From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 06/24] ia64/cpu: Mark play_dead() __noreturn
Date: Mon, 13 Feb 2023 23:05:40 -0800
Message-ID: <7575bb38417bd8bcb5be980443f99cab29319342.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVAfdD6YdKjwwxI3WnUTCep3TatiFHsru52KzQxJL3I=; b=AkG0RcpMjBeZGl
	434g5osnnmSfQbZ8D9nVZzlahzo+Gws+ipJdWFED/zvuqLbikQuZlESGaVzElNTFq+H4ykGsOpdJi
	vd2LZEQSAc0D0AQ2iO/j8H+E6Va7VAZSn09wqr9tyCmjdSR3LPy3iXdagCgLEJXZRSoT0luOcuNtB
	Nbx3IhLXZNqOXCWFTYvc+e+f4G1cXh7yLVBEIyNC+7Q2m31744V7yY0fvdJbBvNtYWWhfgiBjKx3n
	kxPr9Lxn5tNJm2XcWrnCX/etANQZM6O/O63LH/wEstLG2xKuSxVGz+YPprhQDi2djL5NAgbU2kJvc
	GU8lud24/jgJrcnODamA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676358419;
	bh=3mR91vFTYi4rZMGRYXhJgaTgkFrCc+v4wRJPGBILCHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lSg8bVoi1sh/I6LONG4iulI3+H5Ch/fv8oDbHX3Iz0jLvADbdNJ6D9Sz4m9UcKyBI
	 u8j3EjXkJ36I1pjLPkbtpMMmXURLhpf0+V6yaLVf1isw74nA6CnSOlvkxRCip1ngGU
	 95eXUsVxMrlU6SstBN4ziVQPwIQ8/17wMlV2LoZUpRs3AjK1TEzUHxr9L1Unx2Bc2c
	 iPW6u9juO9foAwGO5JJByMvXfPQB1Lpxb4CcPYBA8FAJBUrIQBu6A2r//KGsu7LfUt
	 1HyKwkSfkaRwk/DdZ7zy/c/F59Cd3SGJj/k7oluBq9g8jtnPj9mSreXUy0dUR7bYBo
	 6iq/gvWezobbQ==
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, chris@zankel.net, j

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
2.39.1
