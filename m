From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [BUG] 4.14 cannot find configured disks/partitions
Date: Fri, 1 Dec 2017 22:49:01 -0600
Message-ID: <20171202044901.GA24486@gherkin.frus.com>
References: <20171124051010.GA18422@gherkin.frus.com>
 <20171129054955.GA9467@gherkin.frus.com>
 <20171201211628.omfk6jchxgqc4eof@tower>
 <20171202002250.GB22990@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171202002250.GB22990@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, debian-alpha@lists.debian.org, Michael Cree <michael.cree@waikato.ac.nz>, linux-alpha@vger.kernel.org

On Fri, Dec 01, 2017 at 06:22:50PM -0600, Bob Tracy wrote:
> On Sat, Dec 02, 2017 at 10:16:28AM +1300, Michael Cree wrote:
> > Just got a chance to try out 4.14 on an Alpha and look like firmware
> > for built-in drivers are being treated differently.  I presume you
> > have a qlogic scsi driver.  Make sure qlogic/1040.bin (or whatever is
> > appropriate for your scsi driver) is listed under Drivers->Generic
> > Driver Options->Include in-kernel firmware blobs.
> 
> Glad I saw this before trying a freshly-built 4.14 with a few more
> kernel config options enabled per the README file for systemd.  Doesn't
> mean there isn't a systemd/udev issue as well, but if the firmware for
> the SCSI controller isn't getting loaded, that makes detection of the
> host and attached devices pretty much a non-starter.

That was *it*.  Up and running on 4.14 with no issues.  Have reported
success and requested closure of bug #883089.

FYI, "1040.bin" *is* the correct firmware for the Qlogic ISP1020 card
as confirmed by examination of the driver source.

Oddly enough, I've been including the firmware for the video card as
part of the kernel build since forever: the console wouldn't initialize
properly without it.  Never occurred to me the same thing might be
needed for the built-in SCSI driver, mostly because everything worked
great up through kernel version 4.13.

Thanks again.

--Bob
