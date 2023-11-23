Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="tMbPNoYQ"
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A68FD5E
	for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 10:03:05 -0800 (PST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D47E14152B
	for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 18:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1700762583;
	bh=R1n8ksDNdCksuRnFAcfne+WFQ6Clq7m+xUS67MT50PI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=tMbPNoYQkNmW+8NpzhsdZrIy6s8MqTTNgqyVf/itFJlEzwelJWYfwOu5hCyq52m/S
	 jg7azbP0V/Scrdk3x2xGn0VWsDQOZj7v99MEysKOn6MevD1AYNtjhoFQclMjjXmyEN
	 tTWdu9PLvsn3M27fM1P3xBarVxLnKml+r9OZieTa54XSMIXIAV0rIQUVxh8akw+Zj0
	 sE99jjrO6dMPqvJjJfNn2ZghPEzFTPexetbmgPUrhM6oLJ/5rdcPLiS9AIlT/LkBe4
	 VB7yh8WRU8JLLDfwlvu6riDGrNCR781N0jEoTIB7KL63ISk2IchqNszHvOby2aiS8/
	 uU8VMWtbnIZhg==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-332e06036b5so610502f8f.0
        for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 10:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700762583; x=1701367383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1n8ksDNdCksuRnFAcfne+WFQ6Clq7m+xUS67MT50PI=;
        b=Ox9ecXJ7JMdCEco/RTE4teh5L08dBz5SJTNS7VL98BBiPDPms+6eBpI7JKa7ZLn5q6
         zQ+k5BUNa4pC0zXUtgkdwqbs/mcKW/KNyTm/hF9WAqlkweHKiWb002ZDAarRFsUKlniV
         OMunnSp3aW0GuOZ50lS/0SOYGH/aKhCvKk8UpqGVkMiNcqtLc2uo+Bd0CbO2zVVHI94d
         ziaF3xuwYEN2n4+vWKKpYMjq113z+HrUYkvBaPoYWMwSZxH5BlJE33zpsV2iMH3JHfQ/
         oZuswZ1zuiKp/0fxpNNbDC7pEWZjr4NaoaYMoMDOXZArgQyjdgTar9pm+phucwVbrnBM
         P2/Q==
X-Gm-Message-State: AOJu0YwxHbG3UTPM/+WekTLw0k58V1J41IBduB68ApHlICTRC6XROxfc
	qTefYPIgdQQYjYUIFGwfEIwlBDIsEdGFD4xK7RyOnVGRBr6lb6OMUGLy9bIDc6gFxTFaRsFMO44
	yEOHbT07tkWf0x9OFK7HMqP30qSj3vqIYnoaOjiWe
X-Received: by 2002:a5d:688e:0:b0:332:ca0b:5793 with SMTP id h14-20020a5d688e000000b00332ca0b5793mr145431wru.19.1700762583062;
        Thu, 23 Nov 2023 10:03:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2QhZkx9uLWjRxbIxU8Xy3xhC2F+2LVtCCkr4qvSqBJX+aNSZh4TVvrXYen3EtRYmsrgNSSg==
X-Received: by 2002:a5d:688e:0:b0:332:ca0b:5793 with SMTP id h14-20020a5d688e000000b00332ca0b5793mr145406wru.19.1700762582657;
        Thu, 23 Nov 2023 10:03:02 -0800 (PST)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
        by smtp.gmail.com with ESMTPSA id c9-20020adfef49000000b0032fb7b4f191sm2268350wrp.91.2023.11.23.10.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:03:01 -0800 (PST)
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
Subject: [PATCH 2/5] alpha: stop shipping a.out.h uapi headers
Date: Thu, 23 Nov 2023 18:02:42 +0000
Message-Id: <20231123180246.750674-3-dimitri.ledkov@canonical.com>
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
 arch/alpha/include/uapi/asm/a.out.h | 92 -----------------------------
 1 file changed, 92 deletions(-)
 delete mode 100644 arch/alpha/include/uapi/asm/a.out.h

diff --git a/arch/alpha/include/uapi/asm/a.out.h b/arch/alpha/include/uapi/asm/a.out.h
deleted file mode 100644
index 7d692df04b..0000000000
--- a/arch/alpha/include/uapi/asm/a.out.h
+++ /dev/null
@@ -1,92 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI__ALPHA_A_OUT_H__
-#define _UAPI__ALPHA_A_OUT_H__
-
-#include <linux/types.h>
-
-/*
- * OSF/1 ECOFF header structs.  ECOFF files consist of:
- * 	- a file header (struct filehdr),
- *	- an a.out header (struct aouthdr),
- *	- one or more section headers (struct scnhdr). 
- *	  The filhdr's "f_nscns" field contains the
- *	  number of section headers.
- */
-
-struct filehdr
-{
-	/* OSF/1 "file" header */
-	__u16 f_magic, f_nscns;
-	__u32 f_timdat;
-	__u64 f_symptr;
-	__u32 f_nsyms;
-	__u16 f_opthdr, f_flags;
-};
-
-struct aouthdr
-{
-	__u64 info;		/* after that it looks quite normal.. */
-	__u64 tsize;
-	__u64 dsize;
-	__u64 bsize;
-	__u64 entry;
-	__u64 text_start;	/* with a few additions that actually make sense */
-	__u64 data_start;
-	__u64 bss_start;
-	__u32 gprmask, fprmask;	/* bitmask of general & floating point regs used in binary */
-	__u64 gpvalue;
-};
-
-struct scnhdr
-{
-	char	s_name[8];
-	__u64	s_paddr;
-	__u64	s_vaddr;
-	__u64	s_size;
-	__u64	s_scnptr;
-	__u64	s_relptr;
-	__u64	s_lnnoptr;
-	__u16	s_nreloc;
-	__u16	s_nlnno;
-	__u32	s_flags;
-};
-
-struct exec
-{
-	/* OSF/1 "file" header */
-	struct filehdr		fh;
-	struct aouthdr		ah;
-};
-
-/*
- * Define's so that the kernel exec code can access the a.out header
- * fields...
- */
-#define	a_info		ah.info
-#define	a_text		ah.tsize
-#define a_data		ah.dsize
-#define a_bss		ah.bsize
-#define a_entry		ah.entry
-#define a_textstart	ah.text_start
-#define	a_datastart	ah.data_start
-#define	a_bssstart	ah.bss_start
-#define	a_gprmask	ah.gprmask
-#define a_fprmask	ah.fprmask
-#define a_gpvalue	ah.gpvalue
-
-#define N_TXTADDR(x) ((x).a_textstart)
-#define N_DATADDR(x) ((x).a_datastart)
-#define N_BSSADDR(x) ((x).a_bssstart)
-#define N_DRSIZE(x) 0
-#define N_TRSIZE(x) 0
-#define N_SYMSIZE(x) 0
-
-#define AOUTHSZ		sizeof(struct aouthdr)
-#define SCNHSZ		sizeof(struct scnhdr)
-#define SCNROUND	16
-
-#define N_TXTOFF(x) \
-  ((long) N_MAGIC(x) == ZMAGIC ? 0 : \
-   (sizeof(struct exec) + (x).fh.f_nscns*SCNHSZ + SCNROUND - 1) & ~(SCNROUND - 1))
-
-#endif /* _UAPI__ALPHA_A_OUT_H__ */
-- 
2.34.1

