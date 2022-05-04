From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/1] termbits: Convert octal defines to hex
Date: Wed, 4 May 2022 09:42:07 +0200
Message-ID: <CAK8P3a0hy8Ras7pwF9rJADtCAfeV49K7GWkftJnzqeGiQ6j-zA@mail.gmail.com>
References: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-serial <linux-serial@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Linux API <linux-api@vger.kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Parisc List <linux-parisc@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, linux-arch <linux-arch@vger.kernel.>

On Wed, May 4, 2022 at 9:20 AM Ilpo Järvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Many archs have termbits.h as octal numbers. It makes hard for humans
> to parse the magnitude of large numbers correctly and to compare with
> hex ones of the same define.
>
> Convert octal values to hex.
>
> First step is an automated conversion with:
>
> for i in $(git ls-files | grep 'termbits\.h'); do
>         awk --non-decimal-data '/^#define\s+[A-Z][A-Z0-9]*\s+0[0-9]/ {
>                 l=int(((length($3) - 1) * 3 + 3) / 4);
>                 repl = sprintf("0x%0" l "x", $3);
>                 print gensub(/[^[:blank:]]+/, repl, 3);
>                 next} {print}' $i > $i~;
>         mv $i~ $i;
> done
>
> On top of that, some manual processing on alignment and number of zeros.
> In addition, small tweaks to formatting of a few comments on the same
> lines.
>
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Good idea!

I assume you already checked if additional file contents can be shared across
architectures? I think I've tried in the past but didn't really get
anywhere with
that.

After applying the patch locally, I still see a bunch of whitespace
differences in the
changed lines if I run

vimdiff arch/*/include/uapi/asm/termbits.h include/uapi/asm-generic/termbits.h

I think this mostly because you left the sparc version alone (it already
uses hex constants), but it may be nice to edit this a little more to
make the actual differences stick out more.

> I prefer this to go in though Greg's tty tree.

Acked-by: Arnd Bergmann <arnd@arndb.de>
