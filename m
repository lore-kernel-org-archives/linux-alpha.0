From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [RFC PATCH 6/7] serial: General support for multipoint addresses
Date: Wed, 9 Mar 2022 20:05:21 +0100
Message-ID: <20220309190521.GA9832@wunner.de>
References: <20220302095606.14818-1-ilpo.jarvinen@linux.intel.com>
 <20220302095606.14818-7-ilpo.jarvinen@linux.intel.com>
 <20220306194001.GD19394@wunner.de>
 <ab43569c-6488-12a6-823-3ef09f2849d@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-doc-owner@vger.kernel.org>
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id 4A151100BA624;
        Wed,  9 Mar 2022 20:05:21 +0100 (CET)
Content-Disposition: inline
In-Reply-To: <ab43569c-6488-12a6-823-3ef09f2849d@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-serial <linux-serial@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-api@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Pau

On Mon, Mar 07, 2022 at 11:48:01AM +0200, Ilpo J=E4rvinen wrote:
> On Sun, 6 Mar 2022, Lukas Wunner wrote:
> > On Wed, Mar 02, 2022 at 11:56:05AM +0200, Ilpo J=E4rvinen wrote:
> > > This change is necessary for supporting devices with RS485
> > > multipoint addressing [*].
> >=20
> > If this is only used with RS485, why can't we just store the
> > addresses in struct serial_rs485 and use the existing TIOCSRS485
> > and TIOCGRS485 ioctls?  There's 20 bytes of padding left in
> > struct serial_rs485 which you could use.  No need to add more
> > user-space ABI.
>=20
> It could if it is agreed that serial multipoint addressing is just
> a thing in RS-485 and nowhere else? In that case, there is no point
> in adding more generic support for it.

It's just that the above-quoted sentence in the commit message
specifically mentions RS485.  If you intend to use it with RS232
as well, that should be made explicit, otherwise one wonders why
it wasn't integrated into struct serial_rs485.

I have no idea how common 9th bit addressing mode is with RS232.
Goggle turns up links saying it's mainly used with RS485, "but also
RS232".  Since RS232 isn't a bus but a point-to-point link,
9th bit addressing doesn't seem to make as much sense.


> > > [*] Technically, RS485 is just an electronic spec and does not
> > > itself specify the 9th bit addressing mode but 9th bit seems
> > > at least "semi-standard" way to do addressing with RS485.
> >=20
> > Is 9th bit addressing actually used by an Intel customer or was
> > it implemented just for feature completeness? I think this mode
> > isn't used often (I've never seen a use case myself), primarily
> > because it requires disabling parity.
>=20
> On what basis? ...The datasheet I'm looking at has a timing diagram=20
> with both D8 (9th bit) and parity so I think your information must be
> incorrect.

E.g. the discussion here says that 9th bit addressing requires that
parity is disabled or the character size is reduced to 7-bit:

https://www.microchip.com/forums/m299904.aspx

I guess that applies only to some UARTs, the Synopsys databook doesn't
mention any such constraints.

Thanks,

Lukas
