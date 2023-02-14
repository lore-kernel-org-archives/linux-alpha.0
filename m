From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 13/24] sh/cpu: Make sure play_dead() doesn't return
Date: Mon, 13 Feb 2023 23:05:47 -0800
Message-ID: <d0c3ff5349adfe8fd227acc236ae2c278a05eb4c.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676358432;
        bh=m+7K5x/TKiEj3Gy7/GvXMcVUaI8EGyr7dPyawUZEKXQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fOpRTeaeqj7hhaGmET48v/uJfiCnR9WNdfn8ZFw7ORfMJaETjqccEYQqZqCgVORhN
         dd/OOQ8j6dRStxceWMED1vf7o2DVlLr8j5I/tYedDKi+X5u6X1sxCVvCrWSEssWddS
         GGM63fRebwPaXosH+NvNaaJoQlvxVTTRU8RCVlA5gO7tdOJQG7CacZD3MILsrijiVH
         k+GbCTQ+whZStivN99KdDh6cSLrC9i5RzLyA1L/2wZ7DZoTD1LAhiQ3M953wxi8Zrt
         Q706WZCFFns6QWrdh3xYBCIvXV3fPLHaYT/Qq1T7t2MAcMw1dYiRA/OI5B6Cy2NHtD
         HPkrBoE/aroSw==
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
 arch/sh/include/asm/smp-ops.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sh/include/asm/smp-ops.h b/arch/sh/include/asm/smp-ops.h
index e27702130eb6..63866b1595a0 100644
--- a/arch/sh/include/asm/smp-ops.h
+++ b/arch/sh/include/asm/smp-ops.h
@@ -27,6 +27,7 @@ static inline void plat_smp_setup(void)
 static inline void play_dead(void)
 {
 	mp_ops->play_dead();
+	BUG();
 }
 
 extern void register_smp_ops(struct plat_smp_ops *ops);
-- 
2.39.1

