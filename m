From: mru@users.sourceforge.net (=?iso-8859-1?q?M=E5ns_Rullg=E5rd?=)
Subject: Re: compiling kernel for an alphaserver (VERY OLD ONE)
Date: 26 Apr 2003 18:01:20 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <yw1xel3p2qpb.fsf@zaphod.guide>
References: <1051322644.1967.55.camel@Gandalf> <yw1xel3p4pd8.fsf@zaphod.guide>
	<1051361328.1967.64.camel@Gandalf> <yw1xof2t2wnn.fsf@zaphod.guide>
	<1051365623.1967.79.camel@Gandalf>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1051365623.1967.79.camel@Gandalf>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 333101@personal.net.py
Cc: linux-alpha@vger.kernel.org

Alan Bort <333101@personal.net.py> writes:

> > > well: 4,0M    patch-2.4.20.bz2
> > >=20
> > > that's what du patch-2.4.20.bz2 returns....
> >=20
> > That's the patch (i.e. difference) from 2.4.19 to 2.4.20.  The full
> > source is called linux-2.4.20.tar.bz2, but remember that 2.4.20 is
> > broken.
> Well. On kernel.org, in the main page there is a link to THAT kernel.=
=2E.
> I could searcho for the full ~.19 version... but... how big is it???
> cause my /boot partition is about 12 MB.. the Image will be smalller
> than that... won't it???

The image will be about 1M compressed.  You'll find all 2.4 kernels in
ftp://ftp.kernel.org/pub/linux/kernel/v2.4/

Get the kernel and compile it, then post your /etc/aboot.conf and
someone can tell you what to do.

--=20
M=E5ns Rullg=E5rd
mru@users.sf.net
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
