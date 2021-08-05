From: Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v4 10/15] asm/io.h: Add ioremap_shared fallback
Date: Wed,  4 Aug 2021 17:52:13 -0700
Message-ID: <20210805005218.2912076-11-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org

From: Andi Kleen <ak@linux.intel.com>

This function is for declaring memory that should be shared with
a hypervisor in a confidential guest. If the architecture doesn't
implement it it's just ioremap.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 arch/alpha/include/asm/io.h    | 1 +
 arch/mips/include/asm/io.h     | 1 +
 arch/parisc/include/asm/io.h   | 1 +
 arch/sparc/include/asm/io_64.h | 1 +
 include/asm-generic/io.h       | 4 ++++
 5 files changed, 8 insertions(+)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index 0fab5ac90775..701b44909b94 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -283,6 +283,7 @@ static inline void __iomem *ioremap(unsigned long port, unsigned long size)
 }
 
 #define ioremap_wc ioremap
+#define ioremap_shared ioremap
 #define ioremap_uc ioremap
 
 static inline void iounmap(volatile void __iomem *addr)
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 6f5c86d2bab4..3713ff624632 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -179,6 +179,7 @@ void iounmap(const volatile void __iomem *addr);
 #define ioremap(offset, size)						\
 	ioremap_prot((offset), (size), _CACHE_UNCACHED)
 #define ioremap_uc		ioremap
+#define ioremap_shared		ioremap
 
 /*
  * ioremap_cache -	map bus memory into CPU space
diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index 0b5259102319..73064e152df7 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -129,6 +129,7 @@ static inline void gsc_writeq(unsigned long long val, unsigned long addr)
  */
 void __iomem *ioremap(unsigned long offset, unsigned long size);
 #define ioremap_wc			ioremap
+#define ioremap_shared			ioremap
 #define ioremap_uc			ioremap
 
 extern void iounmap(const volatile void __iomem *addr);
diff --git a/arch/sparc/include/asm/io_64.h b/arch/sparc/include/asm/io_64.h
index 5ffa820dcd4d..18cc656eb712 100644
--- a/arch/sparc/include/asm/io_64.h
+++ b/arch/sparc/include/asm/io_64.h
@@ -409,6 +409,7 @@ static inline void __iomem *ioremap(unsigned long offset, unsigned long size)
 #define ioremap_uc(X,Y)			ioremap((X),(Y))
 #define ioremap_wc(X,Y)			ioremap((X),(Y))
 #define ioremap_wt(X,Y)			ioremap((X),(Y))
+#define ioremap_shared(X, Y)		ioremap((X), (Y))
 static inline void __iomem *ioremap_np(unsigned long offset, unsigned long size)
 {
 	return NULL;
diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index e93375c710b9..bfcaee1691c8 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -982,6 +982,10 @@ static inline void __iomem *ioremap(phys_addr_t addr, size_t size)
 #define ioremap_wt ioremap
 #endif
 
+#ifndef ioremap_shared
+#define ioremap_shared ioremap
+#endif
+
 /*
  * ioremap_uc is special in that we do require an explicit architecture
  * implementation.  In general you do not want to use this function in a
-- 
2.25.1

