From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 11/24] mips/cpu: Mark play_dead() __noreturn
Date: Mon, 13 Feb 2023 23:05:45 -0800
Message-ID: <2897b51a9b8beb5b594fe66fb1d3a479ddd2a0e2.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676358428;
        bh=cICjYhWCnF2ml1iqzN2D4vPy8YvhQqZSeYkkjMWbTjE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ArdSZZQD1oOWx2YT+O2RgHGQZZ19pe/43NFY1dR6EM6Ndt/MsoRBbKJhCxy+uHk+Q
         nI6vgl4OCw5vt/dQS2FPeju5wKv3KBlcDSlQmVknYY41DzY6TUhs5+ZCo/gLbP5pW7
         gGqj9tn2N/Hdkxi+fY8v0640b1SmjNWXZ2tb5KDEi6l2C+Oo1xIJ7GbCDG/ogObPp7
         iT0ImC0TGzlNXYVQx2zRqD+9iYOJn7/JiPu/OlZ86IZsXWXyHWKooGE1vJhSd0SDCP
         2BvoZYyMOkb5t2saSRjsFNLKzURbrukXE0o5HEqBw0YIwp8qNrN94L9ASc6F7fXO3m
         J0459isrwev/g==
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

play_dead() doesn't return.  Annotate it as such.  By extension this
also makes arch_cpu_idle_dead() noreturn.

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/mips/include/asm/smp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
index 5d9ff61004ca..4eee29b7845c 100644
--- a/arch/mips/include/asm/smp.h
+++ b/arch/mips/include/asm/smp.h
@@ -88,7 +88,7 @@ static inline void __cpu_die(unsigned int cpu)
 	mp_ops->cpu_die(cpu);
 }
 
-extern void play_dead(void);
+extern void __noreturn play_dead(void);
 #endif
 
 #ifdef CONFIG_KEXEC
-- 
2.39.1

