Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216F0451986
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 19:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746045; cv=none; b=h0fhaSPw4KM0JUvGR2aGCfYDK+iIN1O7GXuvvFHDaX55ly/ytZMFNux/DmpVhyRoLCy4ObGepX96HKOnu9dwGjhp4Oh1yOAS5DUub8dN1q/Hx5ilhkJLITdyGAaxwXWD+hXBzntBj0VcusQA1nhpSvjC+92n2J3PKVWEKPcyWno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746045; c=relaxed/simple;
	bh=sJlscAr/ZjjIrT3/qnQwBejz9BRcOyny87c0ziuOn9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tzbjlvGBq+SPU544i5784D9yqWWI8DKfhHrY8kjgSp9mQ3nVpWotIqe1FSWTR3pqSsj13AHXHOcpAHQZxWCs8KTYzR5Eizpq6t7l2RLgAbXphsGphIqMVDb8gkV4xqeb9HFtfG67Jeud8SuznroqsM0hqqFCNlxXxct9oasIhOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5EtaKJA; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5EtaKJA"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6af9befd04cso1276068a12.2
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 12:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791746042; x=1792350842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYsOyJbpl11wXDTkYqWO7uHSky61lig9rX3b7iPMWxU=;
        b=O5EtaKJAz4Ah0FUvPxnrI4jEWiNxcrug+CSdJnncFH3roJRGmgjeQIPSOuSjqfdhSX
         qC+2vZlZ2W8ATFPbdVHFV+Ga+wZjH+351EHkATq3IkjdofGD64pei/tnbvWIzAYvuaGm
         XO2kLPwaHHRsWYyZoIWAibr/jVPcfbvurkRhkTv5fLiPifSzo5+cLNDUvjWBfDdjMZSp
         xwH4qNOuJG5YTN7TEa6Nwhq4RWoGeWISpj/TFIGWl0PmIz9ZnGK7GUhz8GpWG0QvwlWF
         p4dmAQEa6wrf58A0KfNBn97KYI46HEyIqj+zOCGw7dpQBxtw/R3UpqRIRM4vLlfPWmjJ
         7hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791746042; x=1792350842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYsOyJbpl11wXDTkYqWO7uHSky61lig9rX3b7iPMWxU=;
        b=STYjejRXafMPAzkjx30vtG9H0iwY9kB3ovonI908sqT5DGxvJQJrCTzbZbwkqTBcRm
         dk1RqUQl2dhgplpLoIBVpdug8tvEJpewcr4oMp6hjUhHAR/0On07Ik6cmNXaXPOF7MEV
         Ijzk+ZwMuZXGSEnu5jLGHWcQdmFvSreN+BIURrtZu1lbSvkgv2s75qXyetyz2pUNC4JL
         9E5Kq33vsTM2eW572h52JScigd0OejIv/g3md2Fyh30pWguudAyigGJTNOGa4YL2p51X
         6qhKvy5DdHhe5M1bSC+SfL9hJj+gDn3y4V2fvAFuKC2VQl/YDosCWwp23HNMcIIWjAvj
         yjXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhIZUa9Hh/whbrJy9NSvwZuqfMPWvd5SxYgerDyr3rrxe/YMA+b2wxpzVPu5TC5q8QzageCCVMXUtRnQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLjcw35JlKM42SwTPjj/L156PCye7ysqwt2KAQYvKSrOVKJ0NVq
	nhxtNVQCCbdIF3Jz5TtkRvCYmYqTpk+5Pl1CS2bRL4unjbB4FcwDee0A
X-Gm-Gg: AYBFou3RB9wr7lYz6AG77IPG+NrnOHiCFvTD+LVQB57SOXmFsF7E/QNmIVn5r/ECwuA
	grBFC9pCnpZWeT5jrkzs+sX3T1CKJ2fBcFDXx5LnN782EiHw1iZOUsVtToI1A+tmRxOMPXNTu5l
	8JTgjkP7sfMYDT3leT9cTK0Fv1X7doxc+Sf2TQEtC76VIbj+Gb9I31Mk9GJio7QatQBTaX8C6zM
	hYuMB26APCtIp8ZZZhOemJMzcqCek5bnbn/Dw294bKniOs4aH/pt+qWCnRzsn23nW4b3a5pu7mL
	8X2JZd1mTZB0YXL0BF08u5Sp2wmCgsoztzOx9R8i1Fovph9diNAH9tQlUeK+GobbSvJYxIABdUP
	bpL9IWorO2SjxLwHToXf8kt2y7oLL2kzHrgYZrDbU5b41jsfUP8dYMdXOWh9eOribZqYHR6HOSH
	fs3qNSBk6eI5bVhOLeppQzvQPyvU01+y3niPjh48ekqsrI7cvkSmsmWPIeEocVwiTKcr5xfCR0X
	jYiMZs4gIqS5P/E2LYrnR2OBz6T0lkNxAmJ/UIm
X-Received: by 2002:a05:6402:2712:b0:6af:bc4e:a285 with SMTP id 4fb4d7f45d1cf-6b17c2dd330mr7140690a12.31.1791746042080;
        Sun, 11 Oct 2026 12:14:02 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3736sm4084832a12.18.2026.10.11.12.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:14:00 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v6 3/6] alpha: bound EV6 logout decoding by the processor area
Date: Sun, 11 Oct 2026 21:12:50 +0200
Message-ID: <20261011191344.981000-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011191344.981000-1-linmag7@gmail.com>
References: <20261011191344.981000-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ES40 Service Guide, Table D-19, documents a correctable frame with
its system area at 0x58 and total size 0x80. The existing EV6 decoder
interprets system words as extended CPU registers and reads past its end.
This establishes the layout for ES40; whether Titan and Nautilus PALcode
also emits this short frame has not been verified.

Validate the processor area before decoding it and only print extended
registers when present. Preserve rejected frames with a raw dump rather
than trusting their invalid offsets. Cap the dump at 1 KiB and round down
to complete quadwords. This still relies on firmware supplying an
accessible frame of its advertised size; the cap is not pointer validation.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/err_common.c | 13 ++++++++++++
 arch/alpha/kernel/err_ev6.c    | 38 +++++++++++++++++++++++++---------
 arch/alpha/kernel/err_impl.h   |  1 +
 3 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/arch/alpha/kernel/err_common.c b/arch/alpha/kernel/err_common.c
index 94e1b3dcf6d4..9271ea425a7b 100644
--- a/arch/alpha/kernel/err_common.c
+++ b/arch/alpha/kernel/err_common.c
@@ -44,6 +44,19 @@ mchk_dump_mem(void *data, size_t length, char **annotation)
 	}
 }
 
+/* Preserve rejected frames without trusting their internal offsets. */
+void
+mchk_dump_logout_frame_raw(struct el_common *header)
+{
+	size_t length = header->size;
+
+	/* Bound diagnostic output and never read a partial final quadword. */
+	if (length > 1024)
+		length = 1024;
+	length &= ~7UL;
+	mchk_dump_mem(header, length, NULL);
+}
+
 void
 mchk_dump_logout_frame(struct el_common *mchk_header)
 {
diff --git a/arch/alpha/kernel/err_ev6.c b/arch/alpha/kernel/err_ev6.c
index 8144f2045b5b..f12299ae1f24 100644
--- a/arch/alpha/kernel/err_ev6.c
+++ b/arch/alpha/kernel/err_ev6.c
@@ -190,6 +190,25 @@ ev6_process_logout_frame(struct el_common *mchk_header, int print)
 		(struct el_common_EV6_mcheck *)mchk_header;
 	int status = MCHK_DISPOSITION_UNKNOWN_ERROR;
 
+	/*
+	 * ES40 correctable frames end the CPU area before EXC_ADDR (Table
+	 * D-19). Validate both regions before decoding or dumping any data.
+	 */
+	if (mchk_header->proc_offset != offsetof(struct el_common_EV6_mcheck,
+					       I_STAT) ||
+	    mchk_header->sys_offset < offsetof(struct el_common_EV6_mcheck,
+					      EXC_ADDR) ||
+	    mchk_header->sys_offset > mchk_header->size ||
+	    ((mchk_header->sys_offset | mchk_header->size) & 7)) {
+		if (print) {
+			printk("%s    Invalid EV6 logout frame: size %x, CPU %x, system %x\n",
+			       err_print_prefix, mchk_header->size,
+			       mchk_header->proc_offset, mchk_header->sys_offset);
+			mchk_dump_logout_frame_raw(mchk_header);
+		}
+		return MCHK_DISPOSITION_UNKNOWN_ERROR;
+	}
+
 	status |= ev6_parse_ibox(ev6mchk->I_STAT, print);
 	status |= ev6_parse_mbox(ev6mchk->MM_STAT, ev6mchk->DC_STAT, 
 				 ev6mchk->C_STAT, print);
@@ -203,16 +222,15 @@ ev6_process_logout_frame(struct el_common *mchk_header, int print)
 	if (status != MCHK_DISPOSITION_DISMISS) {
 		char *saved_err_prefix = err_print_prefix;
 
-		/*
-		 * Dump some additional information from the frame
-		 */
-		printk("%s    EXC_ADDR: 0x%016lx   IER_CM: 0x%016lx"
-		            "   ISUM: 0x%016lx\n"
-		         "    PAL_BASE: 0x%016lx   I_CTL:  0x%016lx"
-		            "   PCTX: 0x%016lx\n",
-		       err_print_prefix,
-		       ev6mchk->EXC_ADDR, ev6mchk->IER_CM, ev6mchk->ISUM,
-		       ev6mchk->PAL_BASE, ev6mchk->I_CTL, ev6mchk->PCTX);
+		/* These registers are absent from short correctable frames. */
+		if (mchk_header->sys_offset >= sizeof(*ev6mchk))
+			printk("%s    EXC_ADDR: 0x%016lx   IER_CM: 0x%016lx"
+			       "   ISUM: 0x%016lx\n"
+			       "    PAL_BASE: 0x%016lx   I_CTL:  0x%016lx"
+			       "   PCTX: 0x%016lx\n",
+			       err_print_prefix,
+			       ev6mchk->EXC_ADDR, ev6mchk->IER_CM, ev6mchk->ISUM,
+			       ev6mchk->PAL_BASE, ev6mchk->I_CTL, ev6mchk->PCTX);
 
 		if (status == MCHK_DISPOSITION_UNKNOWN_ERROR) {
 			printk("%s    UNKNOWN error, frame follows:\n",
diff --git a/arch/alpha/kernel/err_impl.h b/arch/alpha/kernel/err_impl.h
index 737b958a586d..5bef23a00942 100644
--- a/arch/alpha/kernel/err_impl.h
+++ b/arch/alpha/kernel/err_impl.h
@@ -47,6 +47,7 @@ struct el_subpacket_handler {
 extern char *err_print_prefix;
 
 extern void mchk_dump_mem(void *, size_t, char **);
+extern void mchk_dump_logout_frame_raw(struct el_common *header);
 extern void mchk_dump_logout_frame(struct el_common *);
 extern void el_print_timestamp(union el_timestamp *);
 extern void el_process_subpackets(struct el_subpacket *, int);
-- 
2.43.0

