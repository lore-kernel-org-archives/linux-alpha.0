From: Jay Maynard <jmaynard@conmicro.cx>
Subject: Re: howto boot alpha via SRM without supported SCSI controller
Date: Fri, 22 Oct 2004 08:10:04 -0500
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20041022131004.GA31857@thebrain.conmicro.cx>
References: <20041015110635.GB24800@gamma.logic.tuwien.ac.at> <yw1xbrf46wle.fsf@ford.guide> <20041022122428.GA6808@gamma.logic.tuwien.ac.at> <yw1xr7nq3ogx.fsf@mru.ath.cx>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <yw1xr7nq3ogx.fsf@mru.ath.cx>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

On Fri, Oct 22, 2004 at 02:51:42PM +0200, M?ns Rullg?rd wrote:
> Norbert Preining <preining@logic.at> writes:
> > Thanks for the suggestion. I decided to take this route, put a small IDE
> > disk into the machine, and only get aboot, kernel and root-fs from
> > there. Anyting else will be done from SCSI disks.
> There is no problem having the root fs on the SCSI disks.  Just pass
> root=/dev/sdXX to the kernel.

If you do this, I'd suggest putting swap space on the unused portion of the
IDE. That way, you won't have I/O contention for swapping.
