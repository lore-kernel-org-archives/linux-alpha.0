From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 02/24] arm64: Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:17 +0100
Message-ID: <20230302093539.372962-3-alexghiti__3564.07140368304$1677749879$gmane$org@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677749865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqgG96kIfrM1gqMHmNCahiNfUJeEB3Yoev2yU5VrqsE=;
        b=3T4efKjmvFLj0Sap5GTKL4Xj6tQ6ZeYI1K7Wp/dVc7Fdevq+cmCM3TKgaXWDSzqNWY
         VD5vYq/x83VdNoxfwerHMUeWJALyo6YQbivbn3Vuw66OxFLiVRNWVQ/e8immeMjkIN5I
         AzZeRHet0UE+NrLlFw9RQVWB6hBcl9brTRsXWsUPR06sJXVN/Pqt2s79soG+kCjyNfgZ
         Irmg8/tdoWk/SF8SnAFsFGts/cECj+sPCWqjl4zh9/k7ZAadmbBYYA99/1qIXohMuwFv
         sET2WbLjedfjnMpB4vAQiNQAH76p0INnCZi/3Ww68KpktBF6K4psDUSp7D+R1c3iXfrb
         4Z7g==
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

From: Palmer Dabbelt <palmer@rivosinc.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/setup.h      | 3 ++-
 arch/arm64/include/uapi/asm/setup.h | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
index f4af547ef54c..7ca70f883cee 100644
--- a/arch/arm64/include/asm/setup.h
+++ b/arch/arm64/include/asm/setup.h
@@ -4,8 +4,9 @@
 #define __ARM64_ASM_SETUP_H
 
 #include <linux/string.h>
+#include <linux/types.h>
 
-#include <uapi/asm/setup.h>
+#define COMMAND_LINE_SIZE	2048
 
 void *get_early_fdt_ptr(void);
 void early_fdt_map(u64 dt_phys);
diff --git a/arch/arm64/include/uapi/asm/setup.h b/arch/arm64/include/uapi/asm/setup.h
index 5d703888f351..f9f51e5925aa 100644
--- a/arch/arm64/include/uapi/asm/setup.h
+++ b/arch/arm64/include/uapi/asm/setup.h
@@ -22,6 +22,4 @@
 
 #include <linux/types.h>
 
-#define COMMAND_LINE_SIZE	2048
-
 #endif
-- 
2.37.2

