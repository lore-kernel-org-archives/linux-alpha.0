From: Kurt Garloff <garloff@suse.de>
Subject: AS500/266 trouble
Date: Mon, 15 Apr 2002 18:53:06 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20020415185306.F2345@nbkurt.etpnet.phys.tue.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/+CTqSGWdiRg+8j"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-alpha.vger.kernel.org>
To: Linux Alpha list <linux-alpha@vger.kernel.org>


--W/+CTqSGWdiRg+8j
Content-Type: multipart/mixed; boundary="mFHiwr52TKrxpkjc"
Content-Disposition: inline


--mFHiwr52TKrxpkjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,=20

I have some trouble with an AlphaStation 500/266 and would like to ask
for hints.
Hardware: AS500 with 21164-266, Bret MoBo (Alcor), 288MB Ram, qlogic isp
1020 connected to two hard disks and CD-Rom, S3virge PCI video hardware.
It has the latest available firmware (7.2-2, ARC 4.58)

I have three problems:

(1) I can't get the machine to boot via ARC/MILO
    "Swapping to palcode at 0x0" is the last thing I see.
    Afterwards, I need the reset button.
    This happens with both SL7.1 AXP milo and with a self-compiled one.
    (milo-2.2.18 with 2.2.19 kernel)
    So I have to boot via SRM from a floppy. (I dislike the VMS/OSF=20
    partitioning scheme even more than the DOS one.)

(2) I can't get a 2.4.18 kernel to work:
    The qlogicisp driver/hardware seems to trigger some weird machine check.
   =20
 Linux version 2.4.18 (root@pebbles) (gcc version 2.96 20000731 (SuSE Linux=
 7.1/Alpha)) #16 Mon Apr 15 19:28:18 CEST 2002
 Booting on Alcor variation Alcor using machine vector Alcor from SRM
 Command line: ro root=3D/dev/sda6 console=3DttyS0,115200 console=3Dtty0
 [...]
 pci: cia revision 1
 On node 0 totalpages: 36747
 [...]
 pci: passed tb register update test
 pci: failed sg loopback i/o read test (0xac8000 !=3D 0xdeadbeef)
 pci: disabling sg translation window
 [...]
 SCSI subsystem driver Revision: 1.00
 qlogicisp : new isp1020 revision ID (2)
 scsi0 : QLogic ISP1020 SCSI on PCI bus 00 device 48 irq 28 I/O base 0x9400
 CIA machine check NOT expected!!!
 CIA machine check: vector=3D0x660 pc=3D0xfffffc00003124a4 code=3D0x0
 machine check type: unknown
 pc =3D [<fffffc00003124a4>]  ra =3D [<fffffc00003124c0>]  ps =3D 0007    N=
ot tainted
 v0 =3D 0000000000000000  t0 =3D ffffffffffffffff  t1 =3D 0000000000000000
 t2 =3D 0000000000000001  t3 =3D 0000000000000001  t4 =3D fffffc000056c640
 t5 =3D fffffffffffffc18  t6 =3D fffffc00005b0d90  t7 =3D fffffc0000568000
 a0 =3D 0000000000000019  a1 =3D 0000000000000032  a2 =3D 0000000000000100
 a3 =3D 0000000000000000  a4 =3D fffffc0000470ab0  a5 =3D 0000000000001800
 t8 =3D 0000000000000000  t9 =3D 000000002a7d999b  t10=3D 0000000000000000
 t11=3D fffffc000061a798  pv =3D fffffc000031e440  at =3D 0000000000000000
 gp =3D fffffc000060fc20  sp =3D fffffc000056bf90
   +       0 00000000000 0000000000000000 0000000000000000
   +      30 0000000000000000 0000000000000000
   +      40 0000000000000000 0000000000000000
   +      50 0000000000000000 0000000000000000
   +      60 ffffffffffffffff fffffc0000310b20
   +      70 0000000000005200 0000000000000001
   +      80 fffffc000056c640 fffffffffffffc18
   +      90 fffffc0000310780 1f1e161514020100
   +      a0 fffffc0000310d58 fffffc00003124a4
   +      b0 fffffc00003105c0 fffffc0000310700
   +      c0 0000000000000a0d 00000000000000e8
   +      d0 00000000000001e8 0000000006600001
   +      e0 0000000000000000 0000000000000000
   +      f0 fffffc0000adb8a0 0000000000300000
   +     100 fffffc0000310640 fffffc000060fc20
   +     110 00000000005683e8 fffffc00003124a4
   +     120 0000000000000000 0000000000000000
   +     130 0000000000018000 0000000000000000
   +     140 0000004164000000 0000000000000000
   +     150 0000000000000000 0000000010130b88
   +     160 00000000000148d0 ffffff0000644d6f
   +     170 0000000000000000 ffffff80002d6fff
   +     180 ffffffffffffffff 0000000000002880
   +     190 fffffff004ffffff ffffff000056802f
   +     1a0 ffffffffffe00000 0000000000001087
   +     1b0 0000000000000000 0000000000000018
   +     1c0 0000000000000c12 0000000000000000
   +     1d0 ffffffffffe00000 0000000002100000
   +     1e0 000000000e010806 0000000040008840
   +     1f0 0000000000000000 ffffffff80b62000
   =20
    Compiling a generic SRM kernel does not help.   =20
    Under 2.2.19 (from SL7.1 AXP), it behaves:
   =20
 Inspecting /boot/System.map-2.2.19
 Loaded 10635 symbols from /boot/System.map-2.2.19.
 Symbols match kernel version 2.2.19.
 No module symbols loaded.
 klogd 1.3-3, log source =3D ksyslog started.
 Linux version 2.2.19 (root@Fullinst.suse.de) (gcc version 2.96 20000731 (S=
uSE Linux 7.1/Alpha)) #2 Tue Apr 24 08:57:32 GMT 2001
 Booting GENERIC on Alcor variation Alcor using machine vector Alcor from S=
RM
 Command line: ro root=3D/dev/sda6
 [...]
 Alpha PCI BIOS32 revision 0.04
 PCI: Probing PCI hardware
 [...]
 qlogicisp : new isp1020 revision ID (2)
  scsi0 : QLogic ISP1020 SCSI on PCI bus 00 device 48 irq 28 I/O base 0xa000
 scsi : 1 host.
   Vendor: DEC       Model: RRD45   (C) DEC   Rev: 1645
   Type:   CD-ROM                             ANSI SCSI revision: 02
 Detected scsi CD-ROM sr0 at scsi0, channel 0, id 4, lun 0
   Vendor: IBM       Model: DDRS-34560W       Rev: S97B
   Type:   Direct-Access                      ANSI SCSI revision: 02
 Detected scsi disk sda at scsi0, channel 0, id 6, lun 0
   Vendor: QUANTUM   Model: ATLAS_V__9_WLS    Rev: 0230
   Type:   Direct-Access                      ANSI SCSI revision: 03
 Detected scsi disk sdb at scsi0, channel 0, id 8, lun 0
 scsi : detected 1 SCSI cdrom 2 SCSI disks total.
 Uniform CD-ROM driver Revision: 3.11
 SCSI device sda: hdwr sector=3D 512 bytes. Sectors=3D 8925000 [4357 MB] [4=
.4 GB]
 SCSI device sdb: hdwr sector=3D 512 bytes. Sectors=3D 17930694 [8755 MB] [=
8.8 GB]
 Partition check:
  sda: sda1 sda4 < sda5 sda6 sda7 sda8 sda9 sda10 >
  sdb: sdb4 < sdb5 sdb6 sdb7 sdb8 sdb9 sdb10 sdb11 >
 md.c: sizeof(mdp_super_t) =3D 4104
   =20
    A few things are remarkable:
    * 2.2.19 uses  irq 28 I/O base 0xa000  whereas 2.4.18
      tries to use irq 28 I/O base 0x9400.
      I'd think that these things are setup by SRM, no?
    * The machine check does not always occur. Especially, if I enable
      serial console or enable DEBUG printks in qlogicisp, the SCSI
      command tends to endlessly time out instead.
    * The pc (ffff fc00 0031 24c0) is near the end of cpu_idle
      (and probably unrelated to the machine check, as it's coming from
       the CIA.)
    * I enabled DEBUG_MCHECK, as you can see ...
   =20
(3) Using 2.2.19 (from SL7.1, booted via SRM), I can't get=20
    XFree86-4.2 to work. I did not (yet) try any other version
    of XF86.
    XFree86.0.log is attached.

Any hints would be appreciated.

Regards,
--=20
Kurt Garloff  <garloff@suse.de>                          Eindhoven, NL
GPG key: See mail header, key servers         Linux kernel development
SuSE Linux AG, Nuernberg, DE                            SCSI, Security

--mFHiwr52TKrxpkjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="pebbles.XF86.log"
Content-Transfer-Encoding: quoted-printable

XFree86 Version 4.2.0 / X Window System
(protocol Version 11, revision 0, vendor release 6600)
Release Date: 18 January 2002
	If the server is older than 6-12 months, or if your card is
	newer than the above date, look for a newer version before
	reporting problems.  (See http://www.XFree86.Org/)
Build Operating System: SuSE Linux [ELF] SuSE
Module Loader present
Markers: (--) probed, (**) from config file, (=3D=3D) default setting,
         (++) from command line, (!!) notice, (II) informational,
         (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(=3D=3D) Log file: "/var/log/XFree86.0.log", Time: Sun Apr  7 23:28:15 2002
(=3D=3D) Using config file: "/etc/X11/XF86Config"
(=3D=3D) ServerLayout "Layout[all]"
(**) |-->Screen "Screen[1]" (0)
(**) |   |-->Monitor "Monitor[0]"
(**) |   |-->Device "Device[1]"
(**) |-->Input Device "Keyboard[0]"
(**) Option "Protocol" "Standard"
(**) Option "XkbRules" "xfree86"
(**) XKB: rules: "xfree86"
(**) Option "XkbModel" "pc101"
(**) XKB: model: "pc101"
(**) Option "XkbLayout" "us"
(**) XKB: layout: "us"
(=3D=3D) Keyboard: CustomKeycode disabled
(**) |-->Input Device "Mouse[1]"
(WW) The directory "/usr/X11R6/lib/X11/fonts/jmk" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/PEX" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/cyrillic" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/latin2/misc" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/latin2/75dpi" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/latin2/100dpi" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/latin2/Type1" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/latin7/75dpi" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/kwintv" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/baekmuk" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/japanese" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/hellas/misc" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/hellas/75dpi" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/hellas/100dpi" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/hellas/Type1" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/xtest" does not exist.
	Entry deleted from font path.
(**) FontPath set to "/usr/X11R6/lib/X11/fonts/misc:unscaled,/usr/X11R6/lib=
/X11/fonts/local,/usr/X11R6/lib/X11/fonts/misc:unscaled,/usr/X11R6/lib/X11/=
fonts/75dpi:unscaled,/usr/X11R6/lib/X11/fonts/100dpi:unscaled,/usr/X11R6/li=
b/X11/fonts/Type1,/usr/X11R6/lib/X11/fonts/URW,/usr/X11R6/lib/X11/fonts/Spe=
edo,/usr/X11R6/lib/X11/fonts/truetype,/usr/X11R6/lib/X11/fonts/uni,/usr/X11=
R6/lib/X11/fonts/CID,/usr/X11R6/lib/X11/fonts/ucs/misc,/usr/X11R6/lib/X11/f=
onts/ucs/75dpi,/usr/X11R6/lib/X11/fonts/ucs/100dpi"
(**) RgbPath set to "/usr/X11R6/lib/X11/rgb"
(**) ModulePath set to "/usr/X11R6/lib/modules"
(**) Option "AllowMouseOpenFail"
(**) Option "Xinerama" "off"
(--) using VT number 7

(WW) Open APM failed (/dev/apm_bios) (No such device)
(II) Module ABI versions:
	XFree86 ANSI C Emulation: 0.1
	XFree86 Video Driver: 0.5
	XFree86 XInput driver : 0.3
	XFree86 Server Extension : 0.1
	XFree86 Font Renderer : 0.3
(II) Loader running on linux
(II) LoadModule: "bitmap"
(II) Loading /usr/X11R6/lib/modules/fonts/libbitmap.a
(II) Module bitmap: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.0.0
	Module class: XFree86 Font Renderer
	ABI class: XFree86 Font Renderer, version 0.3
(II) Loading font Bitmap
(II) LoadModule: "pcidata"
(II) Loading /usr/X11R6/lib/modules/libpcidata.a
(II) Module pcidata: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 0.1.0
	ABI class: XFree86 Video Driver, version 0.5
(II) PCI: PCI scan (all values are in hex)
(II) PCI: 00:06:0: chip 1011,0002 card 0000,0000 rev 24 class 02,00,00 hdr =
00
(II) PCI: 00:08:0: chip 10ec,8139 card 10ec,8139 rev 10 class 02,00,00 hdr =
00
(II) PCI: 00:09:0: chip 1077,1020 card 0000,0000 rev 02 class 01,00,00 hdr =
00
(II) PCI: 00:0a:0: chip 8086,0482 card 0000,0000 rev 05 class 00,00,00 hdr =
00
(II) PCI: 00:0c:0: chip 5333,8a01 card 5333,8a01 rev 01 class 03,00,00 hdr =
00
(II) PCI: End of PCI scan
(II) LoadModule: "scanpci"
(II) Loading /usr/X11R6/lib/modules/libscanpci.a
(II) Module scanpci: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 0.1.0
	ABI class: XFree86 Video Driver, version 0.5
(II) UnloadModule: "scanpci"
(II) Unloading /usr/X11R6/lib/modules/libscanpci.a
(II) Host-to-PCI bridge:
(II) Bus 0: bridge is at (0:0:0), (-1,0,0), BCTRL: 0x00 (VGA_EN is cleared)
(II) Bus 0 I/O range:
	[0] -1	0x00000000 - 0xffffffff (0x0) IX[B]
(II) Bus 0 non-prefetchable memory range:
	[0] -1	0x00000000 - 0x07ffffff (0x8000000) MX[B]
	[1] -1	0x09000000 - 0x0fffffff (0x7000000) MX[B]
	[2] -1	0x11000000 - 0x17ffffff (0x7000000) MX[B]
	[3] -1	0x19000000 - 0x1fffffff (0x7000000) MX[B]
	[4] -1	0x21000000 - 0x27ffffff (0x7000000) MX[B]
	[5] -1	0x29000000 - 0x2fffffff (0x7000000) MX[B]
	[6] -1	0x31000000 - 0x37ffffff (0x7000000) MX[B]
	[7] -1	0x39000000 - 0x3fffffff (0x7000000) MX[B]
	[8] -1	0x41000000 - 0x47ffffff (0x7000000) MX[B]
	[9] -1	0x49000000 - 0x4fffffff (0x7000000) MX[B]
	[10] -1	0x51000000 - 0x57ffffff (0x7000000) MX[B]
	[11] -1	0x59000000 - 0x5fffffff (0x7000000) MX[B]
	[12] -1	0x61000000 - 0x67ffffff (0x7000000) MX[B]
	[13] -1	0x69000000 - 0x6fffffff (0x7000000) MX[B]
	[14] -1	0x71000000 - 0x77ffffff (0x7000000) MX[B]
	[15] -1	0x79000000 - 0x7fffffff (0x7000000) MX[B]
	[16] -1	0x81000000 - 0x87ffffff (0x7000000) MX[B]
	[17] -1	0x89000000 - 0x8fffffff (0x7000000) MX[B]
	[18] -1	0x91000000 - 0x97ffffff (0x7000000) MX[B]
	[19] -1	0x99000000 - 0x9fffffff (0x7000000) MX[B]
	[20] -1	0xa1000000 - 0xa7ffffff (0x7000000) MX[B]
	[21] -1	0xa9000000 - 0xafffffff (0x7000000) MX[B]
	[22] -1	0xb1000000 - 0xb7ffffff (0x7000000) MX[B]
	[23] -1	0xb9000000 - 0xbfffffff (0x7000000) MX[B]
	[24] -1	0xc1000000 - 0xc7ffffff (0x7000000) MX[B]
	[25] -1	0xc9000000 - 0xcfffffff (0x7000000) MX[B]
	[26] -1	0xd1000000 - 0xd7ffffff (0x7000000) MX[B]
	[27] -1	0xd9000000 - 0xdfffffff (0x7000000) MX[B]
	[28] -1	0xe1000000 - 0xe7ffffff (0x7000000) MX[B]
	[29] -1	0xe9000000 - 0xefffffff (0x7000000) MX[B]
	[30] -1	0xf1000000 - 0xf7ffffff (0x7000000) MX[B]
	[31] -1	0xf9000000 - 0xffffffff (0x7000000) MX[B]
(II) Bus 0 prefetchable memory range:
	[0] -1	0x00000000 - 0x07ffffff (0x8000000) MX[B]
	[1] -1	0x09000000 - 0x0fffffff (0x7000000) MX[B]
	[2] -1	0x11000000 - 0x17ffffff (0x7000000) MX[B]
	[3] -1	0x19000000 - 0x1fffffff (0x7000000) MX[B]
	[4] -1	0x21000000 - 0x27ffffff (0x7000000) MX[B]
	[5] -1	0x29000000 - 0x2fffffff (0x7000000) MX[B]
	[6] -1	0x31000000 - 0x37ffffff (0x7000000) MX[B]
	[7] -1	0x39000000 - 0x3fffffff (0x7000000) MX[B]
	[8] -1	0x41000000 - 0x47ffffff (0x7000000) MX[B]
	[9] -1	0x49000000 - 0x4fffffff (0x7000000) MX[B]
	[10] -1	0x51000000 - 0x57ffffff (0x7000000) MX[B]
	[11] -1	0x59000000 - 0x5fffffff (0x7000000) MX[B]
	[12] -1	0x61000000 - 0x67ffffff (0x7000000) MX[B]
	[13] -1	0x69000000 - 0x6fffffff (0x7000000) MX[B]
	[14] -1	0x71000000 - 0x77ffffff (0x7000000) MX[B]
	[15] -1	0x79000000 - 0x7fffffff (0x7000000) MX[B]
	[16] -1	0x81000000 - 0x87ffffff (0x7000000) MX[B]
	[17] -1	0x89000000 - 0x8fffffff (0x7000000) MX[B]
	[18] -1	0x91000000 - 0x97ffffff (0x7000000) MX[B]
	[19] -1	0x99000000 - 0x9fffffff (0x7000000) MX[B]
	[20] -1	0xa1000000 - 0xa7ffffff (0x7000000) MX[B]
	[21] -1	0xa9000000 - 0xafffffff (0x7000000) MX[B]
	[22] -1	0xb1000000 - 0xb7ffffff (0x7000000) MX[B]
	[23] -1	0xb9000000 - 0xbfffffff (0x7000000) MX[B]
	[24] -1	0xc1000000 - 0xc7ffffff (0x7000000) MX[B]
	[25] -1	0xc9000000 - 0xcfffffff (0x7000000) MX[B]
	[26] -1	0xd1000000 - 0xd7ffffff (0x7000000) MX[B]
	[27] -1	0xd9000000 - 0xdfffffff (0x7000000) MX[B]
	[28] -1	0xe1000000 - 0xe7ffffff (0x7000000) MX[B]
	[29] -1	0xe9000000 - 0xefffffff (0x7000000) MX[B]
	[30] -1	0xf1000000 - 0xf7ffffff (0x7000000) MX[B]
	[31] -1	0xf9000000 - 0xffffffff (0x7000000) MX[B]
(--) PCI:*(0:12:0) S3 ViRGE/DX or /GX rev 1, Mem @ 0x14000000/26, BIOS @ 0x=
000c0000/16
(II) Addressable bus resource ranges are
	[0] -1	0x00000000 - 0xffffffff (0x0) MX[B]
	[1] -1	0x00000000 - 0xffffffff (0x0) IX[B]
(II) OS-reported resource ranges:
	[0] -1	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0xffffffff - 0xffffffff (0x1) IX[B]
	[4] -1	0x00000000 - 0x000000ff (0x100) IX[B]
(II) Active PCI resource ranges:
	[0] -1	0x09002000 - 0x09003fff (0x2000) MX[B]E
	[1] -1	0x09001000 - 0x09001fff (0x1000) MX[B]E
	[2] -1	0x09000000 - 0x09ffffff (0x1000000) MX[B]E
	[3] -1	0x000c0000 - 0x000cffff (0x10000) MX[B](B)
	[4] -1	0x14000000 - 0x17ffffff (0x4000000) MX[B](B)
	[5] -1	0x0000a000 - 0x0000a0ff (0x100) IX[B]E
	[6] -1	0x00009800 - 0x000098ff (0x100) IX[B]E
	[7] -1	0x00009000 - 0x000090ff (0x100) IX[B]E
(II) PCI Memory resource overlap reduced 0x09000000 from 0x09ffffff to 0x09=
000fff
(II) Active PCI resource ranges after removing overlaps:
	[0] -1	0x09002000 - 0x09003fff (0x2000) MX[B]E
	[1] -1	0x09001000 - 0x09001fff (0x1000) MX[B]E
	[2] -1	0x09000000 - 0x09000fff (0x1000) MX[B]E
	[3] -1	0x000c0000 - 0x000cffff (0x10000) MX[B](B)
	[4] -1	0x14000000 - 0x17ffffff (0x4000000) MX[B](B)
	[5] -1	0x0000a000 - 0x0000a0ff (0x100) IX[B]E
	[6] -1	0x00009800 - 0x000098ff (0x100) IX[B]E
	[7] -1	0x00009000 - 0x000090ff (0x100) IX[B]E
(II) OS-reported resource ranges after removing overlaps with PCI:
	[0] -1	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1	0x000c0000 - 0x000cffff (0x10000) MX[B]
	[3] -1	0xffffffff - 0xffffffff (0x1) IX[B]
	[4] -1	0x00000000 - 0x000000ff (0x100) IX[B]
(II) All system resource ranges:
	[0] -1	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1	0x000c0000 - 0x000cffff (0x10000) MX[B]
	[3] -1	0x09002000 - 0x09003fff (0x2000) MX[B]E
	[4] -1	0x09001000 - 0x09001fff (0x1000) MX[B]E
	[5] -1	0x09000000 - 0x09000fff (0x1000) MX[B]E
	[6] -1	0x000c0000 - 0x000cffff (0x10000) MX[B](B)
	[7] -1	0x14000000 - 0x17ffffff (0x4000000) MX[B](B)
	[8] -1	0xffffffff - 0xffffffff (0x1) IX[B]
	[9] -1	0x00000000 - 0x000000ff (0x100) IX[B]
	[10] -1	0x0000a000 - 0x0000a0ff (0x100) IX[B]E
	[11] -1	0x00009800 - 0x000098ff (0x100) IX[B]E
	[12] -1	0x00009000 - 0x000090ff (0x100) IX[B]E
(II) LoadModule: "ddc"
(II) Loading /usr/X11R6/lib/modules/libddc.a
(II) Module ddc: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.0.0
	ABI class: XFree86 Video Driver, version 0.5
(II) LoadModule: "type1"
(II) Loading /usr/X11R6/lib/modules/fonts/libtype1.a
(II) Module type1: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.0.1
	Module class: XFree86 Font Renderer
	ABI class: XFree86 Font Renderer, version 0.3
(II) Loading font Type1
(II) Loading font CID
(II) LoadModule: "speedo"
(II) Loading /usr/X11R6/lib/modules/fonts/libspeedo.a
(II) Module speedo: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.0.1
	Module class: XFree86 Font Renderer
	ABI class: XFree86 Font Renderer, version 0.3
(II) Loading font Speedo
(II) LoadModule: "extmod"
(II) Loading /usr/X11R6/lib/modules/extensions/libextmod.a
(II) Module extmod: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.0.0
	Module class: XFree86 Server Extension
	ABI class: XFree86 Server Extension, version 0.1
(II) Loading extension SHAPE
(II) Loading extension MIT-SUNDRY-NONSTANDARD
(II) Loading extension BIG-REQUESTS
(II) Loading extension SYNC
(II) Loading extension MIT-SCREEN-SAVER
(II) Loading extension XC-MISC
(II) Loading extension XFree86-VidModeExtension
(II) Loading extension XFree86-Misc
(II) Loading extension XFree86-DGA
(II) Loading extension DPMS
(II) Loading extension FontCache
(II) Loading extension TOG-CUP
(II) Loading extension Extended-Visual-Information
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) LoadModule: "freetype"
(II) Loading /usr/X11R6/lib/modules/fonts/libfreetype.a
(II) Module freetype: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.1.10
	Module class: XFree86 Font Renderer
	ABI class: XFree86 Font Renderer, version 0.3
(II) Loading font FreeType
(II) LoadModule: "dri"
(II) Loading /usr/X11R6/lib/modules/extensions/libdri.a
(II) Module dri: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.0.0
	ABI class: XFree86 Server Extension, version 0.1
(II) Loading sub module "drm"
(II) LoadModule: "drm"
(II) Loading /usr/X11R6/lib/modules/linux/libdrm.a
(II) Module drm: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.0.0
	ABI class: XFree86 Server Extension, version 0.1
(II) Loading extension XFree86-DRI
(II) LoadModule: "glx"
(II) Loading /usr/X11R6/lib/modules/extensions/libglx.a
(II) Module glx: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.0.0
	ABI class: XFree86 Server Extension, version 0.1
(II) Loading sub module "GLcore"
(II) LoadModule: "GLcore"
(II) Loading /usr/X11R6/lib/modules/extensions/libGLcore.a
(II) Module GLcore: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.0.0
	ABI class: XFree86 Server Extension, version 0.1
(II) Loading extension GLX
(II) LoadModule: "s3virge"
(II) Loading /usr/X11R6/lib/modules/drivers/s3virge_drv.o
(II) Module s3virge: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.8.3
	Module class: XFree86 Video Driver
	ABI class: XFree86 Video Driver, version 0.5
(II) LoadModule: "mouse"
(II) Loading /usr/X11R6/lib/modules/input/mouse_drv.o
(II) Module mouse: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.0.0
	Module class: XFree86 XInput Driver
	ABI class: XFree86 XInput driver, version 0.3
(II) S3VIRGE: driver (version 1.8.3) for S3 ViRGE chipsets: virge, 86C325,
	virge vx, 86C988, virge dx, virge gx, 86C375, 86C385, virge gx2,
	86C357, virge mx, 86C260, virge mx+, 86C280, trio 3d, 86C365,
	trio 3d/2x, 86C362, 86C368
(II) Primary Device is: PCI 00:0c:0
(--) Assigning device section with no busID to primary device
(--) Chipset virge dx found
(II) resource ranges after xf86ClaimFixedResources() call:
	[0] -1	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1	0x000c0000 - 0x000cffff (0x10000) MX[B]
	[3] -1	0x09002000 - 0x09003fff (0x2000) MX[B]E
	[4] -1	0x09001000 - 0x09001fff (0x1000) MX[B]E
	[5] -1	0x09000000 - 0x09000fff (0x1000) MX[B]E
	[6] -1	0x000c0000 - 0x000cffff (0x10000) MX[B](B)
	[7] -1	0x14000000 - 0x17ffffff (0x4000000) MX[B](B)
	[8] -1	0xffffffff - 0xffffffff (0x1) IX[B]
	[9] -1	0x00000000 - 0x000000ff (0x100) IX[B]
	[10] -1	0x0000a000 - 0x0000a0ff (0x100) IX[B]E
	[11] -1	0x00009800 - 0x000098ff (0x100) IX[B]E
	[12] -1	0x00009000 - 0x000090ff (0x100) IX[B]E
(II) resource ranges after probing:
	[0] -1	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1	0x000c0000 - 0x000cffff (0x10000) MX[B]
	[3] -1	0x09002000 - 0x09003fff (0x2000) MX[B]E
	[4] -1	0x09001000 - 0x09001fff (0x1000) MX[B]E
	[5] -1	0x09000000 - 0x09000fff (0x1000) MX[B]E
	[6] -1	0x000c0000 - 0x000cffff (0x10000) MX[B](B)
	[7] -1	0x14000000 - 0x17ffffff (0x4000000) MX[B](B)
	[8] 0	0x000a0000 - 0x000affff (0x10000) MS[B]
	[9] 0	0x000b0000 - 0x000b7fff (0x8000) MS[B]
	[10] 0	0x000b8000 - 0x000bffff (0x8000) MS[B]
	[11] -1	0xffffffff - 0xffffffff (0x1) IX[B]
	[12] -1	0x00000000 - 0x000000ff (0x100) IX[B]
	[13] -1	0x0000a000 - 0x0000a0ff (0x100) IX[B]E
	[14] -1	0x00009800 - 0x000098ff (0x100) IX[B]E
	[15] -1	0x00009000 - 0x000090ff (0x100) IX[B]E
	[16] 0	0x000003b0 - 0x000003bb (0xc) IS[B]
	[17] 0	0x000003c0 - 0x000003df (0x20) IS[B]
(II) Setting vga for screen 0.
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"
(II) Loading /usr/X11R6/lib/modules/libvgahw.a
(II) Module vgahw: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 0.1.0
	ABI class: XFree86 Video Driver, version 0.5
(**) S3VIRGE(0): Depth 16, (--) framebuffer bpp 16
(=3D=3D) S3VIRGE(0): RGB weight 565
(=3D=3D) S3VIRGE(0): Default visual is TrueColor
(=3D=3D) S3VIRGE(0): Using HW Cursor
(=3D=3D) S3VIRGE(0): Using fb.
(=3D=3D) S3VIRGE(0): mx_cr3a_fix.
(=3D=3D) S3VIRGE(0): XVideo allowed (depends on chipset).
(II) Loading sub module "vbe"
(II) LoadModule: "vbe"
(II) Loading /usr/X11R6/lib/modules/libvbe.a
(II) Module vbe: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.0.0
	ABI class: XFree86 Video Driver, version 0.5
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Loading /usr/X11R6/lib/modules/libint10.a
(II) Module int10: vendor=3D"The XFree86 Project"
	compiled for 4.2.0, module version =3D 1.0.0
	ABI class: XFree86 Video Driver, version 0.5
(II) S3VIRGE(0): initializing int10
(II) Machine needs sparse mapping
(II) mapVidMemSparse: mapped Base 0xa0000 size 0x20000 to DENSE at 0x2ff000=
a0000 and SPARSE at 0x30001400000
(II) S3VIRGE(0): No legacy BIOS found -- trying PCI
(EE) S3VIRGE(0): Cannot read V_BIOS (5)
(II) unmapVidMemSparse: unmapping Base 0x2ff000a0000 Size 0x20000
(--) S3VIRGE(0): Chipset: "virge dx"
(II) mapVidMemSparse: mapped Base 0x15000000 size 0x10000 to DENSE at 0x2ff=
15000000 and SPARSE at 0x302a0000000

Fatal server error:
xf86MapVidMemSparse: Could not (dense) mmap fb (No such file or directory)


When reporting a problem related to a server crash, please send
the full server output, not just the last messages.
This can be found in the log file "/var/log/XFree86.0.log".
Please report problems to feedback@suse.de.

root@pebbles:/var/log #=20

--mFHiwr52TKrxpkjc--

--W/+CTqSGWdiRg+8j
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8uwVyxmLh6hyYd04RAnWCAKC8ea8DEdTnCrLXqALpaxHtftuToQCgun0Y
hpLa1LpeQWtWU8E8Ew7uExI=
=6HoU
-----END PGP SIGNATURE-----

--W/+CTqSGWdiRg+8j--
