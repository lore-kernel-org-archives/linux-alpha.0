From: Norbert Preining <preining@logic.at>
Subject: Re: howto boot alpha via SRM without supported SCSI controller
Date: Fri, 22 Oct 2004 14:24:28 +0200
Message-ID: <20041022122428.GA6808@gamma.logic.tuwien.ac.at>
References: <20041015110635.GB24800@gamma.logic.tuwien.ac.at> <yw1xbrf46wle.fsf@ford.guide>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <yw1xbrf46wle.fsf@ford.guide>
Resent-Message-ID: <7Q9b1C.A.AbD.HwPeBB@murphy>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-alpha/>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-15?Q?M=E5ns_Rullg=E5rd?= <mru@mru.ath.cx>
Cc: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

On Fre, 15 Okt 2004, M=E5ns Rullg=E5rd wrote:
> > aboot:
> > =3D=3D=3D=3D=3D=3D
> > - Put aboot and kernel on a floppy, boot from floppy
> > 	this is working, but I am not a big friend of it.
>=20
> aboot and kernel on HD on onboard controller is another option.
> That's how I boot my sx164.

Thanks for the suggestion. I decided to take this route, put a small IDE
disk into the machine, and only get aboot, kernel and root-fs from
there. Anyting else will be done from SCSI disks.

> > - Boot via network/bootp
> > 	this doesn't work up to now, OTOH I want the alpha to be
> > 	not dependent on another machine
>=20
> Have you tried booting with aboot over the network.  It's worked for
> me.

Finally I got it to work using the fix from Ivan Kokshaysky.
No I only need a SRM-bootp acceptable NIC for our second alpha ;-)

Best wishes

Norbert

-------------------------------------------------------------------------=
------
Norbert Preining <preining AT logic DOT at>         Technische Universit=E4=
t Wien
gpg DSA: 0x09C5B094      fp: 14DF 2E6C 0307 BE6D AD76  A9C0 D2BF 4AA3 09C=
5 B094
-------------------------------------------------------------------------=
------
MAPLEDURHAM (n.)
A hideous piece of chipboard veneer furniture bought in a suburban
high street furniture store and designed to hold exactly a year's
supply of Sunday colour supplements.
			--- Douglas Adams, The Meaning of Liff


--=20
To UNSUBSCRIBE, email to debian-alpha-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org

