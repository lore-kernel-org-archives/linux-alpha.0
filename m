Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEDC3CEBB8
	for <linux-alpha@vger.kernel.org>; Fri,  9 Oct 2026 21:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579906; cv=none; b=hsalhB64H4XVhY/ecXIatNUe2koue3G2MgT5wDZZX8YC+NMx9+0hZAhyHT0wHTyq9rEVx/GJdXHBAa6aG5atBfm9DYB2P1pk+M+mgkQOYIoYwUw5P76uNrEFt1wnbjpa5dEUkMpyO8Eu0+5/LPGw1a2fr6+GT8ed96/DyXpkxxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579906; c=relaxed/simple;
	bh=6opi/5R9M3NXlfgYoH61tIu1FvaiunNCfa3uJFb93kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohHf8RQQsG7MpipSbs/wMejxAsMBBfKCADIam80dTFLc/MWVfdn4mibKTcK2s4nETTkku4KBGMY/vxbZXPmrCy25EzVP+Og1k4yNECeguzVBs0PvYsvy4NzCN6Yrcq3O1moipF4s4BgdWL3G2GqTzHakv2PV6Z0jFw8V5VcUNZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwXQqGpc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwXQqGpc"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e5e801487so42206866b.3
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 14:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791579902; x=1792184702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59gWwwZKc4LtbAwf3F0whP4Jml+i88HQZDtzu/90YQc=;
        b=rwXQqGpc8+yHz2zOiwvJHPG5mdhiojWxn8kHL41yZfpnMlFegWy46GZxSQi1+zm8NN
         6USm7+mxQMZu1qeKrAL+Uo4hWi0C5K1H6+V1P/RfGzWhxcaHA17koYBbvSA//m5vjnPu
         9L+hIdgnzvIIFLDXMEU/BtZbf0X8ZK5GbMOlUBDUjgtZOrOUsbgpChJXnIT397kKiHVp
         qm/rkwqOkIn7RMfyVLxilR9iG/KpU1/SpK7+EHfddKaA4o5IZOuysLLd3C39MI5AKY5f
         V369DzcBaMxX9IiOTKLv5TqmkW7z+zvPhiX1hzIz3oarJcPX9dNKG5irtVLl5gXvi9Mr
         KIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579902; x=1792184702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=59gWwwZKc4LtbAwf3F0whP4Jml+i88HQZDtzu/90YQc=;
        b=aETU0Xta1YygVr5KWrrtwv0WcvVeBrId4y8isy2DCTkeRbId+D0WEm/Nq3qghYwSZx
         UnfN6xcaWIbs3pIp0r2OYdnoP0XxPb4tU+O+Yri/h+KmRQ0Lv9/2yg2/LWMn/D7htWbm
         VUPLMt95MBKfchYpm+67fN09PQ2zktjR4iYxUQL3SOYebLv389jP/ghlDT9EyEM0s8Vn
         7p+BVMgqoZ7FvXag9GOtGObxwdOhjRG+9WrrWtMc8juZRYDYAMdrkgij2Hzxzq5ZS4C/
         ugeDKAWGjxY4Z1GbGW4UHZqWKjsprxAZwqNFnTTPEQRmuA9WSQB0qwTx2hgTgir9TWan
         BIIA==
X-Forwarded-Encrypted: i=1; AKwUvBzl+XASdWd/kU44mcBERu5mo/FoCITutaGfjNZ4IlIB9PMb+mSrAofPH8jTNodSIIXhIHqpFt/ovBL4Pw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKnjXOzaO2x8gn1xGz+MN5DEQzeFjKCoYhn4XYbj+ikgEY7eI5U
	+KaDUHj+SzjVcg26AuleLTbapvdvZgPWfdKQScBOcIeTwdMZItOtuwo2
X-Gm-Gg: AYBFou1m+WATszn+sY1MH5Iu5DxKQO2URqUCPF6nyO5roZUk1Re4m7I83JBhbJCyiHW
	JyVXphHKQvT2LlgoxwJ4jhEM6kq7qjZar4EgUeWEuT9skVadyDrpEuYBZj20JuyL8PRNYgoPCsM
	MO3yZeNbngjuZRLJpgTW+yR8X9x9apwoFX+GY3pHQn2WyR17ZOkjPtqjmR56H/5UP3KcJ/6iNyR
	ZEsomxerTcFGOJ8WhcmnQIAGYxSPIStQrp4THldwZZ1PWz/RxZLwYKUQYCZ3eaMBEZnIk2kK6kA
	fHy9Ztt/lUFYKVIk1yCUcTCCEeEz05AFmZ+p9OXKLo5NVxF28Vy//1yafjERqkioQ0+p090dmaf
	dl6WWJibppMaxg1Ks+xGxHYGFszW7i8PG9vVpoUmhK4NLlxOsSVKWggT2ztERqRcPTIQAXFUSYJ
	0hrucJPHVLka7U3D9YhNCu1Tq0HEs6uL/rqCqoZn9OQFPJLU6eExW6T1AvL86J11xBkuoPGEcRc
	bJfCDIvPq6dKkDlde4escv88YEXYkPI/nEvx61K
X-Received: by 2002:a17:906:630c:b0:c2e:4601:24d7 with SMTP id a640c23a62f3a-c31aa0b038fmr334122466b.39.1791579902349;
        Fri, 09 Oct 2026 14:05:02 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm142141266b.8.2026.10.09.14.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:05:01 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 1/8] alpha: load the MMU context when switch_mm() switches the current task
Date: Fri,  9 Oct 2026 23:03:46 +0200
Message-ID: <20261009210449.971057-2-linmag7@gmail.com>
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

ev5_switch_mm() only prepares the incoming PCB. The context is installed
by PAL_swpctx, which alpha_switch_to() issues against that PCB on the way
out of the scheduler.

Two callers reach switch_mm_irqs_off() without going through
alpha_switch_to(): kthread_use_mm(), which borrows an mm for the current
kernel thread, and sched_force_init_mm() on the CPU-hotplug teardown path.
Neither explicitly loads the context, so the task can carry on running
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

sched_force_init_mm() needs CONFIG_HOTPLUG_CPU, which alpha does not
support, so kthread_use_mm() is the only one of the two reachable in
practice; the fix below tests the caller's identity rather than
special-casing either one.

The scheduler passes the incoming task, which is not current until
alpha_switch_to() runs; both direct callers pass current. Test for that
and load the context the way activate_mm() does. Both hold interrupts
disabled across switch_mm_irqs_off(), so this completes before any
shootdown can be taken and needs no asn_lock handshake.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: <stable@vger.kernel.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
Message-ID: <20261008195608.965266-2-linmag7@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index eee8fe836a59..c5cf7dbe6161 100644
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
@@ -139,6 +141,15 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	unsigned long mmc;
 	long cpu = smp_processor_id();
 
+	/*
+	 * kthread_use_mm() and sched_force_init_mm() switch current's mm
+	 * without alpha_switch_to(), which is what loads the context.
+	 */
+	if (next == current) {
+		__load_new_mm_context(next_mm);
+		return;
+	}
+
 #ifdef CONFIG_SMP
 	cpu_data[cpu].asn_lock = 1;
 	barrier();
@@ -160,7 +171,6 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	task_thread_info(next)->pcb.asn = mmc & HARDWARE_ASN_MASK;
 }
 
-extern void __load_new_mm_context(struct mm_struct *);
 asmlinkage void do_page_fault(unsigned long address, unsigned long mmcsr,
 			      long cause, struct pt_regs *regs);
 
-- 
2.43.0

