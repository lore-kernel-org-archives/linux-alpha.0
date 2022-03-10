From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH 6/7] serial: General support for multipoint
 addresses
Date: Thu, 10 Mar 2022 14:29:21 +0200 (EET)
Message-ID: <6feb796a-ea58-9a6-f2f9-a11ca72acfd@linux.intel.com>
References: <20220302095606.14818-1-ilpo.jarvinen@linux.intel.com> <20220302095606.14818-7-ilpo.jarvinen@linux.intel.com> <20220306194001.GD19394@wunner.de> <ab43569c-6488-12a6-823-3ef09f2849d@linux.intel.com> <20220309190521.GA9832@wunner.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-24784813-1646915371=:1973"
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646915373; x=1678451373;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KpU7qHsFQttScVYV4Sy+C7cKf/dHAGOyV91juLQL6gk=;
  b=NgFY8eRdD81ohSejE1d5DO20LjYbv3RY7ET76nPkYeMlSHg+aTstckek
   S8/ctGS3G1ijTVnjn2V2MsmQBDECfd/WZvpxEVm2IgscOkJs+vKOoW2R1
   Tg5/RbkIrbMIVpdK/CSoAwz4XaaVqm/BSVs7q72b21hpCQNN2lU//vuSh
   KrvPemzpbYV7jvLCigfVO/dNhbya2kQUeWEN3/Dclbug8ZNYwZd4FyuZW
   fQTUUJSUa5eBvBFgNovM0f5gwecjeXRZKDkfFUsU6KY5xe+PUvF7W7awO
   v+fMUYdLsZ5fp5+4hzDD/MyQsKaGsAhe6tFIDP6zC3mCuyqEtSCIUS5B/
   g==;
In-Reply-To: <20220309190521.GA9832@wunner.de>
List-ID: <linux-alpha.vger.kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-serial <linux-serial@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-api@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Pau

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-24784813-1646915371=:1973
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Mar 2022, Lukas Wunner wrote:

> On Mon, Mar 07, 2022 at 11:48:01AM +0200, Ilpo J=E4rvinen wrote:
> > On Sun, 6 Mar 2022, Lukas Wunner wrote:
> > > On Wed, Mar 02, 2022 at 11:56:05AM +0200, Ilpo J=E4rvinen wrote:
> > > > This change is necessary for supporting devices with RS485
> > > > multipoint addressing [*].
> > >=20
> > > If this is only used with RS485, why can't we just store the
> > > addresses in struct serial_rs485 and use the existing TIOCSRS485
> > > and TIOCGRS485 ioctls?  There's 20 bytes of padding left in
> > > struct serial_rs485 which you could use.  No need to add more
> > > user-space ABI.
> >=20
> > It could if it is agreed that serial multipoint addressing is just
> > a thing in RS-485 and nowhere else? In that case, there is no point
> > in adding more generic support for it.
>=20
> It's just that the above-quoted sentence in the commit message
> specifically mentions RS485.

That sentence is just to justify why addressing mode is needed,
not to take a stance on whether it is only used with RS485 or not.

> If you intend to use it with RS232
> as well, that should be made explicit, otherwise one wonders why
> it wasn't integrated into struct serial_rs485.
>=20
> I have no idea how common 9th bit addressing mode is with RS232.
> Goggle turns up links saying it's mainly used with RS485, "but also
> RS232".  Since RS232 isn't a bus but a point-to-point link,
> 9th bit addressing doesn't seem to make as much sense.

While I don't know any better, I can image though that with an=20
RS232-to-RS485 converter, it could make some sense.

If I put them back to serial_rs485 / rs485 config, it's basically just=20
where I initially started from with this patchset (offlist).


--=20
 i.

--8323329-24784813-1646915371=:1973--
