From: Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v2 13/13] m68k: deprecate DISCONTIGMEM
Date: Sun,  1 Nov 2020 19:04:54 +0200
Message-ID: <20201101170454.9567-14-rppt@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604250386;
        bh=fWxkbZL/5LT7MVmydGQvto+yiZVxeeiLovyNTt2+nMQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vz7hlCOfEKvhdYdVx02tccXCR69Tgvys6SCSJ/AwADwwmLCxWzCZRFA3N4DSZ0TNf
         NMj2sjlY5sUvwwkqZVyNWvWsIKsoWRy4e5mWYOTcjMU9Z7iDHW/BBbA5ZKDtLBao9Y
         XcPPJPO0UL5x9C2pQixh7DUbitUwk4/sJ48l2D4E=
In-Reply-To: <20201101170454.9567-1-rppt@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>, Meelis Roos <mroos@linux.ee>, Michael Schmitz <schmitzmic@gmail.com>, Mike Rapoport <rppt@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Russell King <linux@armlinux.org.uk>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linu

From: Mike Rapoport <rppt@linux.ibm.com>

DISCONTIGMEM was intended to provide more efficient support for systems
with holes in their physical address space that FLATMEM did.

Yet, it's overhead in terms of the memory consumption seems to overweight
the savings on the unused memory map.

For a ARAnyM system with 16 MBytes of FastRAM configured, the memory usage
reported after page allocator initialization is

Memory: 23828K/30720K available (3206K kernel code, 535K rwdata, 936K rodata, 768K init, 193K bss, 6892K reserved, 0K cma-reserved)

and with DISCONTIGMEM disabled and with relatively large hole in the memory
map it is:

Memory: 23864K/30720K available (3197K kernel code, 516K rwdata, 936K rodata, 764K init, 179K bss, 6856K reserved, 0K cma-reserved)

Moreover, since m68k already has custom pfn_valid() it is possible to
define HAVE_ARCH_PFN_VALID to enable freeing of unused memory map. The
minimal size of a hole that can be freed should not be less than
MAX_ORDER_NR_PAGES so to achieve more substantial memory savings let m68k
also define custom FORCE_MAX_ZONEORDER.

With FORCE_MAX_ZONEORDER set to 9 memory usage becomes:

Memory: 23880K/30720K available (3197K kernel code, 516K rwdata, 936K rodata, 764K init, 179K bss, 6840K reserved, 0K cma-reserved)

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/m68k/Kconfig.cpu | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index b8884af365ae..3e70fb7a8d83 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -20,6 +20,7 @@ choice
 
 config M68KCLASSIC
 	bool "Classic M68K CPU family support"
+	select HAVE_ARCH_PFN_VALID
 
 config COLDFIRE
 	bool "Coldfire CPU family support"
@@ -377,11 +378,34 @@ config SINGLE_MEMORY_CHUNK
 	help
 	  Ignore all but the first contiguous chunk of physical memory for VM
 	  purposes.  This will save a few bytes kernel size and may speed up
-	  some operations.  Say N if not sure.
+	  some operations.
+	  When this option os set to N, you may want to lower "Maximum zone
+	  order" to save memory that could be wasted for unused memory map.
+	  Say N if not sure.
 
 config ARCH_DISCONTIGMEM_ENABLE
+	depends on BROKEN
 	def_bool MMU && !SINGLE_MEMORY_CHUNK
 
+config FORCE_MAX_ZONEORDER
+	int "Maximum zone order" if ADVANCED
+	depends on !SINGLE_MEMORY_CHUNK
+	default "11"
+	help
+	  The kernel memory allocator divides physically contiguous memory
+	  blocks into "zones", where each zone is a power of two number of
+	  pages.  This option selects the largest power of two that the kernel
+	  keeps in the memory allocator.  If you need to allocate very large
+	  blocks of physically contiguous memory, then you may need to
+	  increase this value.
+
+	  For systems that have holes in their physical address space this
+	  value also defines the minimal size of the hole that allows
+	  freeing unused memory map.
+
+	  This config option is actually maximum order plus one. For example,
+	  a value of 11 means that the largest free memory block is 2^10 pages.
+
 config 060_WRITETHROUGH
 	bool "Use write-through caching for 68060 supervisor accesses"
 	depends on ADVANCED && M68060
-- 
2.28.0

