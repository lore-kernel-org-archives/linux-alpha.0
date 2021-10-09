From: Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v5 06/16] x86/tdx: Make DMA pages shared
Date: Fri,  8 Oct 2021 17:37:01 -0700
Message-ID: <20211009003711.1390019-7-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Just like MKTME, TDX reassigns bits of the physical address for
metadata.  MKTME used several bits for an encryption KeyID. TDX
uses a single bit in guests to communicate whether a physical page
should be protected by TDX as private memory (bit set to 0) or
unprotected and shared with the VMM (bit set to 1).

__set_memory_enc_dec() is now aware about TDX and sets Shared bit
accordingly following with relevant TDX hypercall.

Also, Do TDX_ACCEPT_PAGE on every 4k page after mapping the GPA range
when converting memory to private. Using 4k page size limit is due
to current TDX spec restriction. Also, If the GPA (range) was
already mapped as an active, private page, the host VMM may remove
the private page from the TD by following the “Removing TD Private
Pages” sequence in the Intel TDX-module specification [1] to safely
block the mapping(s), flush the TLB and cache, and remove the
mapping(s).

BUG() if TDX_ACCEPT_PAGE fails (except "previously accepted page" case)
, as the guest is completely hosed if it can't access memory. 

[1] https://software.intel.com/content/dam/develop/external/us/en/documents/tdx-module-1eas-v0.85.039.pdf

Tested-by: Kai Huang <kai.huang@linux.intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Reviewed-by: Andi Kleen <ak@linux.intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---

Changes since v4:
 * Renamed tdg_accept_page() to tdx_accept_page().
 * Added required comments to tdx_accept_page().
 * Replaced prot_guest_has() to cc_guest_has().

Changes since v3:
 * Rebased on top of Tom Lendacky's protected guest
   changes (https://lore.kernel.org/patchwork/cover/1468760/)
 * Fixed TDX_PAGE_ALREADY_ACCEPTED error code as per latest
   spec update.

Changes since v1:
 * Removed "we" or "I" usages in comment section.
 * Replaced is_tdx_guest() checks with prot_guest_has() checks.

 arch/x86/include/asm/pgtable.h   |  1 +
 arch/x86/kernel/tdx.c            | 45 ++++++++++++++++++++++++++++----
 arch/x86/mm/mem_encrypt_common.c | 11 +++++++-
 arch/x86/mm/pat/set_memory.c     | 45 +++++++++++++++++++++++++++-----
 4 files changed, 89 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index ecefccbdf2e3..2de4d6e34b84 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -24,6 +24,7 @@
 /* Make the page accesable by VMM for confidential guests */
 #define pgprot_cc_guest(prot) __pgprot(pgprot_val(prot) |	\
 					      tdx_shared_mask())
+#define pgprot_cc_shared_mask() __pgprot(tdx_shared_mask())
 
 #ifndef __ASSEMBLY__
 #include <asm/x86_init.h>
diff --git a/arch/x86/kernel/tdx.c b/arch/x86/kernel/tdx.c
index c3e4cc5d631b..433f366ca25c 100644
--- a/arch/x86/kernel/tdx.c
+++ b/arch/x86/kernel/tdx.c
@@ -16,10 +16,16 @@
 /* TDX Module call Leaf IDs */
 #define TDX_GET_INFO			1
 #define TDX_GET_VEINFO			3
+#define TDX_ACCEPT_PAGE			6
 
 /* TDX hypercall Leaf IDs */
 #define TDVMCALL_MAP_GPA		0x10001
 
+/* TDX Module call error codes */
+#define TDX_PAGE_ALREADY_ACCEPTED	0x00000b0a00000000
+#define TDCALL_RETURN_CODE_MASK		0xFFFFFFFF00000000
+#define TDCALL_RETURN_CODE(a)		((a) & TDCALL_RETURN_CODE_MASK)
+
 #define VE_IS_IO_OUT(exit_qual)		(((exit_qual) & 8) ? 0 : 1)
 #define VE_GET_IO_SIZE(exit_qual)	(((exit_qual) & 7) + 1)
 #define VE_GET_PORT_NUM(exit_qual)	((exit_qual) >> 16)
@@ -108,18 +114,35 @@ static void tdx_get_info(void)
 	physical_mask &= ~tdx_shared_mask();
 }
 
+static void tdx_accept_page(phys_addr_t gpa)
+{
+	u64 ret;
+
+	/*
+	 * Pass the page physical address and size (0-4KB) to the
+	 * TDX module to accept the pending, private page. More info
+	 * about ABI can be found in TDX Guest-Host-Communication
+	 * Interface (GHCI), sec 2.4.7.
+	 */
+	ret = __tdx_module_call(TDX_ACCEPT_PAGE, gpa, 0, 0, 0, NULL);
+
+	/*
+	 * Non zero return value means buggy TDX module (which is
+	 * fatal for TDX guest). So panic here.
+	 */
+	BUG_ON(ret && TDCALL_RETURN_CODE(ret) != TDX_PAGE_ALREADY_ACCEPTED);
+}
+
 /*
  * Inform the VMM of the guest's intent for this physical page:
  * shared with the VMM or private to the guest.  The VMM is
  * expected to change its mapping of the page in response.
- *
- * Note: shared->private conversions require further guest
- * action to accept the page.
  */
 int tdx_hcall_gpa_intent(phys_addr_t gpa, int numpages,
 			 enum tdx_map_type map_type)
 {
-	u64 ret;
+	u64 ret = 0;
+	int i;
 
 	if (map_type == TDX_MAP_SHARED)
 		gpa |= tdx_shared_mask();
@@ -131,8 +154,20 @@ int tdx_hcall_gpa_intent(phys_addr_t gpa, int numpages,
 	 */
 	ret = _tdx_hypercall(TDVMCALL_MAP_GPA, gpa, PAGE_SIZE * numpages, 0, 0,
 			     NULL);
+	if (ret)
+		ret = -EIO;
+
+	if (ret || map_type == TDX_MAP_SHARED)
+		return ret;
+
+	/*
+	 * For shared->private conversion, accept the page using
+	 * TDX_ACCEPT_PAGE TDX module call.
+	 */
+	for (i = 0; i < numpages; i++)
+		tdx_accept_page(gpa + i * PAGE_SIZE);
 
-	return ret ? -EIO : 0;
+	return 0;
 }
 
 static __cpuidle void _tdx_halt(const bool irq_disabled, const bool do_sti)
diff --git a/arch/x86/mm/mem_encrypt_common.c b/arch/x86/mm/mem_encrypt_common.c
index f063c885b0a5..119a9056efbb 100644
--- a/arch/x86/mm/mem_encrypt_common.c
+++ b/arch/x86/mm/mem_encrypt_common.c
@@ -9,9 +9,18 @@
 
 #include <asm/mem_encrypt_common.h>
 #include <linux/dma-mapping.h>
+#include <linux/cc_platform.h>
 
 /* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
 bool force_dma_unencrypted(struct device *dev)
 {
-	return amd_force_dma_unencrypted(dev);
+	if (cc_platform_has(CC_ATTR_GUEST_TDX) &&
+	    cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
+		return true;
+
+	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) ||
+	    cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
+		return amd_force_dma_unencrypted(dev);
+
+	return false;
 }
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 527957586f3c..6c531d5cb5fd 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -30,6 +30,7 @@
 #include <asm/proto.h>
 #include <asm/memtype.h>
 #include <asm/set_memory.h>
+#include <asm/tdx.h>
 
 #include "../mm_internal.h"
 
@@ -1981,8 +1982,10 @@ int set_memory_global(unsigned long addr, int numpages)
 				    __pgprot(_PAGE_GLOBAL), 0);
 }
 
-static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
+static int __set_memory_protect(unsigned long addr, int numpages, bool protect)
 {
+	pgprot_t mem_protected_bits, mem_plain_bits;
+	enum tdx_map_type map_type;
 	struct cpa_data cpa;
 	int ret;
 
@@ -1997,8 +2000,25 @@ static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
 	memset(&cpa, 0, sizeof(cpa));
 	cpa.vaddr = &addr;
 	cpa.numpages = numpages;
-	cpa.mask_set = enc ? __pgprot(_PAGE_ENC) : __pgprot(0);
-	cpa.mask_clr = enc ? __pgprot(0) : __pgprot(_PAGE_ENC);
+
+	if (cc_platform_has(CC_ATTR_GUEST_SHARED_MAPPING_INIT)) {
+		mem_protected_bits = __pgprot(0);
+		mem_plain_bits = pgprot_cc_shared_mask();
+	} else {
+		mem_protected_bits = __pgprot(_PAGE_ENC);
+		mem_plain_bits = __pgprot(0);
+	}
+
+	if (protect) {
+		cpa.mask_set = mem_protected_bits;
+		cpa.mask_clr = mem_plain_bits;
+		map_type = TDX_MAP_PRIVATE;
+	} else {
+		cpa.mask_set = mem_plain_bits;
+		cpa.mask_clr = mem_protected_bits;
+		map_type = TDX_MAP_SHARED;
+	}
+
 	cpa.pgd = init_mm.pgd;
 
 	/* Must avoid aliasing mappings in the highmem code */
@@ -2006,9 +2026,17 @@ static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
 	vm_unmap_aliases();
 
 	/*
-	 * Before changing the encryption attribute, we need to flush caches.
+	 * Before changing the encryption attribute, flush caches.
+	 *
+	 * For TDX, guest is responsible for flushing caches on private->shared
+	 * transition. VMM is responsible for flushing on shared->private.
 	 */
-	cpa_flush(&cpa, !this_cpu_has(X86_FEATURE_SME_COHERENT));
+	if (cc_platform_has(CC_ATTR_GUEST_TDX)) {
+		if (map_type == TDX_MAP_SHARED)
+			cpa_flush(&cpa, 1);
+	} else {
+		cpa_flush(&cpa, !this_cpu_has(X86_FEATURE_SME_COHERENT));
+	}
 
 	ret = __change_page_attr_set_clr(&cpa, 1);
 
@@ -2021,18 +2049,21 @@ static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
 	 */
 	cpa_flush(&cpa, 0);
 
+	if (!ret && cc_platform_has(CC_ATTR_GUEST_SHARED_MAPPING_INIT))
+		ret = tdx_hcall_gpa_intent(__pa(addr), numpages, map_type);
+
 	return ret;
 }
 
 int set_memory_encrypted(unsigned long addr, int numpages)
 {
-	return __set_memory_enc_dec(addr, numpages, true);
+	return __set_memory_protect(addr, numpages, true);
 }
 EXPORT_SYMBOL_GPL(set_memory_encrypted);
 
 int set_memory_decrypted(unsigned long addr, int numpages)
 {
-	return __set_memory_enc_dec(addr, numpages, false);
+	return __set_memory_protect(addr, numpages, false);
 }
 EXPORT_SYMBOL_GPL(set_memory_decrypted);
 
-- 
2.25.1

