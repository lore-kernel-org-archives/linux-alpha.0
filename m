From: Balint Cristian <rezso@rdsor.ro>
Subject: 2.6.9 on alpha thread.
Date: Sun, 31 Oct 2004 22:15:03 +0200
Message-ID: <200410312215.03450.rezso@rdsor.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Alexander.Rauth@promotion-ie.de, linux-alpha@vger.kernel.org


 I follow the core_cia thread on lkml and hit the same problem on my Miata.
After patching my kernel with your second cia_core.h patch seems
that my kernel too make qlogicisp to not scan the bus, and loop infinit telling:
qlogicisp: mbox_command loop timeout #2

This is the last what i see:
http://www.spinics.net/lists/kernel/msg310542.html

Is there a newer staement ? 

Please CC-me, i am not on lkml.


 Here are the logs on my Miata, whatever please ignore "error handling"
on qlogicisp, this was normal, and oops was normal too, it worked perfect until 2.6.8.

ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
CMD646: IDE controller at PCI slot 0000:00:04.0
CMD646: chipset revision 1
CMD646: not 100% native mode: will probe irqs later
CMD646: chipset revision 0x01, MultiWord DMA Limited, IRQ workaround enabled
    ide0: BM-DMA at 0x9080-0x9087, BIOS settings: hda:pio, hdb:pio
    ide1: BM-DMA at 0x9088-0x908f, BIOS settings: hdc:pio, hdd:pio
ide-floppy driver 0.99.newide
usbcore: registered new driver hiddev
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver
mice: PS/2 mouse device common for all mice
atkbd.c: keyboard reset failed on isa0060/serio1
atkbd.c: keyboard reset failed on isa0060/serio0
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 28Kbytes
TCP: Hash tables configured (established 32768 bind 4681)
Freeing unused kernel memory: 224k freed
Red Hat nash version 4.1.18 starting
Mounted /proc filesystem
Mounting sysfs
SCSI subsystem initialized
Loading scsi_mod.ko module
Loading sd_mod.ko moERROR: SCSI host `isp1020' has no error handling
ERROR: This is not a safe way to run your SCSI host
dule
Loading qlERROR: The error handling must be added to this driver
ogicisp.ko modulfffffc000f89bda8 e
fffffc000f8dfea0 fffffffc002258e8 fffffffc00204d18
       fffffffc00204d18 fffffc000ff91a40 fffffc0000000000 000000001d244b3c
       0000000000000000 000000000000000a fffffffc002364ab 0000000000000000
       0000000000000000 fffffc000f89be10 fffffc000f89be10 0000000000000002
       000000001d244b3c 0000000000000000 000000000000000a fffffffc002364ab
       0000000000000000 0000000000000000 fffffffc001f8090 fffffffc00204d18
Trace:
[<fffffc000036c0d4>] sys_init_module+0x354/0x530
[<fffffc0000315934>] entSys+0xa4/0xc0

qlogicisp : new isp1020 revision ID (5)
qlogicisp: mbox_command loop timeout #2
qlogicisp: mbox_command loop timeout #2
qlogicisp: mbox_command loop timeout #2
qlogicisp: mbox_command loop timeout #2
qlogicisp: mbox_command loop timeout #2
qlogicisp: mbox_command loop timeout #2
qlogicisp: mbox_command loop timeout #2
qlogicisp: mbox_command loop timeout #2
qlogicisp: mbox_command loop timeout #2
qlogicisp: mbox_command loop timeout #2
qlogicisp: mbox_command loop timeout #2
