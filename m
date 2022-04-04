From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 07/12] serial: termbits: ADDRB to indicate 9th bit
 addressing mode
Date: Mon, 4 Apr 2022 10:52:08 +0200
Message-ID: <CAK8P3a0iP79RQWr6-YDf=xQZvonZchYN-Rn7HN2pkNihZ=anAw@mail.gmail.com>
References: <20220404082912.6885-1-ilpo.jarvinen@linux.intel.com> <20220404082912.6885-8-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20220404082912.6885-8-ilpo.jarvinen@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Lukas Wunner <lukas@wunner.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johan Hovold <johan@kernel.org>, Heiko Stuebner <heiko@sntech.de>, giulio.benetti@micronovasrl.com, Heikki Krogerus <heikki.krogerus@linux.intel.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Linux API <linux-api@vger.kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartners>

On Mon, Apr 4, 2022 at 10:29 AM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:

>
>  #define CLOCAL 00100000
> +#define ADDRB  010000000               /* address bit */
>  #define CMSPAR   010000000000          /* mark or space (stick) parity */
>  #define CRTSCTS          020000000000          /* flow control */
>
> diff --git a/arch/mips/include/uapi/asm/termbits.h b/arch/mips/include/ua=
pi/asm/termbits.h
> index dfeffba729b7..e7ea31cfec78 100644
> --- a/arch/mips/include/uapi/asm/termbits.h
> +++ b/arch/mips/include/uapi/asm/termbits.h
> @@ -181,6 +181,7 @@ struct ktermios {
>  #define         B3000000 0010015
>  #define         B3500000 0010016
>  #define         B4000000 0010017
> +#define ADDRB    0020000       /* address bit */
>  #define CIBAUD   002003600000  /* input baud rate */
>  #define CMSPAR   010000000000  /* mark or space (stick) parity */
>  #define CRTSCTS          020000000000  /* flow control */

It looks like the top bits are used the same way on all architectures
already, while the bottom bits of the flag differ. Could you pick
the next free bit from the top to use the same value 04000000000
everywhere?

        Arnd
