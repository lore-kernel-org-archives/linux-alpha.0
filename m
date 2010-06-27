From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: >=gcc-4.5.0 failing to compile with --disable-checking
Date: Sun, 27 Jun 2010 20:20:07 +0100
Message-ID: <yw1xbpawi8pk.fsf@unicorn.mansr.com>
References: <4C27A1FF.8090804@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-alpha@vger.kernel.org

Ra=FAl Porcel <armin76@gentoo.org> writes:

> Hi Uros,
>
> Using latest trunk, with:
> ../configure --host=3Dalpha-unknown-linux-gnu
> --build=3Dalpha-unknown-linux-gnu --enable-languages=3Dc --disable-ch=
ecking
>
> and
>
> make -j5 bootstrap-lean
>
> Fails with the following error:
>
> make[3]: Entering directory `/root/gcc/trunk/build'
> rm -f stage_current
> make[3]: Leaving directory `/root/gcc/trunk/build'
> Comparing stages 2 and 3
> warning: gcc/cc1-checksum.o differs
> Bootstrap comparison failure!
> gcc/cgraph.o differs
> gcc/pretty-print.o differs
> gcc/real.o differs

This is a known bug.  See http://bugs.gentoo.org/317217 and the gcc
bugzilla entries linked from there.

--=20
M=E5ns Rullg=E5rd
mans@mansr.com

--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
