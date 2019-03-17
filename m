From: Deepa Dinamani <deepa.kernel@gmail.com>
Subject: Re: [PATCH] y2038: fix socket.h header inclusion
Date: Sun, 17 Mar 2019 11:20:06 -0700
Message-ID: <CABeXuvrEecSAkBuN-SmAbGwhLWNCC+bA1=X78fm8xMyw8=hm6Q@mail.gmail.com>
References: <20190311153857.563743-1-arnd@arndb.de> <87k1h1fgkk.fsf@mid.deneb.enyo.de>
 <CAK8P3a1r8GRC7GTHHqWY-PUn=9rWB-7+Qo=7txanbEjGZ-wppw@mail.gmail.com> <87a7hvded7.fsf@mid.deneb.enyo.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8zb4FzRNw4owAvoYs6wTot/+cTIpL3kZjP5X58bEJKg=;
        b=lR45Wpc3F0oNwcjJARwrDMYmnLxCZeNJd6sBxiHQp0d3S1Gixah/Ufj9viSLhwiBrp
         1woxZ6HVs+2hdb0m8q00I94ec6S7I29XvRjT0Z5NONuLLSl9bV2uN08zMKZrs8hGoHwv
         gsWSXfkBo//4nJO+98+vbEQbREtEBMZ1iYu/rMr28l5yBA3DQIYwkI/poaqP0TNmq4s6
         YwhJKL7b9ckrTiixEwZcvegmYM1DfTgBlcHlmd6EZ2UKQkC9d7uv8J83YONGmBhmrsW+
         F0sKUTPCO+CN7OVtoOQnbQ498IQ+ZeSPHaLGpsJ2EtS8uFvWT3tlzyTtzZ2BEo0RU41H
         XdvQ==
In-Reply-To: <87a7hvded7.fsf@mid.deneb.enyo.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Weimer <fw@deneb.enyo.de>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>, Willem de Bruijn <willemb@google.com>, alpha <linux-alpha@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-mips@vger.kernel.org, Parisc List <linux-parisc@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, Laura Abbott <labbott@redhat.com>, Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux API <linux-api@vger.kernel.org>

On Fri, Mar 15, 2019 at 2:20 PM Florian Weimer <fw@deneb.enyo.de> wrote:
>
> * Arnd Bergmann:
>
> > On Thu, Mar 14, 2019 at 7:41 PM Florian Weimer <fw@deneb.enyo.de> wrote:
> >>
> >> * Arnd Bergmann:
> >>
> >> > diff --git a/arch/alpha/include/uapi/asm/socket.h
> >> > b/arch/alpha/include/uapi/asm/socket.h
> >> > index 0d0fddb7e738..976e89b116e5 100644
> >> > --- a/arch/alpha/include/uapi/asm/socket.h
> >> > +++ b/arch/alpha/include/uapi/asm/socket.h
> >> > @@ -2,8 +2,8 @@
> >> >  #ifndef _UAPI_ASM_SOCKET_H
> >> >  #define _UAPI_ASM_SOCKET_H
> >> >
> >> > +#include <linux/posix_types.h>
> >> >  #include <asm/sockios.h>
> >> > -#include <asm/bitsperlong.h>
> >>
> >> This breaks POSIX conformance in glibc because the
> >> <linux/posix_types.h> header is not namespace clean.  It contains the
> >> identifiers fds_bits and val:
> >>
> >>         unsigned long fds_bits[__FD_SETSIZE / (8 * sizeof(long))];
> >>
> >>         int     val[2];
> >
> > What is problematic about the struct members here? I had thought that
> > only the struct names have to be in a namespace to be usable here,
> > but not the members.
>
> According POSIX, a user can do this:
>
> #define fds_bits 1024
>
> before including the <sys/socket.h> header file.  Similarly for val.
>
> Since glibc pulls in <asm/socket.h> indirectly, the result is a parse
> error, even though the programmer did nothing wrong (fds_bits is not
> an identifier used by POSIX, nor is it in the implementation
> namespace, ans <sys/socket.h> is a POSIX header).
>
> > We could use asm/posix_types.h instead of linux/posix_types.h,
> > would that address your concern?
>
> It should fix the fds_bits case, I think.  But
> <asm-generic/posix_types.h> still uses val, so that part of the issue
> remains.

Would moving kernel namespace types(__kernel prefix) to a different
header file(kernel_types.h?) and then including this from
linux/posix_types.h.
And, for socket.h just including kernel_types.h make sense?

-Deepa
