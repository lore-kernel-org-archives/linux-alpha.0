From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 1/3] termbits.h: create termbits-common.h for identical
 bits
Date: Mon, 9 May 2022 12:50:06 +0200
Message-ID: <97b0e932-1309-edfd-3886-fee1498bff7d@gmx.de>
References: <20220509093446.6677-1-ilpo.jarvinen@linux.intel.com>
 <20220509093446.6677-2-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652093410;
        bh=ZNg4QfBLznxYxqjKAVqw9swhZEDJfkMbCiNoVYmHisU=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=N4MLLZWGCb5JNtyC7H95egCjPz1yjApQOartbRPLCvWBD4GanTBMTVZ/KKygDC3hm
         FMg7NWuPppvbmIUuTVH5u5V3HSitKPu6xbE0fhzhoYC3vcDqq4e+0NCewfaVZg5h52
         EInpwNfWxYEEtP9d/4bagku/JusC767uarxkzMss=
Content-Language: en-US
In-Reply-To: <20220509093446.6677-2-ilpo.jarvinen@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>, linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org

Hello Ilpo,

On 5/9/22 11:34, Ilpo J=C3=A4rvinen wrote:
> Some defines are the same across all archs. Move the most obvious
> intersection to termbits-common.h.

I like your cleanup patches, but in this specific one, does it makes sense
to split up together-belonging constants, e.g.

> diff --git a/arch/parisc/include/uapi/asm/termbits.h b/arch/parisc/inclu=
de/uapi/asm/termbits.h
> index 6017ee08f099..7f74a822b7ea 100644
> --- a/arch/parisc/include/uapi/asm/termbits.h
> +++ b/arch/parisc/include/uapi/asm/termbits.h
> @@ -61,31 +61,15 @@ struct ktermios {
>
>
>  /* c_iflag bits */
> -#define IGNBRK	0x00001
> -#define BRKINT	0x00002
> -#define IGNPAR	0x00004
> -#define PARMRK	0x00008
> -#define INPCK	0x00010
> -#define ISTRIP	0x00020
> -#define INLCR	0x00040
> -#define IGNCR	0x00080
> -#define ICRNL	0x00100
>  #define IUCLC	0x00200
>  #define IXON	0x00400
> -#define IXANY	0x00800
>  #define IXOFF	0x01000
>  #define IMAXBEL	0x04000
>  #define IUTF8	0x08000

In the hunk above you leave IUCLC, IXON, IXOFF... because they seem unique=
 to parisc.
The other defines are then taken from generic header.
Although this is correct, it leaves single values alone, which make it har=
d to verify
because you don't see the full list of values in one place.

> @@ -112,24 +96,6 @@ struct ktermios {
>
>  /* c_cflag bit meaning */
>  #define CBAUD		0x0000100f
> -#define  B0		0x00000000	/* hang up */
> -#define  B50		0x00000001
> -#define  B75		0x00000002
> -#define  B110		0x00000003
> -#define  B134		0x00000004
> -#define  B150		0x00000005
> -#define  B200		0x00000006
> -#define  B300		0x00000007
> -#define  B600		0x00000008
> -#define  B1200		0x00000009
> -#define  B1800		0x0000000a
> -#define  B2400		0x0000000b
> -#define  B4800		0x0000000c
> -#define  B9600		0x0000000d
> -#define  B19200		0x0000000e
> -#define  B38400		0x0000000f
> -#define EXTA B19200
> -#define EXTB B38400

Here all baud values are dropped and will be taken from generic header, wh=
ich is good.

That said, I think it's good to move away the second hunk,
but maybe we should keep the first as is?

It's just a thought. Either way, I'm fine your patch if that's the
way which is decided to go for all platforms.

Helge
