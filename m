Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096CF3DA7E0
	for <linux-alpha@vger.kernel.org>; Fri,  9 Oct 2026 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579912; cv=none; b=lovT/GOUk98AGTy9zHc6Zh+E3r5hNmM7Run7FSXUxYiBP+9RdF+8pBsl1bYZdOr5Oh7qurjbvPl2FKjqlJDQqg7hE26Z820Il0BhjS8i32NAmDBDjc+Eo60pfxnCC88lez7ehVG0Nl9wl0YYRjs7iIC2uE+uWsASYBqmQ6JkNQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579912; c=relaxed/simple;
	bh=5toHAWoa9RZfe3NwUtwkxm431ePYX6KMOn7h4lFo+DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XvPKhHIMZgnaHFjSYtFVbgMXZ+nULMJu48XHhq0yY1Grn0ce153AyGGEIjfK1YXDE+xn00C1o/e0dEiklIIgQtGSKbB1+fXhwlilMiPeNdeNejsqyACrCcZ0jtC7ShHgo/cIFCnAhynZn28P5v20a+XnhGIc74qQWyuO/NMBBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqW4JEO0; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqW4JEO0"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso151750a12.3
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 14:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791579907; x=1792184707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hkd0Kv48QkL3NWd7Acj/unZYgr+JarMkSbQu09jWeXs=;
        b=VqW4JEO0sYvBYL5t1v31+UvdOUtHAjfMKhui9mCQlPRT67NsJ9cpPlRxWegGkjDgyH
         AJhy9E/IrLkMf92vGWB7B0BcoMANC804Dq50Psuuch9UUk5fR8oAzK8WOGKjkxIWYBL+
         33fdnbBJ37VY3pScvSCOF/9qK9kFi+NtTx8y3oKqinC2ZQ/1rDapZE1LKtgyD12eSXLy
         oEw9y+nR3WnDwbtYh69EaYYrzbeHDh92ljjjhxz0xCLth62JvhqsbLu67ESZaKDKgjg3
         5ADd4rc9VPNLenH4NUSRkx+91VHAR6pL+xbthyVXnO2s0mVxb4FxYgoL/Khu3J9afzQR
         EVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579907; x=1792184707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hkd0Kv48QkL3NWd7Acj/unZYgr+JarMkSbQu09jWeXs=;
        b=jRlP8saU2tD0tftb6+BE0z698doN2g51NN0B9rsxMt45hMfaNsx/WsX/8UOVLOtnfu
         t+pG/fQz8yEUParrjNq5gcwDfiW9YUKDe28/QfQV7vjF8l6eVmqZWHNfZEUr++UclGqh
         20dzK1wtnYSWPfG0q55czOC4FIrVeVHKCXdNogogKYJyXXCD5qsIE+bvAjYvL/Xzy9E/
         y3vq0z11juibkLLcv8FfEpuO/SJQUTpDqNIdT+DR2HqPJApifGN/7GC2H88to/66QeWt
         nrdso9HGzPftC+rapDSXNQd32gTf8LOpl+hhiveQkwO2dsOqtCNEuTbzUIy4Bw8q0PMF
         yCKg==
X-Forwarded-Encrypted: i=1; AKwUvBxMpXyUhvZJf7QalwmGrMpSYB7k3VnlI2XjG5jYhjWsNdtAkAOvH6v4gRD0FuIyyHG0Yt9DFSAIZTIk3w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIFeU3jbY4ug8vgSbaJqbJPPBsrDVeQMRpkTOlhjLLMMLRrBIje
	HSMx0taUbMKmnHX6SSgQBbeSNI29jZdRpI7VLbOMTw0dahYtKMltT0WhrcjMb14r
X-Gm-Gg: AYBFou1xMZOxdDR6jqTLCKDb12cY6uJJZG4X21GwKwv5FshpssIBXWbmL3/yGdCseTe
	1rBED4Wgw9DT+AusIEGrZXNmyWUw7TS6v1Fn7d+Qba3MJIP2QAN1GbNGeua/TYfq6XLDycc9V4a
	SdasRjEvzUBqvn/1Ucacl4FSkJEj5BnePo5MrZJ1SREX1OIW6KT61OB98BxrfsWR5IEjQJo5zA4
	47IA5jEKl9u1Ioqp8VFQT1g3ZAC8FLGbrQXYOA1hWNN3hdGdRnH5oIUoujJRPQiWyoaD/AoOmNy
	LFzuDJL/kqnsZcLbicYWyuWo/2J/fy01cFRrfGniGgNazatDQHMCIgbWKjSNfgS2FQ3wkLA9v1r
	0rMgHXE13EMz7yvQ7PT1OcGSf9QmAmEJrWaqHRLV2JnAsbdZIoaWgxK4YebM9s3IAEllBp/h5hb
	iD9SG1cvMDRKSm6Fb86GFFw+7sJavxdT43wBs4tAlgecDpGcef5HrIwho+OYPi4d+iILQ/+UJdR
	u4OpDqM5H+mv9n7iKu+T/uRa6f0QHSH1hbw4cHj
X-Received: by 2002:a17:907:2d21:b0:c2b:7686:4d7 with SMTP id a640c23a62f3a-c31a9ff6976mr305989166b.39.1791579906531;
        Fri, 09 Oct 2026 14:05:06 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm142141266b.8.2026.10.09.14.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:05:06 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 5/8] alpha: fix the local TLB invalidate in flush_tlb_page()
Date: Fri,  9 Oct 2026 23:03:50 +0200
Message-ID: <20261009210449.971057-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009210449.971057-1-linmag7@gmail.com>
References: <20261009210449.971057-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flush_tlb_page() invalidates the calling CPU itself before asking the
others, and gates that on current->active_mm. For a non-executable vma
that means a targeted tbi(2, addr), which acts on the context currently
loaded and is only guaranteed to invalidate the intended translations
when the target mm's context is the loaded one. A lazy active_mm does
not establish that, so as in ipi_flush_tlb_page() the target mm's stale
translations can survive, and nothing forces the old ASN to be retired
afterwards.

Test current->mm instead. A lazy caller then takes the flush_tlb_other()
branch added by the previous patch, retiring its local context. Adding
that branch first preserves the local invalidate at every step, including
on EV7 where a targeted tbi() against a foreign ASN appeared to work.

Which callers reach here with a foreign mm depends on the configuration.
folio_mkclean(), from the writeback flusher kworker that has no mm of its
own, accounted for about half the calls during writeback of a shared
mapping and none at all on anonymous memory. Those counts were measured
with CONFIG_COMPACTION=n: with COMPACTION=y, asm/pgtable.h overrides
ptep_clear_flush() to call migrate_flush_tlb_page(), which rendezvouses
with every CPU and handles the context itself, so folio_mkclean() does
not reach this function.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Message-ID: <20260923074903.862898-4-linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index e4ba0aab8a66..a5a42ae4a7d8 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -684,7 +684,8 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 
 	preempt_disable();
 
-	if (mm == current->active_mm) {
+	/* As in ipi_flush_tlb_page(): a targeted tbi() needs MM current.  */
+	if (mm == current->mm) {
 		flush_tlb_current_page(mm, vma, addr);
 		if (atomic_read(&mm->mm_users) <= 1) {
 			int cpu, this_cpu = smp_processor_id();
-- 
2.43.0

