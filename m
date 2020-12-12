From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 07/13] ia64: make SPARSEMEM default and disable
 DISCONTIGMEM
Date: Sat, 12 Dec 2020 08:01:44 -0800
Message-ID: <20201212160144.GA174701@roeck-us.net>
References: <20201027112955.14157-1-rppt@kernel.org>
 <20201027112955.14157-8-rppt@kernel.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=SONiYC+w5Ngr25MwYgor37vfyb+DMYhcD3u4dlHLhcY=; b=GX0cdE617m4Hnhp5Yacu1K/NtF
        5yOaFooNMpuV5fj37e3ruItbQReDMItGbRjFL9bI7CWNykP4Nduws7r2jgyQF7hp8gfgUwy61JCsJ
        +L0IKzS+3fLBrTbpfhBmAD2TLHmjrpUjp0KR2hL8jtij4+LhT/9JDapJWbIJYR1t2l2vEa86aHKQc
        evukwK21/adlcL+kCNIavOaIRmcBALWTq+lqLJgWxUow5VMkmHCXe22f/u6ec2xDMTEfspJGwz2SP
        nLYakoJqT4JEgQ4anDolg70aYTtdI2/23EQy2pUZYISRXvfct+HL8rpUImbBx9cWclngC+ZLhNTnK
        RlTkr9 
Content-Disposition: inline
In-Reply-To: <20201027112955.14157-8-rppt@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>, Meelis Roos <mroos@linux.ee>, Michael Schmitz <schmitzmic@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>, Russell King <linux@armlinux.org.uk>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, 

On Tue, Oct 27, 2020 at 01:29:49PM +0200, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> SPARSEMEM memory model suitable for systems with large holes in their
> phyiscal memory layout. With SPARSEMEM_VMEMMAP enabled it provides
> pfn_to_page() and page_to_pfn() as fast as FLATMEM.
> 
> Make it the default memory model for IA-64 and disable DISCONTIGMEM which
> is considered obsolete for quite some time.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

This patch results in 

include/linux/mmzone.h:1156:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
 1156 | #error Allocator MAX_ORDER exceeds SECTION_SIZE

when building ia64:defconfig.

Also, PAGE_SHIFT is not defined, though I don't know if that is related.

Reverting the patch fixes the problem for me.

Guenter

---
bisect log:

# bad: [3cc2bd440f2171f093b3a8480a4b54d8c270ed38] Add linux-next specific files for 20201211
# good: [0477e92881850d44910a7e94fc2c46f96faa131f] Linux 5.10-rc7
git bisect start 'HEAD' 'v5.10-rc7'
# good: [0a701401d4e29d9e73f0f3cc02179fc6c9191646] Merge remote-tracking branch 'crypto/master'
git bisect good 0a701401d4e29d9e73f0f3cc02179fc6c9191646
# good: [6fd39ad603b113e9c68180b9138084710c036e34] Merge remote-tracking branch 'spi/for-next'
git bisect good 6fd39ad603b113e9c68180b9138084710c036e34
# good: [c96b2eec436e87b8c673213b203559bed9e551b9] Merge remote-tracking branch 'vfio/next'
git bisect good c96b2eec436e87b8c673213b203559bed9e551b9
# good: [4f2e7f6a2ce4e621b77e59c8763549fa8bee7b4b] Merge remote-tracking branch 'gpio/for-next'
git bisect good 4f2e7f6a2ce4e621b77e59c8763549fa8bee7b4b
# good: [5ee06b21caaeb37a1ff5143e8ce91b376fe73dc2] swiotlb.h: add "inline" to swiotlb_adjust_size
git bisect good 5ee06b21caaeb37a1ff5143e8ce91b376fe73dc2
# bad: [46aa09d885ce303efd6444def783ec575a5b57ee] mm, page_poison: remove CONFIG_PAGE_POISONING_ZERO
git bisect bad 46aa09d885ce303efd6444def783ec575a5b57ee
# good: [3b77356d530bfd93e2450c063718292aa435eede] mm: mmap_lock: add tracepoints around lock acquisition
git bisect good 3b77356d530bfd93e2450c063718292aa435eede
# bad: [e0287fb91c006d12bed9e6fbfc7fe661ad7f9647] mm,hwpoison: disable pcplists before grabbing a refcount
git bisect bad e0287fb91c006d12bed9e6fbfc7fe661ad7f9647
# bad: [94d171d065be406a2407f0d723afe14c05526283] ia64: make SPARSEMEM default and disable DISCONTIGMEM
git bisect bad 94d171d065be406a2407f0d723afe14c05526283
# good: [7499e1e91e18a285274e9b761ba2abf21e4343fa] mm/vmalloc: use free_vm_area() if an allocation fails
git bisect good 7499e1e91e18a285274e9b761ba2abf21e4343fa
# good: [eba50fff503fa6d6e20679509a1a960c3e003d22] lib/test_kasan.c: add workqueue test case
git bisect good eba50fff503fa6d6e20679509a1a960c3e003d22
# good: [e343d6ff702aaae6181448a38ff85cf201b011ba] ia64: remove 'ifdef CONFIG_ZONE_DMA32' statements
git bisect good e343d6ff702aaae6181448a38ff85cf201b011ba
# good: [a0bfb938ae29239a3f13f6a6a4ef41c3c7f0c84c] ia64: split virtual map initialization out of paging_init()
git bisect good a0bfb938ae29239a3f13f6a6a4ef41c3c7f0c84c
# good: [0e791e5138cde9b96d34ba68136fd26bb97f81e5] ia64: forbid using VIRTUAL_MEM_MAP with FLATMEM
git bisect good 0e791e5138cde9b96d34ba68136fd26bb97f81e5
# first bad commit: [94d171d065be406a2407f0d723afe14c05526283] ia64: make SPARSEMEM default and disable DISCONTIGMEM
