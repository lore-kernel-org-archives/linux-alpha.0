From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/6] simplify rtc-generic driver
Date: Wed, 27 Apr 2016 09:50:58 +0200
Message-ID: <CAMuHMdWppdXFjoj-+YC137fgPYb4TE_Kp4fycitJdPaqMGn3VA@mail.gmail.com>
References: <1461707551-1337971-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=wgHPZbXUoYKqSkPJMvpOEIh9U2OTgntZtCB3nRZWs9M=;
        b=PhanUB/tZeBJ/9UiFV9NSWieKlhHZGaOA/JSFxnulHYVjW+U91izU8TCsBxswkwMPy
         mPMD5g2cKfosgKFB5HYfXfoB1eoMFHBhMxn+5zltgQk1YQnqKEETx7CkvCcFr4HPDLjA
         4ot5fLNYLCYHnq0DE/TXVOT3v4ZHzIP9CLsQ922eWhClHaYEUm30coHxR5JBdJxY+SG8
         RtSAh2Vm4u22EsyFmKQdbj7Wlzci5SFGhTEWzthbF10xx4eBJLqURIf2zYA95mb2htrD
         QgESTJ7mrKRzL8CbwWaiIwGXfQ7JOGhrBeGN7VE6E+SLBwrzPMPDorWs0XpK3/jx3ZDs
         xCCw==
In-Reply-To: <1461707551-1337971-1-git-send-email-arnd@arndb.de>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Rich Felker <dalias@libc.org>, David Howells <dhowells@redhat.com>, alpha <linux-alpha@vger.kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Linux-sh list <linux-sh@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, RTCLINUX <rtc-linux@googlegroups.com>, Linux-Arch <linux-arch@vger.kernel.org>

Hi Arnd,

On Tue, Apr 26, 2016 at 11:52 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> This is a resend of an earlier series, to clean up the rtc-generic
> driver by avoiding the dependency on the architecture specific
> include/asm/rtc.h header that after this series is only used
> for the deprecated "genrtc" driver. As I've shown in another
> series, only three architectures (m68k, powerpc, parisc)
> actually use the genrtc driver, and they all support rtc-generic
> as a replacement as well.
>
> The only missing piece appears to be the ioctl support for
> the m68k q40 machine that I'm adding in patch 2 here.

Apparently I had applied your previous version to my local tree, but I had
completely forgotten about it. So it has received quite some compile testing.

CONFIG_GEN_RTC is not enabled in any of the m68k defconfigs, so I think it's
been unused for a while.
CONFIG_RTC_DRV_GENERIC is modular, so I typically don't run-test it.
I just did that, and after fixing patch 1 to use IS_ENABLED() it worked fine
on ARAnyM.

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

I do not have a Q40, so I couldn't test that part.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
