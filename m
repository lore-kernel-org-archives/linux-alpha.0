From: "Will L Givens" <wlgivens@gmail.com>
Subject: RE: Will's kernel compilation error
Date: Wed, 17 Mar 2010 03:55:54 -0500
Message-ID: <009501cac5af$a757d3a0$f6077ae0$@com>
References: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com> <4B9FDD4E.8080607@gentoo.org> <4BA085EE.3060700@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=jwBp2WL9cf8fjnQcsXVkEpR3oBwVPkZQaE1NEhNpDgA=;
        b=T2/pOPTSGYn/RhMRqsftLgvclJ4lb6evfMPUArQsh7navFL9WFGPVe6B+wO/5BrtL5
         bnjixuQfm92qfFZx+pnO6/18YYR6VxAy9VuQvYrUAogNZ5g9giOiHi0gDVgqFHMSfBAT
         Sse25iEk7sdQz2biGS6QNQEaAdNnb7ZxxqQlc=
In-Reply-To: <4BA085EE.3060700@orcon.net.nz>
Content-Language: en-us
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Michael Cree' <mcree@orcon.net.nz>, =?iso-8859-1?Q?'Ra=FAl_Porcel'?= <armin76@gentoo.org>
Cc: 'Matt Turner' <mattst88@gmail.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org



> -----Original Message-----
> From: Michael Cree [mailto:mcree@orcon.net.nz]
> Sent: Wednesday, March 17, 2010 02:34
> To: Ra=FAl Porcel
> Cc: Matt Turner; Will L Givens; linux-kernel@vger.kernel.org; linux-
> alpha@vger.kernel.org
> Subject: Re: Will's kernel compilation error
>=20
> On 17/03/10 08:34, Ra=FAl Porcel wrote:
> > Have one.
> >
> > My error is as follows:
> >
> > net/built-in.o: In function `svc_auth_unregister':
> > (.text+0xb822c): relocation truncated to fit: GPREL16 against `.sbs=
s'
>=20
> Right, I've confirmed that with the supplied config.  What's happenin=
g
> is that the small data area (where certain static data are stored) ha=
s
> exceeded 64kB which is the limit under the small data model.  As note=
d
> elsewhere on this thread it can be solved by compiling with the large
> data model, but that incurs extra CPU instructions whenever the data
> area is accessed.
>=20
> A better solution, in my view, is to concert some drivers to modules.
> I
> note that the config has a large number of devices to be built (some =
of
> which are denoted as having been tested on x86/x86_64/ia64 only).  I
> converted a few drivers, and most of the selected filesystems (do you
> really need them all at boot time?) into modules.  The kernel then
> builds correctly.
>=20
> But if people insist on being able to build impractical monolithic
> kernels on Alpha I will post my patch to add a kernel option for the
> large data model.
>=20
> Cheers
> Michael.

Well a monolithic kernel, which mine isn't, actually runs faster than a
modular one despite being larger... that's been proven several times ov=
er
the years. In the past I used to roll monolithic kernels simply for
emergency boot situations and because kernel modules were notorious for=
 not
compiling properly with all kinds of undefined symbols... rolling them =
into
the kernel was a quick fix. Do you honestly believe all those different
modules, written by a slew of different people, will build properly let
alone function properly? Kernel-2.6.34-rc1 is the FIRST one that I've s=
een
where the netfilter modules all compiled!

Another thing, some components 'have' to be built into the kernel becau=
se
they won't automatically load or the kernel config makes it mandatory. =
The
auto load function of past kernels has been pretty iffy at best and gra=
nted
I've yet to actually load this release, I do have my doubts. So importa=
nt
things such as my aic7xxx drivers, ali drivers, 751 chipset, etc. I rol=
l
into the kernel itself.

The things that you've stated I can understand but on when you get righ=
t
down to it, it's not a major issue. My 'monolithic' kernel is only 1.9M=
B @
89MB/s. Personally I feel they should make small-data an patch addon, i=
t
would save a lot of people a some grief. Some ppl will select them (mod=
ules)
either intentionally or by accident and the majority of folks are not
running AT HDD's on a flaky IDE controller. Sincerely Will L G

PS Whatever you guys decide please make it obvious... the aboot/kernel
change a few years ago, caused a lot of Alpha Linux users to bug out...
About the only ppl aware of the change was Ivan and a handful of Debian
folks.


--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
