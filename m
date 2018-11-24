From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: NO_BOOTMEM breaks alpha pc164
Date: Sat, 24 Nov 2018 13:45:08 +0200
Message-ID: <20181124114507.GC28634@rapoport-lnx>
References: <8c8e3dba-7adf-96c6-195c-311050256743@linux.ee>
 <20181123071448.GE5704@rapoport-lnx>
 <78de90df-d88b-d82f-baf1-f0218af7a341@linux.ee>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <78de90df-d88b-d82f-baf1-f0218af7a341@linux.ee>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Meelis Roos <mroos@linux.ee>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org, linux-mm@kvack.org

(adding linux-mm, the beginning of the thread is at
https://lkml.org/lkml/2018/11/22/1032)

On Fri, Nov 23, 2018 at 06:11:09PM +0200, Meelis Roos wrote:
> >>The bad commit is swith to NO_BOOTMEM.
> >
> >[ ... ]
> >>How do I debug it?
> >
> >Apparently, some of the early memory registration is not properly converted
> >from bootmem to memblock + nobootmem for your system.
> >
> >You can try applying the below patch to enable debug printouts from
> >memblock, maybe it'll shed some more light.
> 
> Here is the serial console output from a boot with the debug patch applied:
> 
> (boot dka0.0.0.5.0 -flags 0)
> block 0 of dka0.0.0.5.0 is a valid boot block
> reading 161 blocks from dka0.0.0.5.0
> bootstrap code read in
> base = 180000, image_start = 0, image_bytes = 14200
> initializing HWRPB at 2000
> initializing page table at 172000
> initializing machine state
> setting affinity to the primary CPU
> jumping to bootstrap code
> aboot: Linux/Alpha SRM bootloader version 1.0_pre20040408
> aboot: switching to OSF/1 PALcode version 1.23
> aboot: booting from device 'SCSI 0 5 0 0 0 0 0'
> aboot: valid disklabel found: 4 partitions.
> aboot: loading uncompressed test...
> aboot: loading compressed test...
> aboot: PHDR 0 vaddr 0xfffffc0000310000 offset 0x2000 size 0x79925c
> aboot: bss at 0xfffffc0000aa925c, size 0x16469c
> aboot: zero-filling 1459868 bytes at 0xfffffc0000aa925c
> aboot: starting kernel test with arguments root=/dev/sda2 console=ttyS0
> [    0.000000] Linux version 4.20.0-rc2-00068-gda5322e65940-dirty (mroos@pc164) (gcc version 7.3.0 (Gentoo 7.3.0-r3 p1.4)) #115 Fri Nov 23 17:38:17 EET 2018
> [    0.000000] Booting on EB164 variation PC164 using machine vector PC164 from SRM
> [    0.000000] Major Options: EV56 LEGACY_START VERBOSE_MCHECK DISCONTIGMEM MAGIC_SYSRQ
> [    0.000000] Command line: root=/dev/sda2 console=ttyS0
> [    0.000000] Raw memory layout:
> [    0.000000]  memcluster  0, usage 1, start        0, end      192
> [    0.000000]  memcluster  1, usage 0, start      192, end    32651
> [    0.000000]  memcluster  2, usage 1, start    32651, end    32768
> [    0.000000] Initializing bootmem allocator on Node ID 0
> [    0.000000]  memcluster  1, usage 0, start      192, end    32651
> [    0.000000]  Detected node memory:   start      192, end    32651
> [    0.000000] memblock_add: [0x0000000000000000-0x000000000ff15fff] setup_memory+0x39c/0x478
> [    0.000000] memblock_reserve: [0x0000000000300000-0x0000000000c11fff] setup_memory+0x444/0x478
> [    0.000000] 1024K Bcache detected; load hit latency 30 cycles, load miss latency 212 cycles
> [    0.000000] pci: cia revision 2
> [    0.000000] memblock_alloc_try_nid: 104 bytes align=0x20 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 alloc_pci_controller+0x2c/0x50
> [    0.000000] memblock_reserve: [0x000000000ff15f80-0x000000000ff15fe7] memblock_alloc_internal+0x170/0x278
> [    0.000000] memblock_alloc_try_nid: 64 bytes align=0x20 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 alloc_resource+0x2c/0x40
> [    0.000000] memblock_reserve: [0x000000000ff15f40-0x000000000ff15f7f] memblock_alloc_internal+0x170/0x278

...
 
> halted CPU 0
> 
> halt code = 7
> machine check while in PAL mode
> PC = 1814c
> boot failure
> >>>

Two things that might cause the hang. 
First, memblock_add() is called after node_min_pfn has been rounded down to
the nearest 8Mb and in your case this cases memblock to see more memory that
is actually present in the system.
I'm not sure why the 8Mb alignment is required, I've just made sure that
memblock_add() will use exact available memory (the first patch below).

Another thing is that memblock allocates memory from high addresses while
bootmem was using low memory. It may happen that an allocation from high
memory is not accessible by the hardware, although it should be. The second
patch below addresses this issue.

It would be really great if you could test with each patch separately and
with both patches applied :)


Patch 1
------------------------------------------------------------------------------------
diff --git a/arch/alpha/mm/numa.c b/arch/alpha/mm/numa.c
index 74846553..7db1cb5 100644
--- a/arch/alpha/mm/numa.c
+++ b/arch/alpha/mm/numa.c
@@ -144,14 +144,14 @@ setup_memory_node(int nid, void *kernel_end)
 	if (!nid && (node_max_pfn < end_kernel_pfn || node_min_pfn > start_kernel_pfn))
 		panic("kernel loaded out of ram");
 
+	memblock_add(PFN_PHYS(node_min_pfn),
+		     (node_max_pfn - node_min_pfn) << PAGE_SHIFT);
+
 	/* Zone start phys-addr must be 2^(MAX_ORDER-1) aligned.
 	   Note that we round this down, not up - node memory
 	   has much larger alignment than 8Mb, so it's safe. */
 	node_min_pfn &= ~((1UL << (MAX_ORDER-1))-1);
 
-	memblock_add(PFN_PHYS(node_min_pfn),
-		     (node_max_pfn - node_min_pfn) << PAGE_SHIFT);
-
 	NODE_DATA(nid)->node_start_pfn = node_min_pfn;
 	NODE_DATA(nid)->node_present_pages = node_max_pfn - node_min_pfn;
 
Patch 2
------------------------------------------------------------------------------------
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index a37fd99..4b5b1b2 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -634,6 +634,7 @@ setup_arch(char **cmdline_p)
 
 	/* Find our memory.  */
 	setup_memory(kernel_end);
+	memblock_set_bottom_up(true);
 
 	/* First guess at cpu cache sizes.  Do this before init_arch.  */
 	determine_cpu_caches(cpu->type);


> -- 
> Meelis Roos <mroos@linux.ee>
> 

-- 
Sincerely yours,
Mike.

