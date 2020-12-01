From: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
Date: Tue, 1 Dec 2020 14:10:33 +0200
Message-ID: <20201201121033.GG557259@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
 <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
 <20201117062316.GB370813@kernel.org>
 <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
 <20201201102901.GF557259@kernel.org>
 <e3d5d791-8e4f-afcc-944c-24f66f329bd7@physik.fu-berlin.de>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606824645;
        bh=3UWBuUpLQ/U5hRfLC4gft5L+4j9/v/pcU/sPZKvrxZ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SwWnBV1xCIhVvU9x0mK1pgRGpkHqFlT1hqcTXr0/nvDGqUPHUABBTNM0agnkIe3U3
         UkybY5+2Fg7ba3y6mnneoWfhFZQlBlUqm4qaUir9UJOYoGhL+Mv/tG3nQR3yKEpQSZ
         R7wXQoBGjR007g9wr7gE9jMaHOZ84lOxt2eQt7f4=
Content-Disposition: inline
In-Reply-To: <e3d5d791-8e4f-afcc-944c-24f66f329bd7@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>, Meelis Roos <mroos@linux.ee>, Michael Schmitz <schmitzmic@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>, Russell King <linux@armlinux.org.uk>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org, linux-snps-arc@l

On Tue, Dec 01, 2020 at 12:35:09PM +0100, John Paul Adrian Glaubitz wrote:
> Hi Mike!
> 
> On 12/1/20 11:29 AM, Mike Rapoport wrote: 
> > These changes are in linux-mm tree (https://www.ozlabs.org/~akpm/mmotm/
> > with a mirror at https://github.com/hnaz/linux-mm)
> > 
> > I beleive they will be coming in 5.11.
> 
> Just pulled from that tree and gave it a try, it actually fails to build:
> 
>   LDS     arch/ia64/kernel/vmlinux.lds
>   AS      arch/ia64/kernel/entry.o
> arch/ia64/kernel/entry.S: Assembler messages:
> arch/ia64/kernel/entry.S:710: Error: Operand 2 of `and' should be a general register
> arch/ia64/kernel/entry.S:710: Error: qualifying predicate not followed by instruction
> arch/ia64/kernel/entry.S:848: Error: Operand 2 of `and' should be a general register
> arch/ia64/kernel/entry.S:848: Error: qualifying predicate not followed by instruction
>   GEN     usr/initramfs_data.cpio
> make[1]: *** [scripts/Makefile.build:364: arch/ia64/kernel/entry.o] Error 1
> make: *** [Makefile:1797: arch/ia64/kernel] Error 2
> make: *** Waiting for unfinished jobs....
>   CC      init/do_mounts_initrd.o
>   SHIPPED usr/initramfs_inc_data
>   AS      usr/initramfs_data.o

Hmm, it was buidling fine with v5.10-rc2-mmotm-2020-11-07-21-40.
I'll try to see what could cause this.

Do you build with defconfig or do you use a custom config?

> Adrian
> 
> -- 
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
> 
> 

-- 
Sincerely yours,
Mike.
