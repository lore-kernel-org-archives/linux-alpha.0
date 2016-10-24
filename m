From: Helge Deller <deller@gmx.de>
Subject: Re: BRSGP relocation truncations in linking kernel for Alpha.
Date: Mon, 24 Oct 2016 22:59:02 +0200
Message-ID: <580E7616.2020806@gmx.de>
References: <20161022024044.vbfxx4o2rrkwc7gy@tower>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20161022024044.vbfxx4o2rrkwc7gy@tower>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>

Hi Michael,

On 22.10.2016 04:41, Michael Cree wrote:
> When building recent kernels for Alpha I am getting the following
> relocation errors:
> 
> alpha-linux-gnu-ld -static -N --build-id -o .tmp_vmlinux1 -T
> ./arch/alpha/kernel/vmlinux.lds arch/alpha/kernel/head.o init/built-in.o
> --start-group usr/built-in.o arch/alpha/kernel/built-in.o
> arch/alpha/mm/built-in.o arch/alpha/math-emu/built-in.o
> kernel/built-in.o certs/built-in.o mm/built-in.o fs/built-in.o
> ipc/built-in.o security/built-in.o crypto/built-in.o block/built-in.o
> lib/lib.a arch/alpha/lib/lib.a lib/built-in.o arch/alpha/lib/built-in.o
> drivers/built-in.o sound/built-in.o firmware/built-in.o net/built-in.o
> virt/built-in.o --end-group
> net/built-in.o: In function `packet_setsockopt':
> net/packet/af_packet.o:(.text+0xf71d0): relocation truncated to fit:
> BRSGP against symbol `__copy_user' defined in .text section in
> arch/alpha/lib/lib.a(ev6-copy_user.o)
> 
> I can solve it by de-selecting config items, but it is getting
> frustrating that I can't build the kernel I would like to build.
> 
> Is there anything we can do to resolve these relocations?

You could try to play around where various functions get located
in the final vmlinux file. For that you need to modify 
arch/alpha/kernel/vmlinux.lds.S.
I did quite such optimizations for parisc like that.

Does it only happens for __copy_user() ?
If yes, I assume the problem happens because of __copy_tofrom_user_nocheck() in 
uaccess.h is always inlined. Maybe un-inlining helps?
Or, the inline-assembly for jsr/bsr needs tweeking ?

Helge 
