From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] alpha: Implement "current_stack_pointer"
Date: Wed, 23 Feb 2022 22:05:58 -0800
Message-ID: <20220224060558.1856804-1-keescook@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AJMmm/SlxvbP8Sm8pm5HlpUcYulkiVyqQoXsaDjFMls=;
        b=Nj16gpydsLHyxewSyxzs3PETFE10yZOT8OocAloPTEPyI0RxMzLnzE0vso7u1brkn7
         5dxzz2kY2bQs7CxwmSAeIUkR04m6e15cj40hxuIuFBlz8hOM2mpxKrZ21hcJNSiqM+Vw
         cpkjw5/Es+OwuAcMarf8xbbPPbkxgSZrKU6ms=
X-Developer-Signature: v=1; a=openpgp-sha256; l=2260; h=from:subject; bh=xGVDoB0f4KPK3G6iQ0qXCfHOcxmVIxVlmTs8iNQSvMg=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBiFyBFtcrjsWeufKYn/FoCY5B0BszUdQrvcFTrDlR9 XGtmjP2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYhcgRQAKCRCJcvTf3G3AJognD/ 4xeSMrc8OBE8HCbG0YJEhYZqbd2RABBKDFpTHmO26RUOUM4MeFd6/vXWMhElWyCy9nRrlvg8sXDWv5 hxBcINRKZcvQltMbK0lQY4SLiiK7ihaVnmocRdMViWUBD+4lA6V0nYZmcKHLdQvNc46blFEj2aQaXG GFpZK0SGRMm9mAjjCfZO6joJRjcZIeEcssPFsF4OtpozLQZRqxaryq2iJbqL9Ye1cyRnc8JG6BxYVh lgSJ7D9HX1fI5XlhHA5Zxf1mgH/1i20XF4YRdvxpoBN7w6t1jBBJIu3sMNj12p1cWON9paw3aXX4N/ xH6Q9vwV/vlGlnCSuppIqXuNph84Yr9h+boP33WMwaFc/ArZl1ZD3+RKMju1sPrDZ6Ybfa8diMv8Fq oV4WgS5waU2mPXLnzgdRcF19X+6UAMg9zt0zQjl6Ny1EuR4YzHHt61naU5UO0z+TH5j7wQy9HLmVhy qSKj2sLYIhL3O5Hpfz5wkn9oLuibyP97jvNvu2fo1Rt5KnytV
 cL578eiAU4E3ihMvIMjEh9jPKywGt 79tJUSa3Bv65DElDQZvjRyL6Q1vWuxOxYCsH/I5IuToqvXxmonu26GGNTTlCzFMVNUWD 
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>
Cc: Kees Cook <keescook@chromium.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, "Alexander A. Klimov" <grandmaster@al2klimov.de>, linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org

To follow the existing per-arch conventions replace open-coded use
of asm "$30" as "current_stack_pointer". This will let it be used in
non-arch places (like HARDENED_USERCOPY).

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/alpha/Kconfig                   | 1 +
 arch/alpha/include/asm/thread_info.h | 2 ++
 arch/alpha/lib/stacktrace.c          | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 4e87783c90ad..31f3dbcdc28c 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -3,6 +3,7 @@ config ALPHA
 	bool
 	default y
 	select ARCH_32BIT_USTAT_F_TINODE
+	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_NO_PREEMPT
diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 2592356e3215..28214db31053 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -43,6 +43,8 @@ struct thread_info {
 register struct thread_info *__current_thread_info __asm__("$8");
 #define current_thread_info()  __current_thread_info
 
+register unsigned long *current_stack_pointer __asm__ ("$30");
+
 #endif /* __ASSEMBLY__ */
 
 /* Thread information allocation.  */
diff --git a/arch/alpha/lib/stacktrace.c b/arch/alpha/lib/stacktrace.c
index 62454a7810e2..2b1176dd5174 100644
--- a/arch/alpha/lib/stacktrace.c
+++ b/arch/alpha/lib/stacktrace.c
@@ -92,7 +92,7 @@ stacktrace(void)
 {
 	instr * ret_pc;
 	instr * prologue = (instr *)stacktrace;
-	register unsigned char * sp __asm__ ("$30");
+	unsigned char *sp = (unsigned char *)current_stack_pointer;
 
 	printk("\tstack trace:\n");
 	do {
-- 
2.30.2

