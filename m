From: Jay Maynard <jmaynard@conmicro.cx>
Subject: Re: 2.4 kernels broken on Takara?
Date: Mon, 9 Feb 2004 18:42:58 -0600
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040209184258.A826@thebrain.conmicro.cx>
References: <20040208103909.C25099@thebrain.conmicro.cx> <20040208211454.GV28571@lug-owl.de> <20040208175312.A26586@thebrain.conmicro.cx> <20040209090259.GA28571@lug-owl.de> <20040209075717.A29384@thebrain.conmicro.cx>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040209075717.A29384@thebrain.conmicro.cx>; from jmaynard@conmicro.cx on Mon, Feb 09, 2004 at 07:57:17AM -0600
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

On Mon, Feb 09, 2004 at 07:57:17AM -0600, Jay Maynard wrote:
> Okkay, so takara_swizzle looks like it's hiccuping. Based on this, I suspect
> it's the same failure in the 2.4.x kernels I've tried...I'll verify that a
> little later.

Yes, it's the same failure in the 2.4 kernels.

> Now, for a little source code digging...

It appears that the problem is in this line of code:

        unsigned int busslot = PCI_SLOT(dev->bus->self->devfn);

The pointer dev->bus->self is zero. I added the following line to the
beginning of takara_swizzle:

        if (!dev->bus->self)
                printk(KERN_CRIT "takara_swizzle: null dev->bus->self "
                                        "pointer, bus number %d!\n",
                                        dev->bus->number);

and got the following at boot time:

 Linux version 2.6.0 (root@romy) (gcc version 3.3.2 (Debian)) #1 Fri Feb 9 17:40:17 CST 2024
Booting on Takara using machine vector Takara from SRM
Major Options: EV56 LEGACY_START VERBOSE_MCHECK MAGIC_SYSRQ
Command line: ro root=/dev/sdb2  console=ttyS0
memcluster 0, usage 1, start        0, end      159
memcluster 1, usage 0, start      159, end    32651
memcluster 2, usage 1, start    32651, end    32768
freeing pages 159:384
freeing pages 849:32651
reserving pages 849:850
pci: cia revision 2
On node 0 totalpages: 32651
  DMA zone: 32651 pages, LIFO batch:7
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Building zonelist for node : 0
Kernel command line: ro root=/dev/sdb2 console=ttyS0
PID hash table entries: 1024 (order 10: 16384 bytes)
Using epoch = 1980
Console: colour VGA+ 80x25
Memory: 253232k/261208k available (2115k kernel code, 6392k reserved, 374k data, 376k init)
Calibrating delay loop... 994.44 BogoMIPS
Dentry cache hash table entries: 32768 (order: 5, 262144 bytes)
Inode-cache hash table entries: 16384 (order: 4, 131072 bytes)
Mount-cache hash table entries: 512 (order: 0, 8192 bytes)
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
pci: passed tb register update test
pci: passed sg loopback i/o read test
pci: passed tbia test
pci: passed pte write cache snoop test
pci: failed valid tag invalid pte reload test (mcheck; workaround available)
pci: passed pci machine check test
pci: enabling save/restore of SRM state
PCI: Bus 1, bridge: 0000:00:13.0
  IO window: disabled.
  MEM window: disabled.
  PREFETCH window: disabled.
PCI: Bus 2, bridge: 0000:00:14.0
  IO window: 8000-8fff
  MEM window: 02200000-022fffff
  PREFETCH window: 02300000-023fffff
PCI: Setting latency timer of device 0000:00:13.0 to 64
takara_swizzle: null dev->bus->self pointer, bus number 0!
Unable to handle kernel paging request at virtual address 0000000000000040
swapper(1): Oops 0
pc = [<fffffc000059bf50>]  ra = [<fffffc000059bf34>]  ps = 0000    Not tainted
v0 = 000000000513b280  t0 = 0000000000000010  t1 = fffffc00005f8680
t2 = 0000000000000000  t3 = 0000000000000000  t4 = ffffffff00000000
t5 = 0000000000000001  t6 = fffffffffffe07f2  t7 = fffffc000015c000
s0 = fffffc000fef9000  s1 = 0000000000000001  s2 = fffffc000015fe18
s3 = 0000000000000007  s4 = fffffc0000538680  s5 = fffffc0000538680
s6 = 0000000000000008
a0 = fffffc858000a000  a1 = 00000000000007f2  a2 = ffffffffffffffff
a3 = 000000000000000a  a4 = fffffffffffffffb  a5 = 0000000000000000
t8 = 0000000000000000  t9 = fffffc000060a060  t10= 0000000000000000
t11= 000000000000000a  pv = fffffc00003f95e0  at = 0000000000000000
gp = fffffc0000658680  sp = fffffc000015fdc8
Trace:fffffc0000310144 fffffc0000313268
Code: a4290020  23bdc74c  43e00000  a4810038  28610078  203f0010 <a0440040> 43e303a3
Kernel panic: Attempted to kill init!

The addresses map to:
   fffffc0000310144 = init+0x24
   fffffc0000313268 = kernel_thread+0x28
   fffffc000059bf50 = takara_swizzle+0x80

Any guesses as to why that pointer's null when it shouldn't be?
