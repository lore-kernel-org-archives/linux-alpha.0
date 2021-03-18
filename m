From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH 01/10] alpha: use libata instead of the legacy ide driver
Date: Thu, 18 Mar 2021 08:54:49 +0100
Message-ID: <3a752e8c-b518-6d61-75e7-3549e9906f83@physik.fu-berlin.de>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-2-hch@lst.de> <YFLrLwjZubWUvA2J@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-owner@vger.kernel.org>
In-Reply-To: <YFLrLwjZubWUvA2J@zeniv-ca.linux.org.uk>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>
Cc: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Hi Al!

On 3/18/21 6:54 AM, Al Viro wrote:
> On Thu, Mar 18, 2021 at 05:56:57AM +0100, Christoph Hellwig wrote:
>> Switch the alpha defconfig from the legacy ide driver to libata.
> 
> Umm...  I don't have an IDE alpha box in a usable shape (fans on
> CPU module shat themselves), and it would take a while to resurrect
> it, but I remember the joy it used to cause in some versions.
> 
> Do you have reports of libata variants of drivers actually tested on
> those?

At least pata_cypress works fine on my AlphaStation XP1000:

root@tsunami:~> lspci
0000:00:07.0 ISA bridge: Contaq Microsystems 82c693
0000:00:07.1 IDE interface: Contaq Microsystems 82c693
0000:00:07.2 IDE interface: Contaq Microsystems 82c693
0000:00:07.3 USB controller: Contaq Microsystems 82c693
0000:00:0d.0 VGA compatible controller: Texas Instruments TVP4020 [Permedia 2] (rev 01)
0001:01:03.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
0001:01:06.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI (rev 06)
0001:01:08.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev 03)
0001:02:09.0 Ethernet controller: Intel Corporation 82541PI Gigabit Ethernet Controller (rev 05)
root@tsunami:~> lsmod|grep pata
pata_cypress            3595  3
libata                235071  2 ata_generic,pata_cypress
root@tsunami:~>

I also have two AlphaStation 233 currently in storage which I assume use
different IDE chipset which I could test as well.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

