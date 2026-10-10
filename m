Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9271C49E5D9
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642349; cv=none; b=rdeU0KLx8DaZ+KAtBoZzBs11RYMW8kiqrhIeERF1hGgdpqbdQrXTYdLLdBu24jNABlMrbEpPejh6MYZdzBZv6nxiKfGKijpRKYte7bcI5+5q+DsVKJBHL2Gkcs0T/36n19rBMHyxJDCgdHzNibM0BnYC4HY0jpqAecZDpVs4rtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642349; c=relaxed/simple;
	bh=9ypQxSCPJGLXlWd5dhzalcKsTjSW0YYrWgnrxVKaaSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZuT8xLV7NdhFAQHc48piDx/Xj81NBs661OovH/TsUelHuGRYXnogpmFpPeyrr3MmhUp1sjzvCQDUiKbg5ed/homaKu5KPAj95R2woPx0CfOfCkwvLSRAboOx87NQcGJSrHzrXjsSLYZqyx85Q5bAp5jVNB7bEAXR7FXrweZsq+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRtAM4vU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRtAM4vU"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6aa9164072cso936952a12.2
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 07:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642346; x=1792247146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SY31IwQG8K0FMtEN3imdz/ZZUjyZiV853x9as1x0tI=;
        b=VRtAM4vU3NZ7EdDkzycZyryjclAfs3t0UBJb1FWp7Mf0fZq1Dfwq2XhaooToPJeRs9
         H7ePPUgJhTdziiZ0s+3w9if9ZvGhLOZImujStJfSga8Wd/oREO59MLrwR59VO6ybwv9Q
         w0ijictQJtbmoBIDTD8KgoGy4Mh7wbspWwc+I8kgtTMOU70gEqM0/UBbx+oDodN4iczp
         ThdeQFJnzYxteMq34KG8yLf+m+GHznZHzLdgnKXuR/Z6DpWXv4ApHGozx8I2GfiLMzmx
         u6D75RpiKfmcYvv7VSJDl4VaobJZ5BG8Mbn5p1yQy5yt67Wv/mXNMLY4LQ13IxywbbN7
         W44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642346; x=1792247146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SY31IwQG8K0FMtEN3imdz/ZZUjyZiV853x9as1x0tI=;
        b=UKsEtN/RTnuT0QTyqxQwq+AwXgGkL9Z7p200oejnH/BFdWZigETtr8ZqOIjdUwpNt6
         +lpMa5aB3EvH+c+6Y1gLnKFJxCDbutjFELTwtibD2QD+Dw5i0E8eROODX95qsqR1S8p9
         JiJnMmoHEAjTnsr7V1WCH9IRfHfMKBo+cwUnzyGJeMpfhZklVRDrcM37QTD4WwGdCJD/
         4/tUn32lG68AkJAqLHVq0MAd7Lq1BUtnqyNnwLvgeA5+s5xVpKRFYJKdbMQn4N25Y4st
         HbsmvKv7HAIpIS2m1H2rTZ00zOalvtl7lMcjnbcxrxGQPuYwL4hCwoHua7VjsQcIqXQe
         vaQw==
X-Forwarded-Encrypted: i=1; AKwUvByayp9MyLjw82wrPtzgvTov/1l86PPnjES5+KMWNzclso1Vh7nxXX3JvrJYxv2oSnq1uVSQSjJHwJqyFA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJu97MfY5Qbh6YzQhuIdSa3ExEjIB0g+cfqK8k2VN3vgqz9IgV6
	j4meQ7mWiQwwivT77MM3cFKGIRFNv2z+xAB2Y3RzEt7jxjHImbfJ/vGK
X-Gm-Gg: AYBFou24tzM9srXxUP/WkcjtvNX0KBN9hSViGqF1Hs0X4C8oA+OGH3t6/cRT7VF17bM
	/pinheBZhOsN6yYFhKNV+lfPEaPTIFNMaOBT1LrPVejNqGQKIXp9Gv9Z15HX/bLwGMtcC+5Um1J
	oGloQz4QMqt2VijHDi7MMDIW36TJhzorVjR1ADZNZ3Nv+bAfnyqn+qEhCapCRpErycToeFDX4Jy
	dveYfn+Blhw1GZkbqZJk4Z/OzitCZAAFyvcmJt0qNjKAJipj9d48kgfdzWXuyatbkedeUvOWD+o
	NPfnwxiRnTdu7GK77SEltLl53WpQfkBJAfAl8+rgNkiqejGf5Z3QqW5exKhJnbFOonK1N/sWdbs
	DAYjWOK9ducEmAAMA64Fr5sdEUoVBhIwxMerujyFSI/+IiWCsv51OAof6deqDevNeGVNapCrEOI
	ELPr2Ar1lXWCeS6owXIrdjHTrFFckIdIPJQENUagQYAMO40Elphnlz2EwqLmx1DdfmNK7SUGUXf
	qwxFKwdZ71wU08ClYieagZXUjiKK/dKt0XVEQmK
X-Received: by 2002:a05:6402:2812:b0:6ac:6fe6:b391 with SMTP id 4fb4d7f45d1cf-6b17c24c8dbmr4320358a12.18.1791642345707;
        Sat, 10 Oct 2026 07:25:45 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dfff40sm2635586a12.34.2026.10.10.07.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:25:44 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v5 2/8] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
Date: Sat, 10 Oct 2026 16:24:28 +0200
Message-ID: <20261010142533.974797-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010142533.974797-1-linmag7@gmail.com>
References: <20261010142533.974797-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_mmu_context() clears asn_lock and acts on need_new_asn, but it
runs only as the tail of switch_to(), after alpha_switch_to() returns.
A newly forked task never gets there: its first context switch resumes
at ret_from_fork and reaches schedule_tail() without returning to the
code following alpha_switch_to(). New kernel threads take the same
path through schedule_tail().

asn_lock is left set on that CPU, so the new task can run with
interrupts enabled while shootdown IPIs keep taking the deferred path.
The handshake meant to complete those invalidations never runs.

Move check_mmu_context() to finish_arch_post_lock_switch(), which is
called by finish_task_switch() for both existing and newly created tasks.
Drop the now redundant call from switch_to().

The hook runs after finish_lock_switch() releases the rq lock and enables
interrupts. An IPI arriving before asn_lock is cleared retires the slot
through flush_tlb_other(); an IPI arriving afterwards can flush directly,
since PAL_swpctx has already installed the incoming context.

Set need_new_asn whether ev5_switch_mm() reuses or allocates an ASN. An
IPI in that interval can zero either slot. Without this, the allocated
case can return to user space with a live ASN but a zero context slot,
which a later context-based shootdown shortcut could mistake for an
inactive CPU. check_mmu_context() reloads only when the slot is zero.

Call the hook unconditionally. Alpha selects ARCH_NO_PREEMPT, and neither
kthread_use_mm() nor sched_force_init_mm() sleeps between the direct
switch and this hook. RCU_STRICT_GRACE_PERIOD can enable PREEMPT_COUNT,
but cannot make those callers migrate there. Testing preemptible() would
only leave asn_lock set in that configuration.

This requires the preceding direct-switch fix, "alpha: load the MMU
context when switch_mm() switches the current task". It installs the
borrowed context before kthread_use_mm() reaches this hook, so clearing
asn_lock cannot expose a targeted invalidate against the wrong context.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h | 15 +++++++++++++--
 arch/alpha/include/asm/switch_to.h   |  1 -
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index d366f89fee58..f41d7c73fdd6 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -162,8 +162,8 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 		next_mm->context[cpu] = mmc;
 	}
 #ifdef CONFIG_SMP
-	else
-		cpu_data[cpu].need_new_asn = 1;
+	/* A deferred shootdown can also invalidate a newly allocated ASN. */
+	cpu_data[cpu].need_new_asn = 1;
 #endif
 
 	/* Always update the PCB ASN.  Another thread may have allocated
@@ -192,6 +192,17 @@ do {								\
 #define check_mmu_context()  do { } while(0)
 #endif
 
+/*
+ * Also called from kthread_use_mm() with preemption enabled. Alpha has
+ * no kernel preemption, so the task is still on the CPU that ran
+ * switch_mm().
+ */
+#define finish_arch_post_lock_switch finish_arch_post_lock_switch
+static inline void finish_arch_post_lock_switch(void)
+{
+	check_mmu_context();
+}
+
 __EXTERN_INLINE void
 ev5_activate_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm)
 {
diff --git a/arch/alpha/include/asm/switch_to.h b/arch/alpha/include/asm/switch_to.h
index 762b7f975310..35c4b2c9d992 100644
--- a/arch/alpha/include/asm/switch_to.h
+++ b/arch/alpha/include/asm/switch_to.h
@@ -9,7 +9,6 @@ extern struct task_struct *alpha_switch_to(unsigned long, struct task_struct *);
 #define switch_to(P,N,L)						 \
   do {									 \
     (L) = alpha_switch_to(virt_to_phys(&task_thread_info(N)->pcb), (P)); \
-    check_mmu_context();						 \
   } while (0)
 
 #endif /* __ALPHA_SWITCH_TO_H */
-- 
2.43.0

