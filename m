From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 07/24] loongarch/cpu: Make sure play_dead() doesn't return
Date: Mon, 13 Feb 2023 23:05:41 -0800
Message-ID: <21245d687ffeda34dbcf04961a2df3724f04f7c8.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676358421;
        bh=faSU9WIlOndHpDhDf2FIwcDy94fg1S+/xLr91iuYnFs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=haQ67CC9AnruMMdRvLTP3ur8+9rfxW3kiW8NLQWfr7tHyhY9ET6F9E7ucDtc5OPVR
         V8ui5J7DmGKI6YpM6s3RuN0BEgPp/zTnZ+REFssZ3oevvAO2c7PQH3bWcJIYTwl6cs
         FR7+2FEPOdGt0yqGNLg7UTWojyuUbyC3x4unOsqDhORgoeZEHgmKxt7X4ZupgDVwOU
         mP13mc/quC3FdnBlkNjpmbSYXWbt1fLOxPEeYCxsBPJ/xfixJfB/wjf9fYbs/Cw84m
         8AJ+Mn6Ozye8bNGzZXJ/+FdFcGV0KgsLy9yuFiw/Lx8Rx6gYUvFHSq0SPX2bMnh6fI
         hq5rMOVOB+K9Q==
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

play_dead() doesn't return.  Make that more explicit with a BUG().

BUG() is preferable to unreachable() because BUG() is a more explicit
failure mode and avoids undefined behavior like falling off the edge of
the function into whatever code happens to be next.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/loongarch/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 8c6e227cb29d..51f328169a7b 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -336,7 +336,7 @@ void play_dead(void)
 	iocsr_write32(0xffffffff, LOONGARCH_IOCSR_IPI_CLEAR);
 
 	init_fn();
-	unreachable();
+	BUG();
 }
 
 #endif
-- 
2.39.1

