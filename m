From: Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v5 03/16] x86/tdx: Exclude Shared bit from physical_mask
Date: Fri,  8 Oct 2021 17:36:58 -0700
Message-ID: <20211009003711.1390019-4-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Just like MKTME, TDX reassigns bits of the physical address for
metadata.  MKTME used several bits for an encryption KeyID. TDX
uses a single bit in guests to communicate whether a physical page
should be protected by TDX as private memory (bit set to 0) or
unprotected and shared with the VMM (bit set to 1).

Add a helper, tdx_shared_mask() to generate the mask.  The processor
enumerates its physical address width to include the shared bit, which
means it gets included in __PHYSICAL_MASK by default.

Remove the shared mask from 'physical_mask' since any bits in
tdx_shared_mask() are not used for physical addresses in page table
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

Changes since v4:
 * Renamed tdg_shared_mask() to tdx_shared_mask().

Changes since v3:
 * None

Changes since v1:
 * Fixed format issues in commit log.

 arch/x86/Kconfig           | 1 +
 arch/x86/include/asm/tdx.h | 4 ++++
 arch/x86/kernel/tdx.c      | 9 +++++++++
 3 files changed, 14 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 37b27412f52e..e99c669e633a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -871,6 +871,7 @@ config INTEL_TDX_GUEST
 	depends on SECURITY
 	depends on X86_X2APIC
 	select ARCH_HAS_CC_PLATFORM
+	select X86_MEM_ENCRYPT_COMMON
 	help
 	  Provide support for running in a trusted domain on Intel processors
 	  equipped with Trusted Domain Extensions. TDX is a Intel technology
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index eb5e9dbe1861..b8f758dbbea9 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -76,6 +76,8 @@ bool tdx_handle_virtualization_exception(struct pt_regs *regs,
 
 bool tdx_early_handle_ve(struct pt_regs *regs);
 
+extern phys_addr_t tdx_shared_mask(void);
+
 /*
  * To support I/O port access in decompressor or early kernel init
  * code, since #VE exception handler cannot be used, use paravirt
@@ -141,6 +143,8 @@ static inline void tdx_early_init(void) { };
 
 static inline bool tdx_early_handle_ve(struct pt_regs *regs) { return false; }
 
+static inline phys_addr_t tdx_shared_mask(void) { return 0; }
+
 #endif /* CONFIG_INTEL_TDX_GUEST */
 
 #if defined(CONFIG_KVM_GUEST) && defined(CONFIG_INTEL_TDX_GUEST)
diff --git a/arch/x86/kernel/tdx.c b/arch/x86/kernel/tdx.c
index bb237cf291e6..8a37ab0c6cbf 100644
--- a/arch/x86/kernel/tdx.c
+++ b/arch/x86/kernel/tdx.c
@@ -71,6 +71,12 @@ static inline u64 _tdx_hypercall(u64 fn, u64 r12, u64 r13, u64 r14,
 	return out->r10;
 }
 
+/* The highest bit of a guest physical address is the "sharing" bit */
+phys_addr_t tdx_shared_mask(void)
+{
+	return 1ULL << (td_info.gpa_width - 1);
+}
+
 static void tdx_get_info(void)
 {
 	struct tdx_module_output out;
@@ -94,6 +100,9 @@ static void tdx_get_info(void)
 
 	td_info.gpa_width = out.rcx & GENMASK(5, 0);
 	td_info.attributes = out.rdx;
+
+	/* Exclude Shared bit from the __PHYSICAL_MASK */
+	physical_mask &= ~tdx_shared_mask();
 }
 
 static __cpuidle void _tdx_halt(const bool irq_disabled, const bool do_sti)
-- 
2.25.1

