From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 08/24] parisc: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:09 +0100
Message-ID: <20230214074925.228106-9-alexghiti__11137.498640322$1676361541$gmane$org@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKtnovAK57aTUQkxGFuVdZUCgYZPh93HJz6h/9KVrck=;
        b=y2SxFP6uVSLNYz9fZvs3Zs4vhw4emYUflONQjIooXwDO5X6gb+wppeyUmN2kbvXFp3
         gFadUXn2Cp6yqNx9BDGh77dMz5r+vX2Kj22jLhvWxa606s5pKuk33OrVMfmVGTSXH4Iw
         +LoFIHTgDRFHVjoYg4ixCY3aHm67ODUPGfSc9P9eN6uKI9PTm52qHExgYzYPLnSr9J/q
         tLNh+jZRCj6qrjKQvcjjvtKRt0/4/7bcAVMQ2ZOu61x7gveXSgs6wqdmp6NeNPWHUIIE
         PPfyUfT5XwF4q0oq7T93YCkNxcwDBU0oXmgdg4Z+7bvc1OIW0EXOQFT6P/48RtxnrGAp
         ooug==
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

From: Palmer Dabbelt <palmer@rivosinc.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/parisc/include/asm/setup.h      | 7 +++++++
 arch/parisc/include/uapi/asm/setup.h | 2 --
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 arch/parisc/include/asm/setup.h

diff --git a/arch/parisc/include/asm/setup.h b/arch/parisc/include/asm/setup.h
new file mode 100644
index 000000000000..78b2f4ec7d65
--- /dev/null
+++ b/arch/parisc/include/asm/setup.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _PARISC_SETUP_H
+#define _PARISC_SETUP_H
+
+#define COMMAND_LINE_SIZE	1024
+
+#endif /* _PARISC_SETUP_H */
diff --git a/arch/parisc/include/uapi/asm/setup.h b/arch/parisc/include/uapi/asm/setup.h
index 78b2f4ec7d65..bfad89428e47 100644
--- a/arch/parisc/include/uapi/asm/setup.h
+++ b/arch/parisc/include/uapi/asm/setup.h
@@ -2,6 +2,4 @@
 #ifndef _PARISC_SETUP_H
 #define _PARISC_SETUP_H
 
-#define COMMAND_LINE_SIZE	1024
-
 #endif /* _PARISC_SETUP_H */
-- 
2.37.2

