From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 18/24] x86/cpu: Mark play_dead() __noreturn
Date: Mon, 13 Feb 2023 23:05:52 -0800
Message-ID: <f3a069e6869c51ccfdda656b76882363bc9fcfa4.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676358442;
        bh=2hxyWMtg3qxmQjhBEluIl/tRKP8X+GwBr5MgjENjNlA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WuohZJZaQgSpW4PNmGOGgvGy5cTg/0OUzSzqmcDohcYVEnfiFYGENb4NGucvlv0Gx
         anWdKfZuIgLNgf+y4nCfCNeS1o3bdNwyrq4xaNuuuJ05y1uwPyDxZKJrJJQEBZ2Gu9
         JtV1n64jmwGGQxJR/IMbZBlxrFl15/Up5U8Zli0cw05zAglUisySLslJZovTubsbPf
         cK9/hfHIUJowq+jMsn/kL34u804BcBYyKT/hAtlTopsvrJJ+t5iQtHShyWS1PsPjKH
         2uDWvN9/CoD/8fn4NPNGZ8GBjHmbCOWVu5OuEQXJvNul7BccgM6smZdc+l51S9/vmp
         9L+2qpthjzEmg==
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
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
index e57cd31bfec4..4433d13edd44 100644
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
2.39.1

