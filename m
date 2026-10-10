Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3B83793B4
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643590; cv=none; b=aEJelR+ZXp+DfegX09rjTcq4u7BqrRpaQZFLujM4sfnWNIkd/hWICsJEiz3JGscK7Wl4Av/V0nacROX4MTV3las5St/oU3lKYPYrbDRC+LYXOMKPayx/uEjkdzHS9AV9fzUR8sgci6UPI81QGodbevGB5CsQeRb9o5topawiDEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643590; c=relaxed/simple;
	bh=Wvi//AU9aUa0xv2xAKbaSl8hbCy/X/0aBofKQo00tnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSbfU02e96YrOFMx/dR2vEnagdXDL7A3YWEF1wo5mLzncNC2xHjNTHZaPPBxZq9+e6ziyUSl1oHC9e0JGQ/t/nhmTa2vA6dnswIgmgVcxEur2TgFhBpiwRnF2aUsSGCv6LgP/TuqLW14/6dCYjgZmGZotx8oPD+HF79UrDG53sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rz7lt6pJ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rz7lt6pJ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2acc1e170cso112819366b.1
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 07:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791643586; x=1792248386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOzUK8aXNK95MikIEjp1tQfOk1H/IJqCnHMejxcL9r4=;
        b=rz7lt6pJmvAN5eaZKH43tNAKlFYOYBP07WBMlV/D+kLzvp0ySCRg4cqqwd/rufv8QB
         VFro7YP9CNKzeUCzyTDf9GWKHPLh8bzBa/E0WVfeJ+ECY4AsQ3jsBfASS1+mzxdugqaC
         mWzkR7yASVEwELV6/dk8+2pIOBtgUFI8LDa6XszVamO8YxuVIB/vIsBP4KHJtDts6ix1
         Czf63XTKbVBYg9QJXHwO7I1pBx2lL2sUOS+MStYDiGq7LVxc2EX7/wgkYUrY57K1/qCS
         2j/tkAJn5cZna6Az1nzKzo0MqwMdyPWcasIEmINSFb/E+GzMdWCFqOQd+oE/ae6gwVGC
         Ykcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643586; x=1792248386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UOzUK8aXNK95MikIEjp1tQfOk1H/IJqCnHMejxcL9r4=;
        b=vtddvEX8Aatui2BZ+mIgqwwuwqjUbHGNMoAmmElsTQaEFnGIa21DRBY8v0/j8qKUJq
         VAuZKS1UvOompcooWL7/QXH1VKEge5uf6ontsbGrHjtUqIH73ec1pc88W8uH9w/mrUg1
         +VBXM9A0/Vp04VWnfHppqn4FDrUN6D00n0QNIblR/EawYpHohBwfBe3QVoFF8OGkN9g0
         g32OI4OA6MCRMapQxeJBT+ibCmVSC32ArxuaOX4gbPMBMJ5iMf1A5wsvKhP6iISl8ZaV
         afDX/zIZdR/PA29Gq2MiXnJnLd4TwLqXdE+MbKPIkIyI7TeMuzX11ekWx6PT8cIOhqYb
         upqg==
X-Forwarded-Encrypted: i=1; AKwUvBwG99owman6+zwiLsWvF0ZE6cGzULL5AdzFxGrA4TJOmtXCvfwwCPUqlxWn0ddNNHOLzRdL/eTMAN+XEQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKl3IHMASDFDpPcfwWxd7pcJsT2jVTGzoSYFupwy4a0lbWwP3Tk
	EYxkx66lLGBA7AoKgD0657ddC6FXYqLeWpnp8yD5SduEoxFYKyEeTKfF
X-Gm-Gg: AYBFou1KHxaA7sfWWCERgctYZAirXecXePS/whRbIxaplPw9UKukwtCEzc+N8LKuaLS
	EtluTjZi1IKC7y7x/ymVCwZneLystNjclLMB60+GOcVJOZwEDXo6i2LcqdLJQGL5o/s+c7kwu2f
	K+zzF/J3kac8Qzl9c2v7GUVb2AJ6atjy7+27Sf2SBhCcl8qlLYWczGzO9iX2AcTbkdt9gVaXuwz
	Bwl8ozsZhFkXVx4zThFpoDf0c0OUUa9mMXLUa3J6AcViC01WVdTYPjt6st+GSHzMbR/2K+0S5DP
	YN1btIzdGagnj7CxRli0oFZmJMO3TvqX0GtgLUFtUJ23Kps3vF2HRivfHsAwvbU2nGFrUOXBHM8
	xdghuwDPthnNf6MfbW89tM5Ir8F4jYjgff+NqDMjKyGt2xRuyWUcHp3O8kn3znUYSDvFFxK30OO
	KXSdK4AGVmDCC8Y2m9QgGBpG4ByE3YK3GgRMK6qkRLL+XsAgyUy4KwGZeLrmLu7J4JDJv/rqg2q
	WvkS6CC7U25APhsEX0zVPUCZ0yLr0G1gfAX6C1mC6EGrxVca3A=
X-Received: by 2002:a17:907:a4ca:b0:c29:f5d8:9c82 with SMTP id a640c23a62f3a-c31aa0dc185mr510677266b.49.1791643586117;
        Sat, 10 Oct 2026 07:46:26 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9767227sm247286566b.11.2026.10.10.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:46:25 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
Date: Sat, 10 Oct 2026 16:33:10 +0200
Message-ID: <20261010144621.974850-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010144621.974850-1-linmag7@gmail.com>
References: <20261010144621.974850-1-linmag7@gmail.com>
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

