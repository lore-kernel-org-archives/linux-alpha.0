From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 08/22] loongarch/cpu: Mark play_dead() __noreturn
Date: Fri,  3 Feb 2023 14:05:17 -0800
Message-ID: <7b6c893031048242da4a7256cd5da876292b8abb.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461956;
        bh=c/F3dYyrvAqz6wprj56ksl9t+Sypivhl5og5kpg5L6s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tptDeVHqMjvz4+S0iYtQ6xPGjXx4/3Ccw0/deBnVQWH7nF/I1PUzMSxGVylz0Dgty
         AzsbQwHn8cZPxBUugokyhG+G0x2v6NoabtKRTQA82/NRgKmcfhf6btWGLkhuu4gvDr
         iPy6MN24l25pW+tYGwzziJgtrgbb/FUXeFjmOjDxILCnJVSlMUDQj2lEcR3JRnIesk
         Dw5PWj95Y97QxX9ZAyCSFBPbOnnhyZPRJSQlNLCo9O1M5lihchoQsVEP5LMfayPIdB
         kkNaXSVZQ/FMqtdgmpcj9piJkDTn0P0bTWRd5a6/2HOK7g3HyTWXT6NY4jitXMiTqa
         uDGktzLGFC0eg==
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

play_dead() doesn't return.  Annotate it as such.  By extension this
also makes arch_cpu_idle_dead() noreturn.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/loongarch/include/asm/smp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index d82687390b4a..416b653bccb4 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -99,7 +99,7 @@ static inline void __cpu_die(unsigned int cpu)
 	loongson_cpu_die(cpu);
 }
 
-extern void play_dead(void);
+extern void __noreturn play_dead(void);
 #endif
 
 #endif /* __ASM_SMP_H */
-- 
2.39.0

