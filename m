From: Bob Tracy <rct@gherkin.frus.com>
Subject: PWS 433au (Miata) recovery update
Date: Wed, 16 Jan 2019 01:10:14 -0600
Message-ID: <20190116071014.GA11881@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
Resent-Message-ID: <WeIncSBebMJ.A.QrE.w2tPcB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20190116071014.GA11881@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Cc: mcree@orcon.net.nz, mattst88@gmail.com

Gentlemen,

Figured it was past time for an update, now that I actually have the
Alpha back on-line and functioning in its pre-meltdown capacity as my
IPv6 router and Linux kernel git repository.  The following narrative is
going to necessarily be somewhat long-winded, seeing as it's intended to
be a modern synthesis of knowledge gleaned from out-of-date Debian and
Gentoo installation documents, mailing list archives, bitter experience,
and source code examination.  Make whatever use of it you will.  My
intent is to have this written down *somewhere* for "the next time".

The ability to recover the machine in a somewhat timely fashion was
predicated on having reasonably current backups and a way to get them
onto the Alpha.  I never figured the latter consideration would be the
most difficult part of the job.  Not to put too fine a point on it, but
functional boot media for Alpha is more scarce than it should be.
Special thanks to the people at Gentoo (and Matt Turner in particular)
for being responsive and fixing the "qla1280" firmware issue that was
preventing the effective use of Gentoo's "install-alpha-minimal" image
as a recovery tool.  After a few off-line conversations with Michael,
I'm cautiously optimistic we'll eventually see a useful Debian NETINST
image at some point in the not-too-distant future.

The Gentoo image had neither the requisite USB drivers nor "ntfs-3g"
filesystem support, so I had to mount my external USB drive remotely and
copy my backups across the network.  Not too much pain, even over a
relatively slow 10 Mbit/s link.  Perhaps somewhat fortuitously, I used
a 36 GB disk in the PWS with a layout something like this:

(reserved for aboot)
/boot	(about 75 MB)
/	(about 4 GB)
swap	(about 2 GB)
/tmp	(about 3 GB)
/usr	(about 13.5 GB)
/opt	(about 13.5 GB)

Out of the lot, the real contents of "/opt" didn't have to be present
for the system to function when I initially booted off the hard drive, so
that was my staging area for the backups.  Once I was running off the hard
drive, the plan was to hook up the USB drive and restore "/opt".

Odd thing about the disk partitioning scheme.  The disk label definitely
has to be "bsd" for SRM to be happy, but if Linux is the only OS on the
disk, all the rest of the BSD partitioning conventions don't have to be
observed as far as slice "c" spanning the entire disk, slice "a" being
the "boot" slice, slice "b" being "swap", and so forth.  I doubt dual-
booting with Digital UNIX or one of the *BSD variants is a practical
possibility for most people, particularly those with PWS systems having
limited disk space.

A brief note about partitioning programs: "fdisk" is NOT your friend
on the Alpha, especially in "modern" times.  Use "parted" and save
yourself much frustration.

Using "parted", I set the default units to "cyl" and created a
"sacrificial" first partition beginning on cylinder 0 and ending on
cylinder 1.  This is detected by Linux as, for example "sda1" and should
not be used for anything on the off chance "aboot" installation
overwrites it.  So, the sequence of partition creation commands was:

mkpart 0 1
mkpart 1 a
mkpart a b
mkpart b c
mkpart c d
mkpart d e
mkpart e f

where the letters "a" through "f" represent starting and ending cylinder
numbers for each partition, and the starting cylinder for each partition
is the ending cylinder of the preceding partition, and yes, "parted"
makes sure things don't overlap.

Bonus: when it comes time to do "swriteboot", you don't have to specify
"-f3" because there's no slice 3 spanning the entire disk to prevent
"swriteboot" from writing the boot sectors.

Once I copied my backups into place (with the exception of "/opt" as
mentioned earlier) and wrote the boot sector, I ran into an interesting
show-stopper.  I had evidently upgraded the "initramfs-tools" package
prior to creating my backups, and, long story short, I was getting
dropped into an interactive shell with an "(initramfs)" prompt due to
the following braindamage:

(1) "systemd" (and "udevd" by extension) don't play well with "/usr"
being on a separate partition from "/".  If I have *any* advice to offer
both the battle-scarred veteran and the newbie, it would be to consider
consolidating those two partitions into a single partition.  Me?  I'd
prefer the younger generation of system programmers consider the
perfectly valid reasons why those filesystems might have been separate
to begin with, and respect those reasons.  (Hint: much smaller disks.)

(2) Perhaps as a consequence of (1), "/lib/systemd/systemd-udevd" refuses
to start/run on the initramfs, in spite of the appropriate support being
enabled in the kernel configuration per systemd's README file.  The
error messages appearing on the console are:

error getting socket: Address family not supported by protocol
error initializing udev control socket
could not listen on fds: Invalid argument

This isn't necessarily a fatal error, EXCEPT...

(3) The brain-dead "init-bottom/udev" script doesn't perform the
needed
    mount -n -o move /dev "${rootmnt:?}/dev"
because a prior "udevadm control --exit" fails because "udevd" isn't
running.  So...

(4) validate_init() fails with the cryptic error message
"run-init: opening console: No such file or directory" due to there
being no populated "/dev" directory on the real root fs.

See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=811479
Ben thought he had this fixed back in 2016, and I'm pretty sure he did.

My current workaround is to edit
"/usr/share/initramfs-tools/script/init-bottom/udev" and change the
"udevadm" line to read something like
udevadm control --exit || echo "warning: udevd not running"
then run "update-initramfs" as appropriate.  The point being, without
the logical OR clause in that statement, the script exits with an error
at that point, and the subsequent needed mount commands don't get
executed :-(.  The *real* fix is for some bright person to figure out
why "udevd" won't start.  It's running just fine on the hard disk once
the pivot from initramfs gets made.

--Bob

