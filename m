Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE423DE452
	for <linux-alpha@vger.kernel.org>; Fri,  9 Oct 2026 21:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581119; cv=none; b=N/Zy/bOFr1/ohgLyHUuwQRPmrCddTVcAKTQuhy4E5WGAc+2E9F3daGcc71XJtgIP3MK3siX+OO15FaS6IRXINuLauERtaa2hqz7Dk7euTMfg0H2EQFpRsD4PrNpKwDcnw4ir4tmfR0w7pSlHtahzjc0z3NlJITymlG2liCnv190=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581119; c=relaxed/simple;
	bh=l+10RVdMjooYlozj00YagPRxJnPJycDfAXhfTLYB5mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TamW51hqBp07yc6arHNVGvgj8n5ou2wjjoFtCeB3GGp7CwAcrj2Ov82nGk7LWrGFZxGgmjUZVtlZq1DduCfqXZHjinAESeM7fQf7jgln0+CIrV8my421Cc+cyXTkjkL13fQiw6E2BfyTmThXxxo8r8loxliUsocvlfixuku0cSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktohFhsl; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktohFhsl"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e2db5e8e4so50415866b.0
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 14:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791581116; x=1792185916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOFw7EBDtEEegIcDVyyhj9teTCiXNTrYQF7gDTs01rI=;
        b=ktohFhslSR+DmIgXgBd2nUJhJngV/w5DDmedFhW8uDnuZM2689KB4ez9BVYdwOcHR7
         i5EX7dxL4ojPB7kVQmYEwfKIvOPF3henb2uNVgLGWgcysxuyBPxxmOw0MfJKO5U32X4b
         Zc4qPJvYYhqPzBiiLJJpAPwqayMTcs3BFJ+aEyf2Oju1XYbLxj436OjYyTTwHc3Xg2gS
         o7K+zIMxWBM0SnWZ0trYT0OJcjEuII0KNPZ92JJkyeV2PLfRL/SRr4KkKntg7vCyzqGr
         bCXZh77QoXhtfusOHPk3nt7/L7EtmJ0I9qXUfWKfkvL/WOETnt4+zZFFCizwoCZIoj8V
         MvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581116; x=1792185916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VOFw7EBDtEEegIcDVyyhj9teTCiXNTrYQF7gDTs01rI=;
        b=BPqVl/YiuTiUEHbu8Hb+2rHPa7sk60sy3wN4h4kM184afa0iCp7I9vOe6vPj9XKjdB
         Ly631G5ROd6gNhMbmUzsfkUEebgucJwZKNrTZTyyEEQCBbR4zGj2SkK6ujCOFQk2K071
         ER8LD/+xVZb0G4uLtPYpbaJgejoT3QL7ZXOfnlPelINyyHuZ/grnsSNrrV5NRcHGFD0L
         m2AkRof2U7+Lj2Kzcqlycg0reqwq2JU3n3MmJ51APod3bkg8Ue4zQ9m0Ca5aP1DAGZTs
         pu0iZ8HB2p6MJIKX3HgrWvXTn8DaD0hdgjp0Cxoqa/+56M+2M7KIYVdX2j8qkkDU1Yqm
         XLzg==
X-Forwarded-Encrypted: i=1; AKwUvBznQpsyYGdpW5/qXGorTI9rN8OLy0Sso0i9o85asgIJMxs3QF3oJaQVsQzV8AzNz1ZR5FyiWwhyIO1OoQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLFjo0coSlLVMIhq9aK18vlKuHoPY8eJP2pUs/kjp97N0VJfLGy
	9ijY5paaAMOsDHSvG3otFc4BoC3V5NaSZn+p0oeePeUGuVjDAumrqgSo0GT3KBpZ
X-Gm-Gg: AYBFou1zEDDHXJEbQu9eAturyC0AmRgfShkHSEzzMcO9cdn0xWpgcV0G8wI/9oTH+DW
	0WWTZ/muDyaU7sk6ZF07Us8iKp4aSCElVnAWQPd3ICPKw8y7FT+L/nz3ep2Q1RqsXnmO7g0JHzV
	ZSYHwkZrfYMXLt1Qmhq7Tak4ZmXe9EUdRzAt+iE7rJ36H1+FDc3+q8eRG22yH1VxjxqPa+ZOPpJ
	2784B1M4yPtYYoAt7olDJCyVY4rTskktJxH24F7vuNTZlzDPbt+CrtZO+Yxj0I1YzGBbX9t54hh
	mqqfEV0Rwf2ZyYVHxyeGrB+CBy2Y7jem/INtgJ4u2Aq8iNp8B312eyYD0QNPh52QmPsm9GyaIHG
	dZSPfkqTk+PUQovXTarTtecjTW6zypPjRgBDyk8sePQ+o2xt586e59L0V3utZaGgzSvwnNhln4+
	MtEMlxRgr38+73ibuzqx3O3HI9R+mvQ9TsHlWgJxBypmv2bYJIjj9l9mtiJE+9QJstogyyn2DtQ
	ix3t3CtcGg86WuhJVCgb8CJ3GuCHfNtYB8ebeZJd8a5xyD4zkw=
X-Received: by 2002:a17:906:f59f:b0:c2e:4b90:3c56 with SMTP id a640c23a62f3a-c31a9fcf0c2mr331531266b.13.1791581115807;
        Fri, 09 Oct 2026 14:25:15 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae42sm149079966b.15.2026.10.09.14.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:25:15 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
Date: Fri,  9 Oct 2026 23:19:35 +0200
Message-ID: <20261009212501.971158-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009212501.971158-1-linmag7@gmail.com>
References: <20261009212501.971158-1-linmag7@gmail.com>
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
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Message-ID: <20261008195608.965266-3-linmag7@gmail.com>
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

