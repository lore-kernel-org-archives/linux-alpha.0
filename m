From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH 4/4] alpha: use .data.init_task instead of .data.init_thread
Date: Thu, 30 Apr 2009 19:00:16 -0400
Message-ID: <1241132416-7055-5-git-send-email-tabbott@mit.edu>
References: <1241132416-7055-1-git-send-email-tabbott@mit.edu>
 <1241132416-7055-2-git-send-email-tabbott@mit.edu>
 <1241132416-7055-3-git-send-email-tabbott@mit.edu>
 <1241132416-7055-4-git-send-email-tabbott@mit.edu>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1241132416-7055-4-git-send-email-tabbott@mit.edu>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, Anders Kaseorg <andersk@mit.edu>, Waseem Daher <wdaher@mit.edu>, Denys Vlasenko <vda.linux@googlemail.com>, Jeff Arnold <jbarnold@mit.edu>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Tim Abbott <tabbott@mit.edu>

alpha is the only architecture that uses the section name
.data.init_thread instead of .data.init_task.  So convert alpha to use
.data.init_task like everything else.

.data.init_task should not need a separate output section; this change
also moves it into the .data output section.

Signed-off-by: Tim Abbott <tabbott@mit.edu>
Cc: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/kernel/init_task.c   |    5 ++---
 arch/alpha/kernel/vmlinux.lds.S |    7 ++-----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/kernel/init_task.c b/arch/alpha/kernel/init_task.c
index c2938e5..475d46a 100644
--- a/arch/alpha/kernel/init_task.c
+++ b/arch/alpha/kernel/init_task.c
@@ -16,6 +16,5 @@ struct task_struct init_task = INIT_TASK(init_task);
 EXPORT_SYMBOL(init_mm);
 EXPORT_SYMBOL(init_task);
 
-union thread_union init_thread_union
-	__attribute__((section(".data.init_thread")))
-	= { INIT_THREAD_INFO(init_task) };
+union thread_union init_thread_union __init_task_data =
+	{ INIT_THREAD_INFO(init_task) };
diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index 7acd1eb..caca724 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -1,5 +1,6 @@
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/page.h>
+#include <asm/thread_info.h>
 
 OUTPUT_FORMAT("elf64-alpha")
 OUTPUT_ARCH(alpha)
@@ -92,14 +93,10 @@ SECTIONS
 	__init_end = .;
 	/* Freed after init ends here */
 
-	/* Note 2 page alignment above.  */
-	.data.init_thread : {
-		*(.data.init_thread)
-	}
-
 	_data = .;
 	/* Data */
 	.data : {
+		INIT_TASK_DATA(THREAD_SIZE)
 		PAGE_ALIGNED_DATA
 		CACHELINE_ALIGNED_DATA(64)
 		DATA_DATA
-- 
1.6.2.1

