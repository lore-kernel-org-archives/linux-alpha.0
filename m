From: Norbert Preining <preining@logic.at>
Subject: Re: howto boot alpha via SRM without supported SCSI controller
Date: Fri, 22 Oct 2004 15:26:29 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20041022132629.GE6808@gamma.logic.tuwien.ac.at>
References: <20041015110635.GB24800@gamma.logic.tuwien.ac.at> <yw1xbrf46wle.fsf@ford.guide> <20041022122428.GA6808@gamma.logic.tuwien.ac.at> <yw1xr7nq3ogx.fsf@mru.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <yw1xr7nq3ogx.fsf@mru.ath.cx>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-15?Q?M=E5ns_Rullg=E5rd?= <mru@mru.ath.cx>
Cc: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

Hi M=E5ns!

On Fre, 22 Okt 2004, M=E5ns Rullg=E5rd wrote:
> > Thanks for the suggestion. I decided to take this route, put a smal=
l IDE
> > disk into the machine, and only get aboot, kernel and root-fs from
> > there. Anyting else will be done from SCSI disks.
>=20
> There is no problem having the root fs on the SCSI disks.  Just pass
> root=3D/dev/sdXX to the kernel.

So the aboot loader, the etc/aboot.conf and the kernel(s). That would b=
e
not to bad. Would the following layout work:

hda1:/etc/aboot.conf
hda1:/vmlinuz

and in aboot.conf there is:
0:1/vmlinuz ro root=3D/dev/sda1


> > Finally I got it to work using the fix from Ivan Kokshaysky.
> > No I only need a SRM-bootp acceptable NIC for our second alpha ;-)
>=20
> The Digital Tulip series usually work well (surprise).  They are
> getting rare these days, though.

Hmm, this is the one that does not work here:
Linux Tulip driver version 0.9.15-pre12 (Aug 9, 2002)
tulip0:  EEPROM default media type Autosense.
tulip0:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) bl=
ock.
tulip0:  MII transceiver #0 config 0000 status 780d advertising 01e1.
eth0: Digital DS21140 Tulip rev 34 at 0xfffffc880a104000, 00:40:05:36:5=
0:D4, IRQ 25.

The only one I got working was on our PC164 with
eth0: DE434/5 at 0x8400 (PCI bus 0, device 7), h/w address 00:c0:95:ec:=
b7:60,
      and requires IRQ17 (provided by PCI BIOS).
de4x5.c:V0.546 2001/02/22 davies@maniac.ultranet.com


Are you sure that the tulip work?

Best wishes

Norbert

-----------------------------------------------------------------------=
--------
Norbert Preining <preining AT logic DOT at>         Technische Universi=
t=E4t Wien
gpg DSA: 0x09C5B094      fp: 14DF 2E6C 0307 BE6D AD76  A9C0 D2BF 4AA3 0=
9C5 B094
-----------------------------------------------------------------------=
--------
TROSSACHS (pl.n.) The useless epaulettes on an expensive raincoat.
			--- Douglas Adams, The Meaning of Liff
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
