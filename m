From: "Uwe Schindler" <uwe@thetaphi.de>
Subject: RE: recent udev upgrade failure on alpha
Date: Wed, 18 May 2011 17:28:42 +0200
Message-ID: <008e01cc1570$4567c210$d0374630$@thetaphi.de>
References: <20110224070203.GA28419@gherkin.frus.com> <20110224075149.GA28779@gherkin.frus.com> <002101cbd40a$fcb4a610$f61df230$@thetaphi.de> <AANLkTi=3mY=dUkhCRjFE_1-iPOMV8OHsGwqc1OF9zp9V@mail.gmail.com> <008101cbd454$02036770$060a3650$@thetaphi.de> <005301cc1555$58f92c30$0aeb8490$@thetaphi.de> <20110518145605.GJ3539@smp.if.uj.edu.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
In-Reply-To: <20110518145605.GJ3539@smp.if.uj.edu.pl>
Content-Language: de
Resent-Message-ID: <LVZw-aURilL.A.QhB.1W-0NB@liszt>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="us-ascii"
To: 'Witold Baryluk' <baryluk@smp.if.uj.edu.pl>
Cc: 'Michael Cree' <mcree@orcon.net.nz>, debian-alpha@lists.debian.org, mattst88@gmail.com, linux-alpha@vger.kernel.org

Hi,

thanks for response!

> -----Original Message-----
> From: Witold Baryluk [mailto:baryluk@smp.if.uj.edu.pl]
> Sent: Wednesday, May 18, 2011 4:56 PM
> To: Uwe Schindler
> Subject: Re: recent udev upgrade failure on alpha
> 
> On 05-18 14:15, Uwe Schindler wrote:
> > Hi,
> >
> > I had some time today to try again an upgrade of my AlphaStation 500
> > to "linux-image-2.6.38-2-alpha-generic". I got again an error on
> > loading the xfs.ko module from initrd  (I typed it manually from the
> > boot screen to this mail *g*):
> >
> > Module xfs: Relocation (type4) overflow vs _xfs_buf_find
> > FATAL: Error inserting xfs
(/lib/modules/2.6.38-2-alpha-generic/.../xfs.ko):
> > Invalid module format
> >
> > All other modules before (like SCSI QLA1040 and SATA SiI3114, Tulip
> > Ethernet,... load successfully). The last kernel that works is (as
> > written
> > below): 2.6.31-1-alpha-generic, all after 2.6.32 fail with the same
> > error message (with some minor differences).
> >
> > I had to go back to the working kernel and of course prevent upgrading
> > udev...
> 
> Strange. I was using xfs on 2.6.32 without problem (but not as root). Can
try
> on 2.6.38.

2.6.32 is also broken here (at least in the debian alpha-generic kernel).

> > Has anybody any idea what's wrong with the XFS module? My root file
> > system on a SATA disk (not /boot) is XFS. Maybe its again a binutils
bug.
> 
> Looks to be, but why only this module?

That's the big question. It's not a corrupted initrd, because i regenerated
it quite often, reinstalled kernels,... It is broken since .32 for this
machine.

Here some more infos about the machine (with working kernel):

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.31-1-alpha-generic (Debian 2.6.31-2)
(ben@decadent.org.uk) (gcc version 4.3.4 (Debian 4.3.4-6) ) #1 Mon Nov 16
05:56:06 UTC 2009
[    0.000000] Booting GENERIC on Alcor variation Alcor using machine vector
Alcor from SRM
[    0.000000] Major Options: MAGIC_SYSRQ
[    0.000000] Command line: ro  root=/dev/disk/by-label/root
...

$  cat /proc/cpuinfo
cpu                     : Alpha
cpu model               : EV56
cpu variation           : 7
cpu revision            : 0
cpu serial number       :
system type             : Alcor
system variation        : Alcor
system revision         : 0
system serial number    :
cycle frequency [Hz]    : 500000000
timer frequency [Hz]    : 1024.00
page size [bytes]       : 8192
phys. address bits      : 40
max. addr. space #      : 127
BogoMIPS                : 990.32
kernel unaligned acc    : 0 (pc=0,va=0)
user unaligned acc      : 0 (pc=0,va=0)
platform string         : Digital AlphaStation 500/500
cpus detected           : 1
L1 Icache               : 8K, 1-way, 32b line
L1 Dcache               : 8K, 1-way, 32b line
L2 cache                : 96K, 3-way, 64b line
L3 cache                : 8192K, 1-way, 64b line

$ lspci
00:06.0 Ethernet controller: Digital Equipment Corporation DECchip 21040
[Tulip] (rev 26)
00:07.0 USB Controller: NEC Corporation USB (rev 43)
00:07.1 USB Controller: NEC Corporation USB (rev 43)
00:07.2 USB Controller: NEC Corporation USB 2.0 (rev 04)
00:08.0 RAID bus controller: Silicon Image, Inc. SiI 3114
[SATALink/SATARaid] Serial ATA Controller (rev 02)
00:09.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI (rev
02)
00:0a.0 EISA bridge: Intel Corporation 82375EB/SB PCI to EISA Bridge (rev
15)
00:0b.0 Ethernet controller: Digital Equipment Corporation DECchip 21140
[FasterNet] (rev 20)
00:0c.0 VGA compatible controller: Digital Equipment Corporation PBXGB
[TGA2] (rev 22)

$ lsscsi
[0:0:0:0]    disk    IOMEGA   ZIP 100          J.03  /dev/sda   <-- this
uses special alpha partition table  with ext2 as /boot (contains aboot and
kernel)
[0:0:6:0]    cd/dvd  TEAC     CD-R56S          1.0P  /dev/sr0
[1:0:0:0]    disk    ATA      ST3120827AS      3.42  /dev/sdb  <-- on this
disk is xfs filesystem

Uwe

