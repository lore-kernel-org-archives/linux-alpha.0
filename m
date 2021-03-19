From: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the legacy ide driver
Date: Fri, 19 Mar 2021 06:43:19 +0100
Message-ID: <20210319054319.GA9880@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
 <c1fa8e6-a05d-9ea1-f47e-9e85ea6ea65e@telegraphics.com.au>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane-mx.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <c1fa8e6-a05d-9ea1-f47e-9e85ea6ea65e@telegraphics.com.au>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Jens Axboe <axboe@kernel.dk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>

On Fri, Mar 19, 2021 at 12:43:48PM +1100, Finn Thain wrote:
> A few months ago I wrote another patch to move some more platforms away 
> from macide but it has not been tested yet. That is not to say you should 
> wait. However, my patch does have some changes that are missing from your 
> patch series, relating to ide platform devices in arch/m68k/mac/config.c. 
> I hope to be able to test this patch before the 5.13 merge window closes.

Normally we do not remove drivers for hardware that is still used.  So
at leat for macide my plan was not to take it away unless the users 
are sufficiently happy.  Or in other words:  I think waiting it the
right choice, but hopefully we can make that wait as short as possible.
