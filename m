From: Mans Rullgard <mans@mansr.com>
Subject: [PATCH] alpha: implement various OSF/1 stat syscalls
Date: Fri, 26 Aug 2011 19:06:29 +0100
Message-ID: <1314381989-17694-1-git-send-email-mans@mansr.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

This implements OSF/1 versions of stat, lstat, fstat, statfs64,
and fstatfs64 syscalls.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 arch/alpha/include/asm/unistd.h |    6 ++
 arch/alpha/kernel/osf_sys.c     |  163 +++++++++++++++++++++++++++++++++++++++
 arch/alpha/kernel/systbls.S     |   10 +-
 3 files changed, 174 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index 4ac48a0..cdb5033 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -203,6 +203,12 @@
 #define __NR_osf_security	222	/* not implemented */
 #define __NR_osf_kloadcall	223	/* not implemented */
 
+#define __NR_osf_stat		224
+#define __NR_osf_lstat		225
+#define __NR_osf_fstat		226
+#define __NR_osf_statfs64	227
+#define __NR_osf_fstatfs64	228
+
 #define __NR_getpgid		233
 #define __NR_getsid		234
 #define __NR_sigaltstack	235
diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 484e9e0..297df72 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -191,6 +191,39 @@ SYSCALL_DEFINE6(osf_mmap, unsigned long, addr, unsigned long, len,
 	return ret;
 }
 
+struct osf_stat {
+	int		st_dev;
+	int		st_pad1;
+	unsigned	st_mode;
+	unsigned short	st_nlink;
+	short		st_nlink_reserved;
+	unsigned	st_uid;
+	unsigned	st_gid;
+	int		st_rdev;
+	int		st_ldev;
+	long		st_size;
+	int		st_pad2;
+	int		st_uatime;
+	int		st_pad3;
+	int		st_umtime;
+	int		st_pad4;
+	int		st_uctime;
+	int		st_pad5;
+	int		st_pad6;
+	unsigned	st_flags;
+	unsigned	st_gen;
+	long		st_spare[4];
+	unsigned	st_ino;
+	int		st_ino_reserved;
+	int		st_atime;
+	int		st_atime_reserved;
+	int		st_mtime;
+	int		st_mtime_reserved;
+	int		st_ctime;
+	int		st_ctime_reserved;
+	long		st_blksize;
+	long		st_blocks;
+};
 
 /*
  * The OSF/1 statfs structure is much larger, but this should
@@ -209,6 +242,60 @@ struct osf_statfs {
 	__kernel_fsid_t f_fsid;
 };
 
+struct osf_statfs64 {
+	short f_type;
+	short f_flags;
+	int f_pad1;
+	int f_pad2;
+	int f_pad3;
+	int f_pad4;
+	int f_pad5;
+	int f_pad6;
+	int f_pad7;
+	__kernel_fsid_t f_fsid;
+	u_short f_namemax;
+	short f_reserved1;
+	int f_spare[8];
+	char f_pad8[90];
+	char f_pad9[90];
+	long mount_info[10];
+	u_long f_flags2;
+	long f_spare2[14];
+	long f_fsize;
+	long f_bsize;
+	long f_blocks;
+	long f_bfree;
+	long f_bavail;
+	long f_files;
+	long f_ffree;
+};
+
+static int
+linux_to_osf_stat(struct kstat *lstat, struct osf_stat __user *osf_stat)
+{
+	struct osf_stat tmp = { 0 };
+
+	tmp.st_dev	= lstat->dev;
+	tmp.st_mode	= lstat->mode;
+	tmp.st_nlink	= lstat->nlink;
+	tmp.st_uid	= lstat->uid;
+	tmp.st_gid	= lstat->gid;
+	tmp.st_rdev	= lstat->rdev;
+	tmp.st_ldev	= lstat->rdev;
+	tmp.st_size	= lstat->size;
+	tmp.st_uatime	= lstat->atime.tv_nsec / 1000;
+	tmp.st_umtime	= lstat->mtime.tv_nsec / 1000;
+	tmp.st_uctime	= lstat->ctime.tv_nsec / 1000;
+	tmp.st_ino	= lstat->ino;
+	tmp.st_atime	= lstat->atime.tv_sec;
+	tmp.st_mtime	= lstat->mtime.tv_sec;
+	tmp.st_ctime	= lstat->ctime.tv_sec;
+	tmp.st_blksize	= lstat->blksize;
+	tmp.st_blocks	= lstat->blocks;
+
+	return copy_to_user(osf_stat, &tmp, sizeof(tmp)) ? -EFAULT : 0;
+}
+
 static int
 linux_to_osf_statfs(struct kstatfs *linux_stat, struct osf_statfs __user *osf_stat,
 		    unsigned long bufsiz)
@@ -230,6 +317,26 @@ linux_to_osf_statfs(struct kstatfs *linux_stat, struct osf_statfs __user *osf_st
 	return copy_to_user(osf_stat, &tmp_stat, bufsiz) ? -EFAULT : 0;
 }
 
+static int
+linux_to_osf_statfs64(struct kstatfs *linux_stat, struct osf_statfs64 __user *osf_stat,
+		      unsigned long bufsiz)
+{
+	struct osf_statfs64 tmp_stat = { 0 };
+
+	tmp_stat.f_type = linux_stat->f_type;
+	tmp_stat.f_fsize = linux_stat->f_frsize;
+	tmp_stat.f_bsize = linux_stat->f_bsize;
+	tmp_stat.f_blocks = linux_stat->f_blocks;
+	tmp_stat.f_bfree = linux_stat->f_bfree;
+	tmp_stat.f_bavail = linux_stat->f_bavail;
+	tmp_stat.f_files = linux_stat->f_files;
+	tmp_stat.f_ffree = linux_stat->f_ffree;
+	tmp_stat.f_fsid = linux_stat->f_fsid;
+	if (bufsiz > sizeof(tmp_stat))
+		bufsiz = sizeof(tmp_stat);
+	return copy_to_user(osf_stat, &tmp_stat, bufsiz) ? -EFAULT : 0;
+}
+
 SYSCALL_DEFINE3(osf_statfs, const char __user *, pathname,
 		struct osf_statfs __user *, buffer, unsigned long, bufsiz)
 {
@@ -240,6 +347,42 @@ SYSCALL_DEFINE3(osf_statfs, const char __user *, pathname,
 	return error;	
 }
 
+SYSCALL_DEFINE2(osf_stat, char __user *, name, struct osf_stat __user *, buf)
+{
+	struct kstat stat;
+	int error;
+
+	error = vfs_stat(name, &stat);
+	if (error)
+		return error;
+
+	return linux_to_osf_stat(&stat, buf);
+}
+
+SYSCALL_DEFINE2(osf_lstat, char __user *, name, struct osf_stat __user *, buf)
+{
+	struct kstat stat;
+	int error;
+
+	error = vfs_lstat(name, &stat);
+	if (error)
+		return error;
+
+	return linux_to_osf_stat(&stat, buf);
+}
+
+SYSCALL_DEFINE2(osf_fstat, int, fd, struct osf_stat __user *, buf)
+{
+	struct kstat stat;
+	int error;
+
+	error = vfs_fstat(fd, &stat);
+	if (error)
+		return error;
+
+	return linux_to_osf_stat(&stat, buf);
+}
+
 SYSCALL_DEFINE3(osf_fstatfs, unsigned long, fd,
 		struct osf_statfs __user *, buffer, unsigned long, bufsiz)
 {
@@ -250,6 +393,26 @@ SYSCALL_DEFINE3(osf_fstatfs, unsigned long, fd,
 	return error;
 }
 
+SYSCALL_DEFINE3(osf_statfs64, char __user *, pathname,
+		struct osf_statfs64 __user *, buffer, unsigned long, bufsiz)
+{
+	struct kstatfs linux_stat;
+	int error = user_statfs(pathname, &linux_stat);
+	if (!error)
+		error = linux_to_osf_statfs64(&linux_stat, buffer, bufsiz);
+	return error;
+}
+
+SYSCALL_DEFINE3(osf_fstatfs64, unsigned long, fd,
+		struct osf_statfs64 __user *, buffer, unsigned long, bufsiz)
+{
+	struct kstatfs linux_stat;
+	int error = fd_statfs(fd, &linux_stat);
+	if (!error)
+		error = linux_to_osf_statfs64(&linux_stat, buffer, bufsiz);
+	return error;
+}
+
 /*
  * Uhh.. OSF/1 mount parameters aren't exactly obvious..
  *
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index b9c28f3..b1c5b1a 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -241,11 +241,11 @@ sys_call_table:
 	.quad alpha_ni_syscall
 	.quad alpha_ni_syscall
 	.quad alpha_ni_syscall
-	.quad alpha_ni_syscall
-	.quad alpha_ni_syscall			/* 225 */
-	.quad alpha_ni_syscall
-	.quad alpha_ni_syscall
-	.quad alpha_ni_syscall
+	.quad sys_osf_stat
+	.quad sys_osf_lstat			/* 225 */
+	.quad sys_osf_fstat
+	.quad sys_osf_statfs64
+	.quad sys_osf_fstatfs64
 	.quad alpha_ni_syscall
 	.quad alpha_ni_syscall			/* 230 */
 	.quad alpha_ni_syscall
-- 
1.7.6.1

