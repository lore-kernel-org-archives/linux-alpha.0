From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 03/24] arm/cpu: Make sure arch_cpu_idle_dead() doesn't return
Date: Mon, 13 Feb 2023 23:05:37 -0800
Message-ID: <ed361403b8ee965f758fe491c47336dddcfb8fd5.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676358414;
        bh=wu6LTRXru7nWyi2Ep9Lymkp1Vs6jli+8qnKXJEfRRlk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pBWajwyC6eZHxl5YTbqnE/95CYn//yQCVENJWaDj5KhoUt1aag5nvaHja/0HdJ1mW
         X4MWumwa8fgVpZVuVCKQjcQ2ErPDfuq9EWIL1C6CsOcO4hXctxKlHJVwMXOUF+JTiF
         B+//nYfwgDdiV1oKlcXo9Hd0YLE8QOjNVv1BQhhcOsgmaTkK99tBhbNQ1crwms+Ua9
         am/PeEUzKk2CCwsnSgTjTS3Ztlw5wa3G6w/fqp3eeOJYZuKeyUDi3bvvzbM718WHOi
         Uuem/JRBOqIzvtXYvVZXF1W4bCz75afEA61iOZpnVcnNwJStxDuuCWKI6Hr+grLu3E
         hXdS10io+JBzg==
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
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
2.39.1

