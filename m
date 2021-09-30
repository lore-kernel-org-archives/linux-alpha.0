From: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH v4 08/11] extable: Use is_kernel_text() helper
Date: Thu, 30 Sep 2021 15:11:40 +0800
Message-ID: <20210930071143.63410-9-wangkefeng.wang@huawei.com>
References: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, mingo@redhat.com, davem@davemloft.net, ast@kernel.org, ryabinin.a.a@gmail.com, akpm@linux-foundation.org
Cc: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, bpf@vger.kernel.org, linux-alpha@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Kefeng Wang <wangkefeng.wang@huawei.com>

The core_kernel_text() should check the gate area, as it is part
of kernel text range, use is_kernel_text() in core_kernel_text().

Cc: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 kernel/extable.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/extable.c b/kernel/extable.c
index 98ca627ac5ef..0ba383d850ff 100644
--- a/kernel/extable.c
+++ b/kernel/extable.c
@@ -64,8 +64,7 @@ const struct exception_table_entry *search_exception_tables(unsigned long addr)
 
 int notrace core_kernel_text(unsigned long addr)
 {
-	if (addr >= (unsigned long)_stext &&
-	    addr < (unsigned long)_etext)
+	if (is_kernel_text(addr))
 		return 1;
 
 	if (system_state < SYSTEM_RUNNING &&
-- 
2.26.2

