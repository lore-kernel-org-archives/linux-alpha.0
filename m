From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Will's kernel compilation error
Date: Wed, 17 Mar 2010 20:34:06 +1300
Message-ID: <4BA085EE.3060700@orcon.net.nz>
References: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com> <4B9FDD4E.8080607@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4B9FDD4E.8080607@gentoo.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>
Cc: Matt Turner <mattst88@gmail.com>, Will L Givens <wlgivens@gmail.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On 17/03/10 08:34, Ra=FAl Porcel wrote:
> Have one.
>
> My error is as follows:
>
> net/built-in.o: In function `svc_auth_unregister':
> (.text+0xb822c): relocation truncated to fit: GPREL16 against `.sbss'

Right, I've confirmed that with the supplied config.  What's happening=20
is that the small data area (where certain static data are stored) has=20
exceeded 64kB which is the limit under the small data model.  As noted=20
elsewhere on this thread it can be solved by compiling with the large=20
data model, but that incurs extra CPU instructions whenever the data=20
area is accessed.

A better solution, in my view, is to concert some drivers to modules.  =
I=20
note that the config has a large number of devices to be built (some of=
=20
which are denoted as having been tested on x86/x86_64/ia64 only).  I=20
converted a few drivers, and most of the selected filesystems (do you=20
really need them all at boot time?) into modules.  The kernel then=20
builds correctly.

But if people insist on being able to build impractical monolithic=20
kernels on Alpha I will post my patch to add a kernel option for the=20
large data model.

Cheers
Michael.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
