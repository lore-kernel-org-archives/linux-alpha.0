From: Alan Bort <333101@personal.net.py>
Subject: Re: compiling kernel for an alphaserver (VERY OLD ONE)
Date: 26 Apr 2003 09:48:48 -0300
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <1051361328.1967.64.camel@Gandalf>
References: <1051322644.1967.55.camel@Gandalf>
	 <yw1xel3p4pd8.fsf@zaphod.guide>
Reply-To: 333101@personal.net.py
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <yw1xel3p4pd8.fsf@zaphod.guide>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?M=E5ns_Rullg=E5rd?= <mru@users.sourceforge.net>
Cc: linux-alpha@vger.kernel.org

El s=E1b, 26 de 04 de 2003 a las 05:47, M=E5ns Rullg=E5rd escribi=F3:
> Alan Bort <333101@personal.net.py> writes:
>=20
> > Ok... here is the deal.
> >=20
> > I've read a couple tutorials on compiling kernel and stuff... but i=
n
> > both my machines I have Mandrake 9.1 and a friend told me that it h=
ad
> > some compatibility issues with the new plain kernel... ANyway... th=
e
> > problem is that I want to put the new kernel (not the latest, just
> > 2.4.20) on my Alphaserver200 Is that possible.. (I KNOW IT IS)...
>=20
> Don't use 2.4.20 on Alpha, it has nasty bugs.  2.4.19 is fine, as are
> 2.4.21-pre1 and up.
Ok. I'll dload it.

>=20
> > Since Lilo is not an option... what happends if I missconfigure
> > something??? how do I boot to another kernel??? from the bios conso=
le???
>=20
> Have you read the aboot man pages.  On Alphas, aboot does what lilo
> does on PCs (approximately).
I'll read them

> > I've noted that the downloadable file is only 4 MB (a little less).=
=2E. is
> > that the FULL kernel???
>=20
> Is that already compiled?  My kernels usually end up around 1.5 MB in
> size, or ~2.7 MB uncompressed.
well: 4,0M    patch-2.4.20.bz2

that's what du patch-2.4.20.bz2 returns....

>=20
> > I'm currently running RH7.0 on my alpha and It's an important machi=
ne in
> > my network... it's the router and the http/sendmail/ftp/etc server.=
=2E.
> >=20
> > I'd appreciate all the help you can give me here... I'm new to linu=
x (at
> > least at this level) and I certainly never did somthing like this..=
=2E I
> > don't want to screw THIS one... I'm already downloading RH9 that is=
n't
> > supposed to have any trouble with the not-mdified kernel... so I th=
ink I
> > can screw that one up a few times... also... it's an x86 intel... s=
o
> > LILO works and I can boot to any kernel I want.
>=20
> Read about aboot.
>=20
> If you're new at this stuff, you WILL screw it up once or twice befor=
e
> you learn it.  That doesn't mean that you'll loose any data, of
> course.
But I will be able to boot to my good kernel... won't I?

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
