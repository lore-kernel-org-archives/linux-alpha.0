From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 04/16] rtc: sh: provide rtc_class_ops directly
Date: Thu, 28 Apr 2016 09:21:05 +0200
Message-ID: <CAMuHMdVP3QWvyY11sw-Y440MFpxtjcZRQ+pAP76p35qFvcye6g@mail.gmail.com>
References: <1461796470-1291527-1-git-send-email-arnd@arndb.de>
	<1461796470-1291527-5-git-send-email-arnd@arndb.de>
	<20160427232122.GW21636@brightrain.aerifal.cx>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=+0QUX6n2+67ThTdh+Z2WHupeGndjFZwIEV75RlfssrY=;
        b=uX2J/SYOMIVrPx6g/Uz+udeCFduF7v+45t7VMEjQF97lwsaUeQiuraKmgzGNTAZep0
         NVOyFpeBVVRiZZ59LJFLQgqrDB+BOULjr8UR8vPzGY3eGDEsMS5THr5lk5qb8vfai8P1
         gRB7bvwXwT/F7/+26jq3hQUXhcuj6i7uCUO8Kr1Z+GN1IM3bsDEMh5DBXMvx7xH/AWHr
         WsZh/w/pfDYyYRf20rz402KRoulnZ0h6Ap6JcGP8rklFo5cjQtHvniLcmW7+IX1jWG6b
         rKJgBx2tqiiJhVrnMXXTn1CIR8B4/EkDBR6g2Kae04ixy1hzXswbWElDm/HrGaAY1SXl
         KDAA==
In-Reply-To: <20160427232122.GW21636@brightrain.aerifal.cx>
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rich Felker <dalias@libc.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, David Howells <dhowells@redhat.com>, alpha <linux-alpha@vger.kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Linux-sh list <linux-sh@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, RTCLINUX <rtc-linux@googlegroups.com>, Linux-Arch <linux-arch@vger.kernel.org>

Hi Rich,

On Thu, Apr 28, 2016 at 1:21 AM, Rich Felker <dalias@libc.org> wrote:
> Not a complaint about your patch, but I'd like to get rid of this
> platform device and abstraction layer completely since it doesn't seem
> like something that can be modeled correctly in device tree. When
> you're done cleaning this up, will it be possible to just have rtc
> drivers that use whatever generic framework is left, where the right
> driver is automatically attached to compatible DT nodes? I'm trying to
> move all of arch/sh over to device tree and remove hard-coded platform
> devices.

If you describe the RTC in DT, it can bound to a hardware-specific driver
in drivers/rtc/rtc-*.c.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
