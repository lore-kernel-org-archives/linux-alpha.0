Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3B451615F
	for <linux-alpha@vger.kernel.org>; Thu, 15 Oct 2026 10:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059854; cv=none; b=ReGuz5EsuCUr3LHz2ymLzGz+GhBmS/LIbctay0PM92Dgc1Kf7zhTGhmZruoUfaTAlJDPTtTgxIM48X5Nn4QQ+nCsuO2oGoBZmzMV9HZ67fQ60W2FFr7B8z9QTCYLCbSv/geqXcYB0tQ+ai/aRU0Zgejs3OL7MM4OnrH+pCl+9ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059854; c=relaxed/simple;
	bh=mYsd403UguRpErjneRCONzy9EwzsT+JCk5m6pugKqy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8nWtw2yDXUxsiVJXJQQAyLPyvMfGwldTeOG8L/yEEWp6Prw39S9E23R7swbF+3AgqUt5Arc38Cxugq4Bvu07/wLB78GAxY+a+zPuSs5nuxGfNhziwGaE+BbKULOIid6W4tNxFG5SUuR7o4NC1keByAaPwI/UEOfCKpewcRxZyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qk5JODL2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qk5JODL2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso98537866b.2
        for <linux-alpha@vger.kernel.org>; Thu, 15 Oct 2026 03:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059851; x=1792664651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wA5IrwmhjCels3NLWyd4qYpH5Gev6ZGf3R+/qrMipb0=;
        b=qk5JODL2gWH/Hu6l7rXj3P6pF9agKGy0LS6ELtcyHVKNTZUFokwU5vgXH+Ax/+WWtb
         w1qEF5Q1xS9d+0iLqa8+J4/egXE8EmP6m/UmSF0D1j+vB68uokUeGeNoPhtTXBme0dRR
         9uEq9KU/cVPL1tdipCTwjJV8MDwITKeXZ8SA9QJni3U9Sn4/+9kI//77dAaMeRPzjDGl
         3SlNJE+E84MonpwL2t3IR67Ll4/xkvlA8kam9QdHCz7QQUNHi0NzR52AGqaET/AB2T8/
         JbM1Owvwqgapj3IpLPXDousMOhyOYmwSkhuLBHGKH7uygdpEcbmKEiIngdfk6KD7s8Wh
         rDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059851; x=1792664651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wA5IrwmhjCels3NLWyd4qYpH5Gev6ZGf3R+/qrMipb0=;
        b=Ze1r5LcnhMgk99MckKNDYuQA4CR1svcHb4U0CVtJ0/staztg1XXU6L5Qe5jhgYlELF
         1Yv1u/q8yAYhEQug6hyeEfwHY1NwcWQWjdDclPvJ7ze9IPXNjGeyAnxsZTa4eQgHteau
         ZMFOLZWSR4Ua79kRDZ0ssRa4NO/X+MQWhq9H3Fj8vda7ZodRiLGVNOgZP7upPFKb/AV0
         Wgh6fsUfsWokhx9/Cy4Re6wNO170QZA3KbjDGpY4/w2lBc+2ucl2COOOq7dcKjxf41JG
         3UcqhjO2MtZfZ6haYuh4xdMPG7bEa5ZV9S0uT8OLbKuEBGynHtgbQgEFC6RkZrCUCSB2
         GR3A==
X-Forwarded-Encrypted: i=1; AKwUvBzir7Bx1olELtdit1Y0SCRSKv3J0NIRoKvX/oeUdpVfPOx6hAAyUUBdUP3jTbP5trXjMaZGCHLOxyyusw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKOKgcUDJNIbrLUo9qfgEAnOuGmFyjUJxgkKLLkO4dBxAAFgVhG
	5ZfMs1q0XsYFD8KfhfBWXxVlptTYSkA+ogMZdvDhGxeA0fJlV6Up8XR+
X-Gm-Gg: AYBFou3Y9fcRXaGiLp+DAHHcw/r3gX7uIPkkSO2VX7rb6IIEdhKzpsHDTmp+EMqtqT1
	OsPy9/XgnpPtK8U1gJk+Z62GEJeQxj9VR589sX/axQDmUdI22MOo0LJL2V90BjZ/JPQPLE1D9GO
	eod26LDShqK9/hN84RoWX7jykDAWyJKR6DaSYZy6Aj/OFD+KdbggHNXM9YuShT3mTREivFwxxOW
	3pAFCNBQtrGnHwP37Ib3NWCHfHOvE+WsjvuLhZupvSLLlgnW4MeS3D4DCfI5slSpjaYAhZ2yEDu
	U2nP1F17jMdpfeKoPFNns7psk1mOQ82JK/UTKXtX7XkdL9N8kHqvZn6gTRElUS8f5UNucsE63kL
	vLJUqPBhREm3gCR0gj7E0ClNu2NtJSesqAOC3TE7A/6rAVXQFCu2BLOk6heQdnylquB9/UU4+14
	UEkdjnpPaUCub8pOJwjtVkYKfxXyzZ104/5TqgHNORG57xby3XeeWzcOc62YidxvK488kvYupcG
	lDmMyjlYeUcQRzA6MPOc5oJbU9A6CRP8O78axsd8w==
X-Received: by 2002:a17:907:3d48:b0:c29:659e:2fd6 with SMTP id a640c23a62f3a-c31a9fc1522mr1869085666b.10.1792059851048;
        Thu, 15 Oct 2026 03:24:11 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab13f4esm108371766b.87.2026.10.15.03.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:24:10 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v8 3/6] alpha: bound EV6 logout decoding by the processor area
Date: Thu, 15 Oct 2026 12:22:52 +0200
Message-ID: <20261015102353.999695-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015102353.999695-1-linmag7@gmail.com>
References: <20261015102353.999695-1-linmag7@gmail.com>
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
Reviewed-by: Matt Turner <mattst88@gmail.com>
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

