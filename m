From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 18/22] x86/cpu: Mark play_dead() __noreturn
Date: Fri,  3 Feb 2023 14:05:27 -0800
Message-ID: <6e322880a30ed582847702f400fa99f55be821d3.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461975;
        bh=bXJvKHvsodpO0BPlco2s0aMLVPJi3gp9AhXx9K2v2Lo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k2rixxjxWrJRRyUMI/UIOonFKDfpZNhS5xd+/8CuXK0prPGkQnnv9Kfg10DIKZOUJ
         TnQ9bBPlqmYQDrXpQSFxMhJGIKsE/V+npKts3TEZNdT8iuM0s9Iq/8P0rYPzPyZwJ4
         Jh6lhsIXNcEbx1B5mweJ3CQge57WG2SQxBM/6jESjWiE44sc6FKSEPhym1/PqmwKMO
         nhRytRWxyWzWSDDhS1ZWNY+LxbnIUqHAkuGjhF7/fQVzkTW/gQPTqo4uppxXJbVsVu
         u2gxECq3yVWPrt2pTsvgswuFgQhH6K6nVThvA924uuSIhWhkbCYXj3lDMkpQXXw5sZ
         tcWARjjzt2M+A==
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

play_dead() doesn't return.  Annotate it as such.  By extension this
also makes arch_cpu_idle_dead() noreturn.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/include/asm/smp.h | 2 +-
 arch/x86/kernel/process.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index 8f628e08b25a..e6d1d2810e38 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -93,7 +93,7 @@ static inline void __cpu_die(unsigned int cpu)
 	smp_ops.cpu_die(cpu);
 }
 
-static inline void play_dead(void)
+static inline void __noreturn play_dead(void)
 {
 	smp_ops.play_dead();
 	BUG();
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index b650cde3f64d..f1ec36caf1d8 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -715,7 +715,7 @@ static bool x86_idle_set(void)
 }
 
 #ifndef CONFIG_SMP
-static inline void play_dead(void)
+static inline void __noreturn play_dead(void)
 {
 	BUG();
 }
-- 
2.39.0

