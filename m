From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@mru.ath.cx>
Subject: Re: howto boot alpha via SRM without supported SCSI controller
Date: Fri, 22 Oct 2004 16:21:31 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <yw1xacue3kb8.fsf@mru.ath.cx>
References: <20041015110635.GB24800@gamma.logic.tuwien.ac.at>
	<yw1xbrf46wle.fsf@ford.guide>
	<20041022122428.GA6808@gamma.logic.tuwien.ac.at>
	<yw1xr7nq3ogx.fsf@mru.ath.cx>
	<20041022131004.GA31857@thebrain.conmicro.cx>
	<yw1xis923mpi.fsf@mru.ath.cx>
	<20041022133144.GA19851@gamma.logic.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20041022133144.GA19851@gamma.logic.tuwien.ac.at> (Norbert
 Preining's message of "Fri, 22 Oct 2004 15:31:44 +0200")
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Norbert Preining <preining@logic.at>
Cc: Jay Maynard <jmaynard@conmicro.cx>, linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

Norbert Preining <preining@logic.at> writes:

> On Fre, 22 Okt 2004, M=E5ns Rullg=E5rd wrote:
>> > If you do this, I'd suggest putting swap space on the unused porti=
on of the
>> > IDE. That way, you won't have I/O contention for swapping.
>>=20
>> The IDE controller on the SX164 is really nothing you want to be usi=
ng
>> at all.
>
> Is it that bad? It is the SiI680: IDE controller.

Mine has a Cypress 82c693, which is somewhat less than impressive.

--=20
M=E5ns Rullg=E5rd
mru@mru.ath.cx
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
