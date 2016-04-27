From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: char: legacy RTC cleanups
Date: Wed, 27 Apr 2016 09:54:41 +0200
Message-ID: <CAMuHMdV=R3ad33vPdMZNvZZ8A_DF+F2C8nyAmXOmFiiP50D_UQ@mail.gmail.com>
References: <1461707052-1337718-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=Waa/WsobClkvW26HByrJ00IKiUOQzaxUZyFmYxaIHe4=;
        b=njQZT0K7i3JoS0narfxpezMwClMox+M2ODTYCh/iFb2uqCvRfJkpFxtUWnFsbKOvZi
         iRgDSYnuqiQjL2FF2Ce3jj693MOFT3uAEtavkxi3lYA1K3IK4FqFSLue/WZqJ9+FajA7
         EwXW1WYMB0T1mFUaKyAdACujx1gs0KXbRAiDeHYFTRWRPxGXQ45jLQrIL2gPYS5FOLfj
         X1lQz6reZs0qnd41q0s/Zr0Q0rFLm0dNZmVPf5e6I+BoUzw78Ph2yYPnLLBdtV5Mp1Z9
         EZE+FDgHN4vDeGhhRCi7H3EyIkH2nj/zk2vmh1/fy8Y25lZyb1k4MbCR7PH0YzmUutwC
         k2vQ==
In-Reply-To: <1461707052-1337718-1-git-send-email-arnd@arndb.de>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tony Luck <tony.luck@intel.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Rich Felker <dalias@libc.org>, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, alpha <linux-alpha@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Linux-sh

Hi Arnd,

On Tue, Apr 26, 2016 at 11:44 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> For the genrtc driver, rearranging the headers makes it simpler
> to use and reduces duplication. In case of alpha and mn10300,
> I've shown that the genrtc and rtc drivers are doing the same
> thing, so we don't need them both. The remaining three
> architectures (m68k, parisc, powerpc) actually all support
> the newer rtc-generic driver, so we could remove genrtc completely
> if we want to.

CONFIG_GEN_RTC is not enabled in any of the m68k defconfigs, so I think genrtc
has been unused for a while.
All defconfigs either use CONFIG_RTC_DRV_GENERIC, or enable a more specific
RTC driver.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
