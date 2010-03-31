From: "Morten Holst Larsen" <m-larsen@post6.tele.dk>
Subject: Resend: [PATCH] Detect Super IO chip, no IDE on Avanti, enable EPP19
Date: Wed, 31 Mar 2010 20:54:10 +0200
Message-ID: <91A43CC268C145CA9F34DA08AD4F25D5@morten>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: linux-alpha@vger.kernel.org
Cc: mattst88@gmail.com, ink@jurassic.park.msu.ru, rth@twiddle.net

A resend on request from Matt Turner.

/Morten

----- Original Message ----- 

This patch probes for the Super IO chip and reserves the IO range when 
found.
It avoids enabling the IDE interface on the Avanti family, since none had 
IDE.
It enables the Enhanced Parallel Port v1.9 feature.

Signed-off-by: Morten H. Larsen m-larsen@post6.tele.dk

diff -uNr a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
--- a/arch/alpha/kernel/Makefile 2010-01-22 00:31:35.000000000 +0100
+++ b/arch/alpha/kernel/Makefile 2010-02-12 14:50:33.000000000 +0100
@@ -35,7 +35,7 @@
obj-y += irq_pyxis.o irq_i8259.o irq_srm.o
obj-y += err_ev6.o
-obj-y += es1888.o smc37c669.o smc37c93x.o ns87312.o gct.o
+obj-y += es1888.o smc37c669.o smc37c93x.o pc873xx.o gct.o
obj-y += srmcons.o
else
@@ -63,11 +63,11 @@
# Board support
obj-$(CONFIG_ALPHA_ALCOR) += sys_alcor.o irq_i8259.o irq_srm.o
obj-$(CONFIG_ALPHA_CABRIOLET) += sys_cabriolet.o irq_i8259.o irq_srm.o \
- ns87312.o
+ pc873xx.o
obj-$(CONFIG_ALPHA_EB164) += sys_cabriolet.o irq_i8259.o irq_srm.o \
- ns87312.o
+ pc873xx.o
obj-$(CONFIG_ALPHA_EB66P) += sys_cabriolet.o irq_i8259.o irq_srm.o \
- ns87312.o
+ pc873xx.o
obj-$(CONFIG_ALPHA_LX164) += sys_cabriolet.o irq_i8259.o irq_srm.o \
smc37c93x.o
obj-$(CONFIG_ALPHA_PC164) += sys_cabriolet.o irq_i8259.o irq_srm.o \
@@ -90,14 +90,14 @@
obj-$(CONFIG_ALPHA_RX164) += sys_rx164.o irq_i8259.o
obj-$(CONFIG_ALPHA_SABLE) += sys_sable.o
obj-$(CONFIG_ALPHA_LYNX) += sys_sable.o
-obj-$(CONFIG_ALPHA_BOOK1) += sys_sio.o irq_i8259.o irq_srm.o ns87312.o
-obj-$(CONFIG_ALPHA_AVANTI) += sys_sio.o irq_i8259.o irq_srm.o ns87312.o
-obj-$(CONFIG_ALPHA_NONAME) += sys_sio.o irq_i8259.o irq_srm.o ns87312.o
-obj-$(CONFIG_ALPHA_P2K) += sys_sio.o irq_i8259.o irq_srm.o ns87312.o
-obj-$(CONFIG_ALPHA_XL) += sys_sio.o irq_i8259.o irq_srm.o ns87312.o
+obj-$(CONFIG_ALPHA_BOOK1) += sys_sio.o irq_i8259.o irq_srm.o pc873xx.o
+obj-$(CONFIG_ALPHA_AVANTI) += sys_sio.o irq_i8259.o irq_srm.o pc873xx.o
+obj-$(CONFIG_ALPHA_NONAME) += sys_sio.o irq_i8259.o irq_srm.o pc873xx.o
+obj-$(CONFIG_ALPHA_P2K) += sys_sio.o irq_i8259.o irq_srm.o pc873xx.o
+obj-$(CONFIG_ALPHA_XL) += sys_sio.o irq_i8259.o irq_srm.o pc873xx.o
obj-$(CONFIG_ALPHA_SX164) += sys_sx164.o irq_pyxis.o irq_i8259.o \
irq_srm.o smc37c669.o
-obj-$(CONFIG_ALPHA_TAKARA) += sys_takara.o irq_i8259.o ns87312.o
+obj-$(CONFIG_ALPHA_TAKARA) += sys_takara.o irq_i8259.o pc873xx.o
obj-$(CONFIG_ALPHA_WILDFIRE) += sys_wildfire.o irq_i8259.o
# Error support
diff -uNr a/arch/alpha/kernel/ns87312.c b/arch/alpha/kernel/ns87312.c
--- a/arch/alpha/kernel/ns87312.c 2010-01-22 00:31:35.000000000 +0100
+++ b/arch/alpha/kernel/ns87312.c 1970-01-01 01:00:00.000000000 +0100
@@ -1,38 +0,0 @@
-/*
- * linux/arch/alpha/kernel/ns87312.c
- */
-
-#include <linux/init.h>
-#include <asm/io.h>
-#include "proto.h"
-
-
-/*
- * The SRM console *disables* the IDE interface, this code ensures it's
- * enabled.
- *
- * This code bangs on a control register of the 87312 Super I/O chip
- * that implements parallel port/serial ports/IDE/FDI. Depending on
- * the motherboard, the Super I/O chip can be configured through a
- * pair of registers that are located either at I/O ports 0x26e/0x26f
- * or 0x398/0x399. Unfortunately, autodetecting which base address is
- * in use works only once (right after a reset). The Super I/O chip
- * has the additional quirk that configuration register data must be
- * written twice (I believe this is a safety feature to prevent
- * accidental modification---fun, isn't it?).
- */
-
-void __init
-ns87312_enable_ide(long ide_base)
-{
- int data;
- unsigned long flags;
-
- local_irq_save(flags);
- outb(0, ide_base); /* set the index register for reg #0 */
- data = inb(ide_base+1); /* read the current contents */
- outb(0, ide_base); /* set the index register for reg #0 */
- outb(data | 0x40, ide_base+1); /* turn on IDE */
- outb(data | 0x40, ide_base+1); /* turn on IDE, really! */
- local_irq_restore(flags);
-}
diff -uNr a/arch/alpha/kernel/pc873xx.c b/arch/alpha/kernel/pc873xx.c
--- a/arch/alpha/kernel/pc873xx.c 1970-01-01 01:00:00.000000000 +0100
+++ b/arch/alpha/kernel/pc873xx.c 2010-02-12 14:50:33.000000000 +0100
@@ -0,0 +1,88 @@
+#include <linux/ioport.h>
+#include <asm/io.h>
+
+#include "pc873xx.h"
+
+static unsigned pc873xx_probelist[] = {0x398, 0x26e, 0};
+
+static char *pc873xx_names[] = {
+ "PC87303", "PC87306", "PC87312", "PC87332", "PC87334"
+};
+
+static unsigned int base, model;
+
+
+unsigned int __init pc873xx_get_base()
+{
+ return base;
+}
+
+char* __init pc873xx_get_model()
+{
+ return pc873xx_names[model];
+}
+
+static unsigned char __init pc873xx_read(unsigned int base, int reg)
+{
+ outb(reg, base);
+ return inb(base + 1);
+}
+
+static void __init pc873xx_write(unsigned int base, int reg, unsigned char
data)
+{
+ unsigned long flags;
+
+ local_irq_save(flags);
+ outb(reg, base);
+ outb(data, base + 1);
+ outb(data, base + 1); /* Must be written twice */
+ local_irq_restore(flags);
+}
+
+int __init pc873xx_probe(void)
+{
+ int val, index = 0;
+
+ while ((base = pc873xx_probelist[index++])) {
+
+ if (request_region(base, 2, "Super IO PC873xx") == NULL)
+ continue;
+
+ val = pc873xx_read(base, REG_SID);
+ if ((val & 0xf0) == 0x10) {
+ model = PC87332;
+ break;
+ } else if ((val & 0xf8) == 0x70) {
+ model = PC87306;
+ break;
+ } else if ((val & 0xf8) == 0x50) {
+ model = PC87334;
+ break;
+ } else if ((val & 0xf8) == 0x40) {
+ model = PC87303;
+ break;
+ }
+
+ release_region(base, 2);
+ }
+
+ return (base == 0) ? -1 : 1;
+}
+
+void __init pc873xx_enable_epp19(void)
+{
+ unsigned char data;
+
+ printk(KERN_INFO "PC873xx enabling EPP v1.9\n");
+ data = pc873xx_read(base, REG_PCR);
+ pc873xx_write(base, REG_PCR, (data & 0xFC) | 0x02);
+}
+
+void __init pc873xx_enable_ide(void)
+{
+ unsigned char data;
+
+ printk(KERN_INFO "PC873xx enabling IDE interrupt\n");
+ data = pc873xx_read(base, REG_FER);
+ pc873xx_write(base, REG_FER, data | 0x40);
+}
diff -uNr a/arch/alpha/kernel/pc873xx.h b/arch/alpha/kernel/pc873xx.h
--- a/arch/alpha/kernel/pc873xx.h 1970-01-01 01:00:00.000000000 +0100
+++ b/arch/alpha/kernel/pc873xx.h 2010-02-12 14:50:33.000000000 +0100
@@ -0,0 +1,35 @@
+
+#ifndef _PC873xx_H_
+#define _PC873xx_H_
+
+/*
+ * Control Register Values
+ */
+#define REG_FER 0x00
+#define REG_FAR 0x01
+#define REG_PTR 0x02
+#define REG_FCR 0x03
+#define REG_PCR 0x04
+#define REG_KRR 0x05
+#define REG_PMC 0x06
+#define REG_TUP 0x07
+#define REG_SID 0x08
+#define REG_ASC 0x09
+#define REG_IRC 0x0e
+
+/*
+ * Model numbers
+ */
+#define PC87303 0
+#define PC87306 1
+#define PC87312 2
+#define PC87332 3
+#define PC87334 4
+
+int pc873xx_probe(void);
+unsigned int pc873xx_get_base(void);
+char* pc873xx_get_model(void);
+void pc873xx_enable_epp19(void);
+void pc873xx_enable_ide(void);
+
+#endif
diff -uNr a/arch/alpha/kernel/sys_sio.c b/arch/alpha/kernel/sys_sio.c
--- a/arch/alpha/kernel/sys_sio.c 2010-01-22 00:31:35.000000000 +0100
+++ b/arch/alpha/kernel/sys_sio.c 2010-02-12 15:53:45.000000000 +0100
@@ -34,6 +34,7 @@
#include "irq_impl.h"
#include "pci_impl.h"
#include "machvec_impl.h"
+#include "pc873xx.h"
#if defined(ALPHA_RESTORE_SRM_SETUP)
/* Save LCA configuration data as the console had it set up. */
@@ -208,7 +209,27 @@
common_init_pci();
sio_pci_route();
sio_fixup_irq_levels(sio_collect_irq_levels());
- ns87312_enable_ide(0x26e);
+
+ if (pc873xx_probe() == -1) {
+ printk(KERN_ERR "Probing for PC873xx Super IO chip failed.\n");
+ } else {
+ printk(KERN_INFO "Found %s Super IO chip at 0x%x\n",
+ pc873xx_get_model(), pc873xx_get_base());
+
+ /* Enabling things in the Super IO chip doesn't actually
+ * configure and enable things, the legacy drivers still
+ * need to do the actual configuration and enabling.
+ * This only unblocks them.
+ */
+
+#if !defined(CONFIG_ALPHA_AVANTI)
+ /* Don't bother on the Avanti family.
+ * None of them had on-board IDE.
+ */
+ pc873xx_enable_ide();
+#endif
+ pc873xx_enable_epp19();
+ }
}
static inline void __init

