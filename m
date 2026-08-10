Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A187442FCD
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 19:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390827; cv=none; b=a16FeK7lBwmCSmeRgc7OH05+7ZASSIy3dXo0CXziyON/VQnUxLYm5Wh92pTanlyf/N2+i8Wk79WwpimXLGw2dFL5q1AVAHCjx2OwlwCWsmn4rDUP7Z8CjnI7MT7p4VkY7Z9r+9iIOUwFZmIz98T2n8obLS2NOvBoie+yBw7TQOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390827; c=relaxed/simple;
	bh=OnuXGl0ethdObH0aY05B9eSD0mR9fLVNfgoP5uzlc9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MIYJs3ylJrCz2CkQU1e/42lmeKzjtJhuGRz3/Z3E1F1lEulCFoiTnrOEr0vbW0RgydoJOQXbLbNlSceEjMQOct8WrgcqwqD6oxJmDLYqxCkX7JCa0gfFBVddHDJz5m6fXfjgJCNkjdDid/N4TLZdHFEsJfeMS9pNFBw/966z8Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOCP1sN4; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOCP1sN4"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c197eaaab00so342779166b.0
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 12:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390814; x=1786995614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZEmNt2xvk8DgVJ1haHknaJRViHX9desP4cc5qWqOEo=;
        b=FOCP1sN4xu/bXIIcFusluqXnO14AC+/v5B2W44ClmpxSIxxWrrAV/2nuzL+8fxNUsp
         RiPdh/Yowp6NBEkq+lwuAeMNRsgAT1KAyI1KP48FlC6WYtmz0WJUGJ/uAg5qbABbzSG2
         QmypcEJrajHUyQICRMKFZ1ClbsMphdZM8C24iv/yqoTJxJOtGYEK9DqE8ISob06+12DM
         xUxwzYGq0P81phORruOvHPXGJnXAluQsZQjdqoAVJ2b4/O1C+IWJL+i1AxCO1Yrepjqg
         uzdVm26dNE8owr112bSfe85UEsLonbxwV9dgCefLiGAdwQami13ZLQAt4SrRzHdh/+83
         RMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390814; x=1786995614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QZEmNt2xvk8DgVJ1haHknaJRViHX9desP4cc5qWqOEo=;
        b=bXvSrR+LAjs3HnUEd9YRjfmpmffNs9Te9jD0lCG13S4kHJliVtnPoEfcLhj+bnwS5R
         hzt/CRulMCuWOprd47ckHKFrIs9OdO6xIkDpZUXjZh8jBkuhao/XgxR0CJv2IEVBG31W
         W2zmAPFacgeKG9YTv2sW6FUPfIWCOsOnH3uv70UTAgEDeXtppBdsF+j6IlCR2OHayIw8
         JVD4lj0JPZ3LL/5RQGTk8mWfr+aKB8AscMFifkPt9vvmtrZ/WLoiKryZQtlrLGphpoF0
         PS+P9dvzn7K5clv2wRIZmbCMUkDMnorC8KeBQu51n7TQO5y1x3Q4eve0JYnESMnqyxxp
         YjQw==
X-Forwarded-Encrypted: i=1; AHgh+Rpd0VEfigpZU+XDCNng4ifhplM+TOdqw6tKbv8G6+2XvVUgkEWPwrVlxttoyRw+GLyjQO68rXJ3QJ8iGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymvAdiTyk3/Ej4xBHSK9EB3TpK9XETwL6JQr5hm+L03gq+jNlq
	iPMBXXZhiYh4rMI0RywzeeQgrDQQ8JS9eipfr5CwxogLwJ4KkcNuuQOo
X-Gm-Gg: AR+sD10PshNONFLd0mML+Pgt5vEG2q4IkzOEoyqw+Kx0iVkl0huoyKVGAsgy1MEQRIn
	hJTi61B6TfSLHZN3DxXs4Hx+PPepUI1ho/jxVfQ2CrMTjQlZvWuy+9xoZA1qmWSP4PjPrbz4wTU
	LCrjYKq3+PveqqcFVWyHIOkKX9B2LvZkLdjpw4XJm5uXJbJlMAyHCiV9Ks0/fMJF5xcSzzljpse
	9eV6U89MlmoOA+ezsFVnbhe6Q3K4UoKDKFV9RwH8Fj8P91FjAC66i7qHarMP3B+CcdfWiB/L7/P
	b/j1aoOaCpXq+cAymVjZiZaLBtw+XXpViemkmXMKiBX/kjGpq9zfOmmVUJKBIuzhVsYmornJr5X
	NVn8rTmOVGl1QBrNNMyxWR6Dp+eu0oL252BeVZjy9jDMGkeEQcio+QzMcJvxAxmgeF43lrnltG6
	6WGinirk3xJFsZneSvz2X8gmocoU1Iu66+wKgRgCPK2EcnWfI35UITbqpXqjSQuK3c/OZNfXdJM
	rbgRchR96u71xoPEmbrlIw6oUCGzepOJ4MpZtPJJQ==
X-Received: by 2002:a17:907:6d0b:b0:c12:83da:7eeb with SMTP id a640c23a62f3a-c207ece5c9amr1238601866b.19.1786390813898;
        Mon, 10 Aug 2026 12:40:13 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a84sm449928966b.3.2026.08.10.12.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:13 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/7] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
Date: Mon, 10 Aug 2026 21:34:52 +0200
Message-ID: <20260810193902.3286353-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810193902.3286353-1-linmag7@gmail.com>
References: <20260810193902.3286353-1-linmag7@gmail.com>
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
at ret_from_fork, which goes to schedule_tail() and then to user space
rather than returning to the code following alpha_switch_to().  A new
kernel thread reaches schedule_tail() the same way, through
ret_from_kernel_thread().

asn_lock is left set on that CPU, so the forked task runs user space
with it set and interrupts enabled. A TLB shootdown IPI arriving in
that window takes the deferred path, and the need_new_asn handshake
meant to cover that never runs.

finish_task_switch() calls finish_arch_post_lock_switch() with
preemption disabled, on the CPU that ran switch_mm(), so hooking
check_mmu_context() there completes the bookkeeping for both. The
existing call from switch_to() then becomes redundant, since
finish_task_switch() runs immediately afterwards and does the same
work, so drop it.

kthread_use_mm() and sched_force_init_mm() reach the same hook outside
the scheduler's preemption-disabled switch tail, where the CPU may have
changed since switch_mm(). check_mmu_context() acts on per-CPU state,
so testing preemptible() expresses the required condition directly
rather than naming particular callers.

One consequence is worth stating, because the TLB patches that follow
depend on it. After kthread_use_mm() the hook does nothing, so the
asn_lock that ev5_switch_mm() set stays on that CPU until the next real
context switch. A borrowed mm therefore has current->mm set while its
context is not loaded, and the shootdown handlers rely on asn_locked()
being true to take the conservative path for the whole of that window.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h | 8 ++++++++
 arch/alpha/include/asm/switch_to.h   | 1 -
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index eee8fe836a59..825d3b9605c9 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -181,6 +181,14 @@ do {								\
 #define check_mmu_context()  do { } while(0)
 #endif
 
+/* Per-CPU state: only safe while still on the switching CPU.  */
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
2.53.0

