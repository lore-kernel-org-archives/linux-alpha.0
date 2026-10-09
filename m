Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40874D489F
	for <linux-alpha@vger.kernel.org>; Fri,  9 Oct 2026 11:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547093; cv=none; b=lgf+nMBgi2LBZdK6JfrJ0Bfq6jrj9u7tUdwE35wbpJfPVdUqhUiMxyT0uj+5WVR+36kpoedVJuE8ZAaMKZSC19bOyLSme9S7ayWJ9pqfuCP1rYLZ5+tME6Qg+25Gxh8hM2v5/3ddu7H8HkV/jeG9H17X09EqqYfLT+D+7OA3F9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547093; c=relaxed/simple;
	bh=ba/owViX072n4tsnMkLV1IOZ/Gn35sGABf1QJjT8nH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VUL5z/Q261+Em9TEdUedtIcEuJyYEa17uoutIIHLxbLW+AUhmEjfCUIWGYYria70sGarkKEDJEn/gqel+qiz3hMdzpHM3nMwKJELRdXTL1IEChA3kFybt/dnJWRtlFuLqewiQx2tGJCIf1mZI8LsXxbDCDtuPecitblVgOP1YvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ6bTqNC; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ6bTqNC"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c20ce3c118aso352871466b.0
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 04:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547087; x=1792151887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0bX5Ir7ruoqJsWc6Yw4x1v0FegL07a55+YRf7Y1SRcs=;
        b=CZ6bTqNCNFOAZcDWtON4bHHJiOsrNkhJeUJmmegnP9Oj6PZZsEZQ2FlmUk26rTO/h1
         L2/4sy1KryDEJxhI2Wq5wiN8o5ohEZ30avIWg277rfTew3DYltYcI2RU4B3nA3hy8H1N
         kPr3lrTHhCGCNWbmrDkNeO42LDuwrOkiC6HVJsD/QJSCWFrPLUZZbPf5zgUfncIfT/ZZ
         gC2jQULZPQmLUc6Hnun2aczvwoFTHPzzetgZG1EodWQ3zrGBlR3/Yo7LR2NxP+KV89hQ
         XGqMDHA/Eby5Dh1Vv/1jmHeB6Q2uK+vE/NBr9DdvO11RKYUGcieLcgClRb/EVN76j7LJ
         CTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547087; x=1792151887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0bX5Ir7ruoqJsWc6Yw4x1v0FegL07a55+YRf7Y1SRcs=;
        b=YjGX3YC1dZ70yXMNpeC1Ey7f2uohIuM3e1EurvULR9ftdWhqy9hXJz9doALlIIOKXG
         rSvu06ije5OlPCUnCTar5+iDUctFIvZ1H8jFpQqchLa0YOX/AKZ9csQHI6jKtyD3mv5r
         9jFDp4JrOc+qIAcp9GFG3OgFdhZO7eYcqeZHi3cm/HguOZD0rWCxQHGhL8C87+kUfPiK
         LJ4ZVTcGuAdZTF0XGnEZNLTjDR5wWtLlFyFJ/dqyeFOSr+rSH4MEHm5zOzHNenD1cJr2
         pa2a5LpjHMgAyJVccn2syKMzAiIj966esO6ElVuetRts2weePil3u+8jyfbcrGZ5JUc+
         Rx5A==
X-Forwarded-Encrypted: i=1; AKwUvBx9/0tO47GHwdUIEMPuh9LoicpR1+qV5trneNwyWU+n9NHpovg+5tEn8dwcLGXxaAZUeoofvwxBAqgA5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJpQgvUMmDGbuIAYieIgD3ZgYGru1WiSkx9t7vhWKclVuTGfVfn
	+xPj+GJOlAxXDTRdHdmA2iqwA65BaojXhmeEcP7oSS5QzBUFs/VoFoYy
X-Gm-Gg: AYBFou1XPjEQfPRxyvnq2dvledow7XZeudRDA8H/RMT3SBK414v7ngZdCfrXT4PedsK
	MPDcfmW33IaOJwOgcolKN0hmCzSBpLL0UBCSE0/9OfTcL9+hbRpmva00FNdXsi062OJ7B+LYrcu
	BLoKsh2LJtPmxDWM9QogjGxlYfolHlHfQswzWeeY7vxkovxr9AOLoNtKGVQpBF88hMLLEOyZBpp
	q6viDStKCwLa5JwY8yRurzrSgXGQQwE301Oh43cmCvrxw4ct3bg5YdK1oqPT8ZxT2BsA1DP14me
	++AgEF0NJmfO7RPER7IdrcqW2kAHmuiSWfyPobpi7ArnA9HMRP07/KYvB7TPDHVC+OAUIljBdxb
	rRQ324UWeWSZ47DZowNTxZPnKNwevWNCaUpKHGoqZWdnhdT8631urM0n/YGMX9qWGGFe0I4kwYP
	xmHUGBhRcGKaJj1zx1wlZIUPdakMxaBMs7KItH4gf6ULCyGWwMjBvpMMErnhq7TLMwedhQrH7n5
	3ts0mMgZ4tjqtvjYD0XDVUd3JWMvtamUOhU1Vm6
X-Received: by 2002:a17:906:7943:b0:c2a:4847:231b with SMTP id a640c23a62f3a-c31aa03cd06mr180613666b.24.1791547086710;
        Fri, 09 Oct 2026 04:58:06 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31aa825e4bsm78525966b.9.2026.10.09.04.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:58:06 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v5 3/5] alpha: bound EV6 logout decoding by the processor area
Date: Fri,  9 Oct 2026 13:54:39 +0200
Message-ID: <20261009115627.969047-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009115627.969047-1-linmag7@gmail.com>
References: <20261009115627.969047-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ES40 correctable logout frame has only the common CPU registers before
its system area at offset 0x58. The EV6 decoder treats those system words
as extra CPU registers and reads beyond the 0x80-byte frame.

Validate the CPU and system boundaries before decoding or dumping data.
Print the additional CPU registers only when the processor area contains
them. This also rejects truncated processor frames passed by console-log
handlers. See the ES40 Service Guide EK-ES240-SV A01, Table D-19.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/err_ev6.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/arch/alpha/kernel/err_ev6.c b/arch/alpha/kernel/err_ev6.c
index 8144f2045b5b..ec0b63b0f377 100644
--- a/arch/alpha/kernel/err_ev6.c
+++ b/arch/alpha/kernel/err_ev6.c
@@ -190,6 +190,23 @@ ev6_process_logout_frame(struct el_common *mchk_header, int print)
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
+		if (print)
+			printk("%s    Invalid EV6 logout frame: size %x, CPU %x, system %x\n",
+			       err_print_prefix, mchk_header->size,
+			       mchk_header->proc_offset, mchk_header->sys_offset);
+		return MCHK_DISPOSITION_UNKNOWN_ERROR;
+	}
+
 	status |= ev6_parse_ibox(ev6mchk->I_STAT, print);
 	status |= ev6_parse_mbox(ev6mchk->MM_STAT, ev6mchk->DC_STAT, 
 				 ev6mchk->C_STAT, print);
@@ -203,16 +220,15 @@ ev6_process_logout_frame(struct el_common *mchk_header, int print)
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
-- 
2.43.0

