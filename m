From: John Goerzen <jgoerzen@complete.org>
Subject: Re: howto boot alpha via SRM without supported SCSI controller
Date: Sat, 23 Oct 2004 07:58:51 -0500
Message-ID: <20041023125851.GC12347@complete.org>
References: <20041015110635.GB24800@gamma.logic.tuwien.ac.at> <yw1xbrf46wle.fsf@ford.guide> <Pine.GSO.4.58.0410221039390.1973@igloo.df.lth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.58.0410221039390.1973@igloo.df.lth.se>
Resent-Message-ID: <Di46S.A.bgF.WWleBB@murphy>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-alpha/>
Content-Type: text/plain; charset="iso-8859-1"
To: Joakim Roubert <jokke@df.lth.se>
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Fri, Oct 22, 2004 at 10:40:53AM +0200, Joakim Roubert wrote:
> On Fri, 15 Oct 2004, M=E5ns Rullg=E5rd wrote:
>=20
> > > milo:
> > I wouldn't do that.
>=20
> Me neither; I used to run milo, but then switched to SRM. The only reason
> I see to usethe milo solution with ARC is if one has to use Windows on the
> same machine (or if no SRM is available).

Or if your disks are not partitioned with the DEC partition table.

I successfully converted a disk enough to boot.  But it was not the
most simple process to do so in a non-destructive way.

-- John

