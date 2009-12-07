From: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>
Subject: Re: kernel fails to build without CONFIG_ALPHA_LEGACY_START_ADDRESS
Date: Mon, 07 Dec 2009 20:53:00 +0100
Message-ID: <4B1D5D1C.9040501@gentoo.org>
References: <4B1AA5FD.6050601@gentoo.org> <b4198de60912051113s55ac98fbj658d19f989221855@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <b4198de60912051113s55ac98fbj658d19f989221855@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org

Matt Turner wrote:
> On Sat, Dec 5, 2009 at 1:27 PM, Ra=FAl Porcel <armin76@gentoo.org> wr=
ote:
>> If CONFIG_ALPHA_LEGACY_START_ADDRESS is not set, which is needed to =
be
>> unset if the machine is Marvel/Titan/Wildfire, it fails to build:
>>
>>  CC      arch/alpha/kernel/err_marvel.o
>> cc1: warnings being treated as errors
>> arch/alpha/kernel/err_marvel.c: In function 'marvel_print_err_cyc':
>> arch/alpha/kernel/err_marvel.c:119: error: format '%ld' expects type
>> 'long int', but argument 6 has type 'u64'
>> arch/alpha/kernel/err_marvel.c: In function 'marvel_print_po7_ugbge_=
sym':
>> arch/alpha/kernel/err_marvel.c:321: error: format '%ld' expects type
>> 'long int', but argument 4 has type 'u64'
>> arch/alpha/kernel/err_marvel.c:321: error: format '%ld' expects type
>> 'long int', but argument 5 has type 'u64'
>> arch/alpha/kernel/err_marvel.c: In function 'marvel_print_pox_spl_cm=
plt':
>> arch/alpha/kernel/err_marvel.c:560: error: format '%ld' expects type
>> 'long int', but argument 4 has type 'long long unsigned int'
>> arch/alpha/kernel/err_marvel.c:560: error: format '%ld' expects type
>> 'long int', but argument 5 has type 'long long unsigned int'
>> arch/alpha/kernel/err_marvel.c:560: error: format '%ld' expects type
>> 'long int', but argument 6 has type 'long long unsigned int'
>> make[1]: *** [arch/alpha/kernel/err_marvel.o] Error 1
>> make: *** [arch/alpha/kernel] Error 2
>=20
> Attached is a completely untested patch. It just tries to get rid of
> u64 by replacing them with unsigned long.
>=20
> Matt


Patch made it compile. Unfortunately its not tested as the DS15 machine
where it was needed its not a Marvel but a Titan.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
