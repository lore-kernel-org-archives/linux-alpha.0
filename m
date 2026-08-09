Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1737D3B5820
	for <linux-alpha@vger.kernel.org>; Sun,  9 Aug 2026 08:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786265732; cv=none; b=mVGwSsA9hDvNMLhYni+OizQInuUFZSUuOnX+mdZ/EyD0uxji0/v1S3W7Kc0bNMGxrVDDrahUIAOx61WnHzpQjW9uC/EhftY72Te5dFtiY+IdUSO3RVrja7CYuRXv38W+YhLY10PpyKwTJv5wxsM0BeYCvBZ0jpVSNbC1V+AhUvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786265732; c=relaxed/simple;
	bh=YaFajEc++EZydpQQWr/F6blWM6a4+OFkGgPACbvd+fE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IsVgBoqml9P1G8Hlm+hyf7EWxhLMkcMfZDE+UJWahYmwXfTYqKNPpmcisXZWk2quxHjFlLP/mlHKKOhYnnfFwRtfiYR6Rw6ugLo/uiZTH4ZyAlzNS7+soseTlMBzXWns+Lx4Q8mKYsomqnaiDLXlKVMmVR8gDmPFjKngx8+ahSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsxcW32o; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsxcW32o"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso957837a12.1
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786265728; x=1786870528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tIXrb9knWmO6iHNuE9igc2E6FtJyIXy1wsmdNsvGwYc=;
        b=nsxcW32oKPHK9ROnGGURXxVr3B0EQ/33BJRcHRl8mCSzymgDaOToTP806WwnO2ASnJ
         SmP7747l7gSC4KmBjUnvdSHYTXUc/pXJI4zt68rBzCeZulZ51wIQm4XFlR1SGWnnhNIu
         j+grzKjWkAQRb3XZr2GgrT5XAOVj70Nfe+l0G4Lg4SOT9XUMa5pBSfpVi/UXmBfrGo+J
         Wq2Ek5eCNgWSmw9vTlNca9NfbLsgBNaYwCjXNmdEFMOisHloxNzxDfMwC9cep1+rl/kf
         dBY1zDdcB9soToX/QPcVGok5TkD8uJKk3jHw7tesXxJzPixR6i2UsveSBZ9ThTy/kCXd
         xvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786265728; x=1786870528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tIXrb9knWmO6iHNuE9igc2E6FtJyIXy1wsmdNsvGwYc=;
        b=dG2cih5+lZqDHkrXTKyXIq5x5DdmTSUB0kKIfrvPB/a2O/GghiCTpFHNVgMm3DRsiR
         HGG6BrW/74VLfgXd+Vv+nsuQG1YXaqAHtJD/eMtFJHS60AmZnL7g1XAGHFY0aqtKOxG6
         n7zNvUqjbqADrruXXqfI8qbz0G18XQWtia8Ftu4367lgoykR5lcfv4Yxm1KZU5C1JI2d
         WUX29sAebyMsOizmpPBWcpmUUc66FE8LwrUbJbI8AKPgwCeFTaRqaHFN2z29HpNtzaNj
         YyR++zCm6/hoG3xfQswgxCM9svXzseb7bSLYQELYFI1r1UTdk2+BX0+Jb+yepIVyGAHZ
         nkwA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7XhJGaGwe/3Y/a662fJb6oiPhYzcoOlJviY1oICNxz7za6PKueKFd7UxMOBAd9fFjqH07hWOcVNI+RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNHBEzYgOq8pMg3zGz/cIQJco0dZvKtVxlig8/qWSeFkof53O6
	XqqVAK232L83wNWs9HJyK8cP9YddRXL9cOvFnJ0Rs3Jb20lB58t780epp0w2j+ld
X-Gm-Gg: AR+sD12CjSUMNEahk36F8qb2Xb9PieA1DEKg22z9ogrc2JYtSaBYcL/keEgeCnLRGzk
	JTs7g+ZZoebr1y/I/09NDiMJ0f1LW22OAxpuHq8nRztwBaeOXILq4ObcSWnhbTCGiMlbKJCuI2h
	7yOfr3plhNs8YCMxnthI9oFhtru5TgG562+JuSL3BxWYwqS/Sy4QYkotX98oak5+AxQPtIJNa1d
	ixhR5zYfYslRuOvH8wwkoRlNd70FsTh7x7OFmZ60qux3S0RIvWgGHdr+MmeKluL/xH8Bcia3SCP
	oKgMU3CBV+9849d5ey46X/rSiC4kiHvzDka2HOMiuBVDET9zV0Fh2RFwaQ9qFSHanVr3ufhItxU
	0X/M+6NQj73RppknSDUD5/SpCiJeukYmCupgOg1PUHH+QdrC9HH3S/InVbrT29OJHf2hL8pcehH
	HcMUDoOjkd6wBZeX6c/LiS9lMSVfj0ZaW0xxw0R30OBBb3x5kk0KwxLiI/0yHH/Osvy6D+FGo4X
	8PcQZ4OT0W8cu/Rmz0SSbCmZIRZMzc=
X-Received: by 2002:a05:6402:11d0:b0:6a1:b515:c3c1 with SMTP id 4fb4d7f45d1cf-6a1b515c6a2mr9877208a12.4.1786265728373;
        Sun, 09 Aug 2026 01:55:28 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1f630a4afsm1606681a12.3.2026.08.09.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:55:27 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 1/6] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
Date: Sun,  9 Aug 2026 10:49:33 +0200
Message-ID: <20260809085208.3262799-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809085208.3262799-1-linmag7@gmail.com>
References: <20260809085208.3262799-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_mmu_context() clears asn_lock and acts on need_new_asn, but it runs
only as the tail of switch_to(), after alpha_switch_to() returns. A newly
forked task never gets there: its first context switch resumes at
ret_from_fork, which goes to schedule_tail() and then to user space rather
than returning to the code following alpha_switch_to(). A new kernel
thread reaches schedule_tail() the same way, through
ret_from_kernel_thread().

asn_lock is left set on that CPU, so the forked task runs user space with
it set and interrupts enabled. A TLB shootdown IPI arriving in that window
takes the deferred path, and the need_new_asn handshake meant to cover that
never runs.

finish_task_switch() calls finish_arch_post_lock_switch() with preemption
disabled, on the CPU that ran switch_mm(), so hooking check_mmu_context()
there completes the deferred-ASN bookkeeping for both. Running it when
switch_to() has already done the work is harmless: check_mmu_context()
clears need_new_asn as it goes.

The same hook is also called from kthread_use_mm() and
sched_force_init_mm(), outside the scheduler's preemption-disabled switch
tail. check_mmu_context() acts on per-CPU state, so it can only complete
this bookkeeping while still on the CPU that ran switch_mm(). Testing
preemptible() expresses that condition directly rather than naming callers:
where those paths leave preemption enabled the CPU may already have changed
and nothing is done, and where preemption is disabled across the switch, or
not configured at all, no migration is possible and running it is correct.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index eee8fe836a59..f7afc64ca8dd 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -181,6 +181,34 @@ do {								\
 #define check_mmu_context()  do { } while(0)
 #endif
 
+/*
+ * check_mmu_context() clears asn_lock and acts on need_new_asn, but it runs
+ * only as the tail of switch_to(), which a newly forked task never reaches:
+ * it resumes at ret_from_fork instead.  asn_lock is left set and the task
+ * goes on to run user space with it set and interrupts enabled, so a
+ * shootdown IPI arriving in that window takes the deferred path and the
+ * need_new_asn handshake meant to cover it never runs.
+ *
+ * finish_task_switch() calls this hook with preemption disabled on the CPU
+ * that ran switch_mm(), which covers that case.  Running it when switch_to()
+ * has already done the work is harmless: check_mmu_context() clears
+ * need_new_asn as it goes.
+ *
+ * kthread_use_mm() and sched_force_init_mm() also call this hook, outside
+ * the scheduler's preemption-disabled switch tail.  check_mmu_context() acts
+ * on per-CPU state, so it can only complete this bookkeeping while still on
+ * the CPU that ran switch_mm(); preemptible() tests that directly.  Where
+ * those paths leave preemption enabled the CPU may already have changed and
+ * nothing is done; where preemption is disabled across the switch, or not
+ * configured at all, no migration is possible and running it is correct.
+ */
+#define finish_arch_post_lock_switch finish_arch_post_lock_switch
+static inline void finish_arch_post_lock_switch(void)
+{
+	if (!preemptible())
+		check_mmu_context();
+}
+
 __EXTERN_INLINE void
 ev5_activate_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm)
 {
-- 
2.53.0

