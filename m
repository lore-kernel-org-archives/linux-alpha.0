From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Ping Re: [PATCH 0/8] math-emu: Update kernel math-emu code from
 current glibc soft-fp
Date: Wed, 26 Aug 2015 16:49:30 +0200
Message-ID: <CAMuHMdWz=McFn81URtirXA4eMA4knhCfVVRLisixnxZaA46E-w@mail.gmail.com>
References: <alpine.DEB.2.10.1507021542380.29415@digraph.polyomino.org.uk>
	<alpine.DEB.2.10.1508191433380.11312@digraph.polyomino.org.uk>
	<1440026806.13406.2.camel@ellerman.id.au>
	<alpine.DEB.2.10.1508261442440.13146@digraph.polyomino.org.uk>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=nuXg8oYioyEOigwHNNMvCwmyp/9cmZc6op/I+Er3q74=;
        b=yn5mFruNspfl7wQ0Zo+RavuteaFK+bENBZTQTpGWeOJb4tsXfzVaXje7xbmYDoVjxz
         Fkw/B59a/0UVX7WcMH3lOj0lqbQ4XLQ29uFAfzRuTjdoOM0UKU2ToUu3KZbPJcKAPZAT
         c3yzDI8GSX2n2aro0oDKsHZNWGl2MG3DVnEekXplEmqGyDxRiTmfUDokPGc7a5LKKIao
         HAxODnQT1cf8TKVW/zseTpZuToY7fkmVGjinrTvFpc7XRCcokfM+Lhj5FmID8AsQXgBJ
         +SwNN+hKuMlVLzIKG9CFXnP26qA02cOSedQzGUpZKPKpa/9HDuBz5IFVg876+w/cPK2L
         /2hA==
In-Reply-To: <alpine.DEB.2.10.1508261442440.13146@digraph.polyomino.org.uk>
Sender: linux-sh-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joseph Myers <joseph@codesourcery.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>

On Wed, Aug 26, 2015 at 4:44 PM, Joseph Myers <joseph@codesourcery.com> wrote:
> Ping again for the other-architecture maintainers (alpha, s390, sh,
> sparc)....

sh is orphaned, cfr. MAINTAINERS.

Perhaps the J2/J4 people are interested in maintainership?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
