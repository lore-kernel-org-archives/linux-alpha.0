From: Tim Abbott <tabbott@ksplice.com>
Subject: [PATCH v2 10/11] alpha: use .data.init_task instead of .data.init_thread.
Date: Thu, 24 Sep 2009 10:36:25 -0400
Message-ID: <1253802986-8132-11-git-send-email-tabbott@ksplice.com>
References: <1253802986-8132-1-git-send-email-tabbott@ksplice.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752985AbZIXOhX@vger.kernel.org>
In-Reply-To: <1253802986-8132-1-git-send-email-tabbott@ksplice.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Tim Abbott <tabbott@ksplice.com>, Tim Abbott <tabbott@mit.edu>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org

alpha is the only architecture that uses the section name
.data.init_thread instead of .data.init_task.  So convert alpha to use
.data.init_task like everything else.

.data.init_task does not need a separate output section; this change
also moves it into the .data output section.

Signed-off-by: Tim Abbott <tabbott@mit.edu>
Cc: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/kernel/init_task.c   |    5 ++---
 arch/alpha/kernel/vmlinux.lds.S |    7 ++-----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/kernel/init_task.c b/arch/alpha/kernel/init_task.c
index 19b8632..6f80ca4 100644
--- a/arch/alpha/kernel/init_task.c
+++ b/arch/alpha/kernel/init_task.c
@@ -13,6 +13,5 @@ static struct sighand_struct init_sighand = INIT_SIGHAND(init_sighand);
 struct task_struct init_task = INIT_TASK(init_task);
 EXPORT_SYMBOL(init_task);
 
-union thread_union init_thread_union
-	__attribute__((section(".data.init_thread")))
-	= { INIT_THREAD_INFO(init_task) };
+union thread_union init_thread_union __init_task_data =
+	{ INIT_THREAD_INFO(init_task) };
diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index 6dc03c3..82803df 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -1,5 +1,6 @@
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/page.h>
+#include <asm/thread_info.h>
 
 OUTPUT_FORMAT("elf64-alpha")
 OUTPUT_ARCH(alpha)
@@ -92,11 +93,6 @@ SECTIONS
 	__init_end = .;
 	/* Freed after init ends here */
 
-	/* Note 2 page alignment above.  */
-	.data.init_thread : {
-		*(.data.init_thread)
-	}
-
 	. = ALIGN(PAGE_SIZE);
 	.data.page_aligned : {
 		*(.data.page_aligned)
@@ -110,6 +106,7 @@ SECTIONS
 	_data = .;
 	/* Data */
 	.data : {
+		INIT_TASK_DATA(THREAD_SIZE)
 		DATA_DATA
 		CONSTRUCTORS
 	}
-- 
1.6.3.3
