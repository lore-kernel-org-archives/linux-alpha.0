From: mru@users.sourceforge.net (=?iso-8859-1?q?M=E5ns_Rullg=E5rd?=)
Subject: Re: compiling kernel for an alphaserver (VERY OLD ONE)
Date: 26 Apr 2003 10:47:15 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <yw1xel3p4pd8.fsf@zaphod.guide>
References: <1051322644.1967.55.camel@Gandalf>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1051322644.1967.55.camel@Gandalf>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 333101@personal.net.py
Cc: linux-alpha@vger.kernel.org

Alan Bort <333101@personal.net.py> writes:

> Ok... here is the deal.
>=20
> I've read a couple tutorials on compiling kernel and stuff... but in
> both my machines I have Mandrake 9.1 and a friend told me that it had
> some compatibility issues with the new plain kernel... ANyway... the
> problem is that I want to put the new kernel (not the latest, just
> 2.4.20) on my Alphaserver200 Is that possible.. (I KNOW IT IS)...

Don't use 2.4.20 on Alpha, it has nasty bugs.  2.4.19 is fine, as are
2.4.21-pre1 and up.

> Since Lilo is not an option... what happends if I missconfigure
> something??? how do I boot to another kernel??? from the bios console=
???

Have you read the aboot man pages.  On Alphas, aboot does what lilo
does on PCs (approximately).

> I've noted that the downloadable file is only 4 MB (a little less)...=
 is
> that the FULL kernel???

Is that already compiled?  My kernels usually end up around 1.5 MB in
size, or ~2.7 MB uncompressed.

> I'm currently running RH7.0 on my alpha and It's an important machine=
 in
> my network... it's the router and the http/sendmail/ftp/etc server...
>=20
> I'd appreciate all the help you can give me here... I'm new to linux =
(at
> least at this level) and I certainly never did somthing like this... =
I
> don't want to screw THIS one... I'm already downloading RH9 that isn'=
t
> supposed to have any trouble with the not-mdified kernel... so I thin=
k I
> can screw that one up a few times... also... it's an x86 intel... so
> LILO works and I can boot to any kernel I want.

Read about aboot.

If you're new at this stuff, you WILL screw it up once or twice before
you learn it.  That doesn't mean that you'll loose any data, of
course.

--=20
M=E5ns Rullg=E5rd
mru@users.sf.net
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
