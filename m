Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0C9459AE9
	for <linux-alpha@vger.kernel.org>; Wed, 23 Sep 2026 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149781; cv=none; b=TM4qAvIGL/0WKc5BIQve7MXIrPbhRu4NkZYfqBN905hK7iFzD+KTc32nlXkgGub9xVG7m6yi9liMlXL2MoEV1Q+L2RjbT/QdhXN+AnaLnjSI7WzvFFxFCoN5OGW3DWE9dsijFoiQwly42Tx17pRXRIt3UXXxfz874BkBkaoW9xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149781; c=relaxed/simple;
	bh=58zmak3D4O3ScLko3YFxQk7A53rZ4PB381sHrZn1Xn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VEPv8d5op1E9dT2OgESWQ01aoaomnvEsPpKNTx0M35abKGxOHhk7xiR3VlOluLZwwjG6jAnCieVWDodiuYIK5Lt7iKU/MZ89jcPMbpw81X9OjDhYu901PWTmive26H59VTdkAJCUxBVyC2F+enyWXYs2uDvW7tHk0YvM6V6EY5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxkgHuRk; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxkgHuRk"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a8038a9f10so837659a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 23 Sep 2026 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149774; x=1790754574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEde7YfaloBRyUhSbmNY1j2NkDWIsjwrgzwyBWTrgFY=;
        b=mxkgHuRk7jvAftQdmDglaLGhTWlGFECYLREkdvk4gSj6Nh92XCzFTtRaoPgaLM8E3+
         dFxhHuJ0CzRT+3yN775E3y6gj2xSjAf/1RQuTZlnXRGbX3fz3PsiN7rab+hJ2XT3fNA9
         +1GSIcpxAR5JJSF8glxtKq2hd+9nEN+kFY8Dy1VG4LjvkOvaLvrJHVg6HsCTWBwzKOBr
         UWdf8jy85wPKBjJNlkuhUiR01g91JblMz1j1AUz+oabO6O1mqcNuwFA5u/lj1AOh2aw0
         hN7fJD7GYAclIhcu9l4JnFniYjR/qV/ws/3J/pH3J+BuRIveMz73KPScGZrYn8OR+8q6
         ff7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149774; x=1790754574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEde7YfaloBRyUhSbmNY1j2NkDWIsjwrgzwyBWTrgFY=;
        b=ijACLx0+3eWO0VBwP00Mizjeilxd2rXkRbmi6IkXdxxWsyZQ//EbRuzMgRfrg6bKwy
         oVQYTWsOHTiFnDk5PAN6uQN0vYhaS5XyiEcnADqZuTfWQ9ZoOlgyEstcLSqE5XUxACfg
         ZRrO/tu9VSL5Cubrk/RWbz2k3qr14iswYc0V78o4LyhXiglKqTvg4t3CV+6DN8Hho/U1
         qYlL+2jleyAXfzgARgqtThJQW+RuiOpOkyuXGuT6jgJG/7Bj7Y8GwBM0uxH3FVMjvpzH
         ZiKYQy8hD6fZF6uN0b4rMRZe2N6CpGvoOgrfzyCmO2FzDe9ZM0JAGJkwxeH6KJ8oQSI3
         +jbw==
X-Forwarded-Encrypted: i=1; AKwUvBwtgfgD4ilUAhn4orkpY3XWsI/0tsnrL8e42s5RqbKoOGDyDWDQFPiJgownbNcbchEPBJza7g5cQLw25w==@vger.kernel.org
X-Gm-Message-State: AFuF++mByhj8IBYXYo1+2udh7lr/mByAz+zhum7UMlmMVT2XqIjbYcrg
	4BZvmiaMAPy1briP6ivDYVWpbpg/MOJBFcv05LldPCuR/QKp6AL8iCkK
X-Gm-Gg: AYBFou1YUhedUFzklth5JmYhTxBb/o5M8n5OM8Kuil/hsNM6fABnf6Z7BGYhcKHOmgz
	xO7MgozppAk+zTW2xxuVmWx62k6NN1x1kS/JwWucRV6K7SX1f4MG8AEy7BuCPIRFNbIfo2qLoEX
	1kz2ULXCMS+L9ctWK1v/6xQU3atBp3C4MhMs1PAw7tYUl+t4le1o6N85xQ2i0YdHIQDyM+KQl6K
	GvNAtBaus7rBq/xnGuGFrQcPWp2zqh9DvZSvLB4Nb7YepL7YBDxO8xYwEgbPreMXM/Wm17pAe9y
	sKgXcVDjLQt21YTdj1G0oY+dDdH3Iupot+vcaX9O9mk1zpDSm6gSEERnN4jwc8Of0cP/r0CEjRW
	7hyOWdAwUecFxnvAJzYyIEHTJ3Vn0xq5B6LtI+TDJUhX/Xj/EXNQL6XvvCru1vQMwWOCBW3i1Qo
	kXbrLAGj6yAa0AZ0sAWwIhqD4bq3MzjXGm9GGuZnRFB9FUcdYXA2SLk/5k0rDqHyZ8rPHF2Fn51
	dIRQPGksbkEeLQ/PJoUGbtalf/clZpqI3Nh/jBO
X-Received: by 2002:a17:907:6089:b0:c29:44b0:1428 with SMTP id a640c23a62f3a-c2aae3738e3mr134989366b.42.1790149773766;
        Wed, 23 Sep 2026 00:49:33 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6f5asm64951366b.15.2026.09.23.00.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:49:33 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3 5/7] alpha: fix the local TLB invalidate in the UP flush_tlb_page()
Date: Wed, 23 Sep 2026 09:47:48 +0200
Message-ID: <20260923074903.862898-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923074903.862898-1-linmag7@gmail.com>
References: <20260923074903.862898-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uniprocessor flush_tlb_page() in asm/tlbflush.h has the same wrong
test as the SMP one: a targeted tbi() is only guaranteed to invalidate
the intended translations when the target mm's context is loaded, but
the gate is current->active_mm, which a lazily borrowed mm also
satisfies.

Test current->mm instead. The else branch it falls to already exists
here, so unlike the SMP side this is the whole fix.
arch/alpha/kernel/smp.c is not built with CONFIG_SMP=n, so this is how
the same defect reaches a uniprocessor, where the flusher kworker
necessarily shares the only CPU with the writer.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/tlbflush.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/tlbflush.h b/arch/alpha/include/asm/tlbflush.h
index 0c8529997f54..9ae1902faf8e 100644
--- a/arch/alpha/include/asm/tlbflush.h
+++ b/arch/alpha/include/asm/tlbflush.h
@@ -87,7 +87,8 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
 	struct mm_struct *mm = vma->vm_mm;
 
-	if (mm == current->active_mm)
+	/* A targeted tbi() needs a thread of MM to be current.  */
+	if (mm == current->mm)
 		flush_tlb_current_page(mm, vma, addr);
 	else
 		flush_tlb_other(mm);
-- 
2.43.0

