From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: [PATCH] serial: 8250: Move alpha-specific quirk out of the core
Date: Sun, 19 Dec 2021 18:37:56 +0100 (CET)
Message-ID: <202112191737.1BJHbujc008689@valdese.nms.ulrich-teichert.org>
References: <20211218090601.GA1016@wunner.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <20211218090601.GA1016@wunner.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lukas Wunner <lukas@wunner.de>
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Lino Sanfilippo <LinoSanfilippo@gmx.de>, Philipp Rosenberger <p.rosenberger@kunbus.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Hi Lukas,

> On Thu, Dec 16, 2021 at 09:36:20PM +0100, Ulrich Teichert wrote:
> > > struct uart_8250_port contains mcr_mask and mcr_force members whose
> > > sole purpose is to work around an alpha-specific quirk.  This code
> > > doesn't belong in the core where it is executed by everyone else,
> > > so move it to a proper ->set_mctrl callback which is used on alpha only.
> [...]
> > > The quirk applies to non-PCI alphas and arch/alpha/Kconfig specifies
> > > "select FORCE_PCI if !ALPHA_JENSEN".  So apparently the only affected
> > > machine is the EISA-based Jensen that Linus was working on back then:
> [...]
> > > Up until now the quirk is not applied unless CONFIG_PCI is disabled.
> > > If users forget to do that, the serial ports aren't usable on Jensen
> > > and the machine may not boot in the first place.  Avoid by confining
> > > the quirk to CONFIG_ALPHA_JENSEN instead.
> > 
> > Wouldn't that mean that you can't use a generic Alpha kernel on the Jensen
> > anymore? CONFIG_ALPHA_JENSEN is only set if you specifically select the
> > Jensen as target, not when you build a generic kernel. That would be a step
> > back in my opinion, as the Debian generic kernel from debian-ports did
> > as least boot up on real hardware and the serial console worked just fine
> 
> The generic Alpha kernel has CONFIG_PCI=y, so the quirk is not applied,
> both with and without the present patch.

Right.

> You should be able to trigger the lockup that the quirk seeks to avoid
> by closing the tty of either of the serial ports.  E.g., if you're using
> the serial console, "cat" something to the other serial port's tty.
> That will clear TIOCM_OUT2 in serial8250_do_shutdown() and should thus
> provoke the lockup.  Alternatively, compile and run the little program
> below on the Jensen.  (Pass a serial port tty as argument.)
> 
> Should you not be able to reproduce the lockup, then the quirk wouldn't
> be necessary anymore and could be removed.
[del]

Thanks for the explanation and the reproducer program. I tried yesterday
to install a recent Linux-Alpha distribution on any of my Alphas to
be able to build natively and check my self-build kernels before burning
a CD-ROM, but I failed. Neither gentoo nor Debian nor T2 was installable on
my Miatas (the Personal Workstations) or my Avanti (AlphaStation 400),
either failing to boot or recognizing the disks or the CD-ROM, or switching
to a framebuffer which did not work or just dying on the hardware detection.
That was a bit frustrating, but I have to follow plan B now and do cross-builds
from amd_x64 to Alpha - that's easy for the kernel (infact, that's what
I've been doing from the start), but generating something bootable that
way is a challenge and needs more time than I usually have during the week,
but I will tackle it over my xmas vacation,

CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction
