From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 07/22] loongarch/cpu: Make sure play_dead() doesn't return
Date: Fri,  3 Feb 2023 14:05:16 -0800
Message-ID: <054ac5118731ae340a8bb7026a15ab78bf57ae89.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461954;
        bh=Nv4dCsRjZPJcR8Ogp1/tV2KDCC1o8+1g518bJ1o/vGk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EDbJ111u3eCADaYKD54CpyZ0JMmqpOrzzMmnYjXzHZSsYrm/4CYyey2Z0wcm3Ug+i
         /wWTyRNufqtNN6FOu+4L4eJ5OWCxVh8O3T+8tp9PjOInweU1pbJeTJNuIlbkzad5f+
         RGO/mzCZqaY3L+eYlLP4NxS9DPtcMKLHu9uOv6zqaV3nY1TK51Jj8i1APul/ewp0jQ
         VD5lhy+pfciXqGOTF81kCW9d5/GVuwdYAQQFFK4SbiHpSoFhV8oiJ7M5QGRozfNCnL
         VVODqRRYWtF0ME1xhs1u28HfcEyYdPw4BuNvmzLEotDSzhpKoG3CmU5LVplR+SCqRH
         MkVSqOzYgRMYw==
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
2.39.0

