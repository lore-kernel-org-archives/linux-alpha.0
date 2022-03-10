From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [RFC PATCH 6/7] serial: General support for multipoint addresses
Date: Thu, 10 Mar 2022 16:09:30 +0200
Message-ID: <YioGmu+KC9WT0KoG@smile.fi.intel.com>
References: <20220302095606.14818-1-ilpo.jarvinen@linux.intel.com>
 <20220302095606.14818-7-ilpo.jarvinen@linux.intel.com>
 <20220306194001.GD19394@wunner.de>
 <ab43569c-6488-12a6-823-3ef09f2849d@linux.intel.com>
 <20220309190521.GA9832@wunner.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646921423; x=1678457423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Vi9TQW28iAGVT+9VTJCeUAtR3L2XgA27dHLozP1I8zM=;
  b=G27wyBmWvNEAVSPYPdfrwrw+qFtSOgN9J0kMPS6K/D+VmhuYIzqR1hbC
   p9bJdKmSO6uC8JCtOBta+bjGdVF+yIluIHkAi1VYR23x6XUKsLfIbWQUx
   8vbvo20B+2ak6a7Uav7VcfPjbUHU7Jc+Bb66v0a6QDuuCXDHyGikMH9UW
   Fczl5/I3uDFul2r3tp176PE3A3q63e/J7OzLrDmd6TuLLSycxbCud80oQ
   9I2bOGvifIglHMBsvwzyESSnITNeg8Uar+8S8KZUbKv6h/BKsix/9ianu
   0lA3j+sZ1VoUOkGAmoQ/FC3BmimF5cRcludSbtHSMJ0k3JwbGK35jpcQH
   g==;
Content-Disposition: inline
In-Reply-To: <20220309190521.GA9832-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-serial <linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jiri Slaby <jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "James E.J. Bottomley" <James.Bottomley-JuX6DAaQMKPCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

On Wed, Mar 09, 2022 at 08:05:21PM +0100, Lukas Wunner wrote:
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
> specifically mentions RS485.  If you intend to use it with RS232
> as well, that should be made explicit, otherwise one wonders why
> it wasn't integrated into struct serial_rs485.
>=20
> I have no idea how common 9th bit addressing mode is with RS232.
> Goggle turns up links saying it's mainly used with RS485, "but also
> RS232".  Since RS232 isn't a bus but a point-to-point link,
> 9th bit addressing doesn't seem to make as much sense.

In my student years I have an exercise to use 9-bit addressing mode on RS23=
2.
Obviously I forgot all of the details, but I remember that that has a pract=
ical
application.

--=20
With Best Regards,
Andy Shevchenko


