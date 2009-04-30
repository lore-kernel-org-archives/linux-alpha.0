From: Tim Abbott <tabbott-DPNOqEs/LNQ@public.gmane.org>
Subject: [PATCH v2 2/6] Add new NOSAVE_DATA linker script macro.
Date: Thu, 30 Apr 2009 15:54:09 -0400
Message-ID: <1241121253-32341-3-git-send-email-tabbott@mit.edu>
References: <1241121253-32341-1-git-send-email-tabbott@mit.edu>
 <1241121253-32341-2-git-send-email-tabbott@mit.edu>
Reply-To: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
Return-path: <owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org>
In-Reply-To: <1241121253-32341-2-git-send-email-tabbott-3s7WtUTddSA@public.gmane.org>
Sender: owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org
List-Id: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Cc: Linux kernel mailing list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Anders Kaseorg <andersk-DPNOqEs/LNQ@public.gmane.org>, Waseem Daher <wdaher-DPNOqEs/LNQ@public.gmane.org>, Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jeff Arnold <jbarnold-DPNOqEs/LNQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Bryan Wu <cooloney-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, dev-etrax-VrBV9hrLPhE@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Greg Ungerer <gerg-JBU5SbJe1FlAfugRpC6u6w@public.gmane.org>, Haavard Skinnemoen <hskinnemoen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, Hirokazu Takata <takata-TMSiXQfHlQjsTix1lMzHGQ@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jeff Dike <jdike@addtoit>

This patch is preparation for replacing most ".data.nosave" in the
kernel with macros, so that the section name can later be changed
without having to touch a lot of the kernel.

The long-term goal here is to be able to change the kernel's magic
section names to those that are compatible with -ffunction-sections
-fdata-sections.  This requires renaming all magic sections with names
of the form ".data.foo".

Signed-off-by: Tim Abbott <tabbott-3s7WtUTddSA@public.gmane.org>
Cc: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
---
 include/asm-generic/vmlinux.lds.h |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 3d88c87..f5ebd2b 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -124,6 +124,13 @@
 	. = ALIGN(PAGE_SIZE);						\
 	*(.bss.page_aligned)
 
+#define NOSAVE_DATA							\
+	. = ALIGN(PAGE_SIZE);						\
+	__nosave_begin = .;						\
+	*(.data.nosave)							\
+	. = ALIGN(PAGE_SIZE);						\
+	__nosave_end = .;
+
 #define RO_DATA(align)							\
 	. = ALIGN((align));						\
 	.rodata           : AT(ADDR(.rodata) - LOAD_OFFSET) {		\
-- 
1.6.2.1
