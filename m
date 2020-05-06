From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] alpha: add a delay between RTC port write and read
Date: Wed, 6 May 2020 16:20:39 +0200
Message-ID: <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, Sinan Kaya <okaya@codeaurora.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

On Wed, May 6, 2020 at 1:21 PM Mikulas Patocka <mpatocka@redhat.com> wrote:

>  /*
>   * The yet supported machines all access the RTC index register via
>   * an ISA port access but the way to access the date register differs ...
> + *
> + * The ISA bus on Alpha Avanti doesn't like back-to-back accesses,
> + * we need to add a small delay.
>   */
>  #define CMOS_READ(addr) ({ \
>  outb_p((addr),RTC_PORT(0)); \
> +udelay(2); \
>  inb_p(RTC_PORT(1)); \


The inb_p() / outb_p() functions are meant to already have a delay in them,
maybe we should just add it there for alpha?

     Arnd
