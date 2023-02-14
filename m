From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 19/24] parisc: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:20 +0100
Message-ID: <20230214074925.228106-20-alexghiti__9974.89925227768$1676362186$gmane$org@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIGhaDfE5SLWmKnSG9ikHY6squrBg187QDirpB8eFVo=;
        b=3lVcUd9sn2zQtFJR0u5J0kIaXOBwAUdWgS6TENWUzffST6PzutUUl4KQpRH68UCRqd
         AmXoKs3y/uU0PKnWtHqvwoOcZOhZN4v1Z7I6ss2MsSWN20umEr3jHUop77luRvjOQ+bk
         v9lp8QZUxuG4bx+6A9WxrhaJL2ZCl/14dMrBN4+4+AEiSiWCOTWv1xrROBT0jCNPejG9
         KRw3spY1j9L9Rl4qLoqZjdsJkumRxyNrfV8n0f91+GGjQwwO2+2THxyXibuvkVx1Ha1Y
         3AaXyilcA+IllPgV2/eY+YJepAx3JFCIrPZ694HAOjj7uDLhBVRVm9DXebU0wkwu1Nw1
         GNsA==
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/parisc/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/parisc/include/uapi/asm/setup.h

diff --git a/arch/parisc/include/uapi/asm/setup.h b/arch/parisc/include/uapi/asm/setup.h
deleted file mode 100644
index bfad89428e47..000000000000
--- a/arch/parisc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _PARISC_SETUP_H
-#define _PARISC_SETUP_H
-
-#endif /* _PARISC_SETUP_H */
-- 
2.37.2

