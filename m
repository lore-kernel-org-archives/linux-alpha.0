From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@mru.ath.cx>
Subject: Re: howto boot alpha via SRM without supported SCSI controller
Date: Fri, 22 Oct 2004 15:29:45 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <yw1xis923mpi.fsf@mru.ath.cx>
References: <20041015110635.GB24800@gamma.logic.tuwien.ac.at>
	<yw1xbrf46wle.fsf@ford.guide>
	<20041022122428.GA6808@gamma.logic.tuwien.ac.at>
	<yw1xr7nq3ogx.fsf@mru.ath.cx>
	<20041022131004.GA31857@thebrain.conmicro.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20041022131004.GA31857@thebrain.conmicro.cx> (Jay Maynard's
 message of "Fri, 22 Oct 2004 08:10:04 -0500")
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jay Maynard <jmaynard@conmicro.cx>
Cc: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

Jay Maynard <jmaynard@conmicro.cx> writes:

> On Fri, Oct 22, 2004 at 02:51:42PM +0200, M?ns Rullg?rd wrote:
>> Norbert Preining <preining@logic.at> writes:
>> > Thanks for the suggestion. I decided to take this route, put a sma=
ll IDE
>> > disk into the machine, and only get aboot, kernel and root-fs from
>> > there. Anyting else will be done from SCSI disks.
>> There is no problem having the root fs on the SCSI disks.  Just pass
>> root=3D/dev/sdXX to the kernel.
>
> If you do this, I'd suggest putting swap space on the unused portion =
of the
> IDE. That way, you won't have I/O contention for swapping.

The IDE controller on the SX164 is really nothing you want to be using
at all.

--=20
M=E5ns Rullg=E5rd
mru@mru.ath.cx
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
