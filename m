From: Norbert Preining <preining@logic.at>
Subject: Re: howto boot alpha via SRM without supported SCSI controller
Date: Fri, 22 Oct 2004 16:43:52 +0200
Message-ID: <20041022144352.GB22918@gamma.logic.tuwien.ac.at>
References: <20041015110635.GB24800@gamma.logic.tuwien.ac.at> <yw1xbrf46wle.fsf@ford.guide> <20041022122428.GA6808@gamma.logic.tuwien.ac.at> <yw1xr7nq3ogx.fsf@mru.ath.cx> <20041022132629.GE6808@gamma.logic.tuwien.ac.at> <yw1xekjq3kcz.fsf@mru.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <yw1xekjq3kcz.fsf@mru.ath.cx>
Resent-Message-ID: <8qG7VB.A.MW.ryReBB@murphy>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-alpha/>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-15?Q?M=E5ns_Rullg=E5rd?= <mru@mru.ath.cx>
Cc: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

Hi M=E5ns!

On Fre, 22 Okt 2004, M=E5ns Rullg=E5rd wrote:
> > and in aboot.conf there is:
> > 0:1/vmlinuz ro root=3D/dev/sda1
>=20
> That looks like it should work.

Ok, thanks. Will try that.

> >> The Digital Tulip series usually work well (surprise).  They are
> >> getting rare these days, though.
> >
> I've used several tulip cards, never had a problem.  What does lspci
> identify it as?

00:05.0 Ethernet controller: Digital Equipment Corporation DECchip 21140 =
[FasterNet] (rev 22)
        Subsystem: D-Link System Inc DFE-500TX Fast Ethernet
        Flags: bus master, medium devsel, latency 32, IRQ 25
        I/O ports at 8800 [size=3D128]
        Memory at 000000000a104000 (32-bit, non-prefetchable) [size=3D128=
]
        Expansion ROM at 000000000a080000 [disabled] [size=3D256K]

What do you have in your machine?

BTW: As you seem to have a SX164, too: Do you experience `autistic'
behaviour (ie, noreaction to kbd, net, whatever, but still working
because I see -- after reboot -- marks in the syslog file) when the
SX164 is connected to a 100Mb port? As soon as we plug our SX164 into a
100Mb port and there is heavy networking load, the machine suddenly
becomes autistic as described.

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
YONKERS (n.)
(Rare.) The combined thrill of pain and shame when being caught in
public plucking your nostril-hairs and stuffing them into your
side-pocket.
			--- Douglas Adams, The Meaning of Liff


--=20
To UNSUBSCRIBE, email to debian-alpha-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org

