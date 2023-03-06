From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 19/26] sparc: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:01 +0100
Message-ID: <20230306100508.1171812-20-alexghiti__20377.1405549318$1678098344$gmane$org@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+ybm5kRJ/yopWCa5U60FTtFVB//Mx8KShs1YeyPeDk=;
        b=VlycwB8hzOW9PVDwiHzu8l5k/quntXrG5VLkAdaIUu+/LZCsC62+PMUXQUNH66i4Un
         YUr9PSMjdim9JJVp0F/a2lCvx6Dfm4lHivR6dyGvTchP3bcl02II04OrcXPhLuJXC68I
         hFAZ56aFTu0sT4cOr9/aG7bDGWiPIOGa3i+I9TDtD57f0bhZLgiK9s6H6nPMJNIirSh5
         3L9OPB/FnM19Y8dZkKeKnuXREhgl6zSf/NqYvjRKKbFiXLNRab21fQ3koK19T+QK7UeG
         tKqz6Lyq6ZoOeVSc9TkrOeWO2POmCSVfI6pjP0fJ1mCCRpUfByX5yb5R9ss+54U+8PpK
         AG4g==
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csg>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/sparc/include/uapi/asm/setup.h | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 arch/sparc/include/uapi/asm/setup.h

diff --git a/arch/sparc/include/uapi/asm/setup.h b/arch/sparc/include/uapi/asm/setup.h
deleted file mode 100644
index c3cf1b0d30b3..000000000000
--- a/arch/sparc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- *	Just a place holder. 
- */
-
-#ifndef _UAPI_SPARC_SETUP_H
-#define _UAPI_SPARC_SETUP_H
-
-#endif /* _UAPI_SPARC_SETUP_H */
-- 
2.37.2

