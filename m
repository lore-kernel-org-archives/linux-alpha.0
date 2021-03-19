From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/10] MIPS: disable CONFIG_IDE in malta*_defconfig
Date: Fri, 19 Mar 2021 14:03:57 +0100
Message-ID: <20210319130356.GA2624@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-9-hch@lst.de>
 <20210318141900.GA10554@alpha.franken.de>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <20210318141900.GA10554@alpha.franken.de>
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
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>

On Thu, Mar 18, 2021 at 03:19:00PM +0100, Thomas Bogendoerfer wrote:
> On Thu, Mar 18, 2021 at 05:57:04AM +0100, Christoph Hellwig wrote:
> >  arch/mips/configs/malta_kvm_guest_defconfig | 3 ---
> 
> that file is gone in mips-next.
> 
> I could take all MIPS patches into mips-next, if you want...

Fine with me - it shouldn't really matter if the defconfig updates
go in independently.  Do you want a resend with the typos fixed
against mips-next or are you simply going to fix these things up?
