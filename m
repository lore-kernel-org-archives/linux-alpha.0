From: "Maciej W. Rozycki" <macro@wdc.com>
Subject: Re: [PATCH v7] alpha: fix memory barriers so that they conform to the
 specification
Date: Wed, 27 May 2020 00:18:43 +0000
Message-ID: <alpine.DEB.2.20.2005270114380.1027@tpp.orcam.me.uk>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
 <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
 <20200523151027.GA10128@mail.rc.ru>
 <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005251151550.4135@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005261046340.29117@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590538727; x=1622074727;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zsE3Q6ziO02lVzKVI5gGQIGQ8b+pIDOVx6g3afOMkao=;
  b=QJX3KP9957K+uaTTzwbEhSYBvFgILAg8L6nRX1G9Rgd5FSrXF2wA48wM
   qo0yMAfSGL8xpeJAA8FpQIffy/sG4aRaF18fy6Dvg/soFo+qL0CqoHOTs
   Ujnc3/PVcCBxFd7i/4mkAUtXb9/nfza1vLVCuAWsSlq5nn6pWzU5ttpOn
   dNoLvbd1T1pnRZI42+uxg4O+DUMuH/TcpK6JCdgdWywEBub6ig50x1ba0
   NPVjUUF+OMJ+AqT609xI2jWOx20O9CEieyIDgwJsdxTYtm18nS9lBzgVU
   rWA0MlhZv//dphV8z/dvxkuXOjdeiEvAfSiI9Cwtksi2CQ9MEUeJ1MXXY
   g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bH+uX4vg3qT0ILcK30pJCCTwA+K8PJ4X1/YSJw3ny4Q=;
 b=qZ9X4WtncB/4cvZNtpQHzhTtWz8GFI+nnw3ZSfi8uroFYIKflzC7wyqlp5QAQy0qOVX13FvSArxB82WrRSrUaArm+kOAw3HzbrM8Qx6obIOFhlarC2xBmXFqWPRe0qURg7QZykUpr8iPdKd7uUdUyXzpr1BPDTBZGq83VL9kj7E=
In-Reply-To: <alpine.LRH.2.02.2005261046340.29117@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
Content-ID: <C53E84AE46884C45843C21A8E7088D0F@namprd04.prod.outlook.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "Maciej W. Rozycki" <macro@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>

On Tue, 26 May 2020, Mikulas Patocka wrote:

> This patch makes barriers confiorm to the specification.
>=20
> 1. We add mb() before readX_relaxed and writeX_relaxed -
>    memory-barriers.txt claims that these functions must be ordered w.r.t.
>    each other. Alpha doesn't order them, so we need an explicit barrier.
> 2. We add mb() before reads from the I/O space - so that if there's a
>    write followed by a read, there should be a barrier between them.
>=20
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Fixes: cd0e00c10672 ("alpha: io: reorder barriers to guarantee writeX() a=
nd iowriteX() ordering")
> Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() a=
nd iowriteX() ordering #2")
> Cc: stable@vger.kernel.org      # v4.17+
> Acked-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>

 LGTM, thanks for persistence!

Reviewed-by: Maciej W. Rozycki <macro@linux-mips.org>

  Maciej=
