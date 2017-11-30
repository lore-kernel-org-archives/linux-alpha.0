From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [BUG] 4.14 cannot find configured disks/partitions
Date: Wed, 29 Nov 2017 23:48:55 -0600
Message-ID: <20171130054855.GB14814@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

On Thu, Nov 23, 2017 at 11:10:10PM -0600, Bob Tracy wrote:
> Perhaps the subject isn't entirely accurate, but that's what seems to be
> the case.  After loading the initial ramdisk, the boot process stalls
> (loops indefinitely) with "mdadm" complaining about not being able to scan 
> the disks defined in its configuration file, which is bone-stock.  What
> makes this particularly infuriating is, I don't have anything configured
> for "mdadm" to worry about, which is what's normally found, i.e.,
> nothing of interest.
> 
> The 4.13 kernel loads and boots just fine with exactly the same
> up-to-date (unstable/experimental) userspace libraries and utilities.
> 
> Bottom line: the 4.14 kernel doesn't seem to detect my SCSI disks for
> some reason.  All the recent patches (end of October time frame) for PCI
> on alpha (I *think* mostly having to do with addressing some weird kind
> of libata conflict) didn't make any difference.
> 
> Any idea what's causing this?  Thanks...

Another follow-up...  Tried booting on 4.14.0 (final) this evening, not
expecting that the upgrade from -rc8 would make any difference.  It
didn't.  The SCSI host adapter is not being detected for whatever reason.
The only device present on the system that's visible when I do
"cat /proc/scsi/scsi" in the initramfs shell is the Toshiba IDE cdrom
device.  Normally, I'd also see the real SCSI host adapter and its
associated SCSI disk.

Upon trying to reboot on my 4.13 kernel, I discovered *it's* now broken
as well, thanks to a recent udev update :-(.  Now I get a bunch of
timeouts for all the filesystems (including the swap partition) not
mounted immediately at boot time.  "journalctl -xb" is littered with
applicable messages of the form

dev-sdaX.device: Job dev-sdaX.device/start timed out.
Timed out waiting for device dev-sdaX.device.

In systemd's emergency mode, I can manually mount (or swapon as
appropriate) the various sdaX partitions.

USB detection/startup is similarly broken.  I had to manually load the
usb core and host modules.

So...  It appears there's something currently badly amiss in the
systemd+udev universe.  Such are the hazards of running the
unstable/experimental distribution, and I suppose I should consider
myself fortunate I can even get to a mostly-functional multi-user run
state at this point.

Did I miss a discussion somewhere about "/dev/sdaX" in "/etc/fstab"
being deprecated?  Moving to UUIDs might help with the current 4.13
brokenness, but won't solve the host adapter detection issue in 4.14.

--Bob
