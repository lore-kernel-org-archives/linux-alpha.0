From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] uapi: fix asm/signal.h userspace compilation errors
Date: Wed, 1 Mar 2017 17:20:50 +0100
Message-ID: <CAK8P3a0YX3RGAqWN0mwUJtBsqUX0C+QRtJLrT_UA=wX6Z+q0DA@mail.gmail.com>
References: <20170226010156.GA28831@altlinux.org>
Mime-Version: 1.0
Return-path: <linux-mips-bounce@linux-mips.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=J/sszfdzPEcWuilL0+phRX3xYbZMLodKzJ48kUz3dvY=;
        b=n5rrMZWzvnqUflt1XRJz8juFk6sea5pr5ZWi+JhrqtnZCsgEOtbBZceaOyB8XmB+6x
         H8IxuIUqpjc1nrj1wg6Syh/RTlaFIzT5gWxVNAuzviqvZyeoT/S/xTwBnLUai4hp+vr1
         O2kK+DPP65i5YnEsxFKuPcZvj3J9pSRKOBI16J83+qn1zFvh0yuZd/vCgkAbno46TaZl
         xp78VvcnZiAGRHyZmsZJgSvsT380lQTgjqwkm+vZS5RQycCfdGH/BEZ4i+NRP1qRqFC5
         CF4nB4gjJcF3coF4Mm71vO3IzBdCWXfKFLjGxV/JtneuzknZ4xOKm1bZvDjzYw9oN0Yo
         qMfQ==
In-Reply-To: <20170226010156.GA28831@altlinux.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-Id: <linux-alpha.vger.kernel.org>
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Dmitry V. Levin" <ldv@altlinux.org>
Cc: Russell King <linux@armlinux.org.uk>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>, David Howells <dhowells@redhat.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, "David S. Miller" <>

On Sun, Feb 26, 2017 at 2:01 AM, Dmitry V. Levin <ldv@altlinux.org> wrote:
> Include <stddef.h> (guarded by #ifndef __KERNEL__) to fix asm/signal.h
> userspace compilation errors like this:
>
> /usr/include/asm/signal.h:126:2: error: unknown type name 'size_t'
>   size_t ss_size;
>
> As no uapi header provides a definition of size_t, inclusion
> of <stddef.h> seems to be the most conservative fix available.
>
> On the kernel side size_t is typedef'ed to __kernel_size_t, so
> an alternative fix would be to change the type of sigaltstack.ss_size
> from size_t to __kernel_size_t for all architectures except those where
> sizeof(size_t) < sizeof(__kernel_size_t), namely, x32 and mips n32.
>
> On x32 and mips n32, however, #include <stddef.h> seems to be the most
> straightforward way to obtain the definition for sigaltstack.ss_size's
> type.
>
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>

I'm not sure if this is the best fix. We generally should not include one
standard header from another standard header. Would it be possible
to use __kernel_size_t instead of size_t?

     Arnd

