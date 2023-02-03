From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 03/22] arm/cpu: Make sure arch_cpu_idle_dead() doesn't return
Date: Fri,  3 Feb 2023 14:05:12 -0800
Message-ID: <5ef67c263f7602d0accfe7b50805a7eb576618c0.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461946;
        bh=b34U778UNXN7FRC5Ic8t90JQ9Tx7F3W870Rcd50IB6g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z3i2Svvz2DgckJMayCk0gnjzplyWv/xWz4lNF/4iQturQRPy9bpRXkh6LHKDE0VTj
         hLT80F7fD7LkSFDdo5XVfokUo2iYIZIkb6RfMG4ZOdTlIUUKJz7jxdNBXJhwhDJi7k
         TtZBctqmDSxTE/uROnYS1JbhnFDadTX80kk2WDbnIWma9DW9nR8COcEuQ+AJZyfnGM
         43FlnaF2H3EggZw3KAqoB2U390Knt/al5l2dzI1AD5mqnBV8xoNTaf+0YclHPcnzYS
         7yH77W1niwbTQwyCnpJgLEmtK0D79wQ1JvuUdroyJZVYC4GQi6U4CJfIOFQxXXFLMP
         YxbeNerpjAahQ==
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

arch_cpu_idle_dead() doesn't return.  Make that more explicit with a
BUG().

BUG() is preferable to unreachable() because BUG() is a more explicit
failure mode and avoids undefined behavior like falling off the edge of
the function into whatever code happens to be next.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 0b8c25763adc..adcd417c526b 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -382,6 +382,8 @@ void arch_cpu_idle_dead(void)
 		: "r" (task_stack_page(current) + THREAD_SIZE - 8),
 		  "r" (current)
 		: "r0");
+
+	BUG();
 }
 #endif /* CONFIG_HOTPLUG_CPU */
 
-- 
2.39.0

