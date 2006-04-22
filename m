From: Bryan =?utf8?Q?=C3=98stergaard?= <kloeri@gentoo.org>
Subject: Re: strncpy (maybe others) broken on Alpha
Date: Sat, 22 Apr 2006 12:39:08 +0200
Message-ID: <20060422103907.GA7693@mail.fl.dk>
References: <20060420215723.GA3949@bigip.bigip.mine.nu> <20060421024304.2D851DBA1@gherkin.frus.com> <20060421081500.GA3767@bigip.bigip.mine.nu> <20060421092127.GA7382@bigip.bigip.mine.nu> <20060421095028.GA8818@bigip.bigip.mine.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060421095028.GA8818@bigip.bigip.mine.nu>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Mathieu Chouquet-Stringer <mchouque@free.fr>, Bob Tracy <rct@gherkin.frus.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net

On Fri, Apr 21, 2006 at 11:50:28AM +0200, Mathieu Chouquet-Stringer wro=
te:
> On Fri, Apr 21, 2006 at 11:21:27AM +0200, Mathieu Chouquet-Stringer w=
rote:
> > The bad news is my test case, compiled with a native gcc version 3.=
4.4
> > and binutils version 2.16.1 doesn't work as expected.  So maybe it'=
s
> > combination of gcc/binutils?  I'm booting the new kernel just to co=
nfirm
> > that 3.4.4 and 2.16.1 do not work.
>=20
> A native gcc 3.4.4 and binutils 2.16.1 do not work...  What should we
> try next?
>=20
=46or what it's worth, I've found gcc 3.4.4 to be bad on gentoo. If I
compile any binutils-2.16.[01] versions with 3.4.4 ld segfaults when
trying to compile gmp. I don't know of any binutils related problems
when using gcc 3.4.6 currently.

Regards,
Bryan =C3=98stergaard
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
