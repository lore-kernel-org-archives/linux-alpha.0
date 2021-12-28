From: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
Date: Tue, 28 Dec 2021 17:32:02 +0100
Message-ID: <20211228173202.678baa44@coco.lan>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
        <20211227164317.4146918-3-schnelle@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640709137;
        bh=wYaH3iu50Xg/A/DNjyHFOWIgZ4rByTFlvgaE/FMZWqY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BTzyk4t+6+nRs9+zo0NSJy02+zZ1BbNUT8+XJkgAXThbIqJ8Tu8Bp03GHCGKlrzYX
         f6mxa+4pitBIl4IybQMSKiUDklqv+EWiC5aYtEZ6X8W5ej/Y8IazWuQESnlWIxcuv8
         qpU3CbEDSyN9MmSRXbz0D4xklNr1SXs2T+TD8ORlrOWK73AvxU+cJQKO+CcdLaW79G
         ATgeIIpXvKMfQoRIkEcfC8ZFCuCdHf6v7cpx9bOyNNQeNgeuyk4t75tVGNPued/kzl
         l93VJjvTGGYCbrQFgpNex301S0U5MY1BOFyW0fzdInsg4whSwmaK2ya34ydGPe6YZY
         2nZg+WlyMxMSA==
In-Reply-To: <20211227164317.4146918-3-schnelle@linux.ibm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Chris Zankel <chris@zankel.net>, Karol Gugala <kgugala@antmicro.com>, Jeff Dike <jdike@addtoit.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Brian Cain <bcain@codeaurora.org>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kern>

Em Mon, 27 Dec 2021 17:42:47 +0100
Niklas Schnelle <schnelle@linux.ibm.com> escreveu:

> We introduce a new HAS_IOPORT Kconfig option to gate support for
> I/O port access. In a future patch HAS_IOPORT=n will disable compilation
> of the I/O accessor functions inb()/outb() and friends on architectures
> which can not meaningfully support legacy I/O spaces. On these platforms
> inb()/outb() etc are currently just stubs in asm-generic/io.h which when
> called will cause a NULL pointer access which some compilers actually
> detect and warn about.
> 
> The dependencies on HAS_IOPORT in drivers as well as ifdefs for
> HAS_IOPORT specific sections will be added in subsequent patches on
> a per subsystem basis. Then a final patch will ifdef the I/O access
> functions on HAS_IOPORT thus turning any use not gated by HAS_IOPORT
> into a compile-time warning.
> 
> Link: https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

...

> @@ -486,6 +487,9 @@ config HAS_IOMEM
>  	depends on !NO_IOMEM
>  	default y
>  
> +config HAS_IOPORT
> +	def_bool ISA || LEGACY_PCI
> +

That doesn't sound right. 

The only dependency for LEGACY_PCI is PCI. If one selects LEGACY_PCI
on an architecture that doesn't support it, this will cause problems.

Instead, HAS_IOPORT should be selected at architecture level, and
the dependency here should be just the opposite: LEGACY_API should
depends on HAS_IOPORT.

Thanks,
Mauro
