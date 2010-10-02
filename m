From: Ian Las <ialas@yahoo.com>
Subject: Re: [BISECTED] 164UX Regression, 2.6.22->2.6.23
Date: Sat, 2 Oct 2010 22:33:06 +0000 (GMT)
Message-ID: <816233.28152.qm@web29014.mail.ird.yahoo.com>
References: <20101001223746.BCE7940038@magilla.sf.frob.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1286058786; bh=55cjEQC9Sew2SATHPEkUYzfSS7JtBWovmvcyvt00vRU=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=2+kwbmfYjr41TfFlUb7c4qN0Cimk2ap0WOhF7EawCKpTbVtdxqRgekzWQ/wJqq5W0JoelxmGG2eeCY1KsOPwAu4RhShROrVia1uXFTAyXpOYCE9+R0hgpPgQXE9U0vjMj7nNs099gT085N01Amdfi6H+ej6hXv2aldaEkFvh3EI=
In-Reply-To: <20101001223746.BCE7940038@magilla.sf.frob.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Roland McGrath <roland@redhat.com>
Cc: Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

Hi Roland,
sorry for my mistake but with this patch reverted it is not possible to=
 compile the kernel any more.
Thanks,
Ian

--- Roland McGrath <roland@redhat.com> schrieb am Fr, 1.10.2010:

> Von: Roland McGrath <roland@redhat.com>
> Betreff: Re: [BISECTED] 164UX Regression, 2.6.22->2.6.23
> An: "Ian Las" <ialas@yahoo.com>
> CC: "Matt Turner" <mattst88@gmail.com>, linux-alpha@vger.kernel.org, =
"Richard Henderson" <rth@twiddle.net>, "Ivan Kokshaysky" <ink@jurassic.=
park.msu.ru>
> Datum: Freitag, 1. Oktober, 2010 22:37 Uhr
> > Hi Roland,
> > attached are a working vml2622.gz and a failing
> > vml2623.gz images.
> > As far as possible identical config has been used for
> compilation.
>=20
> I was looking for an apples-to-apples comparison, i.e. the
> same exact
> everything except reverting this one patch.=A0 Two
> entirely different kernel
> source versions is not what I meant at all.=A0 But I'll
> see if I can tell
> what is going on from looking at these.
>=20
>=20
> Thanks,
> Roland
>=20


--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
