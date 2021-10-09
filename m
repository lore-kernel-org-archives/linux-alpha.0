From: Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v5 02/16] x86/tdx: Get TD execution environment information via TDINFO
Date: Fri,  8 Oct 2021 17:36:57 -0700
Message-ID: <20211009003711.1390019-3-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Per Guest-Host-Communication Interface (GHCI) for Intel Trust Domain
Extensions (Intel TDX) specification, sec 2.4.2, TDCALL[TDINFO]
provides basic TD execution environment information, not provided by
CPUID.

Call TDINFO during early boot to be used for following system
initialization.

The call provides info on which bit in PFN is used to indicate that the
page is shared with the host and attributes of the TD, such as debug.

Information about the number of CPUs need not be saved because there are
no users so far for it.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Andi Kleen <ak@linux.intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 arch/x86/kernel/tdx.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/x86/kernel/tdx.c b/arch/x86/kernel/tdx.c
index 79af9e78b300..bb237cf291e6 100644
--- a/arch/x86/kernel/tdx.c
+++ b/arch/x86/kernel/tdx.c
@@ -14,6 +14,7 @@
 #include <linux/sched/signal.h> /* force_sig_fault() */
 
 /* TDX Module call Leaf IDs */
+#define TDX_GET_INFO			1
 #define TDX_GET_VEINFO			3
 
 #define VE_IS_IO_OUT(exit_qual)		(((exit_qual) & 8) ? 0 : 1)
@@ -21,6 +22,11 @@
 #define VE_GET_PORT_NUM(exit_qual)	((exit_qual) >> 16)
 #define VE_IS_IO_STRING(exit_qual)	((exit_qual) & 16 ? 1 : 0)
 
+static struct {
+	unsigned int gpa_width;
+	unsigned long attributes;
+} td_info __ro_after_init;
+
 bool is_tdx_guest(void)
 {
 	static int tdx_guest = -1;
@@ -65,6 +71,31 @@ static inline u64 _tdx_hypercall(u64 fn, u64 r12, u64 r13, u64 r14,
 	return out->r10;
 }
 
+static void tdx_get_info(void)
+{
+	struct tdx_module_output out;
+	u64 ret;
+
+	/*
+	 * TDINFO TDX Module call is used to get the TD
+	 * execution environment information like GPA
+	 * width, number of available vcpus, debug mode
+	 * information, etc. More details about the ABI
+	 * can be found in TDX Guest-Host-Communication
+	 * Interface (GHCI), sec 2.4.2 TDCALL [TDG.VP.INFO].
+	 */
+	ret = __tdx_module_call(TDX_GET_INFO, 0, 0, 0, 0, &out);
+
+	/*
+	 * Non zero return means buggy TDX module (which is
+	 * fatal). So raise a BUG().
+	 */
+	BUG_ON(ret);
+
+	td_info.gpa_width = out.rcx & GENMASK(5, 0);
+	td_info.attributes = out.rdx;
+}
+
 static __cpuidle void _tdx_halt(const bool irq_disabled, const bool do_sti)
 {
 	u64 ret;
@@ -466,6 +497,8 @@ void __init tdx_early_init(void)
 
 	setup_force_cpu_cap(X86_FEATURE_TDX_GUEST);
 
+	tdx_get_info();
+
 	pv_ops.irq.safe_halt = tdx_safe_halt;
 	pv_ops.irq.halt = tdx_halt;
 
-- 
2.25.1

