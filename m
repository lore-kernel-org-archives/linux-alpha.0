From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 15/22] sh/cpu: Expose arch_cpu_idle_dead()'s prototype definition
Date: Fri,  3 Feb 2023 14:05:24 -0800
Message-ID: <ab9832f83b626a3a78cc398a7c1ffc23c25a9ea1.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461969;
        bh=aYP90nun0m184p5nqJ440uJdYMPBc75BRwnXChmaA8w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VsXyVxEzpcXfilpsFzlk6M+CFr48cROlB/51bhZgU6jOeFjXZsnPEU0o5unZX/lCv
         2s92UV6qDiMVkuwzYYUjibPqLJ0HXjNhVnjkYmHeRyzqPPq35RZXb4I0QJBtFIGHpB
         c05PiWxmuAZTCIhURQlmym/9FanZLhY6P9ATEQuCGE0TqcRKoW2+BmfvDSOl4rFdLQ
         XSQn6q+5Ug0Ma8OfVVzvmkDeLJyoNXKVlNE8zy8/Deb7fBUoAeD5LMKeY5LeE3R65b
         soPuLuhsbfOdSWeFsj5Fs8fj/wW9ZQHSRSDFTboVl+QsDtK3UkzNs6tqSgpIcVZYxl
         mpggjtNUkp/ng==
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
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
2.39.0

