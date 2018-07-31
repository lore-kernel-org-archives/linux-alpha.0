From: Jann Horn <jannh@google.com>
Subject: [PATCH v2] fs: don't let getdents return bogus names
Date: Tue, 31 Jul 2018 18:10:27 +0200
Message-ID: <20180731161025.189534-1-jannh@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=j/sV6dXvNZxplbBedVac4Z0WyJu+MmPT6ZQzfhIbe7I=;
        b=DG0nYZZsyf9vHLscxZ8CBdZ9OKVftHlwgzukZ0rYr51n/QoIu4mT6gbyXkWO/R1Enj
         5YRqzkvnNd20crav7vWTq5k3q+qCaiTmrPDf7/7wHP7Ilvegjv72rA1TtV2WjlZXInJv
         wtZGAPHF/iUkBGYRukZF/pSAmHNFyTvhJvzBiwJdeTp2kBxDxWN1esLsjBGRdl0a2tPS
         kTqKaPYhjngpyZt9z50x7Bt7HDvaAhZRb12lqzwtvgSO/Fan3WfUFa1OOgm0oZU+A2LD
         5uaZYLgoqyrh/1+TPrf0QdHxisVJ8XfTXGL/FOjuhQ9168x+M88TO+23pt/8dxGGZ+PW
         tWBQ==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, jannh@google.com
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Chinner <david@fromorbit.com>, Pavel Machek <pavel@ucw.cz>

When you e.g. run `find` on a directory for which getdents returns
"filenames" that contain slashes, `find` passes those "filenames" back to
the kernel, which then interprets them as paths. That could conceivably
cause userspace to do something bad when accessing something like an
untrusted USB stick, but I'm not aware of any specific example.

Instead of returning bogus filenames to userspace, return -EUCLEAN.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Jann Horn <jannh@google.com>
---
changed in v2:
 - move bogus_dirent_name() out of the #ifdef where it doesn't belong
   (kbuild test robot)

@Al: Given what Dave and Pavel said, are you okay with this?

 arch/alpha/kernel/osf_sys.c |  3 +++
 fs/readdir.c                | 33 +++++++++++++++++++++++++++++++++
 include/linux/fs.h          |  3 +++
 3 files changed, 39 insertions(+)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index c210a25dd6da..e04e51a2320d 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -40,6 +40,7 @@
 #include <linux/vfs.h>
 #include <linux/rcupdate.h>
 #include <linux/slab.h>
+#include <linux/fs.h>
 
 #include <asm/fpu.h>
 #include <asm/io.h>
@@ -117,6 +118,8 @@ osf_filldir(struct dir_context *ctx, const char *name, int namlen,
 	unsigned int reclen = ALIGN(NAME_OFFSET + namlen + 1, sizeof(u32));
 	unsigned int d_ino;
 
+	if (bogus_dirent_name(&buf->error, name, namlen, __func__))
+		return -EUCLEAN;
 	buf->error = -EINVAL;	/* only used if we fail */
 	if (reclen > buf->count)
 		return -EINVAL;
diff --git a/fs/readdir.c b/fs/readdir.c
index d97f548e6323..fa0ac1e33230 100644
--- a/fs/readdir.c
+++ b/fs/readdir.c
@@ -64,6 +64,29 @@ int iterate_dir(struct file *file, struct dir_context *ctx)
 }
 EXPORT_SYMBOL(iterate_dir);
 
+/*
+ * Most filesystems don't filter out bogus directory entry names, and userspace
+ * can get very confused by such names. Behave as if a low-level IO error had
+ * happened while reading directory entries.
+ */
+bool bogus_dirent_name(int *errp, const char *name, int namlen,
+		       const char *caller)
+{
+	if (namlen == 0) {
+		pr_err_once("%s: filesystem returned bogus empty name\n",
+			    caller);
+		*errp = -EUCLEAN;
+		return true;
+	}
+	if (memchr(name, '/', namlen)) {
+		pr_err_once("%s: filesystem returned bogus name '%*pEhp' (contains slash)\n",
+			    caller, namlen, name);
+		*errp = -EUCLEAN;
+		return true;
+	}
+	return false;
+}
+
 /*
  * Traditional linux readdir() handling..
  *
@@ -98,6 +121,8 @@ static int fillonedir(struct dir_context *ctx, const char *name, int namlen,
 
 	if (buf->result)
 		return -EINVAL;
+	if (bogus_dirent_name(&buf->result, name, namlen, __func__))
+		return -EUCLEAN;
 	d_ino = ino;
 	if (sizeof(d_ino) < sizeof(ino) && d_ino != ino) {
 		buf->result = -EOVERFLOW;
@@ -173,6 +198,8 @@ static int filldir(struct dir_context *ctx, const char *name, int namlen,
 	int reclen = ALIGN(offsetof(struct linux_dirent, d_name) + namlen + 2,
 		sizeof(long));
 
+	if (bogus_dirent_name(&buf->error, name, namlen, __func__))
+		return -EUCLEAN;
 	buf->error = -EINVAL;	/* only used if we fail.. */
 	if (reclen > buf->count)
 		return -EINVAL;
@@ -259,6 +286,8 @@ static int filldir64(struct dir_context *ctx, const char *name, int namlen,
 	int reclen = ALIGN(offsetof(struct linux_dirent64, d_name) + namlen + 1,
 		sizeof(u64));
 
+	if (bogus_dirent_name(&buf->error, name, namlen, __func__))
+		return -EUCLEAN;
 	buf->error = -EINVAL;	/* only used if we fail.. */
 	if (reclen > buf->count)
 		return -EINVAL;
@@ -358,6 +387,8 @@ static int compat_fillonedir(struct dir_context *ctx, const char *name,
 
 	if (buf->result)
 		return -EINVAL;
+	if (bogus_dirent_name(&buf->result, name, namlen, __func__))
+		return -EUCLEAN;
 	d_ino = ino;
 	if (sizeof(d_ino) < sizeof(ino) && d_ino != ino) {
 		buf->result = -EOVERFLOW;
@@ -427,6 +458,8 @@ static int compat_filldir(struct dir_context *ctx, const char *name, int namlen,
 	int reclen = ALIGN(offsetof(struct compat_linux_dirent, d_name) +
 		namlen + 2, sizeof(compat_long_t));
 
+	if (bogus_dirent_name(&buf->error, name, namlen, __func__))
+		return -EUCLEAN;
 	buf->error = -EINVAL;	/* only used if we fail.. */
 	if (reclen > buf->count)
 		return -EINVAL;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 805bf22898cf..62ad476563f0 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1680,6 +1680,9 @@ struct dir_context {
 	loff_t pos;
 };
 
+bool bogus_dirent_name(int *errp, const char *name, int namlen,
+		       const char *caller);
+
 struct block_device_operations;
 
 /* These macros are for out of kernel modules to test that
-- 
2.18.0.345.g5c9ce644c3-goog

