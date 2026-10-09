Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018DC3D1CAF
	for <linux-alpha@vger.kernel.org>; Fri,  9 Oct 2026 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579918; cv=none; b=sua5k1wh0M9C0Muc50hd6kOJRLWdOpdKJ6MfwIWzPlceoHUSu1ePRMJY17v6iMBxP6smkm/Bre2hpc46U9K4yVm6n6OOPwvKaWASnEFX8VXdjmIqMoxqmpxleNbsHebqnjXZNMbUv17gNJLKVtM/Ne2q6N8ySxAxfltZqJ3OutI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579918; c=relaxed/simple;
	bh=bhQCTZ59FiryGzv3D1sOSpNJHyq8P/Yq23VYtggOCzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOWDFVcg4ccj+3YQ5tiV8ggI47XCBsERU9HF9lgOmHtxM2Bnpe76igSuf1oSrcf+o+vNaRAtTwDAqTh/N2Mxv9lANEY0To+Sch8JKPqrbk+ki5HiDi2S+lxBQvofwxFgljrFR3Bl6cGyg/EYrV0yMjk3H9d8OaUxWfYu25ydMxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHv7gey1; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHv7gey1"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c315869241fso38442766b.0
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 14:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791579910; x=1792184710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wz0G6EIJ9jHYf1DY2TM/zttSc2Bnn/rBBqINkszU/6M=;
        b=LHv7gey1K7d6dcBiEVBwPaJb/IInzcQqGE6LZ/Iyb9urVy9FAsgUr2SP09qeIEczrV
         c6TsmyBe/qTp62sDWB4F0pcSADsegZ7rsLdqRz725kApesSgt2GB0SahbPvgxZ7BSHHA
         LP3GvkOU/Zpvhl+579ojxLFU/GYwnehpC5tKiIy+YIdNb/NlB7Pg0Y1r/hbwL0XVVFIw
         AOloDh4ldlFvUAGlidIWANnx1w5FzIR4nWeETncZJsu7K+kePq9Yxwhc4Aj+sgsIGnZ2
         TuAMvTKrcwIIXeIOz8TWFaoohszeUGgvpxc/G8IFOr/wKWga1ScKAxrK/fKq3h4ljCIS
         qp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579910; x=1792184710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wz0G6EIJ9jHYf1DY2TM/zttSc2Bnn/rBBqINkszU/6M=;
        b=r1sneK98xShpjHj9XGkJfE/bojbl4KKHBgLDeXqKiYD+KyMfm6rqQoBi532U/tAHPZ
         vwEr+u19ck9swwlgAS17MZKwpu0iO7wVh4jURS91pr0y3UYQWSU58Cb8k+mR1g+0kgD2
         w4NqIj96cFpm2dtUD+72H4e0t0RXoPQLNWmNd6YjX3JjMnvQbXsTdODIUKbVOMzrfJYf
         eINPi4NALh2dVG7RiGR4T5nDUCmtA1aVvGRcex+UcGqV68DqkgZ75NYDcz7KvYb/zO9c
         p5WZuWElLT3eu4vsR+KF95CSqvyiK3rrXdFWYMIKXpAYO5Ar1yDhvj3qH6kpLre5PhFv
         Kg3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxRnUrKh1zo8ZEdzZxVVLJk4YY6IwKwfNnv3nnOEMRR79QxYLCz9WEfggSinA4HICoMksUpLUEVtpBn/w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIqtsyQV5KJFaxrWYrX6PpLJjgPFUWHMPQPUFr0ptBziqzZKpOG
	fGjuqEqxqaffR2TbkG7yVS43cisQDMEP/TZMaoqHh4HYT/O0ywSOpBW8
X-Gm-Gg: AYBFou1BHetG/LkIIU79MjxW5Ym2vCLmOx4VkRACPTNbwYTW8lfuYOuavR4P9CLzuHg
	MXAeepIH4GiqrnSirvRP1952BwZrWmYK+/47z+OgUqKOkrRGPFsB1zeFLczZ84U0Y/N4K1kM4sE
	GtAMZegpHV+Rs6Gakq3VpUQx19njku0cRR4pBYcxYVZ3qfapPUQnCpO10VU1JupYV2UTlVZTPxQ
	r/u7Rv38uR2//N/nUYDMcJpK26S0Mo5jXVjP6dU31UneFQ9032pXzi/bhCZbagbCWHzJgev19rl
	zel2HJLXR9vRhqBsThZ4SkWxt9lyCl/2LfHhZnOFahNGak9n+795rYr7Sab4S1K201D/fOq5dXe
	mnQL/a0rZEHeo7g/lI69PLveZNUpjM9y6heBUi7t5W+dLvDv37xcBPjhzL7ZiLMswEXJZTm/mPI
	jkti0vR2bdgIJc0SClsTRL6Ixc73x9Whc/TLJijI3Sut3G+KqsZKAOrxSRnz612Sx1UI/vk/E48
	nKIQ/kch6NNkfYi344Rc86zNkRADVnJjx2xpL13
X-Received: by 2002:a17:907:1ca0:b0:c26:22ec:db92 with SMTP id a640c23a62f3a-c31aa02c51amr323343466b.47.1791579910016;
        Fri, 09 Oct 2026 14:05:10 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm142141266b.8.2026.10.09.14.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:05:09 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 8/8] alpha: invalidate the local context in flush_icache_user_page()
Date: Fri,  9 Oct 2026 23:03:53 +0200
Message-ID: <20261009210449.971057-9-linmag7@gmail.com>
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

flush_icache_user_page() has the same caller-CPU omission that the
previous patch fixed in flush_tlb_mm(): when the target mm is not the
calling CPU's active_mm nothing happens locally, and smp_call_function()
handles only the other CPUs, so this CPU may later reuse the old ASN
together with the translations it still holds.

This matters here in particular because the function exists for
operating on another process's mappings: the comment above it describes
setting breakpoints through ptrace, and access_remote_vm() reaches it
through copy_to_user_page(). The calling CPU is therefore often running
something other than the target mm.

As in flush_tlb_mm(), the uniprocessor implementation in
asm/cacheflush.h already has the missing case.

No imb() is needed, here or in ipi_flush_icache_page(). Alpha's
user-space I-cache flush works by allocating a new ASN rather than by
invalidating the I-cache: the entries stay, but they are tagged with the
old ASN and can no longer match. An imb() is only required when the ASN
space wraps and numbers are reused, and __get_new_mm_context() already
does one in that case.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Message-ID: <20260923074903.862898-8-linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 988e397b0b8a..e21bc3920bec 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -758,6 +758,9 @@ flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 			preempt_enable();
 			return;
 		}
+	} else {
+		/* smp_call_function() does not call back into this CPU.  */
+		flush_tlb_other(mm);
 	}
 
 	smp_call_function(ipi_flush_icache_page, mm, 1);
-- 
2.43.0

