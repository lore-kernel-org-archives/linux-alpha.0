From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 20/24] xtensa/cpu: Mark cpu_die() __noreturn
Date: Mon, 13 Feb 2023 23:05:54 -0800
Message-ID: <ad801544cab7c26a0f3bbf7cfefb67303f4cd866.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676358445;
        bh=1pqvhflGCMe/wrdXOMGr/PebbGgnoXhSUZ8eiEoomNs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qtoom7YBj3WBm4M85syos7pcETmxlT1MO3MRIBzB66grdniTPurXhV+aT1FnjslmP
         cMp8MWlimGazyrts9GCWRE8gcSjSDK92J9KS5PhgvRRjWcdrU9y1ofmCeleW/ftCC/
         Wbj9tPEch8OC7fzaBaluyhN4gvUOnlPmYj2fushMqqylVs5lB0xce5ctDacvlOLhw1
         gXV0gp4IRLXlK+aa4b1o04FzIlzpIDShD/Axowf7OBsRnGemMDdukKh93uEPCVtkqh
         aPBcMAbBB6Dy6grAZpPwHtPBnbks1EAiqjozMkYpQDepqD0nDE14RN33E32CXChkal
         EPgyHn2BysIww==
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

cpu_die() doesn't return.  Annotate it as such.  By extension this also
makes arch_cpu_idle_dead() noreturn.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/xtensa/include/asm/smp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/include/asm/smp.h b/arch/xtensa/include/asm/smp.h
index 4e43f5643891..5dc5bf8cdd77 100644
--- a/arch/xtensa/include/asm/smp.h
+++ b/arch/xtensa/include/asm/smp.h
@@ -33,7 +33,7 @@ void show_ipi_list(struct seq_file *p, int prec);
 
 void __cpu_die(unsigned int cpu);
 int __cpu_disable(void);
-void cpu_die(void);
+void __noreturn cpu_die(void);
 void cpu_restart(void);
 
 #endif /* CONFIG_HOTPLUG_CPU */
-- 
2.39.1

