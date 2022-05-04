From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/1] termbits: Convert octal defines to hex
Date: Wed, 4 May 2022 13:59:55 +0200
Message-ID: <CAK8P3a33b4KvsGayDV7fXte0+1FzCJp_J60d8LuZO3P+i1NUEg@mail.gmail.com>
References: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com>
 <CAK8P3a0hy8Ras7pwF9rJADtCAfeV49K7GWkftJnzqeGiQ6j-zA@mail.gmail.com> <ca39c741-8d15-33c0-7bd6-635778cc436@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ca39c741-8d15-33c0-7bd6-635778cc436@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, linux-serial <linux-serial@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Linux API <linux-api@vger.kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Parisc List <linux-parisc@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arch <linux-arch@vger.kernel.>

On Wed, May 4, 2022 at 10:33 AM Ilpo Järvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> On Wed, 4 May 2022, Arnd Bergmann wrote:
> > On Wed, May 4, 2022 at 9:20 AM Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> wrote:
> > >
> > After applying the patch locally, I still see a bunch of whitespace
> > differences in the
> > changed lines if I run
> >
> > vimdiff arch/*/include/uapi/asm/termbits.h include/uapi/asm-generic/termbits.h
> >
> > I think this mostly because you left the sparc version alone (it already
> > uses hex constants), but it may be nice to edit this a little more to
> > make the actual differences stick out more.
>
> I took a look on further harmonizing, however, it turned out to be not
> that simple. This is basically the pipeline I use to further cleanup the
> differences and remove comments if you want to play yourself, just remove
> stages from the tail to get the intermediate datas (gawk is required for
> --non-decimal-data):

I've played around with it some more to adjust the number of leading
zeroes and the type of whitespace. This is what I ended up with on top
of your patch: https://pastebin.com/raw/pkDPaKN1

Feel free to fold it into yours.

        Arnd
