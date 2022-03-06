From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [RFC PATCH 6/7] serial: General support for multipoint addresses
Date: Sun, 6 Mar 2022 20:40:01 +0100
Message-ID: <20220306194001.GD19394@wunner.de>
References: <20220302095606.14818-1-ilpo.jarvinen@linux.intel.com>
 <20220302095606.14818-7-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arch-owner@vger.kernel.org>
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id B3C27100D9417;
        Sun,  6 Mar 2022 20:40:02 +0100 (CET)
Content-Disposition: inline
In-Reply-To: <20220302095606.14818-7-ilpo.jarvinen@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-api@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>

On Wed, Mar 02, 2022 at 11:56:05AM +0200, Ilpo J=E4rvinen wrote:
> This patch adds generic support for serial multipoint
> addressing. Two new ioctls are added. TIOCSADDR is used to

Nit:  "This patch adds..." is superfluous.  Just write "Add ..."
in imperative mood.


> This change is necessary for supporting devices with RS485
> multipoint addressing [*].

If this is only used with RS485, why can't we just store the
addresses in struct serial_rs485 and use the existing TIOCSRS485
and TIOCGRS485 ioctls?  There's 20 bytes of padding left in
struct serial_rs485 which you could use.  No need to add more
user-space ABI.


> [*] Technically, RS485 is just an electronic spec and does not
> itself specify the 9th bit addressing mode but 9th bit seems
> at least "semi-standard" way to do addressing with RS485.

Is 9th bit addressing actually used by an Intel customer or was
it implemented just for feature completeness?  I think this mode
isn't used often (I've never seen a use case myself), primarily
because it requires disabling parity.

Thanks,

Lukas
