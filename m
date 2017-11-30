From: Bob Tracy <rct@gherkin.frus.com>
Subject: [BUG] 4.14 cannot find configured disks/partitions
Date: Wed, 29 Nov 2017 23:48:23 -0600
Message-ID: <20171130054823.GA14814@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

(Forgot to include "linux-alpha" in the original recipient list, so
the next few messages are an attempt to fix that.  Please copy
"debian-alpha" on any replies.)

Perhaps the subject isn't entirely accurate, but that's what seems to be
the case.  After loading the initial ramdisk, the boot process stalls
(loops indefinitely) with "mdadm" complaining about not being able to scan 
the disks defined in its configuration file, which is bone-stock.  What
makes this particularly infuriating is, I don't have anything configured
for "mdadm" to worry about, which is what's normally found, i.e.,
nothing of interest.

The 4.13 kernel loads and boots just fine with exactly the same
up-to-date (unstable/experimental) userspace libraries and utilities.

Bottom line: the 4.14 kernel doesn't seem to detect my SCSI disks for
some reason.  All the recent patches (end of October time frame) for PCI
on alpha (I *think* mostly having to do with addressing some weird kind
of libata conflict) didn't make any difference.

Any idea what's causing this?  Thanks...

--Bob
