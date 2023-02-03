From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 16/22] sparc/cpu: Mark cpu_play_dead() __noreturn
Date: Fri,  3 Feb 2023 14:05:25 -0800
Message-ID: <eccdec6e86daed65bedd77f9c3e540503e1ed648.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675461971;
        bh=NrR4P0DY0KkRcvJJpvaBPY8nrqhj1/4WEFbiWkgx25U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IbvLI9SGR0mrEEcDvsTWGmRFY+xC5m55RleQxz9+JQteyCjIJS4oyATHgaLDKg8iT
         Mrcrj1tUqkDKFgDxhiACotXzzd+Ubb/npyitm47+khhnGTg6xyDpHKD0vy1jIB9u/5
         Kl5ByQZatrNlKTDjf0rI7hwfhuNbRiRVWk5imgdvp/hM5rNayYJmTUSlZKkk4SlpVs
         hNm1EBHVifr87GODpz8fpV5UZtd7OqZtrW9RwJeMKf5neI0Evpzkv/91pLQ3MbT6JX
         YQvfjazaZO7Yyom9jcaMJyey9HktA0dUciIGj3r15+QMSD68NRS+h08TN3KaJVaVuz
         sRz7u8p3VLZNw==
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

cpu_play_dead() doesn't return.  Annotate it as such.  By extension this
also makes arch_cpu_idle_dead() noreturn.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/sparc/include/asm/smp_64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/include/asm/smp_64.h b/arch/sparc/include/asm/smp_64.h
index e75783b6abc4..505b6700805d 100644
--- a/arch/sparc/include/asm/smp_64.h
+++ b/arch/sparc/include/asm/smp_64.h
@@ -49,7 +49,7 @@ int hard_smp_processor_id(void);
 
 void smp_fill_in_cpu_possible_map(void);
 void smp_fill_in_sib_core_maps(void);
-void cpu_play_dead(void);
+void __noreturn cpu_play_dead(void);
 
 void smp_fetch_global_regs(void);
 void smp_fetch_global_pmu(void);
-- 
2.39.0

