From: mru@users.sourceforge.net (=?iso-8859-1?q?M=E5ns_Rullg=E5rd?=)
Subject: Re: compiling kernel for an alphaserver (VERY OLD ONE)
Date: 26 Apr 2003 15:52:44 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <yw1xof2t2wnn.fsf@zaphod.guide>
References: <1051322644.1967.55.camel@Gandalf> <yw1xel3p4pd8.fsf@zaphod.guide>
	<1051361328.1967.64.camel@Gandalf>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1051361328.1967.64.camel@Gandalf>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 333101@personal.net.py
Cc: linux-alpha@vger.kernel.org

Alan Bort <333101@personal.net.py> writes:

> > > I've noted that the downloadable file is only 4 MB (a little less=
)... is
> > > that the FULL kernel???
> >=20
> > Is that already compiled?  My kernels usually end up around 1.5 MB =
in
> > size, or ~2.7 MB uncompressed.
> well: 4,0M    patch-2.4.20.bz2
>=20
> that's what du patch-2.4.20.bz2 returns....

That's the patch (i.e. difference) from 2.4.19 to 2.4.20.  The full
source is called linux-2.4.20.tar.bz2, but remember that 2.4.20 is
broken.

> > > I'm currently running RH7.0 on my alpha and It's an important mac=
hine in
> > > my network... it's the router and the http/sendmail/ftp/etc serve=
r...
> > >=20
> > > I'd appreciate all the help you can give me here... I'm new to li=
nux (at
> > > least at this level) and I certainly never did somthing like this=
=2E.. I
> > > don't want to screw THIS one... I'm already downloading RH9 that =
isn't
> > > supposed to have any trouble with the not-mdified kernel... so I =
think I
> > > can screw that one up a few times... also... it's an x86 intel...=
 so
> > > LILO works and I can boot to any kernel I want.
> >=20
> > Read about aboot.
> >=20
> > If you're new at this stuff, you WILL screw it up once or twice bef=
ore
> > you learn it.  That doesn't mean that you'll loose any data, of
> > course.
> But I will be able to boot to my good kernel... won't I?

Sooner or later, of course.  Which distribution is installed right now?

--=20
M=E5ns Rullg=E5rd
mru@users.sf.net
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
