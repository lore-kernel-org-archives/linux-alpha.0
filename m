From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 26/26] riscv: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:08 +0100
Message-ID: <20230306100508.1171812-27-alexghiti__35608.9164664567$1678098810$gmane$org@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2S29OAojjkQ3ph5THndb/5w5HMdqHkAEAaj92KxD7KY=;
        b=xCSHcSRaD2g1+2DbiYWhwBVgmLp88kCObvoul8o22gAShWEWRsDyBUbrABXr5fv65x
         IGnHDZLJd6mZoZ4c8bkw6btaQ552OPPkQaMMyBEUs4Bc9wvEuBuP3LVKslg1nEKUwpBX
         lIVGb+vuDvhF0cDTuCVOpyZV5LaEa7T8m8jfkVFpaCwFvyN4Z00Y7x/hHmTHM+tY2ap5
         RgDlCHiOuFZ5W2OonNpFKfcm5MsZoArntnS/kOhW3H0fDHSI6TVfGt6dIbQVxoFWUZLC
         VaMyxBHz7iI91g7KCZulrkhxAWoD0odFmgisNlLZZFPdJeVIIAgA47RuWu1Yjzh0KCRf
         0raw==
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csg>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/uapi/asm/setup.h | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 arch/riscv/include/uapi/asm/setup.h

diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
deleted file mode 100644
index 17fcecd4a2f8..000000000000
--- a/arch/riscv/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
-
-#ifndef _UAPI_ASM_RISCV_SETUP_H
-#define _UAPI_ASM_RISCV_SETUP_H
-
-#endif /* _UAPI_ASM_RISCV_SETUP_H */
-- 
2.37.2

