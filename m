From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 09/24] mips/cpu: Expose play_dead()'s prototype definition
Date: Mon, 13 Feb 2023 23:05:43 -0800
Message-ID: <39835bc75af2e812fce56400533cb2ab41bcf0e2.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676358425;
        bh=XNCtbUPkWepKcDkoc2QVjt5JoGlLdpvjlgQ3hSVUaHM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CKyTOk6N2s9QMRZ/xz9Dp6WvhVOZ+I7KXLar1fLc4GYGq29T2hULsYNmdGMQCbT3B
         hpl7cgY9habl0Yu7ytEa8SYmo+/rBQ950VNga4e2rNTM+Yk+V1nJuNUyRvrGjy5CeY
         Ma8uujywpI13NT25Z0NH3QTWsRczk5hODqoTnfeRxbg6/xR/QBbq8u0x103UtOS1z/
         +HNk8m78315MkXjpc9AXs8HMe/L73Grn+P3cGI3rWBY4CZBoRG+Z9GYZHLfJ1Cbocf
         6hHpxUH8tYgn3CTRRCHw/sNY6WMFiLhY52qkXwOb/pmk3Mc5S1BtFhPD6RMt2vjyPg
         ITj44etdCnlHQ==
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

Include <asm/smp.h> to make sure play_dead() matches its prototype going
forward.

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/mips/kernel/smp-bmips.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index f5d7bfa3472a..df9158e8329d 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -38,6 +38,7 @@
 #include <asm/traps.h>
 #include <asm/barrier.h>
 #include <asm/cpu-features.h>
+#include <asm/smp.h>
 
 static int __maybe_unused max_cpus = 1;
 
-- 
2.39.1

