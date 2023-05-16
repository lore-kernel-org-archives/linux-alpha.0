From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v5 14/26] alpha: Remove empty <uapi/asm/setup.h>
Date: Tue, 16 May 2023 01:53:45 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2305160147100.11892@angie.orcam.me.uk>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com> <20230306100508.1171812-15-alexghiti@rivosinc.com>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
In-Reply-To: <20230306100508.1171812-15-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csg>

On Mon, 6 Mar 2023, Alexandre Ghiti wrote:

> diff --git a/arch/alpha/include/uapi/asm/setup.h b/arch/alpha/include/uapi/asm/setup.h
> deleted file mode 100644
> index 9b3b5ba39b1d..000000000000
> --- a/arch/alpha/include/uapi/asm/setup.h
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -#ifndef _UAPI__ALPHA_SETUP_H
> -#define _UAPI__ALPHA_SETUP_H
> -
> -#endif /* _UAPI__ALPHA_SETUP_H */

 You can't just remove a UAPI header like this, something will break; cf. 
arch/arc/include/uapi/asm/setup.h, or arch/x86/include/uapi/asm/setup.h if 
you want it brief.

 I suggest that you fold it into 01/26 (it makes no sense to have empty 
multiple inclusion protection), and likewise for the relevant remaining 
headers.

  Maciej
