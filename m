From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 5/5] fs: remove do_mounts
Date: Thu, 17 Sep 2020 10:22:36 +0200
Message-ID: <20200917082236.2518236-6-hch@lst.de>
References: <20200917082236.2518236-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=Kl93QICC5aQvQJMxCeiVqLPxdrJCLvLfKIO/mt3R/aE=; b=GYwqhapVq04TTeK40il4+eAjIH
        eEPWkMcwVUYVvwu/vyIhYQFWJLFOK99rpCjNEPMZ1FYG9P0d1uQmpXDJK+nIeU0oNqlqN1SYFZ/Y5
        OnO8Mxt8h6UwEnK/j/Q+LymGzkLGnPqPkMeaflWU/DNH8dK2UiPK3vnFcVz1X7LX1JcYWiDaIrstD
        4LLddZquANPfwvWhP6AhISfAl3Y3CsdFK+/JNjVbeCQsDoqedJpfEs0BpqLQYfdzxvuHTQusrkLJV
        MprkkLou2kbyqmRXOCgGao41uRx4IcuIeTnX48V51+5VfwJpDTqzV9+9u/1aqlJaaDrgnYCsnz0Bu
        facfdBjw==;
In-Reply-To: <20200917082236.2518236-1-hch-jcswGhMUV9g@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Cc: Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Trond Myklebust <trond.myklebust-F/q8l9xzQnoyLce1RVWEUA@public.gmane.org>, Anna Schumaker <anna.schumaker-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

There are only two callers left, one of which is is in the alpha-specific
OSF/1 compat code.  Just open code it in both.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 arch/alpha/kernel/osf_sys.c |  7 ++++++-
 fs/namespace.c              | 25 ++++++++-----------------
 include/linux/fs.h          |  2 --
 3 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 5fd155b13503b5..8acd5101097576 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -434,6 +434,7 @@ SYSCALL_DEFINE4(osf_mount, unsigned long, typenr, const char __user *, path,
 	struct osf_mount_args tmp;
 	struct filename *devname;
 	const char *fstype;
+	struct path path;
 	int retval;
 
 	if (copy_from_user(&tmp, args, sizeof(tmp)))
@@ -467,7 +468,11 @@ SYSCALL_DEFINE4(osf_mount, unsigned long, typenr, const char __user *, path,
 
 	if (IS_ERR(devname))
 		return PTR_ERR(devname);
-	retval = do_mount(devname.name, dirname, fstype, flags, NULL);
+	retval = user_path_at(AT_FDCWD, dirname, LOOKUP_FOLLOW, &path);
+	if (!retval) {
+		ret = path_mount(devname.name, &path, fstype, flags, NULL);
+		path_put(&path);
+	}
 	putname(devname);
 	return retval;
 }
diff --git a/fs/namespace.c b/fs/namespace.c
index 12b431b61462b9..2ff373ebeaf27f 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -3193,20 +3193,6 @@ int path_mount(const char *dev_name, struct path *path,
 			    data_page);
 }
 
-long do_mount(const char *dev_name, const char __user *dir_name,
-		const char *type_page, unsigned long flags, void *data_page)
-{
-	struct path path;
-	int ret;
-
-	ret = user_path_at(AT_FDCWD, dir_name, LOOKUP_FOLLOW, &path);
-	if (ret)
-		return ret;
-	ret = path_mount(dev_name, &path, type_page, flags, data_page);
-	path_put(&path);
-	return ret;
-}
-
 static struct ucounts *inc_mnt_namespaces(struct user_namespace *ns)
 {
 	return inc_ucount(ns, current_euid(), UCOUNT_MNT_NAMESPACES);
@@ -3390,10 +3376,11 @@ EXPORT_SYMBOL(mount_subtree);
 SYSCALL_DEFINE5(mount, char __user *, dev_name, char __user *, dir_name,
 		char __user *, type, unsigned long, flags, void __user *, data)
 {
-	int ret;
+	struct path path;
 	char *kernel_type;
 	char *kernel_dev;
 	void *options;
+	int ret;
 
 	kernel_type = copy_mount_string(type);
 	ret = PTR_ERR(kernel_type);
@@ -3410,8 +3397,12 @@ SYSCALL_DEFINE5(mount, char __user *, dev_name, char __user *, dir_name,
 	if (IS_ERR(options))
 		goto out_data;
 
-	ret = do_mount(kernel_dev, dir_name, kernel_type, flags, options);
-
+	ret = user_path_at(AT_FDCWD, dir_name, LOOKUP_FOLLOW, &path);
+	if (ret)
+		goto out_options;
+	ret = path_mount(kernel_dev, &path, kernel_type, flags, options);
+	path_put(&path);
+out_options:
 	kfree(options);
 out_data:
 	kfree(kernel_dev);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 7519ae003a082c..bd9878bdd4bfe9 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2292,8 +2292,6 @@ extern struct vfsmount *kern_mount(struct file_system_type *);
 extern void kern_unmount(struct vfsmount *mnt);
 extern int may_umount_tree(struct vfsmount *);
 extern int may_umount(struct vfsmount *);
-extern long do_mount(const char *, const char __user *,
-		     const char *, unsigned long, void *);
 extern struct vfsmount *collect_mounts(const struct path *);
 extern void drop_collected_mounts(struct vfsmount *);
 extern int iterate_mounts(int (*)(struct vfsmount *, void *), void *,
-- 
2.28.0

