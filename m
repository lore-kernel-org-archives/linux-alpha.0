From: Alan Bort <333101@personal.net.py>
Subject: Re: compiling kernel for an alphaserver (VERY OLD ONE)
Date: 26 Apr 2003 11:00:23 -0300
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <1051365623.1967.79.camel@Gandalf>
References: <1051322644.1967.55.camel@Gandalf>
	 <yw1xel3p4pd8.fsf@zaphod.guide> <1051361328.1967.64.camel@Gandalf>
	 <yw1xof2t2wnn.fsf@zaphod.guide>
Reply-To: 333101@personal.net.py
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <yw1xof2t2wnn.fsf@zaphod.guide>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?M=E5ns_Rullg=E5rd?= <mru@users.sourceforge.net>
Cc: linux-alpha@vger.kernel.org

El s=E1b, 26 de 04 de 2003 a las 10:52, M=E5ns Rullg=E5rd escribi=F3:
> Alan Bort <333101@personal.net.py> writes:
>=20
> > > > I've noted that the downloadable file is only 4 MB (a little le=
ss)... is
> > > > that the FULL kernel???
> > >=20
> > > Is that already compiled?  My kernels usually end up around 1.5 M=
B in
> > > size, or ~2.7 MB uncompressed.
> > well: 4,0M    patch-2.4.20.bz2
> >=20
> > that's what du patch-2.4.20.bz2 returns....
>=20
> That's the patch (i.e. difference) from 2.4.19 to 2.4.20.  The full
> source is called linux-2.4.20.tar.bz2, but remember that 2.4.20 is
> broken.
Well. On kernel.org, in the main page there is a link to THAT kernel...
I could searcho for the full ~.19 version... but... how big is it???
cause my /boot partition is about 12 MB.. the Image will be smalller
than that... won't it???
>=20
> > > > I'm currently running RH7.0 on my alpha and It's an important m=
achine in
> > > > my network... it's the router and the http/sendmail/ftp/etc ser=
ver...
> > > >=20
> > > > I'd appreciate all the help you can give me here... I'm new to =
linux (at
> > > > least at this level) and I certainly never did somthing like th=
is... I
> > > > don't want to screw THIS one... I'm already downloading RH9 tha=
t isn't
> > > > supposed to have any trouble with the not-mdified kernel... so =
I think I
> > > > can screw that one up a few times... also... it's an x86 intel.=
=2E. so
> > > > LILO works and I can boot to any kernel I want.
> > >=20
> > > Read about aboot.
> > >=20
> > > If you're new at this stuff, you WILL screw it up once or twice b=
efore
> > > you learn it.  That doesn't mean that you'll loose any data, of
> > > course.
> > But I will be able to boot to my good kernel... won't I?
>=20
> Sooner or later, of course.  Which distribution is installed right no=
w?
Redhat 7.0 for alphaserver (obviously)

here is the cat of /proc/version:

Linux version 2.4.3-12 (root@george.devel.redhat.com) (gcc version 2.96
20000731 (Red Hat Linux 7.1 2.96-85)) #1 Fri Jun 8 13:20:17 EDT 2001

Oh, BTW.. I can't seem to get the system time corretly... though I don'=
t
care... heheh. For some things I need it to be right or I'll get
something like WARNING the file has a modification time in the future.

Tnx a lot-


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
