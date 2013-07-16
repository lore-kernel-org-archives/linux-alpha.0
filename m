From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 5/7] alpha: Implement atomic64_dec_if_positive
Date: Tue, 16 Jul 2013 10:04:38 -0700
Message-ID: <1373994280-12047-6-git-send-email-rth@twiddle.net>
References: <1373994280-12047-1-git-send-email-rth@twiddle.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=paVxA/UKbh/1IKtH3XQq5utMw/7AuxYOV1u20TmYjUA=;
        b=a9Cz+sdhZdfANdCJASArtLdDnxMKbfPqed50UlX8j4tu7VjwmBgoGXCpzOp434DFTB
         foc/h52PQSi02eLObkF36KAsKPCdwYPdnnEHzM7EoBekYDC/78nAJ0DbR+kS+XuhExfF
         aG84vxbW9/iIpRB8oKRPEDjxa19xMynF2D+0Qpamp0GRY6plqQNsKx5HW/rf4bZiTAkS
         vV12hFj57UliW+kXJBJwnFctMPOG7nVPFMf7T/zXuz3qclLBeUIeLFdVVZ8tpmeAPuzb
         eam8JJkXatrv8PxaxSFawLkPU0xI/Qjq8by3pYfkHlSyoVgsK6q/e34+tEkeAKRCq6OJ
         p9LQ==
In-Reply-To: <1373994280-12047-1-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/Kconfig              |  1 +
 arch/alpha/include/asm/atomic.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 837a1f2..082d9b4 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -15,6 +15,7 @@ config ALPHA
 	select ARCH_WANT_OPTIONAL_GPIOLIB
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
+	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_STRNCPY_FROM_USER
diff --git a/arch/alpha/include/asm/atomic.h b/arch/alpha/include/asm/atomic.h
index 0dc18fc..78b03ef 100644
--- a/arch/alpha/include/asm/atomic.h
+++ b/arch/alpha/include/asm/atomic.h
@@ -238,6 +238,34 @@ static __inline__ int atomic64_add_unless(atomic64_t *v, long a, long u)
 	return !c;
 }
 
+/*
+ * atomic64_dec_if_positive - decrement by 1 if old value positive
+ * @v: pointer of type atomic_t
+ *
+ * The function returns the old value of *v minus 1, even if
+ * the atomic variable, v, was not decremented.
+ */
+static inline long atomic64_dec_if_positive(atomic64_t *v)
+{
+	long old, tmp;
+	smp_mb();
+	__asm__ __volatile__(
+	"1:	ldq_l	%[old],%[mem]\n"
+	"	subq	%[old],1,%[tmp]\n"
+	"	ble	%[old],2f\n"
+	"	stq_c	%[tmp],%[mem]\n"
+	"	beq	%[tmp],3f\n"
+	"2:\n"
+	".subsection 2\n"
+	"3:	br	1b\n"
+	".previous"
+	: [old] "=&r"(old), [tmp] "=&r"(tmp)
+	: [mem] "m"(*v)
+	: "memory");
+	smp_mb();
+	return old - 1;
+}
+
 #define atomic64_inc_not_zero(v) atomic64_add_unless((v), 1, 0)
 
 #define atomic_add_negative(a, v) (atomic_add_return((a), (v)) < 0)
-- 
1.8.1.4
