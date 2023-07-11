From: Alexey Gladkov <legion-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 5/5] selftests: add fchmodat4(2) selftest
Date: Tue, 11 Jul 2023 13:25:46 +0200
Message-ID: <c3606ec38227d921fa8a3e11613ffdb2f3ea7636.1689074739.git.legion@kernel.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com> <cover.1689074739.git.legion@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1689074739.git.legion-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; x-default="true"
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org
Cc: James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org, acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, christian-STijNZzMWpgWenYVfaLwtA@public.gmane.org, dalias-8zAoT0mYgF4@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, deepa.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, deller-Mmb7MZpHnFY@public.gmane.org, dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, fenghua.yu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, firoz.khan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org, gor-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, hare-IBi9RG/b67k@public.gmane.org, heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org, jhogan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kim.phillips-5wv7dgnIgG8@public.gmane.org, ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY@public.gmane.org

The test marks as skipped if a syscall with the AT_SYMLINK_NOFOLLOW flag
fails. This is because not all filesystems support changing the mode
bits of symlinks properly. These filesystems return an error but change
the mode bits:

newfstatat(4, "regfile", {st_mode=S_IFREG|0640, st_size=0, ...}, AT_SYMLINK_NOFOLLOW) = 0
newfstatat(4, "symlink", {st_mode=S_IFLNK|0777, st_size=7, ...}, AT_SYMLINK_NOFOLLOW) = 0
syscall_0x1c3(0x4, 0x55fa1f244396, 0x180, 0x100, 0x55fa1f24438e, 0x34) = -1 EOPNOTSUPP (Operation not supported)
newfstatat(4, "regfile", {st_mode=S_IFREG|0640, st_size=0, ...}, AT_SYMLINK_NOFOLLOW) = 0

This happens with btrfs and xfs:

 $ /kernel/tools/testing/selftests/fchmodat4/fchmodat4_test
 TAP version 13
 1..1
 ok 1 # SKIP fchmodat4(symlink)
 # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0

 $ stat /tmp/ksft-fchmodat4.*/symlink
   File: /tmp/ksft-fchmodat4.3NCqlE/symlink -> regfile
   Size: 7               Blocks: 0          IO Block: 4096   symbolic link
 Device: 7,0     Inode: 133         Links: 1
 Access: (0600/lrw-------)  Uid: (    0/    root)   Gid: (    0/    root)

Signed-off-by: Alexey Gladkov <legion-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/fchmodat4/.gitignore  |   2 +
 tools/testing/selftests/fchmodat4/Makefile    |   6 +
 .../selftests/fchmodat4/fchmodat4_test.c      | 151 ++++++++++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 tools/testing/selftests/fchmodat4/.gitignore
 create mode 100644 tools/testing/selftests/fchmodat4/Makefile
 create mode 100644 tools/testing/selftests/fchmodat4/fchmodat4_test.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 90a62cf75008..fe61fa55412d 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -17,6 +17,7 @@ TARGETS += drivers/net/bonding
 TARGETS += drivers/net/team
 TARGETS += efivarfs
 TARGETS += exec
+TARGETS += fchmodat4
 TARGETS += filesystems
 TARGETS += filesystems/binderfs
 TARGETS += filesystems/epoll
diff --git a/tools/testing/selftests/fchmodat4/.gitignore b/tools/testing/selftests/fchmodat4/.gitignore
new file mode 100644
index 000000000000..82a4846cbc4b
--- /dev/null
+++ b/tools/testing/selftests/fchmodat4/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+/*_test
diff --git a/tools/testing/selftests/fchmodat4/Makefile b/tools/testing/selftests/fchmodat4/Makefile
new file mode 100644
index 000000000000..3d38a69c3c12
--- /dev/null
+++ b/tools/testing/selftests/fchmodat4/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+CFLAGS += -Wall -O2 -g -fsanitize=address -fsanitize=undefined
+TEST_GEN_PROGS := fchmodat4_test
+
+include ../lib.mk
diff --git a/tools/testing/selftests/fchmodat4/fchmodat4_test.c b/tools/testing/selftests/fchmodat4/fchmodat4_test.c
new file mode 100644
index 000000000000..50beb731d8ba
--- /dev/null
+++ b/tools/testing/selftests/fchmodat4/fchmodat4_test.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#define _GNU_SOURCE
+#include <fcntl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <syscall.h>
+#include <unistd.h>
+
+#include "../kselftest.h"
+
+#ifndef __NR_fchmodat4
+	#if defined __alpha__
+		#define __NR_fchmodat4 561
+	#elif defined _MIPS_SIM
+		#if _MIPS_SIM == _MIPS_SIM_ABI32	/* o32 */
+			#define __NR_fchmodat4 (451 + 4000)
+		#endif
+		#if _MIPS_SIM == _MIPS_SIM_NABI32	/* n32 */
+			#define __NR_fchmodat4 (451 + 6000)
+		#endif
+		#if _MIPS_SIM == _MIPS_SIM_ABI64	/* n64 */
+			#define __NR_fchmodat4 (451 + 5000)
+		#endif
+	#elif defined __ia64__
+		#define __NR_fchmodat4 (451 + 1024)
+	#else
+		#define __NR_fchmodat4 451
+	#endif
+#endif
+
+int sys_fchmodat4(int dfd, const char *filename, mode_t mode, int flags)
+{
+	int ret = syscall(__NR_fchmodat4, dfd, filename, mode, flags);
+	return ret >= 0 ? ret : -errno;
+}
+
+int setup_testdir(void)
+{
+	int dfd, ret;
+	char dirname[] = "/tmp/ksft-fchmodat4.XXXXXX";
+
+	/* Make the top-level directory. */
+	if (!mkdtemp(dirname))
+		ksft_exit_fail_msg("setup_testdir: failed to create tmpdir\n");
+
+	dfd = open(dirname, O_PATH | O_DIRECTORY);
+	if (dfd < 0)
+		ksft_exit_fail_msg("setup_testdir: failed to open tmpdir\n");
+
+	ret = openat(dfd, "regfile", O_CREAT | O_WRONLY | O_TRUNC, 0644);
+	if (ret < 0)
+		ksft_exit_fail_msg("setup_testdir: failed to create file in tmpdir\n");
+	close(ret);
+
+	ret = symlinkat("regfile", dfd, "symlink");
+	if (ret < 0)
+		ksft_exit_fail_msg("setup_testdir: failed to create symlink in tmpdir\n");
+
+	return dfd;
+}
+
+int expect_mode(int dfd, const char *filename, mode_t expect_mode)
+{
+	struct stat st;
+	int ret = fstatat(dfd, filename, &st, AT_SYMLINK_NOFOLLOW);
+
+	if (ret)
+		ksft_exit_fail_msg("expect_mode: %s: fstatat failed\n", filename);
+
+	return (st.st_mode == expect_mode);
+}
+
+void test_regfile(void)
+{
+	int dfd, ret;
+
+	dfd = setup_testdir();
+
+	ret = sys_fchmodat4(dfd, "regfile", 0640, 0);
+
+	if (ret < 0)
+		ksft_exit_fail_msg("test_regfile: fchmodat4(noflag) failed\n");
+
+	if (!expect_mode(dfd, "regfile", 0100640))
+		ksft_exit_fail_msg("test_regfile: wrong file mode bits after fchmodat4\n");
+
+	ret = sys_fchmodat4(dfd, "regfile", 0600, AT_SYMLINK_NOFOLLOW);
+
+	if (ret < 0)
+		ksft_exit_fail_msg("test_regfile: fchmodat4(AT_SYMLINK_NOFOLLOW) failed\n");
+
+	if (!expect_mode(dfd, "regfile", 0100600))
+		ksft_exit_fail_msg("test_regfile: wrong file mode bits after fchmodat4 with nofollow\n");
+
+	ksft_test_result_pass("fchmodat4(regfile)\n");
+}
+
+void test_symlink(void)
+{
+	int dfd, ret;
+
+	dfd = setup_testdir();
+
+	ret = sys_fchmodat4(dfd, "symlink", 0640, 0);
+
+	if (ret < 0)
+		ksft_exit_fail_msg("test_symlink: fchmodat4(noflag) failed\n");
+
+	if (!expect_mode(dfd, "regfile", 0100640))
+		ksft_exit_fail_msg("test_symlink: wrong file mode bits after fchmodat4\n");
+
+	if (!expect_mode(dfd, "symlink", 0120777))
+		ksft_exit_fail_msg("test_symlink: wrong symlink mode bits after fchmodat4\n");
+
+	ret = sys_fchmodat4(dfd, "symlink", 0600, AT_SYMLINK_NOFOLLOW);
+
+	/*
+	 * On certain filesystems (xfs or btrfs), chmod operation fails. So we
+	 * first check the symlink target but if the operation fails we mark the
+	 * test as skipped.
+	 *
+	 * https://sourceware.org/legacy-ml/libc-alpha/2020-02/msg00467.html
+	 */
+	if (ret == 0 && !expect_mode(dfd, "symlink", 0120600))
+		ksft_exit_fail_msg("test_symlink: wrong symlink mode bits after fchmodat4 with nofollow\n");
+
+	if (!expect_mode(dfd, "regfile", 0100640))
+		ksft_exit_fail_msg("test_symlink: wrong file mode bits after fchmodat4 with nofollow\n");
+
+	if (ret != 0)
+		ksft_test_result_skip("fchmodat4(symlink)\n");
+	else
+		ksft_test_result_pass("fchmodat4(symlink)\n");
+}
+
+#define NUM_TESTS 2
+
+int main(int argc, char **argv)
+{
+	ksft_print_header();
+	ksft_set_plan(NUM_TESTS);
+
+	test_regfile();
+	test_symlink();
+
+	if (ksft_get_fail_cnt() + ksft_get_error_cnt() > 0)
+		ksft_exit_fail();
+	else
+		ksft_exit_pass();
+}
-- 
2.33.8

