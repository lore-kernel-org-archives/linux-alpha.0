From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 21/24] sched/idle: Make sure weak version of arch_cpu_idle_dead() doesn't return
Date: Mon, 13 Feb 2023 23:05:55 -0800
Message-ID: <cf5ad95eef50f7704bb30e7770c59bfe23372af7.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676358447;
        bh=QgOyKDCiySM7B7nEI/CeCUdB9V4cgp0r+x00hCG0bAs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UTx7NvZZYy13iCrSLJI4/e/stpitBs/+hLagiJy96BUaFJ5MujJ4J6mQCivTly9aU
         XuFeDhwKqeLcYDae4jWwak72Pf2i7BG8JbrSVF8YoiubDwMTmJDUGjeFBflHfWBgnO
         6L32o4C5b8JR78z11RsYWTZBwUIC5CFlMvD5lE2d/1HUy8GsTmXNJ/g9JeZ6adGDGu
         SpBAhjB5JhWlZVQ+YSlBEcxV3F7h5KixnUuQi9X4K6aJAaVEr7xJRMQnGQfMIMUBD9
         C+jRTbtnaIlGZMy31m/B6Ep+S7vN+3+3dGihQRhahxNc49RXvYQGaQk8wYeSksBU4B
         Yd1Op3p5cd5dg==
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

arch_cpu_idle_dead() should never return.  Make it so.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 kernel/sched/idle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index e9ef66be2870..56e152f06d0f 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -75,7 +75,7 @@ static noinline int __cpuidle cpu_idle_poll(void)
 void __weak arch_cpu_idle_prepare(void) { }
 void __weak arch_cpu_idle_enter(void) { }
 void __weak arch_cpu_idle_exit(void) { }
-void __weak arch_cpu_idle_dead(void) { }
+void __weak arch_cpu_idle_dead(void) { while (1); }
 void __weak arch_cpu_idle(void)
 {
 	cpu_idle_force_poll = 1;
-- 
2.39.1

