From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/10] alpha: use libata instead of the legacy ide driver
Date: Thu, 18 Mar 2021 07:07:24 +0100
Message-ID: <20210318060724.GA29117@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-2-hch@lst.de> <YFLrLwjZubWUvA2J@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <YFLrLwjZubWUvA2J@zeniv-ca.linux.org.uk>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Jens Axboe <axboe@kernel.dk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>

On Thu, Mar 18, 2021 at 05:54:55AM +0000, Al Viro wrote:
> On Thu, Mar 18, 2021 at 05:56:57AM +0100, Christoph Hellwig wrote:
> > Switch the alpha defconfig from the legacy ide driver to libata.
> 
> Umm...  I don't have an IDE alpha box in a usable shape (fans on
> CPU module shat themselves), and it would take a while to resurrect
> it, but I remember the joy it used to cause in some versions.
> 
> Do you have reports of libata variants of drivers actually tested on
> those?

No, I haven't.  The whole point is that we're not going to keep 40000
lines of code around despite notice for users that don't exist or
care.  If there is a regression we'll fix it, but we're not going to
make life miserable just because we can.
