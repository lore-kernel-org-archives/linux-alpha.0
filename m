From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [BUG] 4.14 cannot find configured disks/partitions
Date: Sat, 2 Dec 2017 10:16:28 +1300
Message-ID: <20171201211628.omfk6jchxgqc4eof@tower>
References: <20171124051010.GA18422@gherkin.frus.com>
 <20171129054955.GA9467@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171129054955.GA9467@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: debian-alpha@lists.debian.org, Michael Cree <michael.cree@waikato.ac.nz>, linux-alpha@vger.kernel.org

On Tue, Nov 28, 2017 at 11:49:55PM -0600, Bob Tracy wrote:
> On Thu, Nov 23, 2017 at 11:10:10PM -0600, Bob Tracy wrote:
> > Perhaps the subject isn't entirely accurate, but that's what seems to be
> > the case.  After loading the initial ramdisk, the boot process stalls
> > (loops indefinitely) with "mdadm" complaining about not being able to scan 
> > the disks defined in its configuration file, which is bone-stock.  What
> > makes this particularly infuriating is, I don't have anything configured
> > for "mdadm" to worry about, which is what's normally found, i.e.,
> > nothing of interest.
> > 
> > The 4.13 kernel loads and boots just fine with exactly the same
> > up-to-date (unstable/experimental) userspace libraries and utilities.
> > 
> > Bottom line: the 4.14 kernel doesn't seem to detect my SCSI disks for
> > some reason.  All the recent patches (end of October time frame) for PCI
> > on alpha (I *think* mostly having to do with addressing some weird kind
> > of libata conflict) didn't make any difference.

Just got a chance to try out 4.14 on an Alpha and look like firmware
for built-in drivers are being treated differently.  I presume you
have a qlogic scsi driver.  Make sure qlogic/1040.bin (or whatever is
appropriate for your scsi driver) is listed under Drivers->Generic
Driver Options->Include in-kernel firmware blobs.

Cheers
Michael.
