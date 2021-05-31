From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2] mm: generalize ZONE_[DMA|DMA32]
Date: Mon, 31 May 2021 14:22:21 +0200
Message-ID: <67269724-625f-4e82-7c05-a52879bc94bd@xilinx.com>
References: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
 <20210528074557.17768-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4QlRJFqramJKeIVPz/pE34+xZCgqFmdx8DaAExUThe0=; b=CpbrzJGfd8K5/HgOOCVJdI0N/q
	+Q5PgE7O6E0lboBezjCtSLNuIuP+k5QsPvOoLCWxMB7baaqRnX6JksF976e+zdY7bFe6yAxW++78f
	QmgKub42sjIUnIcpgWqSdZe2bui1LfCejS4ZMLcI4K0OLIaaHLrsPP/kk0fkEMig/ep3ngbBqvpGy
	+xoiRpK9eW8N8RtPXxHJ38L7S2TQ55wDrHyme9ve4fPkx4UBDxs/6R5d40Gs9dUgEBhJm1p3kryn0
	kcs9r7F8s94EZoi8kB1PONBJjjnRMJKVUySWHZ5NF45qHLsTxw2NoK9vxrmE16Sstx0g4TceIdfOt
	mFeBvZnA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS/QsdVDIzT8OPpGE0MNvbxd3Px81tbH99R4M1X8mI4=;
 b=tULRj4D3zOCR1er2uvUfkkrbShd4TaZRYh0jXOpFcN/hDc/e1uYNNdjsszseyAjuS7yP0KJCI16H+wf+f8igyfyp++uOl0XCH38sZ9X8MJJ7XS4nbZnvjCnehTvyWmBseA2+iMCNhRnI/ZfApdT6zkQkH3Nk+z/m69D7w2R/d3Y=
In-Reply-To: <20210528074557.17768-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "David S. Miller" <davem@davemloft.net>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>, Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>



On 5/28/21 9:45 AM, Kefeng Wang wrote:
> ZONE_[DMA|DMA32] configs have duplicate definitions on platforms
> that subscribe them. Instead, just make them generic options which
> can be selected on applicable platforms.
> 
> Also only x86/arm64 architectures could enable both ZONE_DMA and
> ZONE_DMA32 if EXPERT, add ARCH_HAS_ZONE_DMA_SET to make dma zone
> configurable and visible on the two architectures.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Russell King <linux@armlinux.org.uk>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com> # for arm64
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # for m68k
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2:
> -i386 can't enable ZONE_DMA32, fix it.
> -make ZONE_DMA default y on X86 as before.
> -collect ACKs
> 
>  arch/alpha/Kconfig                     |  5 +----
>  arch/arm/Kconfig                       |  3 ---
>  arch/arm64/Kconfig                     |  9 +--------
>  arch/ia64/Kconfig                      |  4 +---
>  arch/m68k/Kconfig                      |  5 +----
>  arch/microblaze/Kconfig                |  4 +---
>  arch/mips/Kconfig                      |  7 -------
>  arch/powerpc/Kconfig                   |  4 ----
>  arch/powerpc/platforms/Kconfig.cputype |  1 +
>  arch/riscv/Kconfig                     |  5 +----
>  arch/s390/Kconfig                      |  4 +---
>  arch/sparc/Kconfig                     |  5 +----
>  arch/x86/Kconfig                       | 15 ++-------------
>  mm/Kconfig                             | 12 ++++++++++++
>  14 files changed, 23 insertions(+), 60 deletions(-)
> 
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 5998106faa60..6a69a14c4825 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -40,6 +40,7 @@ config ALPHA
>  	select MMU_GATHER_NO_RANGE
>  	select SET_FS
>  	select SPARSEMEM_EXTREME if SPARSEMEM
> +	select ZONE_DMA
>  	help
>  	  The Alpha is a 64-bit general-purpose processor designed and
>  	  marketed by the Digital Equipment Corporation of blessed memory,
> @@ -65,10 +66,6 @@ config GENERIC_CALIBRATE_DELAY
>  	bool
>  	default y
>  
> -config ZONE_DMA
> -	bool
> -	default y
> -
>  config GENERIC_ISA_DMA
>  	bool
>  	default y
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 24804f11302d..000c3f80b58e 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -218,9 +218,6 @@ config GENERIC_CALIBRATE_DELAY
>  config ARCH_MAY_HAVE_PC_FDC
>  	bool
>  
> -config ZONE_DMA
> -	bool
> -
>  config ARCH_SUPPORTS_UPROBES
>  	def_bool y
>  
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 9f1d8566bbf9..42794474f37f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -42,6 +42,7 @@ config ARM64
>  	select ARCH_HAS_SYSCALL_WRAPPER
>  	select ARCH_HAS_TEARDOWN_DMA_OPS if IOMMU_SUPPORT
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
> +	select ARCH_HAS_ZONE_DMA_SET if EXPERT
>  	select ARCH_HAVE_ELF_PROT
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>  	select ARCH_INLINE_READ_LOCK if !PREEMPTION
> @@ -307,14 +308,6 @@ config GENERIC_CSUM
>  config GENERIC_CALIBRATE_DELAY
>  	def_bool y
>  
> -config ZONE_DMA
> -	bool "Support DMA zone" if EXPERT
> -	default y
> -
> -config ZONE_DMA32
> -	bool "Support DMA32 zone" if EXPERT
> -	default y
> -
>  config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>  	def_bool y
>  
> diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
> index 279252e3e0f7..fd8503a0088a 100644
> --- a/arch/ia64/Kconfig
> +++ b/arch/ia64/Kconfig
> @@ -60,6 +60,7 @@ config IA64
>  	select NUMA if !FLATMEM
>  	select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
>  	select SET_FS
> +	select ZONE_DMA32
>  	default y
>  	help
>  	  The Itanium Processor Family is Intel's 64-bit successor to
> @@ -72,9 +73,6 @@ config 64BIT
>  	select ATA_NONSTANDARD if ATA
>  	default y
>  
> -config ZONE_DMA32
> -	def_bool y
> -
>  config MMU
>  	bool
>  	default y
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 372e4e69c43a..05a729c6ad7f 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -34,6 +34,7 @@ config M68K
>  	select SET_FS
>  	select UACCESS_MEMCPY if !MMU
>  	select VIRT_TO_BUS
> +	select ZONE_DMA
>  
>  config CPU_BIG_ENDIAN
>  	def_bool y
> @@ -62,10 +63,6 @@ config TIME_LOW_RES
>  config NO_IOPORT_MAP
>  	def_bool y
>  
> -config ZONE_DMA
> -	bool
> -	default y
> -
>  config HZ
>  	int
>  	default 1000 if CLEOPATRA
> diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
> index 0660f47012bc..14a67a42fcae 100644
> --- a/arch/microblaze/Kconfig
> +++ b/arch/microblaze/Kconfig
> @@ -43,6 +43,7 @@ config MICROBLAZE
>  	select MMU_GATHER_NO_RANGE
>  	select SPARSE_IRQ
>  	select SET_FS
> +	select ZONE_DMA
>  
>  # Endianness selection
>  choice
> @@ -60,9 +61,6 @@ config CPU_LITTLE_ENDIAN
>  
>  endchoice
>  
> -config ZONE_DMA
> -	def_bool y
> -
>  config ARCH_HAS_ILOG2_U32
>  	def_bool n
>  


Acked-by: Michal Simek <michal.simek@xilinx.com> # for MB

Michal
