From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 15/24] sh/cpu: Expose arch_cpu_idle_dead()'s prototype definition
Date: Mon, 13 Feb 2023 23:05:49 -0800
Message-ID: <3d9661e97828fb464a48d4becf18f12604831903.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676358436;
        bh=Ps4PGBv5yPXgtfxfiozPFQBkOC0Om6bfqHZoaR0a8Wo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MDsB0lHraBham/iBQwdl/0Ii9dk8Fs9DMdBLbIn4m+kNU0Ocm8Gn9vAEo2FfPFAGg
         MXid5BhOlSnx6jtD07OvEM0AQjNL6xK96ztsfJaaJbji01ahTN77Njrk8qiVs4WrQZ
         RGqCdA/2a/guY2gP+hj7f+21EdwRYt7sXIbtaE1Ukcp1q+Gh6DgkQ64wn1A5vJLc+V
         odxmo+I5tHChoineV/Y+LwKEiWgmUKi/aJU+aQ/l6vUIO1+ZQ8XYX80Bv/mo2ZVL6d
         4DsM/ppaCL0pPFKUsMcO3kYD7KJFpXSTX3GxGujVjrt5tnDm1VdYU8uBZ+R1xQzCB4
         rNYx73prqIL/A==
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

Include <linux/cpu.h> to make sure arch_cpu_idle_dead() matches its
prototype going forward.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/sh/kernel/idle.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sh/kernel/idle.c b/arch/sh/kernel/idle.c
index 3418c40f0099..114f0c4abeac 100644
--- a/arch/sh/kernel/idle.c
+++ b/arch/sh/kernel/idle.c
@@ -4,6 +4,7 @@
  *
  *  Copyright (C) 2002 - 2009  Paul Mundt
  */
+#include <linux/cpu.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/mm.h>
-- 
2.39.1

