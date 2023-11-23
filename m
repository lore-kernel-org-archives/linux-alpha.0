Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="gjVw0/bR"
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA87210EF
	for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 10:03:10 -0800 (PST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 84AA340DB4
	for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 18:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1700762589;
	bh=t/aBrAkZqTiWY/zs87nQmy2lYsgikda8sYn2IKoRE00=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=gjVw0/bROS07qMcnRIXC2RQ9opEv6h8HSbLQ+SJHuStKX+MvHLsYeh7gAHe+X/dgE
	 18yVtZLFcupqrNc2Ikd5WMDJR+54OcOGKByR2FIChq26e5b77tHiE0zQRVUsGLACht
	 myVhwjLRHmVE4JGovYShKRuH6NOiVWEVjyg1oVWJRvGHmgvWOVtpBo7FZXSN6BWez4
	 tMIYpbkU5NDGTGQmrKSCIO3O0gk7gFCMrFxMdeqQpET3sMZrJiw2+liVyOFqmLxuJN
	 TQ16CHBn2DpNcAd744ckW/Zs5VlG7a0oa8iRRn8DlNRV1TxM9zJvyJJ7p0jDemxbIq
	 6Fn1HBLADRfbA==
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-407da05ee50so5537025e9.0
        for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 10:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700762588; x=1701367388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/aBrAkZqTiWY/zs87nQmy2lYsgikda8sYn2IKoRE00=;
        b=QbeVSRfR+jKsltPWwopK9DUY5amSSQHVRTRrIi+LXWEazRptiiDdA0IXgR4vqFF7bR
         CEZQg0AkhbbqYNQfnQGHZV+vcP9SDRivpsviTvzTw389w+73IIxnx6O/XL7hMTUsPKYw
         Rm5NdAS0XGgJlPTl4itp6yPq0QmsgKwGnBkRjrc4t4AV9SHKQkajsd8ibdqRVxgytWzX
         UWmmXnh2eRewd0fw4gFFXtsgLjV8qebS2mro4ZdQYWTr4J5L2RKESDUWM9/HcqRt27+j
         rHBx/NMJwKc3lLHt9+qBiSSzureWa0ASfr9bDDbyhLuuwSV7RWAPwGuGSMfSriqHhRM0
         mEjg==
X-Gm-Message-State: AOJu0Yz5NFoeJSxT9/8A0+oUfklMWX9WQp7Qs7GIEZTuZL8ZpDjtl4M9
	+KpEO2ER5vrX+bMazTxY5OXmF06PtVMWp1EEQIbkBL7k3LGqlTWahwX9hGQT4kV3RkwoKXZ9BFj
	eEozcI7TX4t0vWmX7xiEkcaGTky8MfOBGVqeVKOtmcqlyMJGxZJI=
X-Received: by 2002:a05:600c:474d:b0:40b:32e7:2ffa with SMTP id w13-20020a05600c474d00b0040b32e72ffamr271270wmo.20.1700762588475;
        Thu, 23 Nov 2023 10:03:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8Q6NswtGoDI9lkAn7zo2wnXhnnopBO0NquctGmUKJYZdwH4RCt7AP4kGBLufiPOaSKbc5LA==
X-Received: by 2002:a05:600c:474d:b0:40b:32e7:2ffa with SMTP id w13-20020a05600c474d00b0040b32e72ffamr271257wmo.20.1700762588111;
        Thu, 23 Nov 2023 10:03:08 -0800 (PST)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
        by smtp.gmail.com with ESMTPSA id bd12-20020a05600c1f0c00b0040b3027ddc5sm3417227wmb.37.2023.11.23.10.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:03:07 -0800 (PST)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: linux-alpha@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] uapi: remove a.out.h uapi header
Date: Thu, 23 Nov 2023 18:02:45 +0000
Message-Id: <20231123180246.750674-6-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123180246.750674-1-dimitri.ledkov@canonical.com>
References: <20231123180246.750674-1-dimitri.ledkov@canonical.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop shipping a.out.h uapi headers, unused.

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 include/uapi/Kbuild        |   4 -
 include/uapi/linux/a.out.h | 251 -------------------------------------
 2 files changed, 255 deletions(-)
 delete mode 100644 include/uapi/linux/a.out.h

diff --git a/include/uapi/Kbuild b/include/uapi/Kbuild
index 61ee6e59c9..850597437b 100644
--- a/include/uapi/Kbuild
+++ b/include/uapi/Kbuild
@@ -1,8 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-ifeq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/uapi/asm/a.out.h),)
-no-export-headers += linux/a.out.h
-endif
-
 ifeq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/uapi/asm/kvm.h),)
 no-export-headers += linux/kvm.h
 endif
diff --git a/include/uapi/linux/a.out.h b/include/uapi/linux/a.out.h
deleted file mode 100644
index 5fafde3798..0000000000
--- a/include/uapi/linux/a.out.h
+++ /dev/null
@@ -1,251 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI__A_OUT_GNU_H__
-#define _UAPI__A_OUT_GNU_H__
-
-#define __GNU_EXEC_MACROS__
-
-#ifndef __STRUCT_EXEC_OVERRIDE__
-
-#include <asm/a.out.h>
-
-#endif /* __STRUCT_EXEC_OVERRIDE__ */
-
-#ifndef __ASSEMBLY__
-
-/* these go in the N_MACHTYPE field */
-enum machine_type {
-#if defined (M_OLDSUN2)
-  M__OLDSUN2 = M_OLDSUN2,
-#else
-  M_OLDSUN2 = 0,
-#endif
-#if defined (M_68010)
-  M__68010 = M_68010,
-#else
-  M_68010 = 1,
-#endif
-#if defined (M_68020)
-  M__68020 = M_68020,
-#else
-  M_68020 = 2,
-#endif
-#if defined (M_SPARC)
-  M__SPARC = M_SPARC,
-#else
-  M_SPARC = 3,
-#endif
-  /* skip a bunch so we don't run into any of sun's numbers */
-  M_386 = 100,
-  M_MIPS1 = 151,	/* MIPS R3000/R3000 binary */
-  M_MIPS2 = 152		/* MIPS R6000/R4000 binary */
-};
-
-#if !defined (N_MAGIC)
-#define N_MAGIC(exec) ((exec).a_info & 0xffff)
-#endif
-#define N_MACHTYPE(exec) ((enum machine_type)(((exec).a_info >> 16) & 0xff))
-#define N_FLAGS(exec) (((exec).a_info >> 24) & 0xff)
-#define N_SET_INFO(exec, magic, type, flags) \
-	((exec).a_info = ((magic) & 0xffff) \
-	 | (((int)(type) & 0xff) << 16) \
-	 | (((flags) & 0xff) << 24))
-#define N_SET_MAGIC(exec, magic) \
-	((exec).a_info = (((exec).a_info & 0xffff0000) | ((magic) & 0xffff)))
-
-#define N_SET_MACHTYPE(exec, machtype) \
-	((exec).a_info = \
-	 ((exec).a_info&0xff00ffff) | ((((int)(machtype))&0xff) << 16))
-
-#define N_SET_FLAGS(exec, flags) \
-	((exec).a_info = \
-	 ((exec).a_info&0x00ffffff) | (((flags) & 0xff) << 24))
-
-/* Code indicating object file or impure executable.  */
-#define OMAGIC 0407
-/* Code indicating pure executable.  */
-#define NMAGIC 0410
-/* Code indicating demand-paged executable.  */
-#define ZMAGIC 0413
-/* This indicates a demand-paged executable with the header in the text. 
-   The first page is unmapped to help trap NULL pointer references */
-#define QMAGIC 0314
-
-/* Code indicating core file.  */
-#define CMAGIC 0421
-
-#if !defined (N_BADMAG)
-#define N_BADMAG(x)	  (N_MAGIC(x) != OMAGIC		\
-			&& N_MAGIC(x) != NMAGIC		\
-  			&& N_MAGIC(x) != ZMAGIC \
-		        && N_MAGIC(x) != QMAGIC)
-#endif
-
-#define _N_HDROFF(x) (1024 - sizeof (struct exec))
-
-#if !defined (N_TXTOFF)
-#define N_TXTOFF(x) \
- (N_MAGIC(x) == ZMAGIC ? _N_HDROFF((x)) + sizeof (struct exec) : \
-  (N_MAGIC(x) == QMAGIC ? 0 : sizeof (struct exec)))
-#endif
-
-#if !defined (N_DATOFF)
-#define N_DATOFF(x) (N_TXTOFF(x) + (x).a_text)
-#endif
-
-#if !defined (N_TRELOFF)
-#define N_TRELOFF(x) (N_DATOFF(x) + (x).a_data)
-#endif
-
-#if !defined (N_DRELOFF)
-#define N_DRELOFF(x) (N_TRELOFF(x) + N_TRSIZE(x))
-#endif
-
-#if !defined (N_SYMOFF)
-#define N_SYMOFF(x) (N_DRELOFF(x) + N_DRSIZE(x))
-#endif
-
-#if !defined (N_STROFF)
-#define N_STROFF(x) (N_SYMOFF(x) + N_SYMSIZE(x))
-#endif
-
-/* Address of text segment in memory after it is loaded.  */
-#if !defined (N_TXTADDR)
-#define N_TXTADDR(x) (N_MAGIC(x) == QMAGIC ? PAGE_SIZE : 0)
-#endif
-
-/* Address of data segment in memory after it is loaded. */
-#ifndef __KERNEL__
-#include <unistd.h>
-#endif
-#if defined(__i386__) || defined(__mc68000__)
-#define SEGMENT_SIZE	1024
-#else
-#ifndef SEGMENT_SIZE
-#ifndef __KERNEL__
-#define SEGMENT_SIZE   getpagesize()
-#endif
-#endif
-#endif
-
-#define _N_SEGMENT_ROUND(x) ALIGN(x, SEGMENT_SIZE)
-
-#define _N_TXTENDADDR(x) (N_TXTADDR(x)+(x).a_text)
-
-#ifndef N_DATADDR
-#define N_DATADDR(x) \
-    (N_MAGIC(x)==OMAGIC? (_N_TXTENDADDR(x)) \
-     : (_N_SEGMENT_ROUND (_N_TXTENDADDR(x))))
-#endif
-
-/* Address of bss segment in memory after it is loaded.  */
-#if !defined (N_BSSADDR)
-#define N_BSSADDR(x) (N_DATADDR(x) + (x).a_data)
-#endif
-
-#if !defined (N_NLIST_DECLARED)
-struct nlist {
-  union {
-    char *n_name;
-    struct nlist *n_next;
-    long n_strx;
-  } n_un;
-  unsigned char n_type;
-  char n_other;
-  short n_desc;
-  unsigned long n_value;
-};
-#endif /* no N_NLIST_DECLARED.  */
-
-#if !defined (N_UNDF)
-#define N_UNDF 0
-#endif
-#if !defined (N_ABS)
-#define N_ABS 2
-#endif
-#if !defined (N_TEXT)
-#define N_TEXT 4
-#endif
-#if !defined (N_DATA)
-#define N_DATA 6
-#endif
-#if !defined (N_BSS)
-#define N_BSS 8
-#endif
-#if !defined (N_FN)
-#define N_FN 15
-#endif
-
-#if !defined (N_EXT)
-#define N_EXT 1
-#endif
-#if !defined (N_TYPE)
-#define N_TYPE 036
-#endif
-#if !defined (N_STAB)
-#define N_STAB 0340
-#endif
-
-/* The following type indicates the definition of a symbol as being
-   an indirect reference to another symbol.  The other symbol
-   appears as an undefined reference, immediately following this symbol.
-
-   Indirection is asymmetrical.  The other symbol's value will be used
-   to satisfy requests for the indirect symbol, but not vice versa.
-   If the other symbol does not have a definition, libraries will
-   be searched to find a definition.  */
-#define N_INDR 0xa
-
-/* The following symbols refer to set elements.
-   All the N_SET[ATDB] symbols with the same name form one set.
-   Space is allocated for the set in the text section, and each set
-   element's value is stored into one word of the space.
-   The first word of the space is the length of the set (number of elements).
-
-   The address of the set is made into an N_SETV symbol
-   whose name is the same as the name of the set.
-   This symbol acts like a N_DATA global symbol
-   in that it can satisfy undefined external references.  */
-
-/* These appear as input to LD, in a .o file.  */
-#define	N_SETA	0x14		/* Absolute set element symbol */
-#define	N_SETT	0x16		/* Text set element symbol */
-#define	N_SETD	0x18		/* Data set element symbol */
-#define	N_SETB	0x1A		/* Bss set element symbol */
-
-/* This is output from LD.  */
-#define N_SETV	0x1C		/* Pointer to set vector in data area.  */
-
-#if !defined (N_RELOCATION_INFO_DECLARED)
-/* This structure describes a single relocation to be performed.
-   The text-relocation section of the file is a vector of these structures,
-   all of which apply to the text section.
-   Likewise, the data-relocation section applies to the data section.  */
-
-struct relocation_info
-{
-  /* Address (within segment) to be relocated.  */
-  int r_address;
-  /* The meaning of r_symbolnum depends on r_extern.  */
-  unsigned int r_symbolnum:24;
-  /* Nonzero means value is a pc-relative offset
-     and it should be relocated for changes in its own address
-     as well as for changes in the symbol or section specified.  */
-  unsigned int r_pcrel:1;
-  /* Length (as exponent of 2) of the field to be relocated.
-     Thus, a value of 2 indicates 1<<2 bytes.  */
-  unsigned int r_length:2;
-  /* 1 => relocate with value of symbol.
-          r_symbolnum is the index of the symbol
-	  in file's the symbol table.
-     0 => relocate with the address of a segment.
-          r_symbolnum is N_TEXT, N_DATA, N_BSS or N_ABS
-	  (the N_EXT bit may be set also, but signifies nothing).  */
-  unsigned int r_extern:1;
-  /* Four bits that aren't used, but when writing an object file
-     it is desirable to clear them.  */
-  unsigned int r_pad:4;
-};
-#endif /* no N_RELOCATION_INFO_DECLARED.  */
-
-#endif /*__ASSEMBLY__ */
-#endif /* _UAPI__A_OUT_GNU_H__ */
-- 
2.34.1

