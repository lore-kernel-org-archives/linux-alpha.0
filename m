From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 20/24] x86: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:21 +0100
Message-ID: <20230214074925.228106-21-alexghiti__1059.22997915826$1676362249$gmane$org@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GFm9NTVm8dbp1GpfLPnAIV1IFir3mGxMVXJeR5p3rs=;
        b=PTQkf//dJGBi2m4Z02VrlE5ANJFq2MWQ6OYQ8nrykhLGUsTt5XBy5YRbf9k9QQegRY
         BVMzJeHG2/hFVSB1Fa0QtoB+NswSMEx7hYwZhLpwiCjCHYi8Y6QbOTsMsY3YRaN2fxyI
         TQrME1t7VPJR1xsC11gsDznxT0+kI7jvgwxSJ4o858yIfRNXRcmvtAxcaRNyUPEuNCl2
         Hm3cAUgxzybA5MtTnncNweGachZ+4qdYQplQMHP/HhiBFsXSovoVwRHcNBk3sGiUk6gs
         zKB5R71fru3DffzOCLnt/KNVPa5PO68WzDLt4s5DKXCBAv8XkTB3JqSiC1c2d82rGL2R
         LHZQ==
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/x86/include/asm/setup.h      | 2 --
 arch/x86/include/uapi/asm/setup.h | 1 -
 2 files changed, 3 deletions(-)
 delete mode 100644 arch/x86/include/uapi/asm/setup.h

diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index f37cbff7354c..449b50a2f390 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -2,8 +2,6 @@
 #ifndef _ASM_X86_SETUP_H
 #define _ASM_X86_SETUP_H
 
-#include <uapi/asm/setup.h>
-
 #define COMMAND_LINE_SIZE 2048
 
 #include <linux/linkage.h>
diff --git a/arch/x86/include/uapi/asm/setup.h b/arch/x86/include/uapi/asm/setup.h
deleted file mode 100644
index 79a9626b5500..000000000000
--- a/arch/x86/include/uapi/asm/setup.h
+++ /dev/null
@@ -1 +0,0 @@
-/* */
-- 
2.37.2

