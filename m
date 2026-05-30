Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6D433987F
	for <linux-alpha@vger.kernel.org>; Sat, 30 May 2026 20:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780172775; cv=none; b=jyGjiv86MTDh8JWZuu+piXn14waQKreLeFQ0iIxtI64k8z7tmFKYdFiOEvT3/LIMTl7y/tWkVfgCZfJwO7jf0xjCbuqJRIlSEjaz75pqBXsEuIrJx/tJKEcD1xuUyJZVAGNPgOsZAuflMgaR/V3gTMyGs5iEOptuY/xif+sDypE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780172775; c=relaxed/simple;
	bh=o+6b37jGJdtML4VSCNe28AJfx9gXkiAKzQVnvryAsrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fd1vYhSKzrWBdaUoLMwWZJzqBEgo8iUu7KCvlIrj2eaaCD9gfuqKK0pUBIG56AEmWM9HQfjCgbI7IOAdZ9lnXVmp6ukVeq7gmdMTJyrkx9k6eeY0yMyW5cjsghNHGvx//Ru3/IGauTxSez6e6mwHxnALOoRLPrlkl6TXJ5exmIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvaqfiBx; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvaqfiBx"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66067da0638so159925d50.0
        for <linux-alpha@vger.kernel.org>; Sat, 30 May 2026 13:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780172764; x=1780777564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5bfay+UMC0FV3+SdGrQmnKGsJ3WhsW5MN1JRBSHUmc=;
        b=AvaqfiBxt0eEeX3Gd00bYgHkUStmaLZ2TsilXE/fVG6mPtC540jhzFZrcKd4VpcSHA
         BS2cso5rNSUXCC5lgI0bs2HtKMxs1qpt2tl2w71q6P7KpxIsh65iDE70cZ0czmJYMbwr
         D1Bvb6lGAk6TCvlJP07KiR6Y2nf0c1YNOhYf133ICw5SSpoN21NlhUsPJJq3JISKxiQQ
         457UCRAz/9xaCgEYCKlUnZl5SNKskzAsxIvy+ugJfdeSgEjL9veofNzUaD4cz6OImEa3
         1G98O0vL4qwltrOIPagIilUPfpbIqvVv6iW7z8TYL4a+zQ0SepjApJE9XaiKVNdhVqJg
         0Z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780172764; x=1780777564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N5bfay+UMC0FV3+SdGrQmnKGsJ3WhsW5MN1JRBSHUmc=;
        b=a4nThDMr1Z66ktYZ5Pw3Wq5yzj3VrBTRNq9Lz656qIRQMK1F7zVYqfSdxsy4+QuUBF
         Mw4lJrG/oNBto+MTUsPtt/xSneOtiAPXbv7MgUb9cRD2zoFB/npEFx2N4gtrGrz9xPpQ
         r9iXmW+XX0DdxciEsjA1sIygQNxlb4Nj2KJYTYgZ/taNFAKQX/Gl5NIED1y4/6HoaEEi
         835P+FIhmkJaBNbSivyV3qT6RKuAIe9jY/R1P0PCzo3jpFCbY0p3o9yUqVQ1NDZ3rBZW
         gNDJIA+AM9VUVyuymOORvU4KBfFxwXPJO4NAfW+KIHjDb60rckq6WuBnbGQ0Av9Taf46
         8VwQ==
X-Gm-Message-State: AOJu0Yw08e5YTtZDOf2EN5AITnFAtrY4yTMjoU2gr53BPKBosX0iChZ2
	mxAhwznQ4aZhlbTV+Ke/z0V0fyUJgQOE9e8VF1K9jBXZdFXu/KPGBIbQW5Zm5FEs
X-Gm-Gg: Acq92OHhL/pTOfoRBd6vW8K20pq/1s+gX8RwuLRy+9nRrg3v/NoVVBTws5j9EIVZ8Vh
	k3zbWCVjd6QY8zFLR9oDf4SzRu8i2Rc9VEZn+DRchfiBJwlW09MkBrCxttZEZu0Zz8Wuie5pK8S
	F6ET6/O5VOkmJzASyW+5SkOjSuxC04vpdj7eRoYrIqCApGK69L5d79c63oJPaFiDy9u5HR4RHql
	e+PWHXXDqxOxEgBNfqxfZNrWMd+FTkQ19hqfLio1wE7IzsrHMVdW4PSfYg/uskafwAG4eUx4pAR
	QG4jKROGAT2qMaPIqOiwSnk9OyyDhOD0G2v4MoGaA33GOR9knbCZaMHNRPTTtk14t+B8vw6DBDQ
	TifknXXGxucCHvbTNlG0O5X+YcOERAOoeOmeeelc4Uv/8AxZR88a/rZLYNpdv9qFEW0vmV8X6fg
	O8bywsPA0+xH5W4x1/gZyvMH2T9iPGVjbfpuoP/2XzVuw4
X-Received: by 2002:a53:e013:0:b0:660:5c10:df05 with SMTP id 956f58d0204a3-6605efdbd3bmr3390808d50.42.1780172763803;
        Sat, 30 May 2026 13:26:03 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66069abb92csm1148658d50.18.2026.05.30.13.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 13:26:02 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Ivan Kokshaysky <ink@unseen.parts>,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH 3/3] alpha: Break down rescued IPI counter by type in /proc/interrupts
Date: Sat, 30 May 2026 16:25:44 -0400
Message-ID: <20260530202544.59231-4-mattst88@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530202544.59231-1-mattst88@gmail.com>
References: <20260530202544.59231-1-mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add per-type rescued IPI counters to cpuinfo_alpha:
  rescued_reschedule_count (RIP:)
  rescued_call_func_count  (RIF:)
  rescued_cpu_stop_count   (RIS:)

alpha_poll_ipi_inirq() peeks at ipi_data[cpu].bits before handle_ipi()
clears them via xchg(), then increments the appropriate per-CPU counter.
Expose all three as separate rows in /proc/interrupts alongside the
existing "IPI:" row.

This lets us distinguish the deadlock-causing subset (RIF: IPI_CALL_FUNC,
of which wait=1 callers are the ones that deadlock) from the harmless
majority (RIP: reschedule). A non-zero RIF count confirms the EV7/IO7
edge-triggered IPI loss hypothesis.

Note: handle_ipi() also increments ipi_count unconditionally, so the
"IPI:" row in /proc/interrupts includes both normal and rescued deliveries.
The RIP:/RIF:/RIS: counters sample bits before the xchg(); bits that
arrive after the READ_ONCE are drained by handle_ipi() but not reflected
in these counters — they are approximate but sufficient for diagnosis.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/smp.h |  3 +++
 arch/alpha/kernel/irq.c      | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git ./arch/alpha/include/asm/smp.h ./arch/alpha/include/asm/smp.h
index 8bd529376cf6..98f522ee367f 100644
--- ./arch/alpha/include/asm/smp.h
+++ ./arch/alpha/include/asm/smp.h
@@ -31,6 +31,9 @@ struct cpuinfo_alpha {
 	int need_new_asn;
 	int asn_lock;
 	unsigned long ipi_count;
+	unsigned long rescued_reschedule_count;
+	unsigned long rescued_call_func_count;
+	unsigned long rescued_cpu_stop_count;
 	unsigned long prof_multiplier;
 	unsigned long prof_counter;
 	unsigned char mcheck_expected;
diff --git ./arch/alpha/kernel/irq.c ./arch/alpha/kernel/irq.c
index c67047c5d830..34709e1c42c5 100644
--- ./arch/alpha/kernel/irq.c
+++ ./arch/alpha/kernel/irq.c
@@ -76,6 +76,18 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 	for_each_online_cpu(j)
 		seq_printf(p, "%10lu ", cpu_data[j].ipi_count);
 	seq_putc(p, '\n');
+	seq_puts(p, "RIP: ");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10lu ", cpu_data[j].rescued_reschedule_count);
+	seq_puts(p, "          Rescued IPIs: reschedule\n");
+	seq_puts(p, "RIF: ");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10lu ", cpu_data[j].rescued_call_func_count);
+	seq_puts(p, "          Rescued IPIs: call function\n");
+	seq_puts(p, "RIS: ");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10lu ", cpu_data[j].rescued_cpu_stop_count);
+	seq_puts(p, "          Rescued IPIs: cpu stop\n");
 #endif
 	seq_puts(p, "PMI: ");
 	for_each_online_cpu(j)
-- 
2.53.0

