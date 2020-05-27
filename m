From: "Maciej W. Rozycki" <macro@wdc.com>
Subject: Re: [PATCH v5] alpha: fix memory barriers so that they conform to the
 specification
Date: Wed, 27 May 2020 00:23:32 +0000
Message-ID: <alpine.DEB.2.20.2005270119170.1027@tpp.orcam.me.uk>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
 <20200523151027.GA10128@mail.rc.ru>
 <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005251149540.4135@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005251729110.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005261044440.29117@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590539015; x=1622075015;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=T+XX72NM0evWLhAQu55bnnX5Y00pEt9zE7eGK0MnvIo=;
  b=REzZao1lK0VUQcrUFA+xStHM4ksbMZ0pe9tntl0+yxuOmCcBlnNGJRzD
   eDHF8lskdfHYW50UnzV3tduAZFu2wvzC36YmBQqDcoymZ+l1+iGgrwL79
   //bMCaqpWIOlGccecQTPTcadsTiS0GUBLPp9Ai5bcfDHGcQaAtG4dTqoj
   6qq/GLuslYDSbYyZEgxluuUPJ5GJfhEMlx2WyxL2zjiVc61mM0gPQaAci
   SJpq9UDQQj0TaCZrYr1Gjd213XsM8tTME8Z8qAU9/Ku7KvYNyhMsM1Igy
   mJEt0af0kgrUyreCceFwyTTx5YmTX1l6JDXlkxi/oNEcMt3tmuMM8Wppo
   Q==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOcYvFe6IGZ/cmUiIpAKQVV6rD8BhKM1SEA6Udqgn84=;
 b=mov/6WSSHP+niuABnwC0KgynVpvoWpkmq4kPJPSbwn9Gf51Cg33N7b2SEsBTHu5q9Lu6eTPxYTJ4Uc7o672pYB6D/7XxfslncuCVM6MkEk9h2jMUtLGQDI6P9W7d9K1U4fi0bu25mus0eyk6NPCfCd3D73hMfrnomrk1+8h0FcU=
In-Reply-To: <alpine.LRH.2.02.2005261044440.29117@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
Content-ID: <D30F3CB55E483D4AB73C5C54DDD22A17@namprd04.prod.outlook.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "Maciej W. Rozycki" <macro@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>

On Tue, 26 May 2020, Mikulas Patocka wrote:

> >  Thanks, I'll have a look.  And now that you have this update, please r=
un=20
> > `size' on ALPHA_GENERIC `vmlinux', preferably monolithic, to see what t=
he=20
> > difference is between `read*_relaxed' handlers `static inline' and keye=
d=20
> > with `*trivial_rw_*'.
> >=20
> >   Maciej
>=20
> The patch with static inline:
>    text    data     bss     dec     hex filename
> 124207762       75953010        5426432 205587204       c410304 vmlinux
>=20
> The patch with extern inline:
>    text    data     bss     dec     hex filename
> 124184422       75953474        5426432 205564328       c40a9a8 vmlinux

 I'm not sure why data grew, but still the gain in size is maybe small,=20
yet it is there.

> (I've sent version 7 of the patch because I misnamed the "write_relaxed"=
=20
> function in version 6).

 I have reviewed v7 now, thanks for your effort!

  Maciej=
