From: Norbert Preining <preining@logic.at>
Subject: Re: howto boot alpha via SRM without supported SCSI controller
Date: Fri, 22 Oct 2004 15:31:44 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20041022133144.GA19851@gamma.logic.tuwien.ac.at>
References: <20041015110635.GB24800@gamma.logic.tuwien.ac.at> <yw1xbrf46wle.fsf@ford.guide> <20041022122428.GA6808@gamma.logic.tuwien.ac.at> <yw1xr7nq3ogx.fsf@mru.ath.cx> <20041022131004.GA31857@thebrain.conmicro.cx> <yw1xis923mpi.fsf@mru.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <yw1xis923mpi.fsf@mru.ath.cx>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-15?Q?M=E5ns_Rullg=E5rd?= <mru@mru.ath.cx>
Cc: Jay Maynard <jmaynard@conmicro.cx>, linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

On Fre, 22 Okt 2004, M=E5ns Rullg=E5rd wrote:
> > If you do this, I'd suggest putting swap space on the unused portio=
n of the
> > IDE. That way, you won't have I/O contention for swapping.
>=20
> The IDE controller on the SX164 is really nothing you want to be usin=
g
> at all.

Is it that bad? It is the SiI680: IDE controller.

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
TUMBY (n.)
The involuntary abdominal gurgling which fills the silence following
someone else's intimate personal revelation.
			--- Douglas Adams, The Meaning of Liff
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
