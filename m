From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: [PATCH] serial: 8250: Move alpha-specific quirk out of the core
Date: Sun, 19 Dec 2021 18:41:14 +0100 (CET)
Message-ID: <202112191741.1BJHfEU8008736@valdese.nms.ulrich-teichert.org>
References: <d372fa08-b935-f13a-e003-805a4b09aa57@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <d372fa08-b935-f13a-e003-805a4b09aa57@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>, Lukas Wunner <lukas@wunner.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Lino Sanfilippo <LinoSanfilippo@gmx.de>, Philipp Rosenberger <p.rosenberger@kunbus.com>

Hi Adrian,

> On 12/16/21 21:36, Ulrich Teichert wrote:
> > Wouldn't that mean that you can't use a generic Alpha kernel on the Jensen
> > anymore? CONFIG_ALPHA_JENSEN is only set if you specifically select the
> > Jensen as target, not when you build a generic kernel. That would be a step
> > back in my opinion, as the Debian generic kernel from debian-ports did
> > as least boot up on real hardware and the serial console worked just fine
> > [granted, the EISA cards were not detected, even after support for it
> > got enabled, but that's another case of worms].
> 
> If you could figure out what kernel option we might be missing for the Jensen
> machine to get EISA working, please let me know. I only have newer Alphas myself,
> so I am relying on your debugging help here.

I know, I know, have been completely absorbed in real-live matters lately,
my apologies, but I will dig into that between xmas and new year,

promise,
CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction
