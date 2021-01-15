From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH] Adds a new ioctl32 syscall for backwards compatibility
 layers
Date: Fri, 15 Jan 2021 20:01:15 +0000
Message-ID: <b15672b1caec4cf980f2753d06b03596@AcuMS.aculab.com>
References: <20210106064807.253112-1-Sonicadvance1@gmail.com>
 <20210115070326.294332-1-Sonicadvance1@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210115070326.294332-1-Sonicadvance1@gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'sonicadvance1@gmail.com'" <sonicadvance1@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.co>

From: sonicadvance1@gmail.com
> Sent: 15 January 2021 07:03
> Problem presented:
> A backwards compatibility layer that allows running x86-64 and x86
> processes inside of an AArch64 process.
>   - CPU is emulated
>   - Syscall interface is mostly passthrough
>   - Some syscalls require patching or emulation depending on behaviour
>   - Not viable from the emulator design to use an AArch32 host process
> 

You are going to need to add all the x86 compatibility code into
your arm64 kernel.
This is likely to be different from the 32bit arm compatibility
because 64bit items are only aligned on 32bit boundaries.
The x86 x32 compatibility will be more like the 32bit arm 'compat'
code - I'm pretty sure arm32 64bit aligned 64bit data.

You'll then need to remember how the process entered the kernel
to work out which compatibility code to invoke.
This is what x86 does.
It allows a single process to do all three types of system call.

Trying to 'patch up' structures outside the kernel, or in the
syscall interface code will always cause grief somewhere.
The only sane place is in the code that uses the structures.
Which, for ioctls, means inside the driver that parses them.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

