Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05932380FC1
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 19:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791489387; cv=none; b=Fd8dSCEsPjR2VEh00Fme8b8bRb/cYqO59DdMDa1RfiNb3DWN6c3NezXMHo0uuMqWmHAVo7MkJ/reHhpPNe8JqRpfVY21Env5jWEtfaY5NStcTVU7A0oBxXpB7LxjKRafGzH43ZNTLYo2aWc8rhyhxVGmqQO0K+6bQKsovMEddcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791489387; c=relaxed/simple;
	bh=Zc2UJIh/Gz4b/GfLgUvqGBXnO/DO2zauikqTsYZZdvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aK68G+d2TdeY76jNZFD8y1UeuqI+LmsP5CeUxJSdmNUtUG8fdtV6sYCnxfWEt3Ccq/IOvQhqvK+oVaSqHh4dXhQ+w3acv4CWm6lPUBPOohg4QqMu6Ge0XLgmyQob9+UmE1tvjrV0zFfpvbFbFCE6wB9LIPAXFHb/rt3ijnMU4eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kbavzyua; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kbavzyua"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso578223666b.2
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 12:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791489384; x=1792094184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVpisjCcjbqYyAaO5WaK+JQliYnymANtNgrr9O1e3Ak=;
        b=Kbavzyuajexd84BqGXnkWLwV5dA3h0K+dfyCAIfh2XvADA74yulqIba8ErDd9UcTaJ
         Q3qyyAiTXHSnxDekCQxNpdISJ9kI6W9ZTOQAa3eoxWUZ1qDsq/NwKuwpC45VbP4aJNn8
         Yzc0TWU2+vUexoEK1O6FcRcxdmAsNET7suEglDhzjkiJnu0QYIVVu5sfWWCKovqbsj6x
         KkGebViuD8vVlqo0IF7E2CtMd52UUZqYHqkdBzEH9DRrB0NBRWyQmPXEQxZd8N/ziC6n
         6HeNMbctnpcoAbi5+XYvhtNZeNfQraGMy1Fk8+OPrFp2X7xFWJdkakwE7ZSWH50j2YEa
         uFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791489384; x=1792094184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TVpisjCcjbqYyAaO5WaK+JQliYnymANtNgrr9O1e3Ak=;
        b=Wcq+ihA5ZyrL8CBn+vdVrIHDR11Edi/N4I6Gn7lyJznbsq7riSUg9xbA4zMC9eWGQU
         q7W2DVS99FhzFNiI3PB+3jjg79/vM1vXTQvQyMAcVxEgFGqXyrMLJPavQO+2zToA+7yU
         XG3Vg3Tq7Oer30KTNbTxJlr6JYpHppOLBwwZhneRoL8VfODNJH5ssQCiP1r9ygvJN/Wn
         EIKTpqon9YQpCqbwSvpn8rfmgWmdx80GYfBqdHg3XocPJndecxZmMIWXGLYY49w7JitS
         gLK0enviLpzBT89ReqMPwLU1rDDvVhFfkcx1KTY/Xjos6F1W8EMDHpZKxb9lVat5FyRo
         sZng==
X-Forwarded-Encrypted: i=1; AKwUvBwemGWk87HfAD0uEVDZChh58vW3QylbJlXmfBA+A0dXB9SSM8EAsikOXOlMppmVPMypsGwGHSO7t5TtOA==@vger.kernel.org
X-Gm-Message-State: AFuF++nJe/kb4v4mwH/esK4o126586d8nqWtCed1NB2EnvqGSbPp1nWU
	DVxsRpyrTukaGML05IORep0yXK6iQPhHANVUwjxD3Dwge+i9+woFca2d
X-Gm-Gg: AYBFou3sqwHCTCbkYJsup4L2byh7jWxwMX5kYSi12MrmCG53oW7jSSzpS9OUgxwZP9s
	5UvPqUk5i6YgSm7ZSxtNUQrXTGsAUNM4NnCm+9iUdNX3jcGtnwmv9a4SDWPc52FFylbZFbJl0O0
	sahas6O43Mwd/HYSKM6pKJbKbSEeTG2jHhBH57NP5zCERRTFIzEBL+BMQ5gQsDm+CfLVyq2iGTi
	tsKmaMRyVez8KMibGNGoBpu0rz/6WM5q79fcC6Jy0gMqw2aToJI7gvlx3+e2Z/ve+0bia/mmyNZ
	18yrqyv7r2EQ6keJTVgNizy5IynfHJELLtUqC6lG3bsE3dj/LhuVnEUmUg9njO0slR3RPUyros+
	T7eHjYGKeSHQJAdikLH6R2Be75JKU1M+0EQbqrnxEpNUOubX9L+5H1iNPHEFHDYCNv8QMNlUB+0
	2YhCr5es04ArUnZ4WJUtP+yYjid1+vLIXq3tclK73ismoTIacjFgaFXrReqoJkXObkDte0xPwnz
	aTepPWh8t76HP1sJEkT12Bv56ZT5bC3DaY3Jp+W
X-Received: by 2002:a17:907:d1a:b0:c2e:40a0:7978 with SMTP id a640c23a62f3a-c317bd54e14mr640435266b.9.1791489384223;
        Thu, 08 Oct 2026 12:56:24 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a4d0c2efsm9906266b.26.2026.10.08.12.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:56:23 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
Date: Thu,  8 Oct 2026 21:55:17 +0200
Message-ID: <20261008195608.965266-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008195608.965266-1-linmag7@gmail.com>
References: <20261008195608.965266-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the on_each_cpu() rendezvous, migrate_flush_tlb_page() walks the
other CPUs and zeroes their mm->context[cpu] when mm_users is at most one,
described as mimicking flush_tlb_mm()'s mm_users<=1 optimization.

It is not one. flush_tlb_mm() tests mm_users before deciding whether to
send the IPIs; here every CPU has already been visited and waited for, so
nothing is saved. The callback has also just set each CPU's own slot
correctly, so the loop only overwrites it, and does so while that CPU may
still be running in the address space.

Remove it. The shootdown shortcuts in flush_tlb_mm(), flush_tlb_page()
and flush_icache_user_page() clear remote slots too; once the next patch
removes those as well, every runtime update of mm->context[cpu] is made by
CPU cpu itself. That patch relies on the invariant when it reads those
slots to decide whether a shootdown can be skipped, so this one is tagged
for stable as its prerequisite.

Fixes: dd5712f3379c ("alpha: fix user-space corruption during memory compaction")
Cc: <stable@vger.kernel.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/mm/tlbflush.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/alpha/mm/tlbflush.c b/arch/alpha/mm/tlbflush.c
index ccbc317b9a34..239c72b8a741 100644
--- a/arch/alpha/mm/tlbflush.c
+++ b/arch/alpha/mm/tlbflush.c
@@ -90,22 +90,6 @@ void migrate_flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 	 */
 	preempt_disable();
 	on_each_cpu(ipi_flush_mm_and_page, &d, 1);
-
-	/*
-	 * mimic flush_tlb_mm()'s mm_users<=1 optimization.
-	 */
-	if (atomic_read(&mm->mm_users) <= 1) {
-
-		int cpu, this_cpu;
-		this_cpu = smp_processor_id();
-
-		for (cpu = 0; cpu < NR_CPUS; cpu++) {
-			if (!cpu_online(cpu) || cpu == this_cpu)
-				continue;
-			if (READ_ONCE(mm->context[cpu]))
-				WRITE_ONCE(mm->context[cpu], 0);
-		}
-	}
 	preempt_enable();
 }
 
-- 
2.43.0

