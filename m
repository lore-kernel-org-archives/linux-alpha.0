From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 14/24] arc: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:15 +0100
Message-ID: <20230214074925.228106-15-alexghiti__41482.9759787366$1676361913$gmane$org@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wjc5nUaXPqzOcikp/dFCXLyDNPdOZGtU07c3eeQkEo=;
        b=QzV31v7ItXqx4yWsJfh152ebFGrBo9gPdhTErCgeoMfuI0a/bXBwVo9zVazH0XhD1o
         1P22Wx88GfdDl5eEqBxmERSHFO/cszqUOCuMenN38SqwMA+e3o2paztN+lm0B02Xgkp3
         e+v+idvauAUtu3a/SIQ7MztA/LQf+9eZsxk+Jym1ZZLsfwfAVWgFyBnu0nM0VTcvl2h7
         FliYXwQgV+CnK774qEo/1yzLrYpRuhTqe2ZbWRvyqrg3H8e5u97kFVktjSnfWw7k86cI
         vT5XzHCiZvDMnZ0VdkIY4TftV6Qme4WQXbWLgnrifFqlcq70lxh8ilRJsq+QAWvDOKHL
         u3Gw==
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/arc/include/asm/setup.h      | 1 -
 arch/arc/include/uapi/asm/setup.h | 6 ------
 2 files changed, 7 deletions(-)
 delete mode 100644 arch/arc/include/uapi/asm/setup.h

diff --git a/arch/arc/include/asm/setup.h b/arch/arc/include/asm/setup.h
index 028a8cf76206..fe45ff4681bc 100644
--- a/arch/arc/include/asm/setup.h
+++ b/arch/arc/include/asm/setup.h
@@ -7,7 +7,6 @@
 
 
 #include <linux/types.h>
-#include <uapi/asm/setup.h>
 
 #define COMMAND_LINE_SIZE 256
 
diff --git a/arch/arc/include/uapi/asm/setup.h b/arch/arc/include/uapi/asm/setup.h
deleted file mode 100644
index a6d4e44938be..000000000000
--- a/arch/arc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/*
- * setup.h is part of userspace header ABI so UAPI scripts have to generate it
- * even if there's nothing to export - causing empty <uapi/asm/setup.h>
- * However to prevent "patch" from discarding it we add this placeholder
- * comment
- */
-- 
2.37.2

