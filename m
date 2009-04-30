From: Tim Abbott <tabbott-DPNOqEs/LNQ@public.gmane.org>
Subject: [PATCH v2 1/6] Add new macros for page-aligned data and bss sections.
Date: Thu, 30 Apr 2009 15:54:08 -0400
Message-ID: <1241121253-32341-2-git-send-email-tabbott@mit.edu>
References: <1241121253-32341-1-git-send-email-tabbott@mit.edu>
Reply-To: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
Return-path: <owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org>
In-Reply-To: <1241121253-32341-1-git-send-email-tabbott-3s7WtUTddSA@public.gmane.org>
Sender: owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org
List-Id: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Cc: Linux kernel mailing list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Anders Kaseorg <andersk-DPNOqEs/LNQ@public.gmane.org>, Waseem Daher <wdaher-DPNOqEs/LNQ@public.gmane.org>, Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jeff Arnold <jbarnold-DPNOqEs/LNQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Bryan Wu <cooloney-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, dev-etrax-VrBV9hrLPhE@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Greg Ungerer <gerg-JBU5SbJe1FlAfugRpC6u6w@public.gmane.org>, Haavard Skinnemoen <hskinnemoen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, Hirokazu Takata <takata-TMSiXQfHlQjsTix1lMzHGQ@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jeff Dike <jdike@addtoit>

This patch is preparation for replacing most uses of
".bss.page_aligned" and ".data.page_aligned" in the kernel with
macros, so that the section name can later be changed without having
to touch a lot of the kernel.

The long-term goal here is to be able to change the kernel's magic
section names to those that are compatible with -ffunction-sections
-fdata-sections.  This requires renaming all magic sections with names
of the form ".data.foo".

Signed-off-by: Tim Abbott <tabbott-3s7WtUTddSA@public.gmane.org>
Cc: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Acked-by: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
