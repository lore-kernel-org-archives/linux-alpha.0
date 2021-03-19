From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: remove the legacy ide driver
Date: Fri, 19 Mar 2021 17:48:32 +0100 (CET)
Message-ID: <alpine.DEB.2.21.2103191712550.21463@angie.orcam.me.uk>
References: <20210318045706.200458-1-hch@lst.de>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>

On Thu, 18 Mar 2021, Christoph Hellwig wrote:

> we've been trying to get rid of the legacy ide driver for a while now,
> and finally scheduled a removal for 2021, which is three month old now.

 Hmm, there's still a regression in that pata_legacy unconditionally pokes 
at random I/O port locations corresponding to all the known possible ATA 
interface mappings with ISA option cards:

scsi host0: pata_legacy
ata1: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
ata1.00: ATA-4: ST310211A, 3.54, max UDMA/100
ata1.00: 19541088 sectors, multi 16: LBA
ata1.00: configured for PIO
scsi 0:0:0:0: Direct-Access     ATA      ST310211A        3.54 PQ: 0 ANSI: 5
scsi 0:0:0:0: Attached scsi generic sg0 type 0
sd 0:0:0:0: [sda] 19541088 512-byte logical blocks: (10.0 GB/9.32 GiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't 
support DPO or FUA
 sda: sda1 sda2 sda3
sd 0:0:0:0: [sda] Attached SCSI disk
scsi host1: pata_legacy
ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
scsi host1: pata_legacy
ata3: PATA max PIO4 cmd 0x1e8 ctl 0x3ee irq 11
scsi host1: pata_legacy
ata4: PATA max PIO4 cmd 0x168 ctl 0x36e irq 10
scsi host1: pata_legacy
ata5: PATA max PIO4 cmd 0x1e0 ctl 0x3e6 irq 8
scsi host1: pata_legacy
ata6: PATA max PIO4 cmd 0x160 ctl 0x366 irq 12

This seems needlessly dangerous to me.  With the old IDE driver I could 
(and did) specify "ide_generic.probe_mask=1" to avoid this clutter (the 
ISA card used with this system has a single ATA port only).

 I guess it's easy to fix by carrying the `probe_mask' parameter over and 
I think we'd rather wait with the removal of the IDE subsystem until we 
have a release with this option supported.  I may look into it unless 
someone beats me to it.

 Overall I find it rather disturbing that nobody has noticed this issue 
over all these years.

 NB it is only earlier this year that I recovered this system from a PSU 
failure several years ago, which took the disk the system previously had 
with it, so myself I had no chance to get at it any earlier, though I did 
mean to have a look as soon as I saw the notice about the scheduled IDE 
removal.

  Maciej
