From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] alpha: remove the needless aliases osf_{readv,writev}
Date: Tue,  4 Oct 2022 09:13:02 +0200
Message-ID: <20221004071302.11471-1-lukas.bulwahn@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=E64n4JdOT43nWMb7866a7qM+s/AANtw76wVVuCsaV50=;
        b=V6/V7N5ybsYZMdzg5RO9dODHr6C7ODksdf/ha/z7V+/C3YglnmsqNWsnDfS8X65q9I
         12hnETsgPho7DJ0oAyv8XKsne+QhineYYY7SO1YWQEkKrLJwjYNq3lcqYWd95Jq8U5zn
         JEPNaKHqjgWRuqlbIKHegUD9jp9YLhcilGV6xsg+fuiNVUyWPV5q2OuTeKz1NNiHQOqn
         Qg+bzJya3sqLkIDHMdR8mbHa4TOQ7MeVf9y4FgDfv62rdy+hvanyleQ3tY2pH0rYcuSc
         b9r9ho8WEaOtxnDQzzopy35otNnFCCx2r6w5Ql30RsazgaPwBvoikmw0Mw44QY+kI6QK
         +Egg==
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Cc: "Eric W . Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Linus Torvalds <torvalds@linux-foundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 987f20a9dcce ("a.out: Remove the a.out implementation") removes
CONFIG_OSF4_COMPAT and its functionality. Hence, sys_osf_{readv,writev}
are now just aliases of sys_{readv,writev}.

Remove these needless aliases.

Link: https://lore.kernel.org/lkml/CAHk-=wjwvBc3VQMNtUVUrMBVoMPSPu26OuatZ_+1gZ2m-PmmRA@mail.gmail.com/
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Linus says: minor cleanup... - Janitor says: Yes, that is my job!

Completely untested.

alpha maintainers, please pick this minor cleanup for your -next tree.

 arch/alpha/kernel/osf_sys.c            | 12 ------------
 arch/alpha/kernel/syscalls/syscall.tbl |  4 ++--
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 68ec314d3fac..c54469b369cb 100644
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
2.17.1

