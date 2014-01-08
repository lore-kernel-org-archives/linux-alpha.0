From: Andrew Gaylard <ag@computer.org>
Subject: IDE problems with Cypress CY82C693 on Miata box
Date: Wed, 8 Jan 2014 14:16:32 +0000 (UTC)
Message-ID: <loom.20140108T144856-793@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

Hi Linux Alpha people,

For some time now, my Miata box (PWS 433au) has been complaining at boot-time:
--------------------------------------------------------------------------------
[    6.999996] ata1.00: ATA-6: ST3200822A, 3.01, max UDMA/100
[    6.999996] ata1.00: 390721968 sectors, multi 0: LBA48 
[    7.000972] ata1.01: ATAPI: DVDRW   16X16X5X, MTS1, max UDMA/66
[    7.000972] ata1.00: failed to set xfermode (err_mask=0x2)
[    7.119136] input: AT Raw Set 2 keyboard as
/devices/platform/i8042/serio0/input/input0
[    7.136715] atkbd serio1: keyboard reset failed on isa0060/serio1
[   12.358392] ata1.00: failed to set xfermode (err_mask=0x2)
[   12.359368] ata1.00: limiting speed to MWDMA2:PIO3
[   17.724600] ata1.00: configured for MWDMA2
[   17.840811] ata1.01: both IDENTIFYs aborted, assuming NODEV
[   17.840811] ata1.01: revalidation failed (errno=-2)
[   28.034165] ata1.01: qc timeout (cmd 0xa1)
[   28.034165] ata1.01: failed to IDENTIFY (I/O error, err_mask=0x4)
[   28.041001] ata1.01: revalidation failed (errno=-5)
[   33.061506] ata1: link is slow to respond, please be patient (ready=0)
[   38.082011] ata1: device not ready (errno=-16), forcing hardreset
[   38.489238] ata1.00: configured for MWDMA2
[   38.605448] ata1.01: both IDENTIFYs aborted, assuming NODEV
[   38.605448] ata1.01: revalidation failed (errno=-2)
[   38.605448] ata1.01: disabled
[   38.613261] ata1.00: configured for MWDMA2
[   38.614238] scsi 1:0:0:0: Direct-Access     ATA      ST3200822A      
3.01 PQ: 0 ANSI: 5
[   38.616191] sd 1:0:0:0: [sdc] 390721968 512-byte logical blocks: (200
GB/186 GiB)
[   38.617167] sd 1:0:0:0: [sdc] Write Protect is off
[   38.617167] sd 1:0:0:0: [sdc] Mode Sense: 00 3a 00 00
[   38.617167] sd 1:0:0:0: [sdc] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[   38.621073] sd 1:0:0:0: Attached scsi generic sg3 type 0
[   38.635722]  sdc: sdc1 sdc2
[   38.639628] sd 1:0:0:0: [sdc] Attached SCSI disk

--------------------------------------------------------------------------------

It's clear from the timestamps that the kernel's busy resetting the IDE bus
for over half a minute, and when it's finished, it still fails to see my
DVD drive.

Fiddling about with drivers/ata/pata_cypress, I found this change fixes the
problem:

--- drivers/ata/pata_cypress.c.orig     2014-01-07 21:57:02.507778689 +0200
+++ drivers/ata/pata_cypress.c  2014-01-08 15:31:14.015467547 +0200
@@ -125,9 +125,9 @@
 static int cy82c693_init_one(struct pci_dev *pdev, const struct
pci_device_id *id)
 {
        static const struct ata_port_info info = {
                .flags = ATA_FLAG_SLAVE_POSS,
-               .pio_mask = ATA_PIO4,
+               .pio_mask = ATA_PIO3,
                .mwdma_mask = ATA_MWDMA2,
                .port_ops = &cy82c693_port_ops
        };
        const struct ata_port_info *ppi[] = { &info, &ata_dummy_port_info };


The boot process is much smoother, and the DVD drive is detected (and works):
--------------------------------------------------------------------------------
[    6.950191] ata1.00: ATA-6: ST3200822A, 3.01, max UDMA/100
[    6.950191] ata1.00: 390721968 sectors, multi 0: LBA48 
[    6.951168] ata1.01: ATAPI: DVDRW   16X16X5X, MTS1, max UDMA/66
[    6.958980] ata1.00: configured for MWDMA2
[    6.983394] ata1.01: configured for MWDMA2
[    6.985347] scsi 1:0:0:0: Direct-Access     ATA      ST3200822A      
3.01 PQ: 0 ANSI: 5
[    6.987301] sd 1:0:0:0: [sdc] 390721968 512-byte logical blocks: (200
GB/186 GiB)
[    6.988277] sd 1:0:0:0: [sdc] Write Protect is off
[    6.988277] sd 1:0:0:0: [sdc] Mode Sense: 00 3a 00 00
[    6.988277] sd 1:0:0:0: [sdc] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    6.992183] sd 1:0:0:0: Attached scsi generic sg3 type 0
[    7.009762]  sdc: sdc1 sdc2
[    7.016597] scsi 1:0:1:0: CD-ROM            DVDRW    16X16X5X        
MTS1 PQ: 0 ANSI: 5
[    7.021480] sr0: scsi3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form2
cdda tray
[    7.021480] cdrom: Uniform CD-ROM driver Revision: 3.20
[    7.023433] sd 1:0:0:0: [sdc] Attached SCSI disk
[    7.024410] sr 1:0:1:0: Attached scsi CD-ROM sr0
[    7.025387] sr 1:0:1:0: Attached scsi generic sg4 type 5

--------------------------------------------------------------------------------

It's not clear to me why PIO4 doesn't work; indeed the CY82C693 
datasheet claims it should work:

"The CY82C693 contains an integrated, dual-channel PCI to
IDE bridge. The IDE controller conforms to ANSI modes 0, 1,
2, 3, and 4 for PIO (Programmed I/O) transfers."

Anyway, hopefully this'll be of use to someone.  I for one
am glad to be able to use (PATA) IDE devices on my Alpha;
SCSI disks are hard to find, and expensive when you do.

BTW: this patch was made against the Gentoo sources (3.10.7-gentoo-r1).
I've checked the current kernel sources (3.12.6), and the file's the
same. So the patch should apply as-is.

--
Andrew

