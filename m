Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307273A48C8
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 03:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791429855; cv=none; b=md5PGYxnvZVWQ4DpaOy0Aypo+jYqgfC2PLbmjr6tPfqOrDgNtM0NeJZIpAHVc5d/nRBi9xI7+DKS2ecNA5s3P3GT14nkn3KdwJW4PU3khB3a/hxqNow33s0jiVv1mxHn0aWd65NO2TZpIVTIyKzy7iqV8rXtoAwMG2/tIj6xPGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791429855; c=relaxed/simple;
	bh=wgVHbY7No0GMVPffT/l8AhfdwKs5R3SUfGvDNMQlP2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cedtIaxUa7BjST37MiiHrj4IR8RGdopaPFT4oOLxdlIFbwxS3MaL7XLlWKKrqXvHRPPxBD8OPz0w6krROjONu3DklK/s+FhOn5IRUxXunBMChqwyKY5Kc0TDHav5S3MHdQGgoMQ3l2MK0/cjfx72Tnc2gStAkMNr1ApN3bOr0s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaZkjExL; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaZkjExL"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6776efd4ff1so2839455d50.1
        for <linux-alpha@vger.kernel.org>; Wed, 07 Oct 2026 20:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791429852; x=1792034652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tR3C2GCMjY5EQ/GRIJNrCAmZ4Khbdwy4MDPpQDotXuE=;
        b=eaZkjExLgY6GVYfbminE38kdBeAIq/LxkGnsYUedIWDrWgpBF33sKvMgJD2AzV0b2N
         BdpOb5ZVjpzCtnE5IMHLkvymA3hJ6O7NXPgzlS3/EfOTzIHvjs7QLhnXOtEf6LYm1xus
         TKG7gtyIWC3Sfy7NFLQD9CIJkYvbsCnsdmgK2gjWYiLAxwG58l3vM0BiQIw0wypzgg8M
         GaisKVcPu5SqRdE5E7tA2tTLSPcwVkt30lL6t1/CZ4KgXC8eoEB6hvGfa5af3ml0zz4J
         51K5f0mw8AUnix1hJGxrlUbGDHu8uyh2ADOZMnSi3P/57IKFBb848/vpKVwWIqJ0CEY/
         nNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791429852; x=1792034652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tR3C2GCMjY5EQ/GRIJNrCAmZ4Khbdwy4MDPpQDotXuE=;
        b=fj4jT7KZ7vXjVa9wcgk4c7cE7ft3STkQLCVzLXJdcnVnbGk35JlnpSP+ORP9mv2jr/
         qhyUfDHLJ1tZPNpGcE0d2oc7h9FC7n/Mq9XLc3STmzXnQwvcR5emmmRyn8CCfS48rX7v
         n0FZ1GnNjFteEtWopLHZonv8GvkhJxAC96KPSHTWJs+qJh86r2fnXfa5HtpXBpUJNbNe
         n7+lTzW4x0yXRRokU4Dke/xWg1506q8pEQ0fvIqlvoHaDXUu1wSX/eTirh+YgLIMTqnq
         Bs404oKpGXYwWeYa69ua6RQzfxAqUSZCqOEa5iwfZFr8+CpCwLOYaiIkOVJ5ice7DrlO
         0QTQ==
X-Gm-Message-State: AFq9FYKeSOrFZhdOXku5Fz22/OjWMy94RMw3TbxbJ6l4FK75T7eVdcAF
	VroBoj0CbpNBXqFDnt1cyFs92Q3pgqluTSKi2Q9eyUoLBs6fi2A2WpWj
X-Gm-Gg: AYBFou11NIF97crwuYCM7FSIHxEsZ+/G3EsVmxWFxcu2l3YywfX3buXw2rsWcsXJ9R6
	boyZ6laVFCc99uy9tLSvjvRDzdvqZ8I0wpaclT4Se8BPcTKvqo+6IAUeCbg2CQNd1HrsSJPc1yQ
	oBO7W/MK0eeFD6Wzm4wngNfx8mwvvZbJA4J8ihHkkEjlTU500tqj/SwjY2Ri/D+appOUTcV5qvQ
	KCTn7VlvmoFbOlygKtC6+2ATKguXSOgIxaitsiJnaZJH/FoVQ/l7vdBQ4sBbjzMf4H3IGYErCh9
	dELeV+FnheBFBvd8q/RmgDrr67zecjUrYv1jRMbKxbFFS/eC5n6Djpwcn5zVEbeIbeYiwAciRLY
	aP0NyHafH08KTtUKCwKekO0U9fDleMySt3/udjVjjroE489TrX2S3doQhQgDLv2U10ewlRO8Q3t
	XtF532DVsEG1GnDQZJLIbqrraqqm2WCOrHQ1Eg0Ab0jLXFx/Ak6PlreR5QX9JoGDq2bktIfJY=
X-Received: by 2002:a05:690e:1508:b0:677:cb43:4b30 with SMTP id 956f58d0204a3-6790a4f7395mr1985554d50.97.1791429851759;
        Wed, 07 Oct 2026 20:24:11 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6791ad6d3d2sm734693d50.1.2026.10.07.20.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:24:10 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 07 Oct 2026 23:24:04 -0400
Subject: [PATCH v2 1/6] alpha: add missing page_table_check_pte_clear() to
 ptep_get_and_clear()
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-alpha-hugepages-v2-1-8e108af2d961@gmail.com>
References: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com>
In-Reply-To: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, 
 Axel Rasmussen <axelrasmussen@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=wgVHbY7No0GMVPffT/l8AhfdwKs5R3SUfGvDNMQlP2w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO81zJbrz4vOLjdusfjj9k9nQvmT5Psttf88/vN5aFy
 7TW9Yc1dXxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1ZlIM/3TnVj6w3y
 /gv/721tffVzHtcihc+PNj7V6HG8/4OWZsErFj+KftdiTnXGey+yP7pMp554zXdh7kfBs8m6vJX
 on3Yu2sq4wA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha's CONFIG_COMPACTION-gated ptep_get_and_clear() overrides the
generic version in include/linux/pgtable.h but omits its
page_table_check_pte_clear() call. With CONFIG_PAGE_TABLE_CHECK=y the
map count taken by set_ptes() is therefore never dropped when a PTE is
cleared through this path. zap_pte_range() clears PTEs this way, so the
first page freed after it hits the BUG_ON() in
__page_table_check_zero().

The call was instead placed in ptep_clear_flush() by commit dd5712f3379c
("alpha: fix user-space corruption during memory compaction"), where it
was harmless until alpha enabled page table check.

Add the missing call, and drop the now-duplicate one in
ptep_clear_flush(), which already goes through ptep_get_and_clear().

Fixes: e761b6fe4085 ("alpha: add ARCH_SUPPORTS_PAGE_TABLE_CHECK support")
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
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
2.55.0

