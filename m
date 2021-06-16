From: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the legacy ide driver v2
Date: Wed, 16 Jun 2021 15:52:41 +0200
Message-ID: <20210616135241.GB30671@lst.de>
References: <20210616134658.1471835-1-hch@lst.de> <c5b74922-2c2d-c7bb-5302-65e675debdfe@physik.fu-berlin.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c5b74922-2c2d-c7bb-5302-65e675debdfe@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org

On Wed, Jun 16, 2021 at 03:51:07PM +0200, John Paul Adrian Glaubitz wrote:
> Hi Christoph!
> 
> On 6/16/21 3:46 PM, Christoph Hellwig wrote:
> > libata mostly covers all hardware supported by the legacy ide driver.
> > There are three mips drivers that are not supported, but the linux-mips
> > list could not identify any users of those.  There also are two m68k
> > drivers that do not have libata equivalents, which might or might not
> > have users, so we'll need some input and possibly help from the m68k
> > community here.
> 
> I think the m68k drivers are being addressed at the moment. But Geert will
> know more about the current status.

Actually they are, and the patches are in the libata tree.  I just forgot
to update the cover letter.
