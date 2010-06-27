From: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>
Subject: Re: >=gcc-4.5.0 failing to compile with --disable-checking
Date: Sun, 27 Jun 2010 21:34:15 +0200
Message-ID: <4C27A7B7.2020703@gentoo.org>
References: <4C27A1FF.8090804@gentoo.org> <yw1xbpawi8pk.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <yw1xbpawi8pk.fsf@unicorn.mansr.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-alpha@vger.kernel.org

On 06/27/2010 09:20 PM, M=E5ns Rullg=E5rd wrote:
> Ra=FAl Porcel <armin76@gentoo.org> writes:
>=20
>> Hi Uros,
>>
>> Using latest trunk, with:
>> ../configure --host=3Dalpha-unknown-linux-gnu
>> --build=3Dalpha-unknown-linux-gnu --enable-languages=3Dc --disable-c=
hecking
>>
>> and
>>
>> make -j5 bootstrap-lean
>>
>> Fails with the following error:
>>
>> make[3]: Entering directory `/root/gcc/trunk/build'
>> rm -f stage_current
>> make[3]: Leaving directory `/root/gcc/trunk/build'
>> Comparing stages 2 and 3
>> warning: gcc/cc1-checksum.o differs
>> Bootstrap comparison failure!
>> gcc/cgraph.o differs
>> gcc/pretty-print.o differs
>> gcc/real.o differs
>=20
> This is a known bug.  See http://bugs.gentoo.org/317217 and the gcc
> bugzilla entries linked from there.
>=20

Hi Mans,

I know(i commented on that bug :D), i forgot to put the bug url here.
That bug report on GCC's bugzilla says its fixed, but in the case of
alpha its still not fixed(i've tried with latest trunk which contains
that fix).

Since Uros is the one that tends to fix alpha's gcc issues, i'm telling
him :)
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
