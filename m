From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: PWS 433au (Miata) recovery update
Date: Fri, 18 Jan 2019 00:19:52 +0000 (GMT)
Message-ID: <alpine.LFD.2.21.1901172329010.14808@eddie.linux-mips.org>
References: <20190116071014.GA11881@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
In-Reply-To: <20190116071014.GA11881@gherkin.frus.com>
Resent-Message-ID: <fnlBs3PQzWK.A.n6D.UGSQcB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/alpine.LFD.2.21.1901172329010.14808@eddie.linux-mips.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org, mcree@orcon.net.nz, mattst88@gmail.com

On Wed, 16 Jan 2019, Bob Tracy wrote:

> Odd thing about the disk partitioning scheme.  The disk label definitely
> has to be "bsd" for SRM to be happy, but if Linux is the only OS on the
> disk, all the rest of the BSD partitioning conventions don't have to be
> observed as far as slice "c" spanning the entire disk, slice "a" being
> the "boot" slice, slice "b" being "swap", and so forth.  I doubt dual-
> booting with Digital UNIX or one of the *BSD variants is a practical
> possibility for most people, particularly those with PWS systems having
> limited disk space.

 SRM doesn't actually care about or know the disk partitioning scheme, 
however it does require a signature and a pointer to the location of the 
boot loader (with `aboot' being the usual choice for Linux) in the first 
physical sector, and these structures happen to clash with the location of 
the IBM PC's DOS-style partition table.

 As you observe the partitions for Linux use can be arbitrary.  I used to 
install `aboot' outside any partition by just leaving a number of sectors 
at the beginning of the disk unassigned; `aboot' takes some 80KiB only. 
This is analogous to disks using a DOS-style partition table where you'd 
often leave the whole (simulated) first track of first cylinder unassigned 
for boot loader use.  This saves a partition table entry for a data area 
that can hardly be used through the corresponding block device anyway.

 NB be aware if you ever boot Windows NT on an Alpha machine that has an 
SRM signature on some disks, then the first sector of these disks will get 
corrupted under NT's assumption that these disks have no data and need to 
have a DOS-style partition table installed in the first sector.  Any OSF/1 
disk label will be retained, however the SRM signature will be lost making 
such disks unbootable and will have to be restored to make them bootable 
again.  Also the presence of the DOS-style partition table marker may 
confuse the Linux kernel if support for such partition tables has been 
compiled in in the addition to support for OSF/1 disk labels.

> A brief note about partitioning programs: "fdisk" is NOT your friend
> on the Alpha, especially in "modern" times.  Use "parted" and save
> yourself much frustration.

 I had a look at the GIT history of `util-linux' and it looks like in the 
conversion of the tool to use `libfdisk', also included with `util-linux', 
support has been lost, which I find rather unfortunate.

 It should be pretty straightforward to resurrect with the aid of old 
code, however it was never particularly clean (as has not been what still 
remains in `fdisk') due to the use of `#ifdef __alpha__' to select the 
label type, meaning you could not work with a disk intended for an Alpha 
system using fdisk compiled for a different host architecture.  It looks 
to me like the current framework would make it easier to avoid this #ifdef 
hack, but obviously any remains would have to be cleaned up.

 There used to be a tool called `minlabel' too that you could use to 
partition your Alpha disk, but it was rather crude.

> (1) "systemd" (and "udevd" by extension) don't play well with "/usr"
> being on a separate partition from "/".  If I have *any* advice to offer
> both the battle-scarred veteran and the newbie, it would be to consider
> consolidating those two partitions into a single partition.  Me?  I'd
> prefer the younger generation of system programmers consider the
> perfectly valid reasons why those filesystems might have been separate
> to begin with, and respect those reasons.  (Hint: much smaller disks.)

 In the old days it used to be a common practice to have /usr NFS-mounted 
in some installations, often where NIS was also used; perhaps it is not 
anymore.

 FWIW,

  Maciej

