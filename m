From: Norbert Preining <preining@logic.at>
Subject: Re: howto boot alpha via SRM without supported SCSI controller
Date: Fri, 22 Oct 2004 16:39:49 +0200
Message-ID: <20041022143949.GA22918@gamma.logic.tuwien.ac.at>
References: <20041015110635.GB24800@gamma.logic.tuwien.ac.at> <yw1xbrf46wle.fsf@ford.guide> <20041022122428.GA6808@gamma.logic.tuwien.ac.at> <yw1xr7nq3ogx.fsf@mru.ath.cx> <20041022131004.GA31857@thebrain.conmicro.cx> <yw1xis923mpi.fsf@mru.ath.cx> <20041022133144.GA19851@gamma.logic.tuwien.ac.at> <yw1xacue3kb8.fsf@mru.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <yw1xacue3kb8.fsf@mru.ath.cx>
Resent-Message-ID: <qL4BJ.A.4hF.6uReBB@murphy>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-alpha/>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-15?Q?M=E5ns_Rullg=E5rd?= <mru@mru.ath.cx>
Cc: Jay Maynard <jmaynard@conmicro.cx>, linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

On Fre, 22 Okt 2004, M=E5ns Rullg=E5rd wrote:
> >> The IDE controller on the SX164 is really nothing you want to be usi=
ng
> >> at all.
> >
> > Is it that bad? It is the SiI680: IDE controller.
>=20
> Mine has a Cypress 82c693, which is somewhat less than impressive.

Uuups, you are right, in the
	SX164:	CY82C693
	PC164:  CMD646
the SiI is another IDE extern we have.

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
SLIGO (n.)
An unnamed and exotic sexual act which people like to believe that
famous films stars get up to in private. 'To commit slingo.'
			--- Douglas Adams, The Meaning of Liff


--=20
To UNSUBSCRIBE, email to debian-alpha-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org

