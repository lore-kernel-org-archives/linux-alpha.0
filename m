From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 13/22] sh/cpu: Make sure play_dead() doesn't return
Date: Fri,  3 Feb 2023 14:05:22 -0800
Message-ID: <a984bc4e16d6074f69c12483feec2ddb1721b325.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461965;
        bh=X1eIlBV7mYZUrbC//4ufL+T75dx0a2gkyRGVpnoY/QM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DhDkIMUjEJOyX2EMlHrPxdUnBWRX3se0vLGO731POCqHk9/VQrMV/gXm8Vb9/Z2m3
         UvzerGv0nP8kmAJhO23jS42gvkc6o8sJJTyUd/dleHrvmoqm98KN02bKtkQZO7MfFL
         WiEZU6kpXcLgGxhn/vJpxLEiRCyGWZl3pjakg3znFOX8OkwD/QWUnY0u+Z51AYGuT1
         3ZX1IoRQ7B7uGKZ1bvIOTbD3JdF+6rUUJYCcYypC+Tlbn/Ml8u53/6kdTb+Sog6/sv
         AsLRZWp+uNctE1zUajMgDNYRMYvTo3DPuPNnHQwSTW0D6vHT8JOdvEDURTxD2SUNqz
         O5cRPvgdcbiQQ==
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
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
2.39.0

