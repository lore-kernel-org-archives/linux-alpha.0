From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@mru.ath.cx>
Subject: Re: howto boot alpha via SRM without supported SCSI controller
Date: Fri, 22 Oct 2004 16:20:28 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <yw1xekjq3kcz.fsf@mru.ath.cx>
References: <20041015110635.GB24800@gamma.logic.tuwien.ac.at>
	<yw1xbrf46wle.fsf@ford.guide>
	<20041022122428.GA6808@gamma.logic.tuwien.ac.at>
	<yw1xr7nq3ogx.fsf@mru.ath.cx>
	<20041022132629.GE6808@gamma.logic.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20041022132629.GE6808@gamma.logic.tuwien.ac.at> (Norbert
 Preining's message of "Fri, 22 Oct 2004 15:26:29 +0200")
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Norbert Preining <preining@logic.at>
Cc: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

Norbert Preining <preining@logic.at> writes:

> Hi M=E5ns!
>
> On Fre, 22 Okt 2004, M=E5ns Rullg=E5rd wrote:
>> > Thanks for the suggestion. I decided to take this route, put a sma=
ll IDE
>> > disk into the machine, and only get aboot, kernel and root-fs from
>> > there. Anyting else will be done from SCSI disks.
>>=20
>> There is no problem having the root fs on the SCSI disks.  Just pass
>> root=3D/dev/sdXX to the kernel.
>
> So the aboot loader, the etc/aboot.conf and the kernel(s). That would=
 be
> not to bad. Would the following layout work:
>
> hda1:/etc/aboot.conf
> hda1:/vmlinuz
>
> and in aboot.conf there is:
> 0:1/vmlinuz ro root=3D/dev/sda1

That looks like it should work.

>> > Finally I got it to work using the fix from Ivan Kokshaysky.
>> > No I only need a SRM-bootp acceptable NIC for our second alpha ;-)
>>=20
>> The Digital Tulip series usually work well (surprise).  They are
>> getting rare these days, though.
>
> Hmm, this is the one that does not work here:
> Linux Tulip driver version 0.9.15-pre12 (Aug 9, 2002)
> tulip0:  EEPROM default media type Autosense.
> tulip0:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) =
block.
> tulip0:  MII transceiver #0 config 0000 status 780d advertising 01e1.
> eth0: Digital DS21140 Tulip rev 34 at 0xfffffc880a104000, 00:40:05:36=
:50:D4, IRQ 25.

I've used several tulip cards, never had a problem.  What does lspci
identify it as?

--=20
M=E5ns Rullg=E5rd
mru@mru.ath.cx
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
