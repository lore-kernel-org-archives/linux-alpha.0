From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 20/22] xtensa/cpu: Mark cpu_die() __noreturn
Date: Fri,  3 Feb 2023 14:05:29 -0800
Message-ID: <f49d0092aa9eb23fe495c697bd49b2553220fa29.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461978;
        bh=ikmsAPzcHbKm4BPXAk4vCHLoc1MwBOQvSdhyskC8aqk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YYnlpQSIhXfIuZtmwX80cwYo8HEVkuAoZxxjLbmDEqRvH2RxesFNwaeIQN8SzGBzW
         vLLgsYhL0lS45Fyp9Ve74Sw7eovpDoz9Guf5+yE5xWhW9jMzSmF6nhwFbdConwpN/q
         D9yipeu6g+D7RAafGUb1qRd6MBnXP+1xEKWp3ZVkISd4WH7IqGChCY1svitqCGUU2L
         JdWz9fBXaPuCoakVUsltIf7yUwqSNv7WF803g7r/quj+PbB+xvBjdfXD9xeqxTxmh5
         kyPlNWlqjarxCrasQl1DO4ameVNS+OQy/bXqd6w2fDPppGX9mt+KVd1ga0sKukW8F6
         dCgB90Ai6peWA==
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
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
2.39.0

