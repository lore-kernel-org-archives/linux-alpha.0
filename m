From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 02/22] alpha/cpu: Make sure arch_cpu_idle_dead() doesn't return
Date: Fri,  3 Feb 2023 14:05:11 -0800
Message-ID: <543dffab94755ae8460b22e273213cbb9a72a173.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461944;
        bh=jwTvhfv5jui0rr++LUZmPhaoB7Jg1TFf9qG4O7JtMhQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Cnpsd3/vIh8cHXwxClTdwl8BAQrgBFDXI4Y6Wl3Yb8uKzKrXFmQjf4bLTlNruFSiS
         qCw5Tpiq0hGpIKAA9/3qXe8LcDIqt+HCuF23fCoKLHz2nfcNB+D+KHlrgpbh1U43BD
         pNBum+Kt2hjbGzQLzCB6YyRpQ9i7GLAoTP+jIcII2BpDc7lxQXJkdYAl8BjjAxWWgH
         vPRzYJ9cYKNr4qu0wK5oRu28WzJ1AZPjIEQJEuuC7Tw5qVQ5zZYaRMYRLjPSmjNcm2
         38kusvC4L8FnSTzlZ9mjTaLmjfcLnDzYkadBZuZ4/c+gcGOlxpmeKS17HnHSBp6y7I
         T1Tc3i1z5DTLw==
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
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
 arch/alpha/kernel/process.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 4813172547b5..94938f856545 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -63,6 +63,7 @@ void arch_cpu_idle(void)
 void arch_cpu_idle_dead(void)
 {
 	wtint(INT_MAX);
+	BUG();
 }
 #endif /* ALPHA_WTINT */
 
-- 
2.39.0

