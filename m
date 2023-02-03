From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 12/22] powerpc/cpu: Mark start_secondary_resume() __noreturn
Date: Fri,  3 Feb 2023 14:05:21 -0800
Message-ID: <b5d065218265e79daa23f82bb84efc6a7ea120fc.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461963;
        bh=NPua2qPyoi9+ZnTVjzJtwJIKtIAcOluqw/LQWD+kyG0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bEfcJwL6SC/AjDrgqLZ4gobtYzzG+kaVTVeIraggyRhwgYWN4oAFuKJ77/RCNTRvY
         fup/m+ICRFhtxmQnpWwYUfJLena8YJAeJTm6ZcubnjXEQ/jgxWcSotzf3Y2mbjtquI
         yW5I485ZkkpQ6Jqy0xpqJWrVtVjUykBoHEcmO5kdnHPKSdwkiAEHBedDcPx5HCDW7z
         e56cpXGjpV9Wa9j+COiY6xVNqjbTa5hVFZNcyFwrdOvNi774RztXhcvRS8u2WNZfqm
         te78V+RaoPzaJRgp+oay8agBh6E4MO/A9zlyBZNVH/Oc0XYt+s1wdWgKe5Q1neeH/O
         i9bQ03yAKwMEA==
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

start_secondary_resume() doesn't return.  Annotate it as such.  By
extension this also makes arch_cpu_idle_dead() noreturn.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/powerpc/include/asm/smp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index f63505d74932..cfd42ca8765c 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -66,7 +66,7 @@ void start_secondary(void *unused);
 extern int smp_send_nmi_ipi(int cpu, void (*fn)(struct pt_regs *), u64 delay_us);
 extern int smp_send_safe_nmi_ipi(int cpu, void (*fn)(struct pt_regs *), u64 delay_us);
 extern void smp_send_debugger_break(void);
-extern void start_secondary_resume(void);
+extern void __noreturn start_secondary_resume(void);
 extern void smp_generic_give_timebase(void);
 extern void smp_generic_take_timebase(void);
 
-- 
2.39.0

