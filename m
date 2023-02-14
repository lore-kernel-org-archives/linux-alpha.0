From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 19/24] xtensa/cpu: Make sure cpu_die() doesn't return
Date: Mon, 13 Feb 2023 23:05:53 -0800
Message-ID: <cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676358443;
        bh=Vz9pacmD2uWnKtGE9AgzwIGUED4qhPPVsYwwh31r10c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ihibyp4ipYh7lQbANFcsUTiHup0xNx5JMQ/c4E3q5yGId+1gTQii/DTVSUWTsOltw
         IqvTEQrOFzi2eFo294/k7bZhA6LANgcvqyIA6iJgUKc3l8XDMyd8GBQE+AIh601ofR
         Qc3xpRS1OEc1oUgLhUfbdhFWnImGAZlRDONcTJ/AUMAJRMW7eT2YlrHDa/yyWvyexc
         X6uQrIyw5EWPq7+6xku9zrDlYBy8ZUaQ+gxoKXgdd3pvsLjc6WJXXE5XCSZlHYHxoY
         0KvkA5welRNTeqfi984yl9rKlVPjqPnNJdmII0J45bsDxbkD1Y+8mlhaPORYaSNPw7
         yJswjRO+Y9qRw==
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

cpu_die() doesn't return.  Make that more explicit with a BUG().

BUG() is preferable to unreachable() because BUG() is a more explicit
failure mode and avoids undefined behavior like falling off the edge of
the function into whatever code happens to be next.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/xtensa/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/xtensa/kernel/smp.c b/arch/xtensa/kernel/smp.c
index 4dc109dd6214..7bad78495536 100644
--- a/arch/xtensa/kernel/smp.c
+++ b/arch/xtensa/kernel/smp.c
@@ -341,6 +341,8 @@ void __ref cpu_die(void)
 	__asm__ __volatile__(
 			"	movi	a2, cpu_restart\n"
 			"	jx	a2\n");
+
+	BUG();
 }
 
 #endif /* CONFIG_HOTPLUG_CPU */
-- 
2.39.1

