From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 01/10] alpha: use libata instead of the legacy ide driver
Date: Thu, 18 Mar 2021 05:54:55 +0000
Message-ID: <YFLrLwjZubWUvA2J@zeniv-ca.linux.org.uk>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-2-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210318045706.200458-2-hch@lst.de>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On Thu, Mar 18, 2021 at 05:56:57AM +0100, Christoph Hellwig wrote:
> Switch the alpha defconfig from the legacy ide driver to libata.

Umm...  I don't have an IDE alpha box in a usable shape (fans on
CPU module shat themselves), and it would take a while to resurrect
it, but I remember the joy it used to cause in some versions.

Do you have reports of libata variants of drivers actually tested on
those?
