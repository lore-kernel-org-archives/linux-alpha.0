From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH v2 5/6] Add new READ_MOSTLY_DATA(align) linker script macro.
Date: Thu, 30 Apr 2009 15:54:12 -0400
Message-ID: <1241121253-32341-6-git-send-email-tabbott@mit.edu>
References: <1241121253-32341-1-git-send-email-tabbott@mit.edu>
 <1241121253-32341-2-git-send-email-tabbott@mit.edu>
 <1241121253-32341-3-git-send-email-tabbott@mit.edu>
 <1241121253-32341-4-git-send-email-tabbott@mit.edu>
 <1241121253-32341-5-git-send-email-tabbott@mit.edu>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1241121253-32341-5-git-send-email-tabbott@mit.edu>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-Id: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, Anders Kaseorg <andersk@mit.edu>, Waseem Daher <wdaher@mit.edu>, Denys Vlasenko <vda.linux@googlemail.com>, Jeff Arnold <jbarnold@mit.edu>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bryan Wu <cooloney@kernel.org>, Chris Zankel <chris@zankel.net>, Cyrill Gorcunov <gorcunov@openvz.org>, David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, dev-etrax@axis.com, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Helge Deller <deller@gmx.de>, Hirokazu Takata <takata@linux-m32r.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jeff Dike <jdike@addtoit.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Kyle McMartin <kyle@mcmartin.ca>, Linus Torvalds <>

This patch is preparation for replacing most ".data.read_mostly" in
the kernel with macros, so that the section name can later be changed
without having to touch a lot of the kernel.

The long-term goal here is to be able to change the kernel's magic
section names to those that are compatible with -ffunction-sections
-fdata-sections.  This requires renaming all magic sections with names
of the form ".data.foo".

Signed-off-by: Tim Abbott <tabbott@mit.edu>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 include/asm-generic/vmlinux.lds.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 4b020e8..a4b4f4a 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -139,6 +139,10 @@
 	. = ALIGN(alignment);						\
 	*(.data.init_task)
 
+#define READ_MOSTLY_DATA(alignment)					\
+	. = ALIGN(alignment);						\
+	*(.data.read_mostly)
+
 #define RO_DATA(align)							\
 	. = ALIGN((align));						\
 	.rodata           : AT(ADDR(.rodata) - LOAD_OFFSET) {		\
-- 
1.6.2.1


