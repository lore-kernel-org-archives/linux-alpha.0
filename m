From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/1] termbits: Convert octal defines to hex
Date: Wed, 04 May 2022 21:03:09 +1000
Message-ID: <87bkwdv9ua.fsf@mpe.ellerman.id.au>
References: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1651662194;
        bh=LCpTjFnDEwsYkNeVhJ/7ZfUx41S6pzSAGCwTzE+zXeE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=oSdsWchJ7c6LaWBbTkrN4HY/gAMdpQJZcaKFI7EDhV0JeJSI6Ilrh5JXSrxrO+uBi
         fz7astncBphLXFWCOHhi/UuBJgXcyFzZqYPiGHlIi6X45BigzITOjmK1rMnK6xaTol
         wK+Fl001hFDLFxA3kebNvk3NpO9blGLOH5shsbSldk7k/YPS8CY+2HU/0urlMYnQPi
         3f3A20Ra29iiAIuItwlZHJn/lAKzlgp6ft6XtuAwcXeHVWlSH3tlipFUOHXN4lOi74
         kINmxaDpdRmWpd8ejwQmQIqRTqnHtMk+0OO2DYANcnQC+pIYh1SpDofrsXa2SehLI+
         bhi5wSivAPsvA==
In-Reply-To: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>, linux-serial <linux-serial@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-api@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:
> Many archs have termbits.h as octal numbers. It makes hard for humans
> to parse the magnitude of large numbers correctly and to compare with
> hex ones of the same define.
>
> Convert octal values to hex.
>
> First step is an automated conversion with:
>
> for i in $(git ls-files | grep 'termbits\.h'); do
> 	awk --non-decimal-data '/^#define\s+[A-Z][A-Z0-9]*\s+0[0-9]/ {
> 		l=3Dint(((length($3) - 1) * 3 + 3) / 4);
> 		repl =3D sprintf("0x%0" l "x", $3);
> 		print gensub(/[^[:blank:]]+/, repl, 3);
> 		next} {print}' $i > $i~;
> 	mv $i~ $i;
> done
>
> On top of that, some manual processing on alignment and number of zeros.
> In addition, small tweaks to formatting of a few comments on the same=20
> lines.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>
> I prefer this to go in though Greg's tty tree.
>
>  arch/alpha/include/uapi/asm/termbits.h   | 202 ++++++++++-----------
>  arch/mips/include/uapi/asm/termbits.h    | 222 +++++++++++------------
>  arch/parisc/include/uapi/asm/termbits.h  | 220 +++++++++++-----------
>  arch/powerpc/include/uapi/asm/termbits.h | 202 ++++++++++-----------

I ran some horrible awk/sed/python mess over the before and after and
they seem to be numerically identical, so LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
