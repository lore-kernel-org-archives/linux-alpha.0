From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] alpha: add a delay before serial port read
Date: Wed, 6 May 2020 13:47:11 +0200
Message-ID: <20200506114711.GB3024358@kroah.com>
References: <alpine.LRH.2.02.2005060721450.25338@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588765633;
        bh=TQtzKK1yWHnWVY5HHhmUp9cmIZd1E0pM/EFAAa1vPx0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ewVPNVR4P1MXTFhr7L5X7HKKiBSMwMW4DMbRW8smM2nQpdL+r5a6XYzx/WkHg6lFi
         KrDTTCSSHgaYX28n1v/F88N6PlvsxNTGgfF+T2JO/iRzQyCIX+4EEef81v5EDoadto
         +Ko6Phs97IoRZgrgDwdTYe1MNpbvXMpNqyndr8FU=
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.2005060721450.25338@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Sinan Kaya <okaya@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

On Wed, May 06, 2020 at 07:23:31AM -0400, Mikulas Patocka wrote:
> The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
> barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
> the Alpha Avanti platform.
> 
> The patch changes timing between accesses to the ISA bus, in particular,
> it reduces the time between "write" access and a subsequent "read" access.
> 
> This causes lock-up when accessing the real time clock and serial ports.
> 
> This patch fixes the serial ports by adding a small delay before the "inb"
> instruction.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
> Cc: stable@vger.kernel.org	# v4.17+
> 
> ---
>  drivers/tty/serial/8250/8250_port.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> Index: linux-stable/drivers/tty/serial/8250/8250_port.c
> ===================================================================
> --- linux-stable.orig/drivers/tty/serial/8250/8250_port.c	2020-05-06 08:25:19.000000000 +0200
> +++ linux-stable/drivers/tty/serial/8250/8250_port.c	2020-05-06 09:04:17.000000000 +0200
> @@ -442,6 +442,10 @@ static unsigned int mem32be_serial_in(st
>  
>  static unsigned int io_serial_in(struct uart_port *p, int offset)
>  {
> +#ifdef CONFIG_ALPHA
> +/* we need a small delay, the Alpha Avanti chipset locks up with back-to-back accesses */
> +	ndelay(300);
> +#endif

We really do not like #ifdef in .c files, especially ones that cause a
coding style violation :)

Why can't you do this as a quirk for this specific chipset?  You should
tie it to the serial port hardware type, not to the CPU type.

thanks,

greg k-h
