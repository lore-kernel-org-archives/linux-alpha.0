From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 17/22] x86/cpu: Make sure play_dead() doesn't return
Date: Fri,  3 Feb 2023 14:05:26 -0800
Message-ID: <7bfd319e3ebf5a3e56d668bee7a3b981b22b1863.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461973;
        bh=Gy7oghtDbUapfyH6lmA7zeDcDutJ46pdh8WMl0cgvVU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cz/e4Tiq0/BvLDX93eISE4dEcCFBPucrGZqH4/s6/uvyLanSuD8oY7sBMKXuYt07K
         mhzTK34NA4E1JWXtyejdLqJNsro+yA1Yj3Uz502TOQTJjfQrpQWQsJNvWHGo5sndOU
         phtWnBDv3YdyzJc4hPNyl2ZLxgw8Kbshx78FoeWjgczSitx7GhnaXT9X29zcTpGQXi
         U01QFLtvja2ffq22rVz1PFTU+/uSTGm4lN21v5c1bGlJrZZQ1k+Db3jT20KJrVcazD
         dzlT0LcCZCfDKhnovvW6WCWz4JZBeYAV+6FJaLKMYf4o9dmDrEbEXRuAD7jpQl0uB+
         MCNtPX36W5EEw==
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

After commit 076cbf5d2163 ("x86/xen: don't let xen_pv_play_dead()
return"), play_dead() never returns.  Make that more explicit with a
BUG().

BUG() is preferable to unreachable() because BUG() is a more explicit
failure mode and avoids undefined behavior like falling off the edge of
the function into whatever code happens to be next.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/include/asm/smp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index b4dbb20dab1a..8f628e08b25a 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -96,6 +96,7 @@ static inline void __cpu_die(unsigned int cpu)
 static inline void play_dead(void)
 {
 	smp_ops.play_dead();
+	BUG();
 }
 
 static inline void smp_send_reschedule(int cpu)
-- 
2.39.0

