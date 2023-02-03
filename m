From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 14/22] sh/cpu: Mark play_dead() __noreturn
Date: Fri,  3 Feb 2023 14:05:23 -0800
Message-ID: <bba33f5055a1f5130d8d08ca019f3144c6345f1a.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461967;
        bh=NaTK1tR+V9DMn/hY0B5jpg7IE7MnPmPMawuvFBlMv1o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sMuRLeIeuX4e5NoLB6UdKdvNaRzHIa+b94PsGTQMufoRN5QA/zc/CEM69PsZyUbp1
         MaysKmxIVcsGQzwrmnkKG0GvRbA9cxT/bDuVaZX4cKX13vFQry04JZub/7YbMzEr99
         cLtBs39kcPbv3AEn9JqZbGlrlVJEq7+r29QctelrKOb+I+n2J4leC7FZUu7ApYfmKA
         q7vw8T+tBdwQiLYoZGWf3XGbln2suP3atmYw9fVnFbsEtKD9GU9f/vEgJntOx59T3k
         AYHnExlZzIdcgOgQulPOWNAktDPoSoVgTe6X9UFvqEgEZQgGo8/EaJPnZcpKZQib90
         Jc9u1vCBV+1cA==
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

play_dead() doesn't return.  Annotate it as such.  By extension this
also makes arch_cpu_idle_dead() noreturn.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/sh/include/asm/smp-ops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/include/asm/smp-ops.h b/arch/sh/include/asm/smp-ops.h
index 63866b1595a0..97331fcb7b85 100644
--- a/arch/sh/include/asm/smp-ops.h
+++ b/arch/sh/include/asm/smp-ops.h
@@ -24,7 +24,7 @@ static inline void plat_smp_setup(void)
 	mp_ops->smp_setup();
 }
 
-static inline void play_dead(void)
+static inline void __noreturn play_dead(void)
 {
 	mp_ops->play_dead();
 	BUG();
@@ -43,7 +43,7 @@ static inline void register_smp_ops(struct plat_smp_ops *ops)
 {
 }
 
-static inline void play_dead(void)
+static inline void __noreturn play_dead(void)
 {
 	BUG();
 }
-- 
2.39.0

