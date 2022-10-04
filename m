From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] alpha: remove osf_{readv,writev}
Date: Tue,  4 Oct 2022 15:53:01 +0200
Message-ID: <20221004135301.1420873-1-Jason@zx2c4.com>
References: <CAHk-=wjwvBc3VQMNtUVUrMBVoMPSPu26OuatZ_+1gZ2m-PmmRA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664891596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AGGvRd9tx9SOklVRx77pjHpfXoIfU4l8Se6V+1IEj4w=;
        b=lN96TlCUjwqIARh+3+8S4FtTR0Y8hi2fiAJCYpFALenUt9rWeBGo70OIjdQKAIJlblOQDF
        egJBF5Dxvg33Xgq+sCqH6km4i1Ws0eog1pK5s+87Z/38mHQxs7F/bompuFYKwf+i9+zu+v
        PpdTgthe2J0INsJPOcKZ0fYuCGEshVA=
In-Reply-To: <CAHk-=wjwvBc3VQMNtUVUrMBVoMPSPu26OuatZ_+1gZ2m-PmmRA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>, Kees Cook <keescook@chromium.org>, "Eric W . Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>, Lukas Bulwahn <lukas.bulwahn@gmail.com>

As of 987f20a9dcce ("a.out: Remove the a.out implementation"),
sys_osf_{readv,writev} is now the same as sys_{readv,writev}. So remove
the osf indirection, and point the syscall table directly at the generic
functions, as is done on other platforms.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Only compiled and QEMU-booted with no userspace, but seems simple
enough?

 arch/alpha/kernel/osf_sys.c            | 12 ------------
 arch/alpha/kernel/syscalls/syscall.tbl |  4 ++--
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index b3ad8c44c971..6c6c4337e201 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1278,18 +1278,6 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	return addr;
 }
 
-SYSCALL_DEFINE3(osf_readv, unsigned long, fd,
-		const struct iovec __user *, vector, unsigned long, count)
-{
-	return sys_readv(fd, vector, count);
-}
-
-SYSCALL_DEFINE3(osf_writev, unsigned long, fd,
-		const struct iovec __user *, vector, unsigned long, count)
-{
-	return sys_writev(fd, vector, count);
-}
-
 SYSCALL_DEFINE2(osf_getpriority, int, which, int, who)
 {
 	int prio = sys_getpriority(which, who);
diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 3515bc4f16a4..8ebacf37a8cf 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -125,8 +125,8 @@
 116	common	osf_gettimeofday		sys_osf_gettimeofday
 117	common	osf_getrusage			sys_osf_getrusage
 118	common	getsockopt			sys_getsockopt
-120	common	readv				sys_osf_readv
-121	common	writev				sys_osf_writev
+120	common	readv				sys_readv
+121	common	writev				sys_writev
 122	common	osf_settimeofday		sys_osf_settimeofday
 123	common	fchown				sys_fchown
 124	common	fchmod				sys_fchmod
-- 
2.37.3

