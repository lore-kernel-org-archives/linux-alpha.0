From: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH v4 06/11] sections: Provide internal __is_kernel() and __is_kernel_text() helper
Date: Thu, 30 Sep 2021 15:11:38 +0800
Message-ID: <20210930071143.63410-7-wangkefeng.wang@huawei.com>
References: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, mingo@redhat.com, davem@davemloft.net, ast@kernel.org, ryabinin.a.a@gmail.com, akpm@linux-foundation.org
Cc: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, bpf@vger.kernel.org, linux-alpha@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Kefeng Wang <wangkefeng.wang@huawei.com>

An internal __is_kernel() helper which only check the
kernel address ranges, and an internal __is_kernel_text()
helper which only check text section ranges.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 include/asm-generic/sections.h | 29 +++++++++++++++++++++++++++++
 include/linux/kallsyms.h       |  4 ++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index 811583ca8bd0..a7abeadddc7a 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -186,4 +186,33 @@ static inline bool is_kernel_inittext(unsigned long addr)
 	       addr < (unsigned long)_einittext;
 }
 
+/**
+ * __is_kernel_text - checks if the pointer address is located in the
+ *                    .text section
+ *
+ * @addr: address to check
+ *
+ * Returns: true if the address is located in .text, false otherwise.
+ * Note: an internal helper, only check the range of _stext to _etext.
+ */
+static inline bool __is_kernel_text(unsigned long addr)
+{
+	return addr >= (unsigned long)_stext &&
+	       addr < (unsigned long)_etext;
+}
+
+/**
+ * __is_kernel - checks if the pointer address is located in the kernel range
+ *
+ * @addr: address to check
+ *
+ * Returns: true if the address is located in the kernel range, false otherwise.
+ * Note: an internal helper, only check the range of _stext to _end.
+ */
+static inline bool __is_kernel(unsigned long addr)
+{
+	return addr >= (unsigned long)_stext &&
+	       addr < (unsigned long)_end;
+}
+
 #endif /* _ASM_GENERIC_SECTIONS_H_ */
diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index 8a9d329c927c..5fb17dd4b6fa 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -26,14 +26,14 @@ struct module;
 
 static inline int is_kernel_text(unsigned long addr)
 {
-	if ((addr >= (unsigned long)_stext && addr < (unsigned long)_etext))
+	if (__is_kernel_text(addr))
 		return 1;
 	return in_gate_area_no_mm(addr);
 }
 
 static inline int is_kernel(unsigned long addr)
 {
-	if (addr >= (unsigned long)_stext && addr < (unsigned long)_end)
+	if (__is_kernel(addr))
 		return 1;
 	return in_gate_area_no_mm(addr);
 }
-- 
2.26.2

