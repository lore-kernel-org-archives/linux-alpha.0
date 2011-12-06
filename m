From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: problem compiling kernel ld error relocation truncated to fit: GPREL16 against symbol
Date: Wed, 7 Dec 2011 11:27:01 +1300
Message-ID: <C9410F52-D2C2-4CD3-84C5-64925D10A749@orcon.net.nz>
References: <CAHEkXCQ5HeiSmSkFSh5bLvo-VO225bKugDXYVFp34-zbb3uriA@mail.gmail.com> <4EBF12B2.1070504@orcon.net.nz> <4EDE46E6.4000000@gentoo.org> <CAFULd4b9XQ3qScxwkjj_rraFn6apXu_eDtSnZvkXbVWqS7nVzA@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <CAFULd4b9XQ3qScxwkjj_rraFn6apXu_eDtSnZvkXbVWqS7nVzA@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: Uros Bizjak <ubizjak@gmail.com>
Cc: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>, carl hansen <carlhansen1234@gmail.com>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org, Richard Henderson <rth@redhat.com>

On 7/12/2011, at 7:55 AM, Uros Bizjak wrote:
> On Tue, Dec 6, 2011 at 5:46 PM, Ra=FAl Porcel <armin76@gentoo.org> =20
> wrote:
>> On 11/13/2011 01:43 AM, Michael Cree wrote:
>> [snip]
>>>
>>> Is there anyone more knowledgeable than I about gcc who can give us
>>> guidance as to why gcc-4.6 should be enlarging the data segment so =
=20
>>> much
>>> that the small data model cannot be used?  Or is there a fix =20
>>> required in
>>> the kernel code?
>>
>> Guess Uros can help here...
>
> Unfortunately, I have no idea... There are similar problems with gcc
> build, so I use:
>
> # Prevent GPREL16 relocation truncation
> LDFLAGS +=3D -Wl,--no-relax
> BOOT_LDFLAGS +=3D -Wl,--no-relax

Yeah, there are a growing number of packages being affected by this =20
(presumably linker) problem and I have recently seen it with gcc-=20
snapshot and gnat-4.6 in Debian.  However I don't think this is the =20
issue seen with the Linux kernel, which has the --relax argument =20
commented out of the linker flags in the Makefile.

What we see is that gcc-4.4 successfully compiles the Linux kernel.  =20
Using gcc-4.6 results in relocation errors.  The kernel Makefile adds -=
=20
msmall-data to the compiler flags.  If this is change to -mlarge-data =20
then compilation with gcc-4.6 succeeds.  What I am wondering about is =20
what is the change in gcc-4.6 that causes the data segment =20
(presumably) to be too large to stored in 64 kbytes (whereas gcc-4.4 =20
can fit it in 64kbytes)?

Cheers
Michael.

--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
