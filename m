From: Dave Airlie <airlied@gmail.com>
Subject: Re: Kernel 2.6.30.1 Oops on Alpha Architecture when starting Xserver
Date: Thu, 16 Jul 2009 13:16:02 +1000
Message-ID: <21d7e9970907152016u3b213beet9090ee3b34f6d8b1@mail.gmail.com>
References: <4A5DB243.2000100@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=1hMZLZ7xfV7d5RGeoX9Ouo1kjd8YOsj/aJsZuv5BpGU=;
        b=iWv1hLDAbu0UVRMQIz78VlA1M+vRj0jCFZk7Zd4qhNcdxL+Ze90EtoT8qrxWYVr2R3
         I3MxMSoCIEL8uD08eLVQ7daRXMZHcVfJmjUkx0N+r9HUvWRgKQjBe1/p8z4OhX/pOLyX
         NpyDZQTquxgLeFRh/oma5sx6hnql/6Y7jXHZc=
In-Reply-To: <4A5DB243.2000100@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 15, 2009 at 8:41 PM, Michael Cree<mcree@orcon.net.nz> wrote=
:
> Kernel Oops on Alpha Architecture when starting the Xserver.
>
> Whenever I start the Xserver, version 1.6.2 from Debain Unstable, I g=
et a
> kernel oops report and the computer crashes hard; no ping response, h=
itting
> the reset button to return to SRM fails. =A0Has caused corruption on =
disc
> partitions on some crashes. =A0This occurs with kernels 2.6.30, 2.6.3=
0.1 and
> also a patched version of 2.6.29.x (patched so that I get PCI resourc=
e files
> under sysfs).
>
> The kernel oops is:

So its a machine check,

Well X is trying to post the graphics card you have installed, and the =
machine
is falling over when it does it.

I'm not really sure what you can do in that case, not posting the GPU w=
ould
probably end up with no working gpu either.

Dave.


>
> Unable to handle kernel paging request at virtual address 00000000000=
0000c
> Xorg(1940): Oops 0
> pc =3D [<fffffc000031e634>] =A0ra =3D [<fffffc000031570c>] =A0ps =3D =
0007 =A0 =A0Not
> tainted
> pc is at cia_machine_check+0x84/0x570
> ra is at do_entInt+0x16c/0x1d0
> v0 =3D 0000000000000001 =A0t0 =3D 0000000000000001 =A0t1 =3D fffffc00=
0071a250
> t2 =3D 0000000000000001 =A0t3 =3D 0000000000000031 =A0t4 =3D 3a000000=
00000000
> t5 =3D 0000000000000004 =A0t6 =3D 000000000000000f =A0t7 =3D fffffc00=
21c0c000
> s0 =3D fffffc00006ed2d8 =A0s1 =3D 0000000000000000 =A0s2 =3D fffffc00=
21c0fee8
> s3 =3D 000000011ff016fc =A0s4 =3D 000000011ff016f4 =A0s5 =3D fffffc00=
00006068
> s6 =3D 0000000000000660
> a0 =3D 0000000000000001 =A0a1 =3D 0000000000000000 =A0a2 =3D fffffc00=
00006068
> a3 =3D 0000000000000000 =A0a4 =3D 0000000100000010 =A0a5 =3D 00000001=
2029c0a0
> t8 =3D 0000000000000010 =A0t9 =3D 00000001200c0b98 =A0t10=3D 00000000=
00000000
> t11=3D 000000000000000a =A0pv =3D fffffc000031e5b0 =A0at =3D 00000000=
00000006
> gp =3D fffffc00007192f0 =A0sp =3D fffffc0021c0fe88
> Disabling lock debugging due to kernel taint
> Trace:
> [<fffffc000031570c>] do_entInt+0x16c/0x1d0
> [<fffffc0000310c80>] ret_from_sys_call+0x0/0x10
> [<fffffc0000310720>] entInt+0x0/0x80
>
> Code: 207f0660 =A041e305a3 =A02a620000 =A0426015a1 =A044230001 =A0e42=
0000f <a031000c>
> 47ff0413
>
>
> On one crash there was a trace of the Xorg.log file left intact endin=
g with
> the following lines:
>
> (II) RADEON(0): Attempting to read un-POSTed bios
> (II) RADEON(0): ATOM BIOS detected
> (II) RADEON(0): ATOM BIOS Rom:
> =A0 =A0 =A0 SubsystemVendorID: 0x2232 SubsystemID: 0x1787
> =A0 =A0 =A0 IOBaseAddress: 0x0000
> =A0 =A0 =A0 Filename: 72319EAA.QEA
> =A0 =A0 =A0 BIOS Bootup Message: =A0 HD2400 GDDR2_32MX16 64BIT 256MB =
72319EAA.QEA
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (II) RADEON(0=
): Framebuffer space used by
> Firmware (kb): 0
> (WW) RADEON(0): rhdAtomGetFbBaseAndSize: AtomBIOS specified VRAM scra=
tch
> space size invalid
> (II) RADEON(0): =A0default to: 20480
> (II) RADEON(0): Cannot get VRAM scratch space. Allocating in main mem=
ory
> instead
> (II) RADEON(0): Default Engine Clock: 525000
> (II) RADEON(0): Default Memory Clock: 400000
> (II) RADEON(0): Maximum Pixel ClockPLL Frequency Output: 1200000
> (II) RADEON(0): Minimum Pixel ClockPLL Frequency Output: 0
> (II) RADEON(0): Maximum Pixel ClockPLL Frequency Input: 13500
> (II) RADEON(0): Minimum Pixel ClockPLL Frequency Input: 1000
> (II) RADEON(0): Maximum Pixel Clock: 400000
> (II) RADEON(0): Reference Clock: 27000
> (II) RADEON(0): Default Engine Clock: 525000
> (II) RADEON(0): Default Memory Clock: 400000
> (II) RADEON(0): Calling ASIC Init
> [Xorg.log ends here]
>
>
> Other machine info follows:
>
> aleph:~# cat /proc/version
> Linux version 2.6.30.1-miata (mjc@alpha) (gcc version 4.2.4 (Debian
> 4.2.4-6)) #1 Fri Jul 3 22:54:36 NZST 2009
>
> aleph:~# cat /proc/cpuinfo
> cpu =A0 =A0 =A0 =A0 =A0 =A0: Alpha
> cpu model =A0 =A0 =A0 =A0: EV56
> cpu variation =A0 =A0 =A0 =A0: 7
> cpu revision =A0 =A0 =A0 =A0: 0
> cpu serial number =A0 =A0:
> system type =A0 =A0 =A0 =A0: Miata
> system variation =A0 =A0: 0
> system revision =A0 =A0 =A0 =A0: 0
> system serial number =A0 =A0:
> cycle frequency [Hz] =A0 =A0: 600000000
> timer frequency [Hz] =A0 =A0: 1024.00
> page size [bytes] =A0 =A0: 8192
> phys. address bits =A0 =A0: 40
> max. addr. space # =A0 =A0: 127
> BogoMIPS =A0 =A0 =A0 =A0: 1187.96
> kernel unaligned acc =A0 =A0: 0 (pc=3D0,va=3D0)
> user unaligned acc =A0 =A0: 0 (pc=3D0,va=3D0)
> platform string =A0 =A0 =A0 =A0: Digital Personal WorkStation 600au
> cpus detected =A0 =A0 =A0 =A0: 1
> L1 Icache =A0 =A0 =A0 =A0: 8K, 1-way, 32b line
> L1 Dcache =A0 =A0 =A0 =A0: 8K, 1-way, 32b line
> L2 cache =A0 =A0 =A0 =A0: 96K, 3-way, 64b line
> L3 cache =A0 =A0 =A0 =A0: 2048K, 1-way, 64b line
>
> aleph:~# cat /proc/modules
> ipv6 331224 22 - Live 0xfffffffc008c2000
> loop 18872 0 - Live 0xfffffffc00812000
> snd_es18xx 40484 0 - Live 0xfffffffc007f0000
> ohci_hcd 26048 0 - Live 0xfffffffc00788000
> ehci_hcd 40004 0 - Live 0xfffffffc00764000
> ide_cd_mod 36336 0 - Live 0xfffffffc0073c000
> cdrom 44000 1 ide_cd_mod, Live 0xfffffffc006fc000
> snd_hda_codec_atihdmi 4616 1 - Live 0xfffffffc006d8000
> snd_hda_intel 31184 0 - Live 0xfffffffc006be000
> snd_cmipci 42152 0 - Live 0xfffffffc00696000
> snd_opl3_lib 13288 2 snd_es18xx,snd_cmipci, Live 0xfffffffc00672000
> snd_hwdep 9760 1 snd_opl3_lib, Live 0xfffffffc0065a000
> snd_mpu401_uart 9488 2 snd_es18xx,snd_cmipci, Live 0xfffffffc00642000
> snd_seq_midi 8768 0 - Live 0xfffffffc0062a000
> snd_seq_midi_event 8032 1 snd_seq_midi, Live 0xfffffffc00614000
> sata_sil 11328 0 - Live 0xfffffffc005fe000
> snd_hda_codec 72498 2 snd_hda_codec_atihdmi,snd_hda_intel, Live
> 0xfffffffc005de000
> snd_rawmidi 26657 2 snd_mpu401_uart,snd_seq_midi, Live 0xfffffffc005a=
6000
> snd_pcm 77689 4 snd_es18xx,snd_hda_intel,snd_cmipci,snd_hda_codec, Li=
ve
> 0xfffffffc00576000
> snd_seq 67568 2 snd_seq_midi,snd_seq_midi_event, Live 0xfffffffc00534=
000
> snd_timer 25064 3 snd_opl3_lib,snd_pcm,snd_seq, Live 0xfffffffc004fe0=
00
> snd_seq_device 8808 4 snd_opl3_lib,snd_seq_midi,snd_rawmidi,snd_seq, =
Live
> 0xfffffffc004de000
> snd 72216 12
> snd_es18xx,snd_hda_intel,snd_cmipci,snd_opl3_lib,snd_hwdep,snd_mpu401=
_uart,snd_hda_codec,snd_rawmidi,snd_pcm,snd_seq,snd_timer,snd_seq_devic=
e,
> Live 0xfffffffc004b8000
> snd_page_alloc 11200 2 snd_hda_intel,snd_pcm, Live 0xfffffffc00484000
> soundcore 7712 1 snd, Live 0xfffffffc0046e000
> libata 191292 1 sata_sil, Live 0xfffffffc0042a000
> evdev 12896 1 - Live 0xfffffffc003b6000
> pcspkr 3088 0 - Live 0xfffffffc0039e000
> usbcore 168612 3 ohci_hcd,ehci_hcd, Live 0xfffffffc00364000
> cy82c693 4552 0 - Live 0xfffffffc002f0000
> tulip 56856 0 - Live 0xfffffffc002d0000
> ide_pci_generic 5132 0 - Live 0xfffffffc002a6000
>
> aleph:~# cat /proc/ioports
> 0000-001f : dma1
> 0020-003f : pic1
> 0040-005f : timer
> 0060-006f : keyboard
> 0070-0080 : rtc
> 00a0-00bf : pic2
> 00c0-00df : dma2
> 0170-0177 : 0000:00:07.2
> =A00170-0177 : cy82c693
> 01f0-01f7 : 0000:00:07.1
> =A001f0-01f7 : cy82c693
> 0220-022f : ES18xx
> 02f8-02ff : serial
> 0330-0331 : MPU401 UART
> 0376-0376 : 0000:00:07.2
> =A00376-0376 : cy82c693
> 03c0-03df : vga+
> 03f2-03f2 : floppy
> 03f4-03f5 : floppy
> 03f6-03f6 : 0000:00:07.1
> =A003f6-03f6 : cy82c693
> 03f7-03f7 : floppy
> 03f8-03ff : serial
> 8000-8fff : PCI Bus 0000:01
> =A08000-80ff : 0000:01:00.0
> 9000-9fff : PCI Bus 0000:02
> =A09000-90ff : 0000:02:04.0
> =A09400-94ff : 0000:02:0a.0
> =A0 9400-94ff : CMI8738-MC6
> =A09800-980f : 0000:02:08.0
> =A09810-9817 : 0000:02:08.0
> =A09818-981f : 0000:02:08.0
> =A09820-9823 : 0000:02:08.0
> =A09824-9827 : 0000:02:08.0
> a000-a07f : 0000:00:03.0
> =A0a000-a07f : tulip
> a080-a08f : 0000:00:07.1
> =A0a080-a08f : cy82c693
>
> aleph:~# car /proc/iomem
> 09000000-090fffff : PCI Bus 0000:01
> =A009000000-0900ffff : 0000:01:00.0
> =A009010000-09013fff : 0000:01:00.1
> =A0 09010000-09013fff : ICH HD audio
> 09100000-091fffff : PCI Bus 0000:02
> =A009100000-09100fff : 0000:02:04.0
> =A009101000-091011ff : 0000:02:08.0
> =A0 09101000-091011ff : sata_sil
> 09200000-092fffff : PCI Bus 0000:02
> =A009200000-0927ffff : 0000:02:08.0
> =A009280000-0928ffff : 0000:02:04.0
> 09300000-0933ffff : 0000:00:03.0
> 09340000-0934ffff : 0000:00:07.2
> =A009340000-0934ffff : cy82c693
> 09350000-09350fff : 0000:00:07.3
> =A009350000-09350fff : ohci_hcd
> 09351000-0935107f : 0000:00:03.0
> =A009351000-0935107f : tulip
> 10000000-27ffffff : PCI Bus 0000:01
> =A010000000-1fffffff : 0000:01:00.0
> =A020000000-2001ffff : 0000:01:00.0
>
> aleph:~# lspci -vvv
> 00:03.0 Ethernet controller: Digital Equipment Corporation DECchip 21=
142/43
> (rev 30)
> =A0 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r+
> Stepping- SERR- FastB2B- DisINTx-
> =A0 Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort=
- <TAbort-
> <MAbort- >SERR- <PERR- INTx-
> =A0 Latency: 255 (5000ns min, 10000ns max), Cache Line Size: 64 bytes
> =A0 Interrupt: pin A routed to IRQ 24
> =A0 Region 0: I/O ports at a000 [size=3D128]
> =A0 Region 1: Memory at 09351000 (32-bit, non-prefetchable) [size=3D1=
28]
> =A0 Expansion ROM at 09300000 [disabled] [size=3D256K]
> =A0 Kernel driver in use: tulip
> =A0 Kernel modules: tulip
>
> 00:07.0 ISA bridge: Contaq Microsystems 82c693
> =A0 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r+
> Stepping- SERR- FastB2B- DisINTx-
> =A0 Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort=
- <TAbort-
> <MAbort- >SERR- <PERR- INTx-
> =A0 Latency: 0
> =A0 Kernel modules: cy82c693
>
> 00:07.1 IDE interface: Contaq Microsystems 82c693 (prog-if 80 [Master=
])
> =A0 Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r+
> Stepping- SERR- FastB2B- DisINTx-
> =A0 Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort=
- <TAbort-
> <MAbort- >SERR- <PERR- INTx-
> =A0 Latency: 0
> =A0 Interrupt: pin A routed to IRQ 0
> =A0 Region 0: I/O ports at 01f0 [size=3D8]
> =A0 Region 1: I/O ports at 03f4 [size=3D1]
> =A0 Region 4: I/O ports at a080 [size=3D16]
> =A0 Kernel driver in use: Cypress_IDE
> =A0 Kernel modules: cy82c693, ide-pci-generic
>
> 00:07.2 IDE interface: Contaq Microsystems 82c693 (prog-if 00 [])
> =A0 Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r+
> Stepping- SERR- FastB2B- DisINTx-
> =A0 Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort=
- <TAbort-
> <MAbort- >SERR- <PERR- INTx-
> =A0 Latency: 0
> =A0 Interrupt: pin B routed to IRQ 0
> =A0 Region 0: I/O ports at 0170 [size=3D8]
> =A0 Region 1: I/O ports at 0374 [size=3D1]
> =A0 Region 4: Memory at 09340000 (32-bit, non-prefetchable) [disabled=
]
> [size=3D64K]
> =A0 Kernel modules: cy82c693, ide-pci-generic
>
> 00:07.3 USB Controller: Contaq Microsystems 82c693 (prog-if 10 [OHCI]=
)
> =A0 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r+
> Stepping- SERR- FastB2B- DisINTx-
> =A0 Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort=
- <TAbort-
> <MAbort- >SERR- <PERR- INTx-
> =A0 Latency: 248
> =A0 Interrupt: pin A routed to IRQ 10
> =A0 Region 0: Memory at 09350000 (32-bit, non-prefetchable) [size=3D4=
K]
> =A0 Kernel driver in use: ohci_hcd
> =A0 Kernel modules: cy82c693, ohci-hcd
>
> 00:0c.0 PCI bridge: PLX Technology, Inc. PEX8112 x1 Lane PCI Express-=
to-PCI
> Bridge (rev aa) (prog-if 00 [Normal decode])
> =A0 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r-
> Stepping- SERR+ FastB2B- DisINTx-
> =A0 Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort=
- <TAbort-
> <MAbort- >SERR- <PERR- INTx-
> =A0 Latency: 255, Cache Line Size: 64 bytes
> =A0 Bus: primary=3D00, secondary=3D01, subordinate=3D01, sec-latency=3D=
255
> =A0 I/O behind bridge: 00008000-00008fff
> =A0 Memory behind bridge: 09000000-090fffff
> =A0 Prefetchable memory behind bridge: 10000000-27ffffff
> =A0 Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- =
<TAbort-
> <MAbort+ <SERR- <PERR-
> =A0 BridgeCtl: Parity- SERR- NoISA- VGA+ MAbort- >Reset- FastB2B-
> =A0 =A0 =A0 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> =A0 Capabilities: [40] Power Management version 2
> =A0 =A0 =A0 Flags: PMEClk- DSI- D1+ D2- AuxCurrent=3D0mA
> PME(D0+,D1+,D2-,D3hot+,D3cold-)
> =A0 =A0 =A0 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME=
-
> =A0 Capabilities: [50] MSI: Enable- Count=3D1/1 Maskable- 64bit+
> =A0 =A0 =A0 Address: 0000000000000000 =A0Data: 0000
> =A0 Capabilities: [60] Express (v1) PCI/PCI-X to PCI-Express Bridge, =
MSI 00
> =A0 =A0 =A0 DevCap: =A0 =A0MaxPayload 128 bytes, PhantFunc 0, Latency=
 L0s <64ns, L1
> <1us
> =A0 =A0 =A0 =A0 =A0 ExtTag- RBE- FLReset-
> =A0 =A0 =A0 DevCtl: =A0 =A0Report errors: Correctable- Non-Fatal- Fat=
al- Unsupported-
> =A0 =A0 =A0 =A0 =A0 RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop- BrCo=
nfRtry-
> =A0 =A0 =A0 =A0 =A0 MaxPayload 128 bytes, MaxReadReq 512 bytes
> =A0 =A0 =A0 DevSta: =A0 =A0CorrErr- UncorrErr- FatalErr- UnsuppReq- A=
uxPwr- TransPend-
> =A0 =A0 =A0 LnkCap: =A0 =A0Port #0, Speed 2.5GT/s, Width x1, ASPM L0s=
 L1, Latency L0
> <1us, L1 <16us
> =A0 =A0 =A0 =A0 =A0 ClockPM- Surprise- LLActRep- BwNot-
> =A0 =A0 =A0 LnkCtl: =A0 =A0ASPM Disabled; Disabled- Retrain- CommClk-
> =A0 =A0 =A0 =A0 =A0 ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> =A0 =A0 =A0 LnkSta: =A0 =A0Speed 2.5GT/s, Width x1, TrErr- Train- Slo=
tClk- DLActive-
> BWMgmt- ABWMgmt-
>
> 00:14.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev =
02)
> (prog-if 00 [Normal decode])
> =A0 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r-
> Stepping- SERR+ FastB2B- DisINTx-
> =A0 Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort=
- <TAbort-
> <MAbort- >SERR- <PERR- INTx-
> =A0 Latency: 255, Cache Line Size: 64 bytes
> =A0 Bus: primary=3D00, secondary=3D02, subordinate=3D02, sec-latency=3D=
255
> =A0 I/O behind bridge: 00009000-00009fff
> =A0 Memory behind bridge: 09100000-091fffff
> =A0 Prefetchable memory behind bridge: 0000000009200000-00000000092ff=
fff
> =A0 Secondary status: 66MHz- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort=
- <TAbort-
> <MAbort- <SERR- <PERR-
> =A0 BridgeCtl: Parity- SERR- NoISA- VGA- MAbort+ >Reset- FastB2B-
> =A0 =A0 =A0 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>
> 01:00.0 VGA compatible controller: ATI Technologies Inc RV 610LE PCI =
[Radeon
> HD 2400] (prog-if 00 [VGA controller])
> =A0 Subsystem: Device 2232:1787
> =A0 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r+
> Stepping- SERR- FastB2B- DisINTx-
> =A0 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- =
<TAbort-
> <MAbort- >SERR- <PERR- INTx-
> =A0 Latency: 0, Cache Line Size: 64 bytes
> =A0 Interrupt: pin A routed to IRQ 32
> =A0 Region 0: Memory at 10000000 (64-bit, prefetchable) [size=3D256M]
> =A0 Region 2: Memory at 09000000 (64-bit, non-prefetchable) [size=3D6=
4K]
> =A0 Region 4: I/O ports at 8000 [size=3D256]
> =A0 Expansion ROM at 20000000 [disabled] [size=3D128K]
> =A0 Capabilities: [50] Power Management version 3
> =A0 =A0 =A0 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D0mA
> PME(D0-,D1-,D2-,D3hot-,D3cold-)
> =A0 =A0 =A0 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME=
-
> =A0 Capabilities: [58] Express (v1) Legacy Endpoint, MSI 00
> =A0 =A0 =A0 DevCap: =A0 =A0MaxPayload 128 bytes, PhantFunc 0, Latency=
 L0s <4us, L1
> unlimited
> =A0 =A0 =A0 =A0 =A0 ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
> =A0 =A0 =A0 DevCtl: =A0 =A0Report errors: Correctable- Non-Fatal- Fat=
al- Unsupported-
> =A0 =A0 =A0 =A0 =A0 RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
> =A0 =A0 =A0 =A0 =A0 MaxPayload 128 bytes, MaxReadReq 128 bytes
> =A0 =A0 =A0 DevSta: =A0 =A0CorrErr- UncorrErr+ FatalErr- UnsuppReq+ A=
uxPwr- TransPend-
> =A0 =A0 =A0 LnkCap: =A0 =A0Port #0, Speed 2.5GT/s, Width x16, ASPM L0=
s L1, Latency L0
> <64ns, L1 <1us
> =A0 =A0 =A0 =A0 =A0 ClockPM- Surprise- LLActRep- BwNot-
> =A0 =A0 =A0 LnkCtl: =A0 =A0ASPM Disabled; RCB 64 bytes Disabled- Retr=
ain- CommClk-
> =A0 =A0 =A0 =A0 =A0 ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> =A0 =A0 =A0 LnkSta: =A0 =A0Speed 2.5GT/s, Width x1, TrErr- Train- Slo=
tClk+ DLActive-
> BWMgmt- ABWMgmt-
> =A0 Capabilities: [a0] MSI: Enable- Count=3D1/1 Maskable- 64bit+
> =A0 =A0 =A0 Address: 0000000000000000 =A0Data: 0000
> =A0 Capabilities: [100] #1002
> =A0 Capabilities: [aa1] #ffff
>
> 01:00.1 Audio device: ATI Technologies Inc RV610 audio device [Radeon=
 HD
> 2400 PRO]
> =A0 Subsystem: Device 2232:aa10
> =A0 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r+
> Stepping- SERR- FastB2B- DisINTx-
> =A0 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- =
<TAbort-
> <MAbort- >SERR- <PERR- INTx+
> =A0 Latency: 0, Cache Line Size: 64 bytes
> =A0 Interrupt: pin B routed to IRQ 33
> =A0 Region 0: Memory at 09010000 (64-bit, non-prefetchable) [size=3D1=
6K]
> =A0 Capabilities: [50] Power Management version 3
> =A0 =A0 =A0 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D0mA
> PME(D0-,D1-,D2-,D3hot-,D3cold-)
> =A0 =A0 =A0 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME=
-
> =A0 Capabilities: [58] Express (v1) Legacy Endpoint, MSI 00
> =A0 =A0 =A0 DevCap: =A0 =A0MaxPayload 128 bytes, PhantFunc 0, Latency=
 L0s <4us, L1
> unlimited
> =A0 =A0 =A0 =A0 =A0 ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
> =A0 =A0 =A0 DevCtl: =A0 =A0Report errors: Correctable- Non-Fatal- Fat=
al- Unsupported-
> =A0 =A0 =A0 =A0 =A0 RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
> =A0 =A0 =A0 =A0 =A0 MaxPayload 128 bytes, MaxReadReq 128 bytes
> =A0 =A0 =A0 DevSta: =A0 =A0CorrErr- UncorrErr+ FatalErr- UnsuppReq+ A=
uxPwr- TransPend-
> =A0 =A0 =A0 LnkCap: =A0 =A0Port #0, Speed 2.5GT/s, Width x16, ASPM L0=
s L1, Latency L0
> <64ns, L1 <1us
> =A0 =A0 =A0 =A0 =A0 ClockPM- Surprise- LLActRep- BwNot-
> =A0 =A0 =A0 LnkCtl: =A0 =A0ASPM Disabled; RCB 64 bytes Disabled- Retr=
ain- CommClk-
> =A0 =A0 =A0 =A0 =A0 ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> =A0 =A0 =A0 LnkSta: =A0 =A0Speed 2.5GT/s, Width x1, TrErr- Train- Slo=
tClk+ DLActive-
> BWMgmt- ABWMgmt-
> =A0 Capabilities: [a0] MSI: Enable- Count=3D1/1 Maskable- 64bit+
> =A0 =A0 =A0 Address: 0000000000000000 =A0Data: 0000
> =A0 Capabilities: [100] #1002
> =A0 Capabilities: [aa1] #ffff
> =A0 Kernel driver in use: HDA Intel
> =A0 Kernel modules: snd-hda-intel
>
> 02:04.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI =
(rev
> 05)
> =A0 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r+
> Stepping- SERR- FastB2B- DisINTx-
> =A0 Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort=
- <TAbort-
> <MAbort- >SERR- <PERR- INTx-
> =A0 Latency: 248, Cache Line Size: 64 bytes
> =A0 Interrupt: pin A routed to IRQ 27
> =A0 Region 0: I/O ports at 9000 [size=3D256]
> =A0 Region 1: Memory at 09100000 (32-bit, non-prefetchable) [size=3D4=
K]
> =A0 Expansion ROM at 09280000 [disabled] [size=3D64K]
> =A0 Kernel driver in use: qla1280
>
> 02:08.0 RAID bus controller: Silicon Image, Inc. SiI 3112
> [SATALink/SATARaid] Serial ATA Controller (rev 02)
> =A0 Subsystem: Silicon Image, Inc. SiI 3112 SATARaid Controller
> =A0 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r+
> Stepping- SERR- FastB2B- DisINTx-
> =A0 Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort=
- <TAbort-
> <MAbort- >SERR- <PERR- INTx-
> =A0 Latency: 240, Cache Line Size: 64 bytes
> =A0 Interrupt: pin A routed to IRQ 36
> =A0 Region 0: I/O ports at 9810 [size=3D8]
> =A0 Region 1: I/O ports at 9820 [size=3D4]
> =A0 Region 2: I/O ports at 9818 [size=3D8]
> =A0 Region 3: I/O ports at 9824 [size=3D4]
> =A0 Region 4: I/O ports at 9800 [size=3D16]
> =A0 Region 5: Memory at 09101000 (32-bit, non-prefetchable) [size=3D5=
12]
> =A0 Expansion ROM at 09200000 [disabled] [size=3D512K]
> =A0 Capabilities: [60] Power Management version 2
> =A0 =A0 =A0 Flags: PMEClk- DSI+ D1+ D2+ AuxCurrent=3D0mA
> PME(D0-,D1-,D2-,D3hot-,D3cold-)
> =A0 =A0 =A0 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D2 PME=
-
> =A0 Kernel driver in use: sata_sil
> =A0 Kernel modules: sata_sil
>
> 02:0a.0 Multimedia audio controller: C-Media Electronics Inc CM8738 (=
rev 10)
> =A0 Subsystem: C-Media Electronics Inc CMI8738/C3DX PCI Audio Device
> =A0 Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r-
> Stepping- SERR- FastB2B- DisINTx-
> =A0 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort=
- <TAbort-
> <MAbort- >SERR- <PERR- INTx-
> =A0 Latency: 255 (500ns min, 6000ns max)
> =A0 Interrupt: pin A routed to IRQ 44
> =A0 Region 0: I/O ports at 9400 [size=3D256]
> =A0 Capabilities: [c0] Power Management version 2
> =A0 =A0 =A0 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D0mA
> PME(D0-,D1-,D2-,D3hot-,D3cold-)
> =A0 =A0 =A0 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME=
-
> =A0 Kernel driver in use: C-Media PCI
> =A0 Kernel modules: snd-cmipci
>
> Cheerz
> Michael.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
