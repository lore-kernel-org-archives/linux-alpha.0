From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2.1 03/24] arm/cpu: Add unreachable() to arch_cpu_idle_dead()
Date: Thu, 16 Feb 2023 10:38:51 -0800
Message-ID: <20230216183851.s5bnvniomq44rytu@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <ed361403b8ee965f758fe491c47336dddcfb8fd5.1676358308.git.jpoimboe@kernel.org>
 <Y+ttS0japRCzHoFM@shell.armlinux.org.uk>
 <20230214183926.46trlpdror3v5sk5@treble>
 <Y+wEubLjgDQDIbSO@shell.armlinux.org.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676572735;
        bh=hl1r8WrgBVR11XLM9TAiwDCXOTiVcQCDtFTYvOcE4vk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pzcnRjPVAqaK3xKlZe1yzpskS9/WG+OMTloaSFKzBMCxOCkoRpNuoRNYa/3zPKJnz
         6X0jJD8EJrjs7EW5Q3nhsFDWki1qsGGw5El1PvFSJCXlOCmUN+Sd3mN6zTUEUZzc4/
         mNsCR3739yEFXFsyMHHJMQQvHiwVXyBZTBiMAN1UkqOhmnVWUd9WCzEFvocuiDiV1c
         Eo7Y6nPnKYPTibCQ+j4JWOC/6OWWtqMh3gcXtNFiAG9L8vY3DcfS2b9I9DQMeEJSOl
         hm19TO6FpEAODpm1nGfmYEAKY8rl2vEswAXObCCmDbCHiycLI4GP13uQYuypXaWSs7
         6xGJABLDdsOig==
Content-Disposition: inline
In-Reply-To: <Y+wEubLjgDQDIbSO@shell.armlinux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave

arch_cpu_idle_dead() doesn't return.  Make that visible to the compiler
with an unreachable() code annotation.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 0b8c25763adc..441ea5cff390 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -382,6 +382,8 @@ void arch_cpu_idle_dead(void)
 		: "r" (task_stack_page(current) + THREAD_SIZE - 8),
 		  "r" (current)
 		: "r0");
+
+	unreachable();
 }
 #endif /* CONFIG_HOTPLUG_CPU */
 
-- 
2.39.1

