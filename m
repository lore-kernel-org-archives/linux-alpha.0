From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 5/6] m68k: use libata instead of the legacy ide driver
Date: Wed, 16 Jun 2021 16:04:24 +0200
Message-ID: <20210616140424.GA32014@lst.de>
References: <20210616134658.1471835-1-hch@lst.de> <20210616134658.1471835-6-hch@lst.de> <CAMuHMdUbEBO28w3XKOvSKUk3XUaesOqxEfL+8i4W0Thu10pNTw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-ide-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUbEBO28w3XKOvSKUk3XUaesOqxEfL+8i4W0Thu10pNTw@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-ide@vger.kernel.org, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Wed, Jun 16, 2021 at 04:03:38PM +0200, Geert Uytterhoeven wrote:
> Hi Christoph,
> 
> On Wed, Jun 16, 2021 at 3:50 PM Christoph Hellwig <hch@lst.de> wrote:
> > Switch the m68 defconfigs from the deprecated ide subsystem to use libata
> > instead.  The gayle and buddha and falcon drivers are enabled for libata,
> > while support for the q40 and macide drivers is lost.
> 
> I guess you forgot to update the last sentence, too?
> These are now handled by the falcon and generic platform libata drivers.

Indeed.

> With the above fixed:
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks!
