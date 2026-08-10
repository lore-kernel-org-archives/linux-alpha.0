Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FED443A88
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 19:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390827; cv=none; b=MDw3ErZdql83wOf1YeslXDIS9Dezlykc4vFjxI1WuXVzXAjKOojsZam2a4R8T7hcs8aapL9guiqv7yAnLovKbTPK8xkZuZPlQVIdJRrlFSfYbKfzxismkXyLL4S2Mh9tX2EhfGk4d2Pk7Nh5amXaKn3qOjQx9oC7CKMyMZOK5GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390827; c=relaxed/simple;
	bh=2LEh4N21WEQPtgsS/wklt177lc/JUP+Si+EuLT16XJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ss3KlH8VgbosC8A1R/BCJjavvYIM0aOYIcTnHgcwnCjrVR5WjykNBHFT7fPAN6bfULK51kU0DjE0KZSWVdZNPfY1L1QXuj4+42qQbyc65XLXqkzXmVajUzIw2z2dvzOkWuYNKdyZ2EZqgmTRLHUNIQC+PY+/mXH0sKZiWwgJL+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgRp7vRO; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgRp7vRO"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15e2dab83eso344821166b.1
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390815; x=1786995615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRKEDfsj3neRvHaPQAcC4yHGhjyN32qyFm0f+mmrXno=;
        b=jgRp7vROUkEtxTU2BcrmcGFPcb2nJO4t6WhS3WZ3yyXJ3YAPaDV4Qq/c+7YjH1jz9/
         CZzds5tkjddT0Eer5/kg+M7+79At1xF0azUA8XLTNGaCai2rz/I8bVYYRj7F5nN0w3el
         MImIiBuuklKGmmjg4z+EHwfHgSOn6lMf1A43r4OGGLmgjmv9apGJfy+ImpQGB1x++xfp
         t3WXUplrMtShwMeFcD8FscrgU6Lhl4BCqRoLP7xpIAf0+F22QVUozoNg91XWROLA3NYV
         S9qJDqkNmP/ywAu6uARxtKNE4HoD4UL3d+CCzdVAABdnIVE5Da82NywHdsE7DYl3Ywq+
         calg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390815; x=1786995615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRKEDfsj3neRvHaPQAcC4yHGhjyN32qyFm0f+mmrXno=;
        b=ea78PlpmQOlxgk4CkFwCBHxNnvaLotMCDf/Xjk0XtYqH7x5FvLBu0cXyvi+TMmxeJy
         YpU7nMjv4OLaJnTeetDHJ7P1D+nxypoehBtfw1LpVwP+KeCj6T5fRFOOKSD6lvumPJyF
         Lk02tiIhGe7HdZuikLSbppOfeWq1VcG83tVVdZlh5tgM3qcqwAIUU4VNy/2opiKbftw0
         GmArtuXN+EGnY64DyAI8XpUyzHEEwQLhZloHkhiX7fR9pp24AV0X7incCsL7oFdsZseF
         TuBxkJsNEjZvnK6M8qPQNXl6+h/9it6KZMAB8d2U6iMXpMKlxtEO4+KgAa/hih7ptDmY
         D3GA==
X-Forwarded-Encrypted: i=1; AHgh+Rq198onqRRTwAOd/U84oPG/dwG6/4Z2hTzi5Fa8z0c1dj2CUvz+oOwFIKmslCKGi01HzuvyAJueU6f9Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyez7kqqqtIYnBGfBlVXTp03uLkdOqhVBDidvJgTLv5wnklZVTf
	rEPFVvlnerGCPVEc4QFAHqVINl2NtBiT+WTqEFDAkkwHvmn436VkKwDG
X-Gm-Gg: AR+sD12pY9v4LtR/WT642BaH00XDtaMAz3i8eI2Yc2OLRta4dkn9FCzSdeBsIYFAbHW
	MSnOujSY/ATI8l5WZl3lwN1Y6q5EANSOlC13tKoxyXPAInaVHwhs9HdsjhdtLOnd7SjVlqdJEpu
	OUA/aR0uCOWiDWm3rbvlFK/Zlto/tAA1FjIGjRQ1QuzURpVj6Cp7zfZusdLvTMLYdmdNWSHgOXy
	8rDTWG+ecTuWtIC7zbkYovpDtP/SiKpXXj2N0JN57Wgdgfxmj/odpqgH8z1YPhMUAJywB4cIyNc
	BCOvRxqLGfA+ywF+SsCWPl5C6jtOhidhwUX/WVUrF3JXZndH/aDdImwcOJ6tCfqxg+HQKsALpNY
	6SyGx/BI7VWLXRjyIE8vqhDHfrJ9pCscbFgUrqxnwzeUHh7WkDX63R5IEuS/YeqYHgaNDOE3fwx
	6qUh1XYU3ugJfcifxyaHif3CJ2VwW8GVE1NrYo8oYjR+tCA0xXnb/0gUBwmaofRqf/TxodyY4Dc
	4VS5VrcMEA9J8DuYgEU9uIdF9RCzOT/5L01HPTjUQ==
X-Received: by 2002:a17:907:5cd:b0:c1c:3b06:ed24 with SMTP id a640c23a62f3a-c207ed5cd1dmr1368830166b.28.1786390814821;
        Mon, 10 Aug 2026 12:40:14 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a84sm449928966b.3.2026.08.10.12.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:14 -0700 (PDT)
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
Subject: [PATCH v2 2/7] alpha: only use a targeted tbi() when the target mm is really current
Date: Mon, 10 Aug 2026 21:34:53 +0200
Message-ID: <20260810193902.3286353-3-linmag7@gmail.com>
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

ipi_flush_tlb_page() gates a targeted tbi() on current->active_mm.
tbi() acts on the address space context currently loaded on the CPU, so
it reaches an mm's translations only when a thread of that mm is running
there. current->active_mm is not sufficient: under lazy TLB an idle or
kernel task keeps an mm as its active_mm while a different ASN is
loaded, so the invalidate hits the wrong context and the stale entry
survives. Nothing retires the old ASN afterwards either,
mm->context[cpu] still being valid, so the resuming thread can reuse it.

Test current->mm instead and otherwise fall back to flush_tlb_other(),
which clears mm->context[cpu] and forces a fresh ASN at the next switch
whatever is loaded now.

current->mm can be set while the mm's context is not loaded: a task that
borrowed an mm through kthread_use_mm() has current->mm set, but
ev5_switch_mm() only prepared the PCB and the asn_lock it set is still
held, as described in the previous patch. The !asn_locked() test keeps
this path conservative for the whole of that window.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index ed06367ece57..1ad448105201 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -669,7 +669,8 @@ ipi_flush_tlb_page(void *x)
 	struct flush_tlb_page_struct *data = x;
 	struct mm_struct * mm = data->mm;
 
-	if (mm == current->active_mm && !asn_locked())
+	/* A targeted tbi() needs a thread of MM to be current.  */
+	if (mm == current->mm && !asn_locked())
 		flush_tlb_current_page(mm, data->vma, data->addr);
 	else
 		flush_tlb_other(mm);
-- 
2.53.0

