From: Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v4 02/15] x86/tdx: Exclude Shared bit from physical_mask
Date: Wed,  4 Aug 2021 17:52:05 -0700
Message-ID: <20210805005218.2912076-3-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Just like MKTME, TDX reassigns bits of the physical address for
metadata.  MKTME used several bits for an encryption KeyID. TDX
uses a single bit in guests to communicate whether a physical page
should be protected by TDX as private memory (bit set to 0) or
unprotected and shared with the VMM (bit set to 1).

Add a helper, tdg_shared_mask() to generate the mask.  The processor
enumerates its physical address width to include the shared bit, which
means it gets included in __PHYSICAL_MASK by default.

Remove the shared mask from 'physical_mask' since any bits in
tdg_shared_mask() are not used for physical addresses in page table
entries.

Also, note that shared mapping configuration cannot be clubbed between
AMD SME and Intel TDX Guest platforms in common function. SME has
to do it very early in __startup_64() as it sets the bit on all
memory, except what is used for communication. TDX can postpone it,
as it don't need any shared mapping in very early boot.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Andi Kleen <ak@linux.intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---

Changes since v3:
 * None

Changes since v1:
 * Fixed format issues in commit log.

 arch/x86/Kconfig           | 1 +
 arch/x86/include/asm/tdx.h | 4 ++++
 arch/x86/kernel/tdx.c      | 9 +++++++++
 3 files changed, 14 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index d66a8a2f3c97..8eada36694b6 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -872,6 +872,7 @@ config INTEL_TDX_GUEST
 	select X86_X2APIC
 	select SECURITY_LOCKDOWN_LSM
 	select ARCH_HAS_PROTECTED_GUEST
+	select X86_MEM_ENCRYPT_COMMON
 	help
 	  Provide support for running in a trusted domain on Intel processors
 	  equipped with Trusted Domain eXtensions. TDX is a new Intel
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 72154d3f63c2..1e2a1c6a1898 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -77,6 +77,8 @@ int tdg_handle_virtualization_exception(struct pt_regs *regs,
 
 bool tdg_early_handle_ve(struct pt_regs *regs);
 
+extern phys_addr_t tdg_shared_mask(void);
+
 /*
  * To support I/O port access in decompressor or early kernel init
  * code, since #VE exception handler cannot be used, use paravirt
@@ -145,6 +147,8 @@ static inline bool tdx_prot_guest_has(unsigned long flag) { return false; }
 
 static inline bool tdg_early_handle_ve(struct pt_regs *regs) { return false; }
 
+static inline phys_addr_t tdg_shared_mask(void) { return 0; }
+
 #endif /* CONFIG_INTEL_TDX_GUEST */
 
 #ifdef CONFIG_INTEL_TDX_GUEST_KVM
diff --git a/arch/x86/kernel/tdx.c b/arch/x86/kernel/tdx.c
index 0c24439774b4..d316fe33f52f 100644
--- a/arch/x86/kernel/tdx.c
+++ b/arch/x86/kernel/tdx.c
@@ -75,6 +75,12 @@ bool tdx_prot_guest_has(unsigned long flag)
 }
 EXPORT_SYMBOL_GPL(tdx_prot_guest_has);
 
+/* The highest bit of a guest physical address is the "sharing" bit */
+phys_addr_t tdg_shared_mask(void)
+{
+	return 1ULL << (td_info.gpa_width - 1);
+}
+
 static void tdg_get_info(void)
 {
 	u64 ret;
@@ -86,6 +92,9 @@ static void tdg_get_info(void)
 
 	td_info.gpa_width = out.rcx & GENMASK(5, 0);
 	td_info.attributes = out.rdx;
+
+	/* Exclude Shared bit from the __PHYSICAL_MASK */
+	physical_mask &= ~tdg_shared_mask();
 }
 
 static __cpuidle void tdg_halt(void)
-- 
2.25.1

