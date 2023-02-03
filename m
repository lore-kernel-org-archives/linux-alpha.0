From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 06/22] ia64/cpu: Mark play_dead() __noreturn
Date: Fri,  3 Feb 2023 14:05:15 -0800
Message-ID: <23142556bf02b84f108e17cda731d48449ce1532.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461952;
        bh=RidcRJTauwsqeDLmerjxLqYVUI6XglY5CdcD8pSGztk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KXcNjXr1EZwGdeCXF6ct6qrEpj3XinY2X/TflAyD28fSnn1mIajf3vnubeZTGtUQl
         l0yW410nwCLxoQgmdOi/cbdDfcTaTxEU5p3jduOutHsGegq8ZkNTFQpISTnoZsLy+P
         QJnNOP7BHtikfMhdewJX2qeGyqyndO4WiZFm7Hw5CT9gPoXGP1c8PNd9LJWkPnyEf5
         hkukFHzBIj0I5cMXibGKpPgHvkLlY++ZIYHcgNg8m5O45ONtbFtyexgjlNUBk3ArXY
         2hvh9/Uq9Yk9bB50FB/IDGjk6U8WNpCVvt4vC6pZpbS7VMSsHlXGeiL3pK6jZtLrun
         QX2FcRMDD2dFQ==
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

play_dead() doesn't return.  Annotate it as such.  By extension this
also makes arch_cpu_idle_dead() noreturn.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/ia64/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
index f6195a0a00ae..78f5794b2dde 100644
--- a/arch/ia64/kernel/process.c
+++ b/arch/ia64/kernel/process.c
@@ -201,7 +201,7 @@ __setup("nohalt", nohalt_setup);
 
 #ifdef CONFIG_HOTPLUG_CPU
 /* We don't actually take CPU down, just spin without interrupts. */
-static inline void play_dead(void)
+static inline void __noreturn play_dead(void)
 {
 	unsigned int this_cpu = smp_processor_id();
 
@@ -219,7 +219,7 @@ static inline void play_dead(void)
 	BUG();
 }
 #else
-static inline void play_dead(void)
+static inline void __noreturn play_dead(void)
 {
 	BUG();
 }
-- 
2.39.0

