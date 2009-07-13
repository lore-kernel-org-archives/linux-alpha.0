From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: Help on memchr() EGLIBC assembly code
Date: Tue, 14 Jul 2009 00:24:04 +0200
Message-ID: <20090713222404.GA16997@hall.aurel32.net>
References: <20090713173104.GA13883@hall.aurel32.net> <119aab440907131124r3fd333d3n967cdde2cf3c2e1b@mail.gmail.com> <20090713211723.GE10110@hall.aurel32.net> <b4198de60907131516t384446e6na6cf15e7ebb1fc83@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-glibc=debian-glibc=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <b4198de60907131516t384446e6na6cf15e7ebb1fc83@mail.gmail.com>
Sender: Aurelien Jarno <aurelien@aurel32.net>
Resent-Message-ID: <_0KuvXGSVzF.A.5BC.TQ7WKB@liszt>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-glibc@lists.debian.org>
List-Help: <mailto:debian-glibc-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-glibc-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-glibc-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="iso-8859-1"
To: Matt Turner <mattst88@gmail.com>
Cc: Carlos O'Donell <carlos@systemhalted.org>, debian-alpha@lists.debian.org, debian-glibc@lists.debian.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth7680@gmail.com>, linux-alpha@vger.kernel.org

On Mon, Jul 13, 2009 at 07:16:16PM -0300, Matt Turner wrote:
> On Mon, Jul 13, 2009 at 6:17 PM, Aurelien Jarno<aurelien@aurel32.net> w=
rote:
> > On Mon, Jul 13, 2009 at 02:24:00PM -0400, Carlos O'Donell wrote:
> >> On Mon, Jul 13, 2009 at 1:31 PM, Aurelien Jarno<aurelien@aurel32.net=
> wrote:
> >> > With a lot of patches (E)GLIBC 2.10 builds on alpha, but it fails =
on the
> >> > testsuite for the memchr() function, which is an optimized assembl=
y code
> >> > on alpha. Unfortunately I don't speak alpha assembly very well, so=
 help
> >> > is needed.
> >> >
> >> > The problem is that the memchr() function on alpha uses prefetch, =
which
> >> > can cause a page boundary to be crossed, while the standards (POSI=
X and
> >> > C99) says it should stop when a match is found.
> >> >
> >> > I have built a small testcase (see file attached), which contains =
the
> >> > code to trigger the bug and the assembly code of the memchr() func=
tion,
> >> > copied from EGLIBC.
> >> >
> >> > It would be nice if someone can fix the assembly code so that the
> >> > prefetching does not create memory faults. Thanks in advance.
> >>
> >> If you remove:
> >> ./sysdeps/alpha/alphaev6/memchr.S
> >> ./sysdeps/alpha/memchr.S
> >> and allow the build to fallback on string/memchr.c do the tests pass=
?
> >>
> >> You can always add memchr.S routines back in a later release if you
> >> need an immediate workaround.
> >
> > Yeah, it works, and that's actually my plan if I get no answer. But I
> > would really like to see this fixed now, as otherwise, it will most
> > probably stay like that indefinitely.
> >
> > --
> > Aurelien Jarno =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0GPG=
: 1024D/F1BCDB73
> > aurelien@aurel32.net =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 http://www.aurel=
32.net
> >
>=20
> I'm copying Richard Henderson and Ivan Kokshayshy on this, as they are
> without a doubt the most knowledgeable people about this sort of
> thing.

Thanks.

> As an aside, please make sure these two bugs are fixed in eglibc (I
> don't know if they exist in eglibc, but I do realize that you filed
> them against glibc yourself -- so this is just a reminder).
>=20
> http://sources.redhat.com/bugzilla/show_bug.cgi?id=3D5350
> http://sources.redhat.com/bugzilla/show_bug.cgi?id=3D5400
>=20

I have already put a first set of patches needed for alpha in a git
repository [1], and sent a pull request on the libc-ports mailing list.
I hope it will work better than filling bug reports. If it also fails,
I'll send them to EGLIBC.

[1]
http://git.aurel32.net/?p=3Dglibc-ports.git;a=3Dshortlog;h=3Drefs/heads/a=
lpha-for-upstream

--=20
Aurelien Jarno	                        GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net


--=20
To UNSUBSCRIBE, email to debian-glibc-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org

