Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAD43B6354
	for <linux-alpha@vger.kernel.org>; Sun,  9 Aug 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786265739; cv=none; b=f+3is6pdDaabYRs1FkPSewU7fuFBV9QXsJWU4zWwucReC+sn7N6A+QYiUflkOf50umeoorIdvGylg1kT9HWDk68yrop5ithN2gfZSAplQBNZ2Xd+HskQp8FTf9nUD6FI21teLdOv6oMAlhOzcy65UFHdYS8iLo1M1mIzJdAHMps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786265739; c=relaxed/simple;
	bh=jNdVta5xUXSTjnpylN4yxJ+wUC0ZRwFWI3FqxiileXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kg7P3xVDAsvv7RUTMcYu6a7w2tz1uujJcSM2UhykJRL0vOMhhhlLiw7dzXbEIhW6EgB1Zt3VhgqWP/y7bD8l1eqPCzdRawGGvm/vgJI++6np4Rzvzk/Ku8RCCSiszyRmW1j5Y16DIMD6vpsw0NaCZqG8VWdtHjLji1ZkGm599FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNJgQH49; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNJgQH49"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so1312120a12.0
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786265734; x=1786870534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JHbNy7t36m8QFac0Mb9Mig7FuHxoP3xq252YSUXqrc=;
        b=dNJgQH49l6zbKr9imy/1OjgiiDsdZZY1E5GhanIdp0IWxmjWJ4fkNiJJylr8W7r7sY
         SenOYRGaGn6tFgEFINSycr36O9giQx9PFwrTXrBVIzV9+bvYVhlboSTS5YgKxhx7dkXO
         8gj5xZEg24GTLBP51E2JVYGPb3utVR6M0yL09igzyeGWgUyeGkmfCTQX+iIUWE+aRDVj
         7sJTRvZVCjT9w43qcmqtvLq4M7STuK3XZMefF38+Hw515VKpYfaRJFKinbUZEIxczZ2Y
         zuYOUm/ogSSKAd2c6LXLgGARwk1/IMIOMgQyIilyWNDCIWBzwfZMZ3JvWW5T3o7DrOob
         uIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786265734; x=1786870534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JHbNy7t36m8QFac0Mb9Mig7FuHxoP3xq252YSUXqrc=;
        b=aGacGTcQsDQ6nOu82xhLys2EoLdlnFaaVTmGVaVwQLvKEBVuW+3kkekyQxvnMoFcfS
         +pdmkcoV4yRJ4BJOVwLr9U2x8xzVJTA2pDDdrN+463pjdc6EIeH0OqcqxgsMVeL2pQb2
         rupK3trEmy4VMDWmtpN6AP/PWWl7mqcN7QeS8GxEo6KHyGHSlVwMhpCiDZi6TqZ1pPRM
         wsv9AzYPq4Unwaz8vPws3PSpZaNrJrUzavEWQKB0bhP33kvkwdNZYWzUK65KpI153R9H
         mH2O/h7yvOTa1vkxt7N3e9xFDrtAfpYp4hyyEjXo38nrcd1shcvRfsw4l+V/1MAiiFHW
         iRkw==
X-Forwarded-Encrypted: i=1; AHgh+RrhDonXW0YTjRPI69cqmeWv3xBi+3t4VZZf6w7Eq/5ZLw1GpRU3KjbMlxZZxqXD9wIO4rcAF4ufxMA9+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDjGfe0eqaHuWFUMZCT8lQD7GEJg74kbNyBVINbTZAZ49Fwq22
	uYP2/PtK7H9b6et8ezjYCVjPjsDl+maCGeVf4YYWyrP+V28SDuuG6x35
X-Gm-Gg: AR+sD13n0uqlpl12pdw4U8d8q2Tk9cIIeBC4dyTJYDKA+es+2mQPAH/KJVZ0iFEZ1FL
	AoS9aGn9BLYKvqQIkjh0QIBjDUVDzKbMDRq4/e9O9mWU0JFMp0cM1kw08KqQTgu8PpkE1564+8N
	UywDFz4XE0g86jffw3+qtPl9eB+DIr1ZUReRSdbuHNQellvafL5YJrX41llpOE03Rqkhg0Fjrxl
	aAuVjmx/xCKAxVh2CnvGQz44ziH+OoOV9U86Xfjr0oPIA7Sq89RquMc/S9mZZN2Iq3GQioPE/yG
	BiSEsZeVyHOAJbzta1gGAu4PdKyra5zGHyGNP5BOIjlLcbp/xwsKrWOR7Fc4DlbEtIaWDpIyPPE
	I20vTtS5VMRXM7zRpZH3+U0RMUX+OIH3LKsMc5zbYfrJFbk1HulfkgVNRvgM59YvbGNlBsYovM3
	1Uf5V1YqaEuciNzjUCiMX5ZSeCM2HSVG/gSP3r9N8Dk1HhlOUWsOLiJrjaoUdUXq/TukkrmOWe8
	yJqYV1LBLlbFQx+z3WqrAfu+usHcIE=
X-Received: by 2002:a05:6402:2344:b0:6a0:c763:89e5 with SMTP id 4fb4d7f45d1cf-6a14f2576f8mr16999516a12.19.1786265734380;
        Sun, 09 Aug 2026 01:55:34 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1f630a4afsm1606681a12.3.2026.08.09.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:55:34 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 6/6] alpha: invalidate the local context in flush_icache_user_page()
Date: Sun,  9 Aug 2026 10:49:38 +0200
Message-ID: <20260809085208.3262799-7-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809085208.3262799-1-linmag7@gmail.com>
References: <20260809085208.3262799-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flush_icache_user_page() has the same caller-CPU omission that the
previous patch fixed in flush_tlb_mm():

	if (mm == current->active_mm) {
		__load_new_mm_context(mm);
		...
	}

	smp_call_function(ipi_flush_icache_page, mm, 1);

When the target mm is not the calling CPU's active_mm nothing happens
locally, and smp_call_function() handles only the other CPUs, so this CPU
may later reuse the old ASN together with the translations it still holds.

This matters here in particular because the function exists for operating
on another process's mappings: the comment above it describes setting
breakpoints through ptrace, and access_remote_vm() reaches it through
copy_to_user_page(). The calling CPU is therefore often running something
other than the target mm.

As in flush_tlb_mm(), the UP implementation in asm/cacheflush.h already
has the missing case:

	if (current->active_mm == mm)
		__load_new_mm_context(mm);
	else
		mm->context[smp_processor_id()] = 0;

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index f501a91001cc..13b86f7224de 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -780,6 +780,13 @@ flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 			preempt_enable();
 			return;
 		}
+	} else {
+		/*
+		 * As in flush_tlb_mm(): smp_call_function() does not call
+		 * back into this CPU, and this function is used precisely
+		 * when operating on another process's mappings.
+		 */
+		flush_tlb_other(mm);
 	}
 
 	smp_call_function(ipi_flush_icache_page, mm, 1);
-- 
2.53.0

