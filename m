From: Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v4 2/5] fs: Add fchmodat2()
Date: Tue, 11 Jul 2023 18:16:04 +0200
Message-ID: <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
References: <cover.1689074739.git.legion@kernel.org> <cover.1689092120.git.legion@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <cover.1689092120.git.legion@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk
Cc: James.Bottomley@HansenPartnership.com, acme@kernel.org, alexander.shishkin@linux.intel.com, axboe@kernel.dk, benh@kernel.crashing.org, borntraeger@de.ibm.com, bp@alien8.de, catalin.marinas@arm.com, christian@brauner.io, dalias@libc.org, davem@davemloft.net, deepa.kernel@gmail.com, deller@gmx.de, dhowells@redhat.com, fenghua.yu@intel.com, fweimer@redhat.com, geert@linux-m68k.org, glebfm@altlinux.org, gor@linux.ibm.com, hare@suse.com, hpa@zytor.com, ink@jurassic.park.msu.ru, jhogan@kernel.org, kim.phillips@arm.com, ldv@altlinux.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux@armlinux.org.uk, li

On the userspace side fchmodat(3) is implemented as a wrapper
function which implements the POSIX-specified interface. This
interface differs from the underlying kernel system call, which does not
have a flags argument. Most implementations require procfs [1][2].

There doesn't appear to be a good userspace workaround for this issue
but the implementation in the kernel is pretty straight-forward.

The new fchmodat2() syscall allows to pass the AT_SYMLINK_NOFOLLOW flag,
unlike existing fchmodat.

[1] https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/fchmodat.c;h=17eca54051ee28ba1ec3f9aed170a62630959143;hb=a492b1e5ef7ab50c6fdd4e4e9879ea5569ab0a6c#l35
[2] https://git.musl-libc.org/cgit/musl/tree/src/stat/fchmodat.c?id=718f363bc2067b6487900eddc9180c84e7739f80#n28

Co-developed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/open.c                | 18 ++++++++++++++----
 include/linux/syscalls.h |  2 ++
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/open.c b/fs/open.c
index 0c55c8e7f837..39a7939f0d00 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -671,11 +671,11 @@ SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, mode)
 	return err;
 }
 
-static int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
+static int do_fchmodat(int dfd, const char __user *filename, umode_t mode, int lookup_flags)
 {
 	struct path path;
 	int error;
-	unsigned int lookup_flags = LOOKUP_FOLLOW;
+
 retry:
 	error = user_path_at(dfd, filename, lookup_flags, &path);
 	if (!error) {
@@ -689,15 +689,25 @@ static int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
 	return error;
 }
 
+SYSCALL_DEFINE4(fchmodat2, int, dfd, const char __user *, filename,
+		umode_t, mode, int, flags)
+{
+	if (unlikely(flags & ~AT_SYMLINK_NOFOLLOW))
+		return -EINVAL;
+
+	return do_fchmodat(dfd, filename, mode,
+			flags & AT_SYMLINK_NOFOLLOW ? 0 : LOOKUP_FOLLOW);
+}
+
 SYSCALL_DEFINE3(fchmodat, int, dfd, const char __user *, filename,
 		umode_t, mode)
 {
-	return do_fchmodat(dfd, filename, mode);
+	return do_fchmodat(dfd, filename, mode, LOOKUP_FOLLOW);
 }
 
 SYSCALL_DEFINE2(chmod, const char __user *, filename, umode_t, mode)
 {
-	return do_fchmodat(AT_FDCWD, filename, mode);
+	return do_fchmodat(AT_FDCWD, filename, mode, LOOKUP_FOLLOW);
 }
 
 /*
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 584f404bf868..6e852279fbc3 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -440,6 +440,8 @@ asmlinkage long sys_chroot(const char __user *filename);
 asmlinkage long sys_fchmod(unsigned int fd, umode_t mode);
 asmlinkage long sys_fchmodat(int dfd, const char __user *filename,
 			     umode_t mode);
+asmlinkage long sys_fchmodat2(int dfd, const char __user *filename,
+			     umode_t mode, int flags);
 asmlinkage long sys_fchownat(int dfd, const char __user *filename, uid_t user,
 			     gid_t group, int flag);
 asmlinkage long sys_fchown(unsigned int fd, uid_t user, gid_t group);
-- 
2.33.8

