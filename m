From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH 1/6] Add new macros for page-aligned data and bss sections.
Date: Thu, 30 Apr 2009 15:32:31 -0400
Message-ID: <1241119956-31453-2-git-send-email-tabbott@mit.edu>
References: <1241119956-31453-1-git-send-email-tabbott@mit.edu>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1241119956-31453-1-git-send-email-tabbott@mit.edu>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-Id: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Anders Kaseorg <andersk@mit.edu>, Waseem Daher <wdaher@mit.edu>, Denys Vlasenko <vda.linux@googlemail.com>, Jeff Arnold <jbarnold@mit.edu>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bryan Wu <cooloney@kernel.org>, Chris Zankel <chris@zankel.net>, Cyrill Gorcunov <gorcunov@openvz.org>, David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, dev-etrax@axis.com, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Helge Deller <deller@gmx.de>, Hirokazu Takata <takata@linux-m32r.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jeff Dike <jdike@addtoit.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Kyle McMartin <kyle@mcmartin.ca>, Linus Torvalds <torvalds@linux-foundation.org>, linux-alpha@vger.kernel.org

This patch is preparation for replacing most uses of
".bss.page_aligned" and ".data.page_aligned" in the kernel with
macros, so that the section name can later be changed without having
to touch a lot of the kernel.

The long-term goal here is to be able to change the kernel's magic
section names to those that are compatible with -ffunction-sections
-fdata-sections.  This requires renaming all magic sections with names
of the form ".data.foo".

Signed-off-by: Tim Abbott <tabbott@mit.edu>
Cc: Sam Ravnborg <sam@ravnborg.org>
Acked-by: David Howells <dhowells@redhat.com>
---
 include/asm-generic/vmlinux.lds.h |    8 ++++++++
 include/linux/linkage.h           |    9 +++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 89853bc..3d88c87 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -116,6 +116,14 @@
 	FTRACE_EVENTS()							\
 	TRACE_SYSCALLS()
 
+#define PAGE_ALIGNED_DATA						\
+	. = ALIGN(PAGE_SIZE);						\
+	*(.data.page_aligned)
+
+#define PAGE_ALIGNED_BSS						\
+	. = ALIGN(PAGE_SIZE);						\
+	*(.bss.page_aligned)
+
 #define RO_DATA(align)							\
 	. = ALIGN((align));						\
 	.rodata           : AT(ADDR(.rodata) - LOAD_OFFSET) {		\
diff --git a/include/linux/linkage.h b/include/linux/linkage.h
index fee9e59..af051fc 100644
--- a/include/linux/linkage.h
+++ b/include/linux/linkage.h
@@ -22,6 +22,15 @@
 #define __page_aligned_bss	__section(.bss.page_aligned) __aligned(PAGE_SIZE)
 
 /*
+ * For assembly routines.
+ *
+ * Note when using these that you must specify the appropriate
+ * alignment directives yourself
+ */
+#define __PAGE_ALIGNED_DATA	.section ".data.page_aligned", "aw", @progbits
+#define __PAGE_ALIGNED_BSS	.section ".bss.page_aligned", "aw", @nobits
+
+/*
  * This is used by architectures to keep arguments on the stack
  * untouched by the compiler by keeping them live until the end.
  * The argument stack may be owned by the assembly-language
-- 
1.6.2.1


