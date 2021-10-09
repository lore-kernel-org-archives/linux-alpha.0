From: Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v5 09/16] x86/tdx: Enable shared memory confidential guest flags for TDX guest
Date: Fri,  8 Oct 2021 17:37:04 -0700
Message-ID: <20211009003711.1390019-10-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
In-Reply-To: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org

In TDX guest, since the memory is private to guest, it needs some
extra configuration before sharing any data with VMM. AMD SEV also
implements similar features and hence code can be shared. Currently
memory sharing related code in the kernel is protected by
CC_ATTR_GUEST_MEM_ENCRYPT and CC_ATTR_GUEST_SHARED_MAPPING_INIT flags.
So enable them for TDX guest as well.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---

Changes since v4:
 * Rebased on top of Tom Lendacky's CC guest
   changes (https://www.spinics.net/lists/linux-tip-commits/msg58716.html)

 arch/x86/kernel/cc_platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/cc_platform.c b/arch/x86/kernel/cc_platform.c
index d13188e8eb2c..deac0a7d7d37 100644
--- a/arch/x86/kernel/cc_platform.c
+++ b/arch/x86/kernel/cc_platform.c
@@ -20,6 +20,9 @@ static bool intel_cc_platform_has(enum cc_attr attr)
 	switch (attr) {
 	case CC_ATTR_GUEST_TDX:
 	case CC_ATTR_GUEST_UNROLL_STRING_IO:
+	case CC_ATTR_GUEST_MEM_ENCRYPT:
+	case CC_ATTR_GUEST_SHARED_MAPPING_INIT:
+	case CC_ATTR_MEM_ENCRYPT:
 		return is_tdx_guest();
 	default:
 		return false;
-- 
2.25.1

