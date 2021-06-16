From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 5/6] m68k: use libata instead of the legacy ide driver
Date: Wed, 16 Jun 2021 16:03:38 +0200
Message-ID: <CAMuHMdUbEBO28w3XKOvSKUk3XUaesOqxEfL+8i4W0Thu10pNTw@mail.gmail.com>
References: <20210616134658.1471835-1-hch@lst.de> <20210616134658.1471835-6-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20210616134658.1471835-6-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-ide@vger.kernel.org, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Christoph,

On Wed, Jun 16, 2021 at 3:50 PM Christoph Hellwig <hch@lst.de> wrote:
> Switch the m68 defconfigs from the deprecated ide subsystem to use libata
> instead.  The gayle and buddha and falcon drivers are enabled for libata,
> while support for the q40 and macide drivers is lost.

I guess you forgot to update the last sentence, too?
These are now handled by the falcon and generic platform libata drivers.

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/m68k/configs/amiga_defconfig | 10 +++++-----
>  arch/m68k/configs/atari_defconfig |  8 ++++----
>  arch/m68k/configs/mac_defconfig   |  8 ++++----
>  arch/m68k/configs/multi_defconfig | 14 +++++++-------
>  arch/m68k/configs/q40_defconfig   |  8 ++++----
>  5 files changed, 24 insertions(+), 24 deletions(-)

With the above fixed:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
