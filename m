From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] serial: 8250: Move alpha-specific quirk out of the core
Date: Tue, 28 Dec 2021 18:33:11 +0100
Message-ID: <20211228173311.GA18155@wunner.de>
References: <20211218090601.GA1016@wunner.de>
 <202112191737.1BJHbujc008689@valdese.nms.ulrich-teichert.org>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout2.hostsharing.net (Postfix) with ESMTPS id 603E228005304;
        Tue, 28 Dec 2021 18:33:11 +0100 (CET)
Content-Disposition: inline
In-Reply-To: <202112191737.1BJHbujc008689@valdese.nms.ulrich-teichert.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulrich Teichert <krypton@ulrich-teichert.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Lino Sanfilippo <LinoSanfilippo@gmx.de>, Philipp Rosenberger <p.rosenberger@kunbus.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

On Sun, Dec 19, 2021 at 06:37:56PM +0100, Ulrich Teichert wrote:
> Thanks for the explanation and the reproducer program. I tried yesterday
> to install a recent Linux-Alpha distribution on any of my Alphas to
> be able to build natively and check my self-build kernels before burning
> a CD-ROM, but I failed. Neither gentoo nor Debian nor T2 was installable on
> my Miatas (the Personal Workstations) or my Avanti (AlphaStation 400),
> either failing to boot or recognizing the disks or the CD-ROM, or switching
> to a framebuffer which did not work or just dying on the hardware detection.
> That was a bit frustrating, but I have to follow plan B now and do cross-builds
> from amd_x64 to Alpha - that's easy for the kernel (infact, that's what
> I've been doing from the start), but generating something bootable that
> way is a challenge and needs more time than I usually have during the week,
> but I will tackle it over my xmas vacation,

No worries, whenever you get to spend more time with the Jensen and come
across issues with the serial ports, we can look into it.

I've just sent out an updated version of the patch which also applies
the Jensen quirk if a generic kernel is used.  It auto-detects at
runtime whether the kernel is running on a Jensen.  If on the other hand
the kernel is compiled specifically for the Jensen, the quirk is applied
unconditionally.

I've also realized that a code comment in sunsu.c refers to the Alpha
quirk, so I'm updating it to point to the new location.  It looks like
a JavaStation thin client of the same era had a similar hardware erratum
as the Jensen.

Thanks,

Lukas
