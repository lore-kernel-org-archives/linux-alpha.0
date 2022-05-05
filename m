From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 1/1] termbits: Convert octal defines to hex
Date: Thu, 5 May 2022 11:56:15 +0300 (EEST)
Message-ID: <386eed36-94f7-8acb-926f-99c74d55915f@linux.intel.com>
References: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com> <CAK8P3a0hy8Ras7pwF9rJADtCAfeV49K7GWkftJnzqeGiQ6j-zA@mail.gmail.com> <ca39c741-8d15-33c0-7bd6-635778cc436@linux.intel.com>
 <CAK8P3a33b4KvsGayDV7fXte0+1FzCJp_J60d8LuZO3P+i1NUEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-878121235-1651740985=:1544"
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651740995; x=1683276995;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FXK7ar2tfCe3b0G5EJOLZVnb+48+yJ1/UsODDRlXrb0=;
  b=TL9dK+sKuTs6J0DgMzsfeBUR4jmf6zNYt5CTNWxnsUW7Y+Yne877rIoM
   xUP1nsYvgGP3tnaMlTVLBkUovoj3xVSpJns89RrCfLPcbNTWj8otudnmz
   /R2c43hrY14NffVCxIB3folmTGOPsqhAJUFrs4IbcM/GU/ELZzMQaEUiC
   078hGn7Qe+IpQLE9AimcQg7K8PHs9A6yrD42Mn+aeFpurhd7gXHNDXhYG
   GgAM6pnIcXlThqaMkMsvHy4mfBmSJ0uCLBohnK7aQcBmr1p1WVJJ6lM76
   8vgSxRkvBMssZ+N8G8dZBfcZisHAj8tkh5AR4m9Of0shAiVvBDt5Jar7Q
   A==;
In-Reply-To: <CAK8P3a33b4KvsGayDV7fXte0+1FzCJp_J60d8LuZO3P+i1NUEg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-serial <linux-serial@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Linux API <linux-api@vger.kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Parisc List <linux-parisc@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arch <linux-arch@vger.kernel.org>, LKML <linux-kernel@vger.k>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-878121235-1651740985=:1544
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 4 May 2022, Arnd Bergmann wrote:

> On Wed, May 4, 2022 at 10:33 AM Ilpo Järvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> > On Wed, 4 May 2022, Arnd Bergmann wrote:
> > > On Wed, May 4, 2022 at 9:20 AM Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> wrote:
> > > >
> > > After applying the patch locally, I still see a bunch of whitespace
> > > differences in the
> > > changed lines if I run
> > >
> > > vimdiff arch/*/include/uapi/asm/termbits.h include/uapi/asm-generic/termbits.h
> > >
> > > I think this mostly because you left the sparc version alone (it already
> > > uses hex constants), but it may be nice to edit this a little more to
> > > make the actual differences stick out more.
> >
> > I took a look on further harmonizing, however, it turned out to be not
> > that simple. This is basically the pipeline I use to further cleanup the
> > differences and remove comments if you want to play yourself, just remove
> > stages from the tail to get the intermediate datas (gawk is required for
> > --non-decimal-data):
> 
> I've played around with it some more to adjust the number of leading
> zeroes and the type of whitespace. This is what I ended up with on top
> of your patch: https://pastebin.com/raw/pkDPaKN1
> 
> Feel free to fold it into yours.

Ok thanks. With that it seems to go a bit beyond octal to hex conversion 
so I'll make a series out of it. The series will also introduce 
include/uapi/asm-generic/termbits-common.h for the most obvious 
intersection.


-- 
 i.

--8323329-878121235-1651740985=:1544--
