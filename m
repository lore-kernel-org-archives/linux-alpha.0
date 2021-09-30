From: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH v4 10/11] microblaze: Use is_kernel_text() helper
Date: Thu, 30 Sep 2021 15:11:42 +0800
Message-ID: <20210930071143.63410-11-wangkefeng.wang@huawei.com>
References: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, mingo@redhat.com, davem@davemloft.net, ast@kernel.org, ryabinin.a.a@gmail.com, akpm@linux-foundation.org
Cc: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, bpf@vger.kernel.org, linux-alpha@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Kefeng Wang <wangkefeng.wang@huawei.com>, Michal Simek <monstr@monstr.eu>

Use is_kernel_text() helper to simplify code.

Cc: Michal Simek <monstr@monstr.eu>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/microblaze/mm/pgtable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/microblaze/mm/pgtable.c b/arch/microblaze/mm/pgtable.c
index c1833b159d3b..9f73265aad4e 100644
--- a/arch/microblaze/mm/pgtable.c
+++ b/arch/microblaze/mm/pgtable.c
@@ -34,6 +34,7 @@
 #include <linux/mm_types.h>
 #include <linux/pgtable.h>
 #include <linux/memblock.h>
+#include <linux/kallsyms.h>
 
 #include <asm/pgalloc.h>
 #include <linux/io.h>
@@ -171,7 +172,7 @@ void __init mapin_ram(void)
 	for (s = 0; s < lowmem_size; s += PAGE_SIZE) {
 		f = _PAGE_PRESENT | _PAGE_ACCESSED |
 				_PAGE_SHARED | _PAGE_HWEXEC;
-		if ((char *) v < _stext || (char *) v >= _etext)
+		if (!is_kernel_text(v))
 			f |= _PAGE_WRENABLE;
 		else
 			/* On the MicroBlaze, no user access
-- 
2.26.2

