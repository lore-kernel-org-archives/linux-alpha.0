From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: [PATCH] serial: 8250: Move alpha-specific quirk out of the core
Date: Thu, 16 Dec 2021 21:36:20 +0100 (CET)
Message-ID: <202112162036.1BGKaKGI003165@valdese.nms.ulrich-teichert.org>
References: <af967f273724aff4cff3c49470110a48f790794e.1639676574.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <af967f273724aff4cff3c49470110a48f790794e.1639676574.git.lukas@wunner.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lukas Wunner <lukas@wunner.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, Ulrich Teichert <krypton@ulrich-teichert.org>, Linus Torvalds <torvalds@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Lino Sanfilippo <LinoSanfilippo@gmx.de>, Philipp Rosenberger <p.rosenberger@kunbus.com>

Hi Lukas,

> struct uart_8250_port contains mcr_mask and mcr_force members whose
> sole purpose is to work around an alpha-specific quirk.  This code
> doesn't belong in the core where it is executed by everyone else,
> so move it to a proper ->set_mctrl callback which is used on alpha only.
> 
> The alpha-specific quirk was introduced in January 1995:
> https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/diff/drivers/char/serial.c?h=1.1.83
> 
> The members in struct uart_8250_port were added in 2002:
> https://git.kernel.org/history/history/c/4524aad27854
> 
> The quirk applies to non-PCI alphas and arch/alpha/Kconfig specifies
> "select FORCE_PCI if !ALPHA_JENSEN".  So apparently the only affected
> machine is the EISA-based Jensen that Linus was working on back then:
> https://lore.kernel.org/all/CAHk-=wj1JWZ3sCrGz16nxEj7=0O+srMg6Ah3iPTDXSPKEws_SA@mail.gmail.com/
> 
> Up until now the quirk is not applied unless CONFIG_PCI is disabled.
> If users forget to do that, the serial ports aren't usable on Jensen
> and the machine may not boot in the first place.  Avoid by confining
> the quirk to CONFIG_ALPHA_JENSEN instead.

Wouldn't that mean that you can't use a generic Alpha kernel on the Jensen
anymore? CONFIG_ALPHA_JENSEN is only set if you specifically select the
Jensen as target, not when you build a generic kernel. That would be a step
back in my opinion, as the Debian generic kernel from debian-ports did
as least boot up on real hardware and the serial console worked just fine
[granted, the EISA cards were not detected, even after support for it
got enabled, but that's another case of worms].

Unfortunately I still can't boot my Jensen with a self-build kernel (that
it's the only Alpha without netboot makes it only harder), so
I can't even test your patch, but my plan is to get it booting over
my xmas vacation :-)

CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction
