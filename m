From: Alan Bort <333101@personal.net.py>
Subject: Re: compiling kernel for an alphaserver (VERY OLD ONE)
Date: 26 Apr 2003 09:54:10 -0300
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <1051361649.1968.70.camel@Gandalf>
References: <1051322644.1967.55.camel@Gandalf>
	 <yw1xel3p4pd8.fsf@zaphod.guide>  <20030426123356.GU19139@lug-owl.de>
Reply-To: 333101@personal.net.py
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20030426123356.GU19139@lug-owl.de>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-alpha@vger.kernel.org

El s=E1b, 26 de 04 de 2003 a las 09:33, Jan-Benedict Glaw escribi=F3:
[SNIP]
> > Don't use 2.4.20 on Alpha, it has nasty bugs.  2.4.19 is fine, as a=
re
> > 2.4.21-pre1 and up.
>=20
> Or 2.5.x. I'm running them for quite some time on NoName, Miata and
> Avanti with no problems at all.
I'll try with 2.4.19 I think it is a little more tested... or at least =
I
think it should

>=20
> > > Since Lilo is not an option... what happends if I missconfigure
> > > something??? how do I boot to another kernel??? from the bios con=
sole???
> >=20
> > Have you read the aboot man pages.  On Alphas, aboot does what lilo
> > does on PCs (approximately).
>=20
> aboot (for SRM-based machines), or milo (which is for AlphaBIOS based
> machines).
>=20
> > > I've noted that the downloadable file is only 4 MB (a little less=
)... is
> > > that the FULL kernel???
> >=20
> > Is that already compiled?  My kernels usually end up around 1.5 MB =
in
> > size, or ~2.7 MB uncompressed.
> Maybe it contains loads of drivers. I think you can easily get a 4MB
> uncompressed kernel image...
The problem is that It's 4MB compressed WITH BZ2!
>=20
[SNIP]
>=20
> I subscribe that. Alpha is _not_ i386, so some things _are_ different=
=2E
> Please, do some reading (and asking) first, then eventually don't sho=
ot
> your foot.
Of course... I'll odo as much resaerch as I do for ANY 'new' sthing I d=
o
on linux... but... will reading preapre me well for what I should
expect???

Thanks a lot.
--=20
Alan Bort
Linux Registered User 298277 -Country Manager- [http://counter.li.org]
[ http://www.linuxquestions.org ] Username: Ciccio
[ http://es.tldp.org ]
Ciccio.-

-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
