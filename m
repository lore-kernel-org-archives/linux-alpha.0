Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B98549E15D
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 14:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642347; cv=none; b=tFeQZy/8R6hgLXyZmEtPpCdHr3LaGdZL/vLVhK4usN/Hjw5ck7/s+/CVi8o5nVdXyT+s28t9N4EsN/ZU94eL2oiGErb555pRQEMjq3ugVGMZGnQlOUAboZrDno7Ob3kuSToFh0WeFdAo3nADTuqwwmncyopsc/+noweotLA4tkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642347; c=relaxed/simple;
	bh=gVko3NTCvcTD25dHMXmIdpbGMdQ9kdFLxTHBjPkwhk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+1snwT5M/v90jnUGlL+sJwQn0hj7J7QgqEsJ9KxyjoIbYqzE1voaHNwMZ13/kcWQCwX2Ik0oO4vDNCCg200lMfK5EyMty+tWq9mf90DDLSe7L4DQojMm52ITCH4iY5nsCMMORClqdTvSoxXgHQFOIejhsdWL5jVTEkb+jJ0yAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKl53ocX; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKl53ocX"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso628197a12.0
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642344; x=1792247144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfFYG7S5LsfE/VVTuIcg/rOspxidrA0GMavY7/KQwWg=;
        b=hKl53ocXJ4ynu8DnKySPHAyZEAK//gbJw8Wu/Pm27MBP3z1zDAymiU8kLI8wm6rZ7/
         Tw7mBetcFsPfm1JjtnvoDc0XPtIyTCJUk9kWqnJ8r7hIR1kSMosNgOgCAr6KlKWUYk/3
         bNd5BKp4xwJ47H2ddUdalKY+OtTK9tOnImZ0xQiCq96SGcBEFE/iTlMdnQ8rxfFwv7PT
         7Z9viNHiU3iFhiez7DD0jOGBZg7mx8eD6yYCWIToU8h1MP/1hbsiQGNzfRk/sG5DS8Kk
         8XRn8qYnqC9cXdCCoeQFsoplJ6tMiBgDgpu3G+51flFyjOWpFNHgiJdeaYlYlfJs/j0F
         qfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642344; x=1792247144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pfFYG7S5LsfE/VVTuIcg/rOspxidrA0GMavY7/KQwWg=;
        b=rER/QzoD907O+ee5Qf757c/1mgHfRRZ2OuXPZZeqwVXxPppoSteo+qRfQL8Kn8R8Jx
         SY+3XEXLwcFAOjZPRKw6FZCDbXr9QKRLO/fB8dg29a9QZHUn3Pf1wrHkMKSSKO7Xuqoq
         WJNZDSCMDUgSpRDkA9iHKjA3bb7YiSCPKnFU3JcjjHLgyx/Rta/qS5N1hMOu1VZnLNO6
         RN3p2oGHec+STHy5Snwq5dYf6zrVgNAR7rVVxl3b12vqg0hrQBgbiF2T5jrLIsJeopxm
         0QXoXClt/5rO6EHv/+35n2GOINEGL0jsfj47jwdIGcnL6E2A01oVpaHwGM08OuksBiju
         ZiUw==
X-Forwarded-Encrypted: i=1; AKwUvByFV3N4spN5O/GC9vSb5/HBMM4ikXO6vidDIU1MiHi2AydxiTjWJWv8pPCG8KqgeDsYxl+buVRqIi9JVQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKe9pwOxWpWOxeSJkeh3KxFVtNkyO1NWKv4iVKg14Q4A/4UWsvI
	80QfSv8W26RnIQW3n4OrFxCvodK344u8aQ2+93cNvw3vBLOzCU9s37mu
X-Gm-Gg: AYBFou2OwEtLP9pHHPgCO5VemSz3waow38aJIhm+0mfuX9xT1Ou8XVpWYWETqiCDb4Z
	V/QFnqNtWkuNNcqP6DDsom1IWPxUuLhc5cyYYBnDcMkwfGf2oAj7dZuqZP78jyOnqhGBu9A4mb9
	cSo6/cn6hrt4VGdPHe5OFfHerq1c+vkmOnaof9LU7vaxlXQwRRiahl++9YrSyuFEiC6SGZuKK0n
	2uoqS4fZhVcmKvaF47RhYcaD8yqW4ii5Dux7C45e+8W++sSpCil6sNgPxVJ3q6kKXpzwWp2KQYW
	ONjRiNVb8F9iIFybmirE0LcZPJeEFH86aYKP5ePOIqc3uAvFJ7eCOJFatkNH17WS9QtZmhGLBDm
	6PbZN4j97ejW3Ao7DiR+OZDDRsU4gxWlmh1GV3S56cK6ciwCcVvXh4WSQqhHOY6/X8jLziUnRB/
	m7PQwmZoe2GzORDB34PPIR6N7aYWPkDeWuLvVWSUICjA5xSlAeXTp6D4r3csxb+TpqB8YozrWT5
	ul0A1nsCVehF8DNbu2J52HyJ5TPpkbxA633TtH8ig==
X-Received: by 2002:a05:6402:194e:b0:6b0:c1d:a7ce with SMTP id 4fb4d7f45d1cf-6b17c237fc2mr4290283a12.12.1791642344039;
        Sat, 10 Oct 2026 07:25:44 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dfff40sm2635586a12.34.2026.10.10.07.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:25:41 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v5 1/8] alpha: load the MMU context when switch_mm() switches the current task
Date: Sat, 10 Oct 2026 16:24:27 +0200
Message-ID: <20261010142533.974797-2-linmag7@gmail.com>
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

ev5_switch_mm() only prepares the incoming PCB. The context is installed
by PAL_swpctx, which alpha_switch_to() issues against that PCB on the way
out of the scheduler.

Direct callers reach switch_mm() without going through alpha_switch_to():
kthread_use_mm(), which borrows an mm for the current kernel thread,
sched_force_init_mm() on the CPU-hotplug teardown path, and
do_shoot_lazy_tlb(), which switches to init_mm from an IPI. None explicitly
loads the context, so the task can carry on running
under whatever was loaded before while current->mm says otherwise.

The stale page-table root need not be swapper_pg_dir; it may belong to a
user process that ran on the CPU earlier, and the kthread's user accesses
can then read and write that process's memory wherever the stale mappings
allow. Translations taken that way can also end up tagged with the
borrowed mm's ASN: ev5_switch_mm() writes that ASN into the PCB, which the
next PAL_swpctx installs against the stale ptbr. An address the stale
tables do not map faults instead, and since do_page_fault() resolves
faults against current->mm without reloading the context, the same access
can fault again on return.

sched_force_init_mm() needs CONFIG_HOTPLUG_CPU and do_shoot_lazy_tlb()
needs CONFIG_MMU_LAZY_TLB_SHOOTDOWN. Alpha selects neither, so only
kthread_use_mm() is reachable in practice. Test the caller's identity
rather than special-casing individual callers.

The scheduler passes the incoming task, which is not current until
alpha_switch_to() runs; all three direct callers pass current. Test for
that and load the context the way activate_mm() does. All three run with
interrupts disabled across the switch, so this completes before any
shootdown can be taken and needs no asn_lock handshake.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: <stable@vger.kernel.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index eee8fe836a59..d366f89fee58 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -130,6 +130,8 @@ __get_new_mm_context(struct mm_struct *mm, long cpu)
 	return next;
 }
 
+extern void __load_new_mm_context(struct mm_struct *);
+
 __EXTERN_INLINE void
 ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	      struct task_struct *next)
@@ -139,6 +141,16 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	unsigned long mmc;
 	long cpu = smp_processor_id();
 
+	/*
+	 * kthread_use_mm(), sched_force_init_mm() and do_shoot_lazy_tlb()
+	 * switch current's mm without alpha_switch_to(), which loads the
+	 * context. The latter two require options Alpha does not select.
+	 */
+	if (next == current) {
+		__load_new_mm_context(next_mm);
+		return;
+	}
+
 #ifdef CONFIG_SMP
 	cpu_data[cpu].asn_lock = 1;
 	barrier();
@@ -160,7 +172,6 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	task_thread_info(next)->pcb.asn = mmc & HARDWARE_ASN_MASK;
 }
 
-extern void __load_new_mm_context(struct mm_struct *);
 asmlinkage void do_page_fault(unsigned long address, unsigned long mmcsr,
 			      long cause, struct pt_regs *regs);
 
-- 
2.43.0

