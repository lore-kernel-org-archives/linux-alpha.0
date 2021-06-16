From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: remove the legacy ide driver v2
Date: Wed, 16 Jun 2021 15:51:07 +0200
Message-ID: <c5b74922-2c2d-c7bb-5302-65e675debdfe@physik.fu-berlin.de>
References: <20210616134658.1471835-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20210616134658.1471835-1-hch@lst.de>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org

Hi Christoph!

On 6/16/21 3:46 PM, Christoph Hellwig wrote:
> libata mostly covers all hardware supported by the legacy ide driver.
> There are three mips drivers that are not supported, but the linux-mips
> list could not identify any users of those.  There also are two m68k
> drivers that do not have libata equivalents, which might or might not
> have users, so we'll need some input and possibly help from the m68k
> community here.

I think the m68k drivers are being addressed at the moment. But Geert will
know more about the current status.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
