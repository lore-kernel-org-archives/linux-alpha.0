From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 24/26] mips: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:06 +0100
Message-ID: <20230306100508.1171812-25-alexghiti__7827.35844129405$1678098678$gmane$org@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXAvkdr/KDgKti1Qk0fGZtxrB/HUuKAsHe829QuSuFY=;
        b=pgS35aCdmrPQvRmz+iyfEoK2FRpACPPCY0MT6mFvJKkIUhbtwnSzkh1nDZ4dLg4N66
         6ZVDArxRLTZLYfBKXHPjVVXFk3ykL/Ll+SunOskkjFEC44CCkzVmJzYhiA/SpJcgPsXD
         iaxTAEzNvivOqXbfNob2LDlmKw0ZcaqlzVRuIFVk8cR0s+FUBB5x+NoBb99m7FdgTTah
         vZAnZAMHkL7V18QXzPHaCpzGGQWELRiT2WyIpZNXSgzp7qcnCjdjYhSVinAF3g/DsyXX
         44dOQ7eQm940d/z5SFQ+4xJwQrGMZMea8UaCvouMgKgVikT1M0ZwEubwwnmdMLP5t9Zo
         iu4g==
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csg>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/mips/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/mips/include/uapi/asm/setup.h

diff --git a/arch/mips/include/uapi/asm/setup.h b/arch/mips/include/uapi/asm/setup.h
deleted file mode 100644
index 157c3c392fb4..000000000000
--- a/arch/mips/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_MIPS_SETUP_H
-#define _UAPI_MIPS_SETUP_H
-
-#endif /* _UAPI_MIPS_SETUP_H */
-- 
2.37.2

