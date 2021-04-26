From: He Zhe <zhe.he@windriver.com>
Subject: [PATCH] alpha: Add syscall_get_return_value()
Date: Mon, 26 Apr 2021 17:16:29 +0800
Message-ID: <20210426091629.45020-1-zhe.he@windriver.com>
References: <20210423103533.30121-3-zhe.he@windriver.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZBxxZTBEa9S6Rku6VwrS+BLXTlYuLgdVHsHBi7l9Yo=;
 b=KWEf88MWgMSlX5exc4nz+jktAgzCJTg4hWDRGpIvgo64rfcKKE6MMP8v4YI6LyXu7gqDk1LefevQtMPlXrmb4a7o0UoGMY9V8dzoGGRhkkDN/N6ehBPDWE1wpzlhDumbtXTARwIT47gDG5YlPI6Mrd1VVn3rBq0hA3hOoprcSHw=
In-Reply-To: <20210423103533.30121-3-zhe.he@windriver.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg@redhat.com, catalin.marinas@arm.com, will@kernel.org, paul@paul-moore.com, eparis@redhat.com, linux-audit@redhat.com, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, zhe.he@windriver.com

audit now reuquires syscall_get_return_value instead of regs_return_value
to retrieve syscall return code . Other architectures that support audit
have already define this function.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 arch/alpha/include/asm/syscall.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/alpha/include/asm/syscall.h b/arch/alpha/include/asm/syscall.h
index 11c688c1d7ec..f21babaeed85 100644
--- a/arch/alpha/include/asm/syscall.h
+++ b/arch/alpha/include/asm/syscall.h
@@ -9,4 +9,10 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_ALPHA;
 }
 
+static inline long syscall_get_return_value(struct task_struct *task,
+					    struct pt_regs *regs)
+{
+	return regs->r0;
+}
+
 #endif	/* _ASM_ALPHA_SYSCALL_H */
-- 
2.17.1

