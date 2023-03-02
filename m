From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 22/24] powerpc: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:37 +0100
Message-ID: <20230302093539.372962-23-alexghiti__25070.0828431704$1677751258$gmane$org@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677751100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWpoWTHF+daqxuKXm60VZYbfqB4+Spk5kTFrpLEIhE4=;
        b=GbOzkhHpIeW6q3QAL7eh/145Udusgp0gIBvSMfE+ON43AdeZu/ee7w201pWjLeG957
         Qq6RowkieZ+r7WYxDV4f068I/TnwbRuLBxT7WIxFprPNBY5ETmLUPXT8bUynxL5VSaUV
         PVUZGZk6ER9seRO9uoW7f1L2mApWo7MewdzdL0qcnQpdXHFH3/9ZB2LUy9VpmO3HrtOm
         pZFwuHfUDS0wMlnfUfqj5o1GaX3nlvS+nxi6hyejhckM5q2KO+HBjRFOyHjW/SKZSMU4
         7gpUQh5NelsMLIJiVkw0+WCtWlNbCFujwtZy/wvskJrB7zILzjZi7BblFbcCuFLCBqPv
         Bewg==
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/powerpc/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/powerpc/include/uapi/asm/setup.h

diff --git a/arch/powerpc/include/uapi/asm/setup.h b/arch/powerpc/include/uapi/asm/setup.h
deleted file mode 100644
index f2ca747aa45b..000000000000
--- a/arch/powerpc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_ASM_POWERPC_SETUP_H
-#define _UAPI_ASM_POWERPC_SETUP_H
-
-#endif /* _UAPI_ASM_POWERPC_SETUP_H */
-- 
2.37.2

