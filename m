From: Helge Deller <deller@gmx.de>
Subject: [PATCH] alpha: Fix bootpfile and bootpzfile make targets
Date: Mon, 23 Mar 2015 22:47:21 +0100
Message-ID: <20150323214721.GA5025@ls3530.box>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: Michael Cree <mcree@orcon.net.nz>

Fix the bootpfile and bootpzfile make targets to creat BOOTP images.
Both targets were broken due to some missing defines to re-map ELF
constants. In addition the old code used the generic vsprintf function
of the kernel which we now replace by a simple and much smaller
implementation for the bootloader.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
index cd14388..8399bd0 100644
--- a/arch/alpha/boot/Makefile
+++ b/arch/alpha/boot/Makefile
@@ -14,6 +14,9 @@ targets		:= vmlinux.gz vmlinux \
 		   tools/bootpzh bootloader bootpheader bootpzheader 
 OBJSTRIP	:= $(obj)/tools/objstrip
 
+HOSTCFLAGS	:= -Wall -I$(objtree)/usr/include
+BOOTCFLAGS	+= -I$(obj) -I$(srctree)/$(obj)
+
 # SRM bootable image.  Copy to offset 512 of a partition.
 $(obj)/bootimage: $(addprefix $(obj)/tools/,mkbb lxboot bootlx) $(obj)/vmlinux.nh
 	( cat $(obj)/tools/lxboot $(obj)/tools/bootlx $(obj)/vmlinux.nh ) > $@ 
@@ -96,13 +99,14 @@ $(obj)/tools/bootph: $(obj)/bootpheader $(OBJSTRIP) FORCE
 $(obj)/tools/bootpzh: $(obj)/bootpzheader $(OBJSTRIP) FORCE
 	$(call if_changed,objstrip)
 
-LDFLAGS_bootloader   := -static -uvsprintf -T  #-N -relax
-LDFLAGS_bootpheader  := -static -uvsprintf -T  #-N -relax
-LDFLAGS_bootpzheader := -static -uvsprintf -T  #-N -relax
+LDFLAGS_bootloader   := -static -T # -N -relax
+LDFLAGS_bootloader   := -static -T # -N -relax
+LDFLAGS_bootpheader  := -static -T # -N -relax
+LDFLAGS_bootpzheader := -static -T # -N -relax
 
-OBJ_bootlx   := $(obj)/head.o $(obj)/main.o
-OBJ_bootph   := $(obj)/head.o $(obj)/bootp.o
-OBJ_bootpzh  := $(obj)/head.o $(obj)/bootpz.o $(obj)/misc.o
+OBJ_bootlx   := $(obj)/head.o $(obj)/stdio.o $(obj)/main.o
+OBJ_bootph   := $(obj)/head.o $(obj)/stdio.o $(obj)/bootp.o
+OBJ_bootpzh  := $(obj)/head.o $(obj)/stdio.o $(obj)/bootpz.o $(obj)/misc.o
 
 $(obj)/bootloader: $(obj)/bootloader.lds $(OBJ_bootlx) $(LIBS_Y) FORCE
 	$(call if_changed,ld)
diff --git a/arch/alpha/boot/main.c b/arch/alpha/boot/main.c
index 3baf2d1..dd6eb4a 100644
--- a/arch/alpha/boot/main.c
+++ b/arch/alpha/boot/main.c
@@ -19,7 +19,6 @@
 
 #include "ksize.h"
 
-extern int vsprintf(char *, const char *, va_list);
 extern unsigned long switch_to_osf_pal(unsigned long nr,
 	struct pcb_struct * pcb_va, struct pcb_struct * pcb_pa,
 	unsigned long *vptb);
diff --git a/arch/alpha/boot/stdio.c b/arch/alpha/boot/stdio.c
new file mode 100644
index 0000000..f844dae
--- /dev/null
+++ b/arch/alpha/boot/stdio.c
@@ -0,0 +1,306 @@
+/*
+ * Copyright (C) Paul Mackerras 1997.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+#include <stdarg.h>
+#include <stddef.h>
+
+size_t strnlen(const char * s, size_t count)
+{
+	const char *sc;
+
+	for (sc = s; count-- && *sc != '\0'; ++sc)
+		/* nothing */;
+	return sc - s;
+}
+
+# define do_div(n, base) ({						\
+	unsigned int __base = (base);					\
+	unsigned int __rem;						\
+	__rem = ((unsigned long long)(n)) % __base;			\
+	(n) = ((unsigned long long)(n)) / __base;			\
+	__rem;								\
+})
+
+
+static int skip_atoi(const char **s)
+{
+	int i, c;
+
+	for (i = 0; '0' <= (c = **s) && c <= '9'; ++*s)
+		i = i*10 + c - '0';
+	return i;
+}
+
+#define ZEROPAD	1		/* pad with zero */
+#define SIGN	2		/* unsigned/signed long */
+#define PLUS	4		/* show plus */
+#define SPACE	8		/* space if plus */
+#define LEFT	16		/* left justified */
+#define SPECIAL	32		/* 0x */
+#define LARGE	64		/* use 'ABCDEF' instead of 'abcdef' */
+
+static char * number(char * str, unsigned long long num, int base, int size, int precision, int type)
+{
+	char c,sign,tmp[66];
+	const char *digits="0123456789abcdefghijklmnopqrstuvwxyz";
+	int i;
+
+	if (type & LARGE)
+		digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
+	if (type & LEFT)
+		type &= ~ZEROPAD;
+	if (base < 2 || base > 36)
+		return 0;
+	c = (type & ZEROPAD) ? '0' : ' ';
+	sign = 0;
+	if (type & SIGN) {
+		if ((signed long long)num < 0) {
+			sign = '-';
+			num = - (signed long long)num;
+			size--;
+		} else if (type & PLUS) {
+			sign = '+';
+			size--;
+		} else if (type & SPACE) {
+			sign = ' ';
+			size--;
+		}
+	}
+	if (type & SPECIAL) {
+		if (base == 16)
+			size -= 2;
+		else if (base == 8)
+			size--;
+	}
+	i = 0;
+	if (num == 0)
+		tmp[i++]='0';
+	else while (num != 0) {
+		tmp[i++] = digits[do_div(num, base)];
+	}
+	if (i > precision)
+		precision = i;
+	size -= precision;
+	if (!(type&(ZEROPAD+LEFT)))
+		while(size-->0)
+			*str++ = ' ';
+	if (sign)
+		*str++ = sign;
+	if (type & SPECIAL) {
+		if (base==8)
+			*str++ = '0';
+		else if (base==16) {
+			*str++ = '0';
+			*str++ = digits[33];
+		}
+	}
+	if (!(type & LEFT))
+		while (size-- > 0)
+			*str++ = c;
+	while (i < precision--)
+		*str++ = '0';
+	while (i-- > 0)
+		*str++ = tmp[i];
+	while (size-- > 0)
+		*str++ = ' ';
+	return str;
+}
+
+int vsprintf(char *buf, const char *fmt, va_list args)
+{
+	int len;
+	unsigned long long num;
+	int i, base;
+	char * str;
+	const char *s;
+
+	int flags;		/* flags to number() */
+
+	int field_width;	/* width of output field */
+	int precision;		/* min. # of digits for integers; max
+				   number of chars for from string */
+	int qualifier;		/* 'h', 'l', or 'L' for integer fields */
+	                        /* 'z' support added 23/7/1999 S.H.    */
+				/* 'z' changed to 'Z' --davidm 1/25/99 */
+
+
+	for (str=buf ; *fmt ; ++fmt) {
+		if (*fmt != '%') {
+			*str++ = *fmt;
+			continue;
+		}
+
+		/* process flags */
+		flags = 0;
+		repeat:
+			++fmt;		/* this also skips first '%' */
+			switch (*fmt) {
+				case '-': flags |= LEFT; goto repeat;
+				case '+': flags |= PLUS; goto repeat;
+				case ' ': flags |= SPACE; goto repeat;
+				case '#': flags |= SPECIAL; goto repeat;
+				case '0': flags |= ZEROPAD; goto repeat;
+				}
+
+		/* get field width */
+		field_width = -1;
+		if ('0' <= *fmt && *fmt <= '9')
+			field_width = skip_atoi(&fmt);
+		else if (*fmt == '*') {
+			++fmt;
+			/* it's the next argument */
+			field_width = va_arg(args, int);
+			if (field_width < 0) {
+				field_width = -field_width;
+				flags |= LEFT;
+			}
+		}
+
+		/* get the precision */
+		precision = -1;
+		if (*fmt == '.') {
+			++fmt;
+			if ('0' <= *fmt && *fmt <= '9')
+				precision = skip_atoi(&fmt);
+			else if (*fmt == '*') {
+				++fmt;
+				/* it's the next argument */
+				precision = va_arg(args, int);
+			}
+			if (precision < 0)
+				precision = 0;
+		}
+
+		/* get the conversion qualifier */
+		qualifier = -1;
+		if (*fmt == 'l' && *(fmt + 1) == 'l') {
+			qualifier = 'q';
+			fmt += 2;
+		} else if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L'
+			|| *fmt == 'Z') {
+			qualifier = *fmt;
+			++fmt;
+		}
+
+		/* default base */
+		base = 10;
+
+		switch (*fmt) {
+		case 'c':
+			if (!(flags & LEFT))
+				while (--field_width > 0)
+					*str++ = ' ';
+			*str++ = (unsigned char) va_arg(args, int);
+			while (--field_width > 0)
+				*str++ = ' ';
+			continue;
+
+		case 's':
+			s = va_arg(args, char *);
+			if (!s)
+				s = "<NULL>";
+
+			len = strnlen(s, precision);
+
+			if (!(flags & LEFT))
+				while (len < field_width--)
+					*str++ = ' ';
+			for (i = 0; i < len; ++i)
+				*str++ = *s++;
+			while (len < field_width--)
+				*str++ = ' ';
+			continue;
+
+		case 'p':
+			if (field_width == -1) {
+				field_width = 2*sizeof(void *);
+				flags |= ZEROPAD;
+			}
+			str = number(str,
+				(unsigned long) va_arg(args, void *), 16,
+				field_width, precision, flags);
+			continue;
+
+
+		case 'n':
+			if (qualifier == 'l') {
+				long * ip = va_arg(args, long *);
+				*ip = (str - buf);
+			} else if (qualifier == 'Z') {
+				size_t * ip = va_arg(args, size_t *);
+				*ip = (str - buf);
+			} else {
+				int * ip = va_arg(args, int *);
+				*ip = (str - buf);
+			}
+			continue;
+
+		case '%':
+			*str++ = '%';
+			continue;
+
+		/* integer number formats - set up the flags and "break" */
+		case 'o':
+			base = 8;
+			break;
+
+		case 'X':
+			flags |= LARGE;
+		case 'x':
+			base = 16;
+			break;
+
+		case 'd':
+		case 'i':
+			flags |= SIGN;
+		case 'u':
+			break;
+
+		default:
+			*str++ = '%';
+			if (*fmt)
+				*str++ = *fmt;
+			else
+				--fmt;
+			continue;
+		}
+		if (qualifier == 'l') {
+			num = va_arg(args, unsigned long);
+			if (flags & SIGN)
+				num = (signed long) num;
+		} else if (qualifier == 'q') {
+			num = va_arg(args, unsigned long long);
+			if (flags & SIGN)
+				num = (signed long long) num;
+		} else if (qualifier == 'Z') {
+			num = va_arg(args, size_t);
+		} else if (qualifier == 'h') {
+			num = (unsigned short) va_arg(args, int);
+			if (flags & SIGN)
+				num = (signed short) num;
+		} else {
+			num = va_arg(args, unsigned int);
+			if (flags & SIGN)
+				num = (signed int) num;
+		}
+		str = number(str, num, base, field_width, precision, flags);
+	}
+	*str = '\0';
+	return str-buf;
+}
+
+int sprintf(char * buf, const char *fmt, ...)
+{
+	va_list args;
+	int i;
+
+	va_start(args, fmt);
+	i=vsprintf(buf,fmt,args);
+	va_end(args);
+	return i;
+}
diff --git a/arch/alpha/boot/tools/objstrip.c b/arch/alpha/boot/tools/objstrip.c
index 367d53d..dee8269 100644
--- a/arch/alpha/boot/tools/objstrip.c
+++ b/arch/alpha/boot/tools/objstrip.c
@@ -27,6 +27,9 @@
 #include <linux/param.h>
 #ifdef __ELF__
 # include <linux/elf.h>
+# define elfhdr elf64_hdr
+# define elf_phdr elf64_phdr
+# define elf_check_arch(x) ((x)->e_machine == EM_ALPHA)
 #endif
 
 /* bootfile size must be multiple of BLOCK_SIZE: */
