From: Alan Bort <333101@personal.net.py>
Subject: Re: compiling kernel for an alphaserver (VERY OLD ONE)
Date: 26 Apr 2003 15:47:48 -0300
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <1051382868.13073.9.camel@Gandalf>
References: <1051322644.1967.55.camel@Gandalf>
	 <yw1xel3p4pd8.fsf@zaphod.guide> <20030426123356.GU19139@lug-owl.de>
	 <1051361649.1968.70.camel@Gandalf>  <20030426155824.GV19139@lug-owl.de>
Reply-To: 333101@personal.net.py
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20030426155824.GV19139@lug-owl.de>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-alpha@vger.kernel.org

El s=E1b, 26 de 04 de 2003 a las 12:58, Jan-Benedict Glaw escribi=F3:
> On Sat, 2003-04-26 09:54:10 -0300, Alan Bort <333101@personal.net.py>
> wrote in message <1051361649.1968.70.camel@Gandalf>:
> > El s=E1b, 26 de 04 de 2003 a las 09:33, Jan-Benedict Glaw escribi=F3=
:
> > > > Don't use 2.4.20 on Alpha, it has nasty bugs.  2.4.19 is fine, =
as are
> > > > 2.4.21-pre1 and up.
> > >=20
> > > Or 2.5.x. I'm running them for quite some time on NoName, Miata a=
nd
> > > Avanti with no problems at all.
> > I'll try with 2.4.19 I think it is a little more tested... or at le=
ast I
> > think it should
>=20
> Then try 2.4.19. But I stand my word - 2.5.x is running quite well fo=
r
> me. However, it's a bit challenging to get 2.5.x running (for the fir=
st
> time) because some things are different. You've to use a new set of
> module utilities (no longer modutils but module-init-tools) and some
> things got modularized you may not expect to be modules. So if you mi=
ss
> to load the keyboard modules (if you didn't compile it directly into
> kernel image) you come up with basically no keyboard (or even with no
> output to monitor:)
Well... I was going to take out my video card and make the output
through a serial port... because I need the second PCI for another
10/100 eth... (the on-board is just 10 and the one I have is plugged to
the radio-modem)

>=20
> > > > > I've noted that the downloadable file is only 4 MB (a little =
less)... is
> > > > > that the FULL kernel???
> > > >=20
> > > > Is that already compiled?  My kernels usually end up around 1.5=
 MB in
> > > > size, or ~2.7 MB uncompressed.
> > > Maybe it contains loads of drivers. I think you can easily get a =
4MB
> > > uncompressed kernel image...
> > The problem is that It's 4MB compressed WITH BZ2!
>=20
> Wow, that's really big then. However, is any bootloader capable of
> booting a .bz2 image? IIRC only ELF and gzip compressed ELF images ar=
e
> supported (with aboot as well as with milo).
>=20
> > [SNIP]
> > >=20
> > > I subscribe that. Alpha is _not_ i386, so some things _are_ diffe=
rent.
> > > Please, do some reading (and asking) first, then eventually don't=
 shoot
> > > your foot.
> > Of course... I'll odo as much resaerch as I do for ANY 'new' sthing=
 I do
> > on linux... but... will reading preapre me well for what I should
> > expect???
>=20
> Well, for a first-time alpha user, some things are really wired. Firs=
t,
> you maybo don't have to use well-known DOS-compatible partitions but =
BSD
> partitions instead. Then you've got to get one of a set ot twe new bo=
ot
> loaders to work properly. This includes to figure out how to interact
> with them (how to pass kernel parameters or boot loader parameters fr=
om
> SRM or from within AlphaBIOS, how to set environment variables there,
> ...).
>=20
> That are the most common nitpicks there, I think. However, you've got=
 to
> start learning about the boot process with every new platform you sta=
rt
> playing with. This said, HP-PA boxen are different, as well as Sparc
> machines are another thing. ...and Amigas, Ataris and Macs are
> different, too.
>=20
> MfG, JBG
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
