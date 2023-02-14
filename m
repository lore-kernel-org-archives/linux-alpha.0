From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 08/24] loongarch/cpu: Mark play_dead() __noreturn
Date: Mon, 13 Feb 2023 23:05:42 -0800
Message-ID: <4da55acfdec8a9132c4e21ffb7edb1f846841193.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676358423;
        bh=3bcDvDEHNC3XwlEvVwF2bpxpuoRIq+9XThZoZN/Qg1M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ph2CpNhOvheZIYUdc6u9KkKM4lt3E0azDsAUFqtw078sOEvh6l19hRnoeJXCxoDsh
         PumBSG5EXPhNtedPSoFbj+/i3LLFCkM7Wm+yp3ZfqecWkisR+yHsE2FhMDh6vz+Zfy
         3UKdpZ67QIINoyefWd8YfDMqoYpHgw9xXBipBEWc/AZUosDI5aOJKyh6lUZUse8iNr
         oEqMbF+Ggs5G80fm2dMFPjEPRsJzzLrBUZzpK9WJ1K/+SPzmgK03jp2Rui2oi9kjfF
         7lcg0+3SCu8O6056FX4n1Rp8JCaScqrw2DZW8esXEuPXMcrjgb2HOaGWt/ev/kTaHg
         UB6RC5abjaexA==
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
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
2.39.1

