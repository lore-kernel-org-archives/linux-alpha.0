From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH] serial: 8250: Move alpha-specific quirk out of the core
Date: Thu, 16 Dec 2021 22:58:33 +0100
Message-ID: <d372fa08-b935-f13a-e003-805a4b09aa57@physik.fu-berlin.de>
References: <202112162036.1BGKaKGI003165@valdese.nms.ulrich-teichert.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <202112162036.1BGKaKGI003165@valdese.nms.ulrich-teichert.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ulrich Teichert <krypton@ulrich-teichert.org>, Lukas Wunner <lukas@wunner.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Lino Sanfilippo <LinoSanfilippo@gmx.de>, Philipp Rosenberger <p.rosenberger@kunbus.com>

Hi Ulrich!

On 12/16/21 21:36, Ulrich Teichert wrote:
> Wouldn't that mean that you can't use a generic Alpha kernel on the Jensen
> anymore? CONFIG_ALPHA_JENSEN is only set if you specifically select the
> Jensen as target, not when you build a generic kernel. That would be a step
> back in my opinion, as the Debian generic kernel from debian-ports did
> as least boot up on real hardware and the serial console worked just fine
> [granted, the EISA cards were not detected, even after support for it
> got enabled, but that's another case of worms].

If you could figure out what kernel option we might be missing for the Jensen
machine to get EISA working, please let me know. I only have newer Alphas myself,
so I am relying on your debugging help here.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

