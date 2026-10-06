Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFBC20E023
	for <linux-alpha@vger.kernel.org>; Tue,  6 Oct 2026 14:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295462; cv=none; b=k8wBooQHX+EXQ1yJbjiNv2Mv4RFtkvptN158eFUfx8cA8Gh1JaiQTlAEL3lxW8vr029vg8WKVHWhsjfgJMSJDqyvAlYYBCZrASZUOfzjUKBinY6QVk7XG4W60thBTcm4Twggc8QzBaUHeVYog6lwaApJVa4E9JMC8U58X9Wzu6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295462; c=relaxed/simple;
	bh=MZykUui1Wig1GtAKfx2ri2KqKibPxVefrQgVM77LKsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N7NlU8kI6S5w4Fv+q5UYS5/f3js7i9cCOLa0mQHYYHb5nDIJYEE3crQM6shJfKn/xlOmFPR5Jr/jkjr3/bw74pZgSw1hUb75b4R3eiQsgeavHYeVJgVX41rtjBu0rEDRFqBuSS79WzUW81GrKX0Ufnox+v97STcoCGo6+QmACRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3/8d8FE; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3/8d8FE"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-888cbacf70eso10904267b3.1
        for <linux-alpha@vger.kernel.org>; Tue, 06 Oct 2026 07:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295460; x=1791900260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itwBqHZFCzsIQDL+h8XDZePWzl6bxkrL0a9ivscfpCM=;
        b=Z3/8d8FEBXDl0GCDpqHLl7HokmJBwC1JEZW/RX/eNgXEUmmFLhXq23+lKWfp9SLYrj
         ogTukbm2BuS8p7Wv9WJoRv1eiC5S+WsYepIuADMyiLwlTfT6liKqehtandrIi4qp+y4P
         MlOQTYqddkLSXe8JAM9t5lwoa5hxWRdRmlEH8Odjvh40ncVjgZgaCTC65OBl1krKyKEP
         n60alpMZ6EoNCjlNdHqeQwUO8/uLOkwOMP8AXfVF27MxxaOildrxgwK2YuLzvOI3YrUM
         gQXB30y3pi/0BIFZsiv8DZQ8hwoA0GocMpbYH6Zg4QWaI94xVdmU+eIR0lfMgOwmvUqL
         XkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295460; x=1791900260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itwBqHZFCzsIQDL+h8XDZePWzl6bxkrL0a9ivscfpCM=;
        b=nOd6RSmuuRPIfZ9J8QpS7eeGOFcb8NEF9inKr2j+WOz1YYUgDqqJ77W3FPvDxp4w24
         ixSGD+94O7tzSz6VOIDp2tFpOeTU4Anh2SmfYiHIe/oPPjpDXFzu3FDOFZEELYHXfaX8
         IU8ziclYirJwX+ZyUDyOZISy4zoHz2AckBfX+3WOP7ZVe/IRuFx7QawAwCVLgGNuyee4
         rnDK1nlQrnnEU+r1D7rLH/l96kf5vaU8Uw7mAdVc9qYlLPAr5td1al7BbeuA2Zuifzmh
         6u/FzKsfB8dI+zodwpCYGKJ4o+AMKy7Tpt2wE4aPb88pDD4yWm46nhpMOKK7w1Goo1XF
         AQJg==
X-Gm-Message-State: AFq9FYLtDIwnJXnY4ohFM4wKeR0NcE9DRyYsbQ1pyA2M0GDfYb5qJULF
	r0hRLCWTBeiGYZpmPC3rC0R2YpigMcDsFotzCHd7mBnNw397Rzi5vhDd
X-Gm-Gg: AYBFou3sxAlOrELYWbSu7dRU+siH7vi2FhZvnZl4GanI6bqI7ACKm6SusUgqqu9eWXl
	oP5Fo9bKeMowCpjYV2Wtvm2ZGGgeKVlYOT7jnvHkM5fbaccO9PD5F0HgF1lbFCWgN0IuuYLeTeZ
	wnS+pVZJc/AB1QEcgR0KS59iaC5MP4yapjMGP4Fd+GmrmGSiCJ8B8O+5lWszg8kWVKb425bc/gQ
	NknreNPyYPjoaKS05PHZl/6MmuDcNq597Pbd3vDL388e1/y4ogGCd0Q7JPBQywVIxLEYkOz1Sm2
	17cQm7J1xBR/y5/68GS0T3zUMvemQ0xXPsmDLXTtOX1JtzQgVdB9j5ftvwy4uGX6NyoCdG5Xw0j
	OApXwWiWFJu2ynKF19r9Mqqbog1fwRYnClhxzrnvDlOH/EQy6USDbhIWZZkhcSonY7dcTM1R3nz
	dzHoB18lpm3XI0qxb50peCK1U0B/XCpBic9g4oGBwN9WXS4xi4XJOo6ZKYxsDELARxEsqVdWgaL
	26ldFkrVA==
X-Received: by 2002:a05:690c:e3eb:b0:871:bc3:9856 with SMTP id 00721157ae682-8b04f40b287mr5784777b3.33.1791295459692;
        Tue, 06 Oct 2026 07:04:19 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae333e9a0bsm50497047b3.36.2026.10.06.07.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:04:17 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 06 Oct 2026 10:04:13 -0400
Subject: [PATCH 1/6] alpha: add missing page_table_check_pte_clear() to
 ptep_get_and_clear()
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-alpha-hugepages-v1-1-a673a18aaa70@gmail.com>
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=MZykUui1Wig1GtAKfx2ri2KqKibPxVefrQgVM77LKsQ=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO/L+7Uz6ryELzRe4hhyqX4NZvOzwutptsL/+56afBV
 V2jueUKHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHPNyuMMv1l/WIrVTr
 q9LDTJaYG/lm2c+dkTKd8eNN5szXV/r/ZKrY/hf4q8UdC29ewVh9f4vJ3f+21KyJG0/oiFEpHOW
 fKOqcmrGQA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha's CONFIG_COMPACTION-gated ptep_get_and_clear() overrides the
generic version in include/linux/pgtable.h but omits its
page_table_check_pte_clear() call. With CONFIG_PAGE_TABLE_CHECK=y the
map count taken by set_ptes() is therefore never dropped when a PTE is
cleared through this path.

Add the missing call, and drop the now-duplicate one in
ptep_clear_flush(), which already goes through ptep_get_and_clear().

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 6ebdd90f3035..8a175e0c2b42 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -305,6 +305,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 	pte_t pte = READ_ONCE(*ptep);
 
 	pte_clear(mm, address, ptep);
+	page_table_check_pte_clear(mm, address, pte);
 	return pte;
 }
 
@@ -316,7 +317,6 @@ static inline pte_t ptep_clear_flush(struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 	pte_t pte = ptep_get_and_clear(mm, addr, ptep);
 
-	page_table_check_pte_clear(mm, addr, pte);
 	migrate_flush_tlb_page(vma, addr);
 	return pte;
 }

-- 
2.54.0

