From: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
Subject: Re: XLT366 Memory Compatiblity...
Date: Tue, 8 Jun 2004 19:32:37 +0000
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040608193237.A31694@Marvin.DL8BCU.ampr.org>
References: <Pine.LNX.4.21.0406080536550.13212-100000@magellan.rkirkpat.net> <20040608125250.GD20632@lug-owl.de> <20040608175612.B31492@Marvin.DL8BCU.ampr.org> <20040608180335.GJ20632@lug-owl.de>
Reply-To: dl8bcu@dl8bcu.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20040608180335.GJ20632@lug-owl.de>; from jbglaw@lug-owl.de on Tue, Jun 08, 2004 at 08:03:35PM +0200
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-alpha@vger.kernel.org, Ryan Kirkpatrick <linux@rkirkpat.net>
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>

On Tue, Jun 08, 2004 at 08:03:35PM +0200, Jan-Benedict Glaw wrote:
> On Tue, 2004-06-08 17:56:12 +0000, Thorsten Kranzkowski <dl8bcu@dl8bc=
u.de>
> wrote in message <20040608175612.B31492@Marvin.DL8BCU.ampr.org>:
> > On Tue, Jun 08, 2004 at 02:52:50PM +0200, Jan-Benedict Glaw wrote:
> > > On Tue, 2004-06-08 05:46:54 -0600, Ryan Kirkpatrick <linux@rkirkp=
at.net>
> > > wrote in message <Pine.LNX.4.21.0406080536550.13212-100000@magell=
an.rkirkpat.net>:
> > > > utilized they work fine. When fully utilized, they just don't w=
ork.
> > >=20
> > > As I said, parity !=3D ECC.
> >=20
> > well he said 36 chips which equals 4 bit ECC per 32 bit word.
>=20
> Or one bit per byte... *digging up some RAM* Ah, these do have 10 or =
20
> chips, so that's 2 bits per byte (which I expected).

Quoting from my DS20 manual (DP264 actually):

"The 72-bit, 100 MHz DIMMs consist of 64 Bits of data and 8 bits of ECC=
, ..."

These are 200 pin sticks which are definitely not found in PC World :)

I assume Ryans memory is bog-standard 72Pin-PS/2 (currently googling to=
=20
find a proof) and also with that it's definitely 4bits/32bit. Quoting
from ref_memory.txt that describes my noname-board:

Table 3-1 Possible Memory Capacities

Organization  SIMM      Bank      BCR<SBE>   BCR<RAS>  BMR
              size      size
----------------------------------------------------------------
1 Mbit x 36   4 Mbyte   8 Mbyte   0          0011b     0070.0000
2 Mbit x 36   8 Mbyte   16 Mbyte  1          0011b     00F0.0000
[...]



Unfortunately most useful Alpha docs seem to be gone by today - the=20
closest I could find is:=20
http://hvdkooij.xs4all.nl/docs/RedHatLinuxAlpha/machinexlt.html=20
which also suggests 36 Bit RAM.


Now I'm curious what kind of RAM-Sticks _you_ found in your black-box?
are all (10,20) chips of the same size and type? Any stickers that
suggest a clue?


> Melle? Not all that far away:) I'm from H=F6rste (near Halle/Westf.).

Ein freundliches Hallo nach Nordrhein Westfahlen! ;-)
=20
> MfG, JBG

Bis denn,
Thorsten


--=20
| Thorsten Kranzkowski        Internet: dl8bcu@dl8bcu.de               =
       |
| Mobile: ++49 170 1876134       Snail: Kiebitzstr. 14, 49324 Melle, Ge=
rmany  |
| Ampr: dl8bcu@db0lj.#rpl.deu.eu, dl8bcu@marvin.dl8bcu.ampr.org [44.130=
=2E8.19] |
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
