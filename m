Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01B94F55A2
	for <linux-alpha@vger.kernel.org>; Fri,  4 Sep 2026 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539084; cv=none; b=KZUb8i30fU+AKL1uZX1DYh1iaZHXr3S8WlKgXaa1hRfQvLAvPyBTu9nWbOqF7WQE1Bv9IDlG1TEwYc/CtmJWcVWH2fE4SPmeI4bRbqvzrx97NR4PbUYYEyJ2PA9U29RL7vkFzbGFlGpdkWLwba3lINRG/3S18n51ackGcXTYE9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539084; c=relaxed/simple;
	bh=skuvCUahsfytaEHEVgrxvRgfWIwbYI863g1x7rEjkNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vq8OMXYE6nNNMXXtHekpN7Wri2YndZHtYEh0chPvqGDVM98j2s0wVQ0TOFMkwphYx/FBAvoYb47ihdb/cffWWHJ1vBs6k9uoBjBsfMFgJV+COZubZcXVYayoTMnvdm1lCFyi8jSYYrZsjI/HItlh9Rme85GhPEzpycdf+QU/v38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qoINVqpR; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qoINVqpR"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c207cb16cf5so191400366b.1
        for <linux-alpha@vger.kernel.org>; Fri, 04 Sep 2026 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539080; x=1789143880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5RCSh49eI3RTioTN3tnarfx8+DyOBkMSuq84hnwt3Q=;
        b=qoINVqpRPd0+Q1KBd9PYC1f3KG2+Y17GXHxZJMBTJIiWIDAENQ3mwUXP2tcO2deY+1
         Fm7W9BnREQJ1WAhM2vwV/GVeRzkRPfoVWDHVQz3UblVJ+fOANMsFWHyMDzSdRkjLFwaJ
         2AlqsVpr/fA9u2rySmfusc1nKwGhzjkKmgZsAsHmp17GQtmXygrxoWp2ko1jzFNbbXsr
         XrtSoknLJ4i1a6eO6H9lQtpNVimnBQc8HSDbxje+PdVUte2SGSzR+4Yq1SZEHkViafdV
         UARmMbcbfFNZ+CtJUqHyzDyTtOjxL/p/Vwq7pE1zWMQjD+JrUnlxyZXsJEIeD01Ldh5m
         zl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539080; x=1789143880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5RCSh49eI3RTioTN3tnarfx8+DyOBkMSuq84hnwt3Q=;
        b=OXhhs3j7Mi80sZ9HXVUgRfxJS+ZtUNLN+Ih0PIlpWP0DubqycjVvQC5ytoZcCPZ/SV
         XQENsGbYm3Qwtb60fhypHT3zcTNQz0iizdixNaP7kql/l4AgHHeDVL/kz70mGQjFy1/W
         9sqIzaPp8YBQtFoiyweAmGNKmdZeua0xllXehiKqDgrCFHk6KkPcgW5fJInKqMoncBBA
         XxZak73UEShKIUnYA3Po5fi2Q7HDhI56SsMR5aDBULRQ9ETrio6i4K7SwYK2wiqSDCZb
         LVZ3Cw47mPp94VUwAc66YUMohplWrcZ0UMXjrKZKm5hRF1SRtMqA3DbUc3i/+/aqcdUD
         +axg==
X-Forwarded-Encrypted: i=1; AKwUvBz8LHc35yIxslyy0xbwK8jwq0T0DW5uQ+N7Zq27QnkZ9LSX1EDW0CFzj7AjNsGbTfF78PJVpRDK9Y3gUQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n80/VBNI64slBdTyyU4reS5LiGqxrIKZcuV+zwSXyI8snQKsPR
	ZIKL0SDa9VoAFpEw0hDz4hvnVtQWohI/S4hhxw37/dLmHGMzixXG9lzi
X-Gm-Gg: AYBFou328NJS/KCJCrqtJ5J2e+XAohiDP6GsiNBVD+9+Xp9SbONjm/RSYRHJZoO+cma
	1Jha0ZBAcLwWIBs3va1HMwHNqey5vL6vSSj1pRshjswyj2K7UiTn4E49rwuBDUQGi03PbYeqbKO
	SUCslSdvuSrV7t3nV8EUzdYPOijz+hYDpEK8C+WhDv4Ky+vW0ltHm7hps24rF0LK+4EBCs2DOZf
	fI2U92q76MvyxjXwN53t0p2I1Zi7sVblk43A703yUBs73EFvGRUBPh19mdoccjmu65jhCnnB5FY
	gfhblZp0SUL4r+4P9Rf74C4WzbEitJqKg2VX+WLekc4Azic+r/v+wVNYVOsv+rH3eZ9yfcRhmMG
	UcBqG8Wi0qtEBXJu/k/tCEJaiB+8h+ic+Ew3TpmlmSt8KK3gqdEmoQxm2msLP3VAP34sXgpLw+O
	P1/tOAFNvDIA0+BvXEgO3ZvjdcvOD2T4AA/8e4YsPLrshOARYJGqbvv3T3m3pGHPW6lQDdgtvsH
	KemyVy3rcZKPZTAf4DaH1SeotiAZ4WmSdpXmY3Lm7Q=
X-Received: by 2002:a17:907:9713:b0:c26:1648:a066 with SMTP id a640c23a62f3a-c261648b70bmr184663766b.33.1788539080234;
        Fri, 04 Sep 2026 09:24:40 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8bacsm132556766b.17.2026.09.04.09.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:24:39 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 1/3] alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
Date: Fri,  4 Sep 2026 18:23:29 +0200
Message-ID: <20260904162424.376504-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904162424.376504-1-linmag7@gmail.com>
References: <20260904162424.376504-1-linmag7@gmail.com>
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
correctly, so the loop only overwrites it and does so while that CPU may
still be running in the address space.

Remove it. Every runtime write to mm->context[] then targets the writing
CPU's own slot, which is the invariant the next patch depends on when it
reads those slots to decide whether a shootdown can be skipped.

Fixes: dd5712f3379c ("alpha: fix user-space corruption during memory compaction")
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

