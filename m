From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@mru.ath.cx>
Subject: Re: howto boot alpha via SRM without supported SCSI controller
Date: Fri, 22 Oct 2004 14:51:42 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <yw1xr7nq3ogx.fsf@mru.ath.cx>
References: <20041015110635.GB24800@gamma.logic.tuwien.ac.at>
	<yw1xbrf46wle.fsf@ford.guide>
	<20041022122428.GA6808@gamma.logic.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20041022122428.GA6808@gamma.logic.tuwien.ac.at> (Norbert
 Preining's message of "Fri, 22 Oct 2004 14:24:28 +0200")
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Norbert Preining <preining@logic.at>
Cc: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

Norbert Preining <preining@logic.at> writes:

> On Fre, 15 Okt 2004, M=E5ns Rullg=E5rd wrote:
>> > aboot:
>> > =3D=3D=3D=3D=3D=3D
>> > - Put aboot and kernel on a floppy, boot from floppy
>> > 	this is working, but I am not a big friend of it.
>>=20
>> aboot and kernel on HD on onboard controller is another option.
>> That's how I boot my sx164.
>
> Thanks for the suggestion. I decided to take this route, put a small =
IDE
> disk into the machine, and only get aboot, kernel and root-fs from
> there. Anyting else will be done from SCSI disks.

There is no problem having the root fs on the SCSI disks.  Just pass
root=3D/dev/sdXX to the kernel.

>> > - Boot via network/bootp
>> > 	this doesn't work up to now, OTOH I want the alpha to be
>> > 	not dependent on another machine
>>=20
>> Have you tried booting with aboot over the network.  It's worked for
>> me.
>
> Finally I got it to work using the fix from Ivan Kokshaysky.
> No I only need a SRM-bootp acceptable NIC for our second alpha ;-)

The Digital Tulip series usually work well (surprise).  They are
getting rare these days, though.

--=20
M=E5ns Rullg=E5rd
mru@mru.ath.cx
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
