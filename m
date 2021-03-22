From: Cye Borg <cyborgyn@gmail.com>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
Date: Mon, 22 Mar 2021 17:47:38 +0100
Message-ID: <CAD4NMuYBr7m+6Zw9cmOJWMXHqNOM17RqGY8bR7itx2yq8piKcw@mail.gmail.com>
References: <20210318045706.200458-1-hch@lst.de> <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk> <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de> <20210322151503.GX1463@shell.armlinux.org.uk> <224b110e-7c42-4e19-800e-e0fa23d3bf7f@physik.fu-berlin.de>
Mime-Version: 1.0
Return-path: <linux-ide-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eo71V2xWro59w05Mq4CnF1xMsNUIPGze5LTw4FuXS2A=;
        b=DLCxZ8Y9zjxqRMlu1J8/r7nzs+yb79uVYpIuUsLrMH2v7J7Of8MvDHK0SAqytIoffm
         IAcbm21SCskZVG0eMJTr/YPMa8dHdIOU7yid/4LU7z/xIwCf9PNd33usAoL0/NQpXcnc
         o0YIKhvIluJkw1ZSUEcZMolcs/Y8JiBAbhOynMzl2CrMOnnyCLaMxMzWF2c9Ghg1b841
         4qb49GnPjICOYIu1Vhp19jfa+9rvWhFbBsLo/E4GW41FleypfdMdpq2n4VxGvHEZH6p5
         YKgzKKhCPIKkHcTfK09hDujGumj2q6l0S/SugkxawOWShbvmusbIpR3FE/vb2RMokzM/
         Dgww==
In-Reply-To: <224b110e-7c42-4e19-800e-e0fa23d3bf7f@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

I use pata_cypress on Alpha, and for the above mentioned problems,
it always restricted me to use only one IDE channel out of the two
available. Also, not forcing it to use PIO mode, it always failed to
operate. I would love to test on Alpha, and give you feedback about
a fix/finished implementation of the driver. I have both Alpha Server DS20E
and Alpha Personal Workstation 500 including that freak chipset.

Let me know if/when I can help with my limited capabilities.

btw, here is the lspci of the Compaq PWS 500au:
snow / # lspci
00:03.0 Ethernet controller: Digital Equipment Corporation DECchip
21142/43 (rev 30)
00:07.0 ISA bridge: Contaq Microsystems 82c693
00:07.1 IDE interface: Contaq Microsystems 82c693
00:07.2 IDE interface: Contaq Microsystems 82c693
00:07.3 USB controller: Contaq Microsystems 82c693
00:0b.0 Multimedia video controller: 3Dfx Interactive, Inc. Voodoo 2 (rev 02)
00:0c.0 PCI bridge: Digital Equipment Corporation DECchip 21052 (rev 01)
00:14.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev 02)
01:04.0 VGA compatible controller: Cirrus Logic GD 5430/40 [Alpine] (rev 47)
01:05.0 Display controller: Intergraph Corporation Device 00eb (rev 40)
02:04.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI (rev 05)
02:0a.0 SCSI storage controller: Broadcom / LSI 53c810 (rev 01)

Thanks, best regards,
Barnabas Viragh


On Mon, Mar 22, 2021 at 5:10 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> On 3/22/21 4:15 PM, Russell King - ARM Linux admin wrote:
> > I'm quite surprised that the CY82C693 even works on Alpha - I've
> > asked for a lspci for that last week but nothing has yet been
> > forthcoming from whoever responded to your patch for Alpha - so I
> > can't compare what I'm seeing with what's happening with Alpha.
>
> Here is lspci on my DEC Alpha XP-1000:
>
> root@tsunami:~> lspci
> 0000:00:07.0 ISA bridge: Contaq Microsystems 82c693
> 0000:00:07.1 IDE interface: Contaq Microsystems 82c693
> 0000:00:07.2 IDE interface: Contaq Microsystems 82c693
> 0000:00:07.3 USB controller: Contaq Microsystems 82c693
> 0000:00:0d.0 VGA compatible controller: Texas Instruments TVP4020 [Permedia 2] (rev 01)
> 0001:01:03.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
> 0001:01:06.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI (rev 06)
> 0001:01:08.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev 03)
> 0001:02:09.0 Ethernet controller: Intel Corporation 82541PI Gigabit Ethernet Controller (rev 05)
> root@tsunami:~>
>
> It's using pata_cypress:
>
> root@tsunami:~> lsmod|grep cypress
> pata_cypress            3595  3
> libata                235071  2 ata_generic,pata_cypress
> root@tsunami:~
>
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
>
