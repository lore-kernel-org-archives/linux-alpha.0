From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 01/22] alpha/cpu: Expose arch_cpu_idle_dead()'s prototype declaration
Date: Fri,  3 Feb 2023 14:05:10 -0800
Message-ID: <ffe87359e7e98855a46867441f8ada5837b4a150.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461943;
        bh=NR8zbYs8EPLnwZAokhvxtM4d11Hejg/pklQk/07I+eg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h1dFAKfFwo43O/p+mZtZ8A+pRz8y8sKCxvJSxAxf2YpW/jd7egSDVmzws1Zas8viu
         I1hsX05Ku4zp8diJUR/N6dJhSG9mAon5ZNQLSZol3jGec2QJ0I0pSVe2Bv6/fcXHXw
         TdnQjaONqw918RHo79XkwWmjiQlnJyFT7QgmZo+nwawn1ZL4JdU0tGamzFwTIX1g3k
         WpeqXBuX7b/QIa6fMLMBsGo5GJbYag1To0ffo6VmtPVndG48TG3eDYQMlosEKX4ZZ2
         Q2OHoZnKg98XUe5DHtWW0te95HvWS2yWc5/MOqBVfViewE35c0040lS7kwSLzx4ju5
         cyK5w4a7yqJyQ==
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

Include <linux/cpu.h> to make sure arch_cpu_idle_dead() matches its
prototype going forward.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/alpha/kernel/process.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 0eddd22c6212..4813172547b5 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -9,6 +9,7 @@
  * This file handles the architecture-dependent parts of process handling.
  */
 
+#include <linux/cpu.h>
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/sched.h>
-- 
2.39.0

