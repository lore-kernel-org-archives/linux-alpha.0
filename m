From: Norbert Preining <preining@logic.at>
Subject: Re: 2.4.27, alpha arch, make bootimage and make bootpfile fails
Date: Fri, 15 Oct 2004 12:39:14 +0200
Message-ID: <20041015103914.GA24800@gamma.logic.tuwien.ac.at>
References: <20041012173344.GA21846@gamma.logic.tuwien.ac.at> <20041013233247.A11663@jurassic.park.msu.ru> <20041014130035.GA4152@gamma.logic.tuwien.ac.at> <yw1xis9d8b9b.fsf@ford.guide>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <yw1xis9d8b9b.fsf@ford.guide>
Resent-Message-ID: <sjoV6B.A.YNG.fj6bBB@murphy>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-alpha/>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-15?Q?M=E5ns_Rullg=E5rd?= <mru@mru.ath.cx>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Don, 14 Okt 2004, M=E5ns Rullg=E5rd wrote:
> > Loading the kernel...'root=3D/dev/sda1'
> >
> > Halted CPU 0
> >
> > halt code =3D 2
> > kernel stack not valid halt
> > PC =3D 200000000
> > boot failure
>=20
> Try building more things as modules instead of builtin, if possible.

I have reduced the whole kernel zo more or less nothing included,
besides the SCSI drivers, and the same still happens.=20

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
LOCHRANZA (n.)
The long unaccomplished wail in the middle of a Scottish folk song
where the pipes nip around the corner for a couple of drinks.
			--- Douglas Adams, The Meaning of Liff


--=20
To UNSUBSCRIBE, email to debian-alpha-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org

