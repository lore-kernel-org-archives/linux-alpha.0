From: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] alpha: Declare virt_to_phys and virt_to_bus parameter as
 pointer to volatile
Date: Thu, 9 Sep 2021 10:13:32 +0200
Message-ID: <CAK8P3a0U-BxUfdTiwDRNHvGHetenF0zVObNVj0z67SqzzEeFyg@mail.gmail.com>
References: <20210909050033.1564459-1-linux@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631175230;
        bh=MCd05u9z+cr1cwZljpMuCHpDxLmMpn+MkW/t1mn9uUw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pSneemarx+jHsqihej06zoNGFQUu2/DLRsEFYfL4J7F9nL1bm2jPKq8uouPpgMONf
         O+0JdkiTZTq8+MecD22iU5FDzkHpzFgyrL/hTl0gSTiw2UWvLRzTZxMrHulZmJDIHN
         Xuo0Q862T/nDsBb/9bWFiBa6bzi++zpzjS27BNP6tneoonEQMkxK2SUJkFkJ4Vlv6j
         5YBJZJ2n9i60jMYg7UiXJfFjFshW+qrZGt6baSFvh1w3SgkQtedP1/Kt7S7g10DxiT
         ahC4jA5gqibmdr3FzeNtb+6/n1IOk+go8niO0bayrk9E2mRLmoeynFUFy9hl7BXBOK
         59Hm7rLYX26Ag==
In-Reply-To: <20210909050033.1564459-1-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Sep 9, 2021 at 7:00 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Some drivers pass a pointer to volatile data to virt_to_bus() and
> virt_to_phys(). One exception is alpha. This results in a number
> of compile errors such as
>
> drivers/net/wan/lmc/lmc_main.c: In function 'lmc_softreset':
> drivers/net/wan/lmc/lmc_main.c:1782:50: error:
>         passing argument 1 of 'virt_to_bus' discards 'volatile'
>         qualifier from pointer target type
>
> drivers/atm/ambassador.c: In function 'do_loader_command':
> drivers/atm/ambassador.c:1747:58: error:
>         passing argument 1 of 'virt_to_bus' discards 'volatile'
>         qualifier from pointer target type
>
> Declare the parameter of virt_to_phys and virt_to_bus as pointer to volatile
> to fix the problem.
>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> ---
> We could instead try to modify the affected drivers, but both drivers
> use the buffer to communicate with the chip, so that would require lots
> of typecasts there. Another option would be to disable affected drivers
> for alpha, but that seems undesirable.
> Other ideas welcome.

Your patch is the obvious workaround, as this makes alpha behave the
same way as all the other architectures.

Drivers using virt_to_bus() are already nonportable, so we could also
decide to go through all users to see which ones are ready to be
retired, and go through the architectures to see which ones actually
still require drivers that use virt_to_bus(), removing the interface from
the others. The ones I see are

arch/alpha/Kconfig:     select VIRT_TO_BUS
arch/h8300/Kconfig:     select VIRT_TO_BUS
arch/ia64/Kconfig:      select VIRT_TO_BUS
arch/m68k/Kconfig:      select VIRT_TO_BUS
arch/microblaze/Kconfig:        select VIRT_TO_BUS
arch/mips/Kconfig:      select VIRT_TO_BUS
arch/parisc/Kconfig:    select VIRT_TO_BUS
arch/powerpc/Kconfig:   select VIRT_TO_BUS                      if !PPC64
arch/x86/Kconfig:       select VIRT_TO_BUS
arch/xtensa/Kconfig:    select VIRT_TO_BUS

drivers/atm/Kconfig:    depends on PCI && VIRT_TO_BUS
drivers/atm/Kconfig:    depends on PCI && VIRT_TO_BUS
drivers/atm/Kconfig:    depends on PCI && VIRT_TO_BUS
drivers/atm/Kconfig:    depends on PCI && VIRT_TO_BUS
drivers/media/pci/sta2x11/Kconfig:      depends on PCI && VIDEO_V4L2
&& VIRT_TO_BUS && I2C
drivers/net/appletalk/Kconfig:  depends on DEV_APPLETALK && (ISA ||
EISA) && ISA_DMA_API && VIRT_TO_BUS
drivers/net/ethernet/dec/tulip/Kconfig: depends on VIRT_TO_BUS ||
ALPHA || PPC || SPARC
drivers/net/wan/Kconfig:        depends on ISA && m && ISA_DMA_API &&
INET && HDLC && VIRT_TO_BUS
drivers/net/wan/Kconfig:        depends on ISA && m && ISA_DMA_API &&
HDLC && VIRT_TO_BUS
drivers/net/wan/Kconfig:        depends on PCI && VIRT_TO_BUS && HDLC
drivers/net/wan/Kconfig:        depends on ISA && m && ISA_DMA_API &&
INET && HDLC && VIRT_TO_BUS
drivers/scsi/Kconfig:   depends on SCSI && PCI && VIRT_TO_BUS
drivers/scsi/Kconfig:   depends on PCI && SCSI && VIRT_TO_BUS
drivers/vme/bridges/Kconfig:    depends on VIRT_TO_BUS

I think we can drop VIRT_TO_BUS from everything other
than x86-32, m68k and ppc32, and fix the tulip and xlr_net
drivers to not use it.

        Arnd
