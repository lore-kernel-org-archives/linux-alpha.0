From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Wed, 4 May 2022 16:08:40 -0500
Message-ID: <20220504210840.GA469916@bhelgaas>
References: <20220429135108.2781579-2-schnelle@linux.ibm.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651698522;
        bh=y1eZ0VyTuh3OSu3SZE5hnm+6Lqgi7WUL9wuM4x9LDoU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=OV+zeMEqAJx67x4OYYs/T+PwaB9EPFjKfNsjZzrWwMVM3NvLvNFpPf0wDtRgV6hPg
         C/vW0RHXE+D3VHZkPbIlT7vV9H8IzZjwKHGMG7joXJdlZZ7WJg8oDJqQBcpyc4rw/O
         yxAB78m6HEpQDrzbacEayJr8iiRcV1EWi7mSGZxb5IDhBXSg0dvOB0Jpz0xpdKT8q1
         53W71wtG3ZAAJTFq4C2Bw331IYIMqmF+azzr+0ky2kC+20quz/B/hGbW52VPMkvf2m
         sc7xISbNbAO/Ktfv/RlrnLm3f7ClaHPrrdpfMsEfr0tf1mKOlzAyEBnIbIHem9sEJj
         ZVekgou/eHQhA==
Content-Disposition: inline
In-Reply-To: <20220429135108.2781579-2-schnelle@linux.ibm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-pci@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>

On Fri, Apr 29, 2022 at 03:49:59PM +0200, Niklas Schnelle wrote:
> We introduce a new HAS_IOPORT Kconfig option to indicate support for
> I/O Port access. In a future patch HAS_IOPORT=n will disable compilation
> of the I/O accessor functions inb()/outb() and friends on architectures
> which can not meaningfully support legacy I/O spaces such as s390 or
> where such support is optional. 

So you plan to drop inb()/outb() on architectures where I/O port space
is optional?  So even platforms that have I/O port space may not be
able to use it?

This feels like a lot of work where the main benefit is to keep
Kconfig from offering drivers that aren't of interest on s390.

Granted, there may be issues where inb()/outb() does the wrong thing
such as dereferencing null pointers when I/O port space isn't
implemented.  I think that's a defect in inb()/outb() and could be
fixed there.

Bjorn
