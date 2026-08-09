Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97CA3B4E94
	for <linux-alpha@vger.kernel.org>; Sun,  9 Aug 2026 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786265734; cv=none; b=FF3zFDOfHTAmICzalDnrzbWwQhUuJfESeWuVSX72EqEHkMjy/h1veBQqRsYnMQy5Ax9bRuZQnj31anUEUuvZB+8eFpxOgA3CI8M1TTMl03uAmx66xsc8VaQK+Bok9h/i34OXwBlvQG0aWUuMSjSS3at+Nfj0/8G4MQH+lkasjW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786265734; c=relaxed/simple;
	bh=XJ13sZxBIJ6krRBf+heB4Ni/k1z+s8+IsLQT7eImPz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=muXRduyTn8F1wDjS6ms7/s/PTqb6IileQ9fFxBqbq/7NCfRdUO/JOGUEq0YYjOz3hPFjamVNkUQ7ny9Pj108bFpCIVfUrfnG/LQAsnYbRLoX3NCV6YbJ5lU3ucB8kMdIP02K3qxPJQYofGTmaaB4FaxPre9lvflW2L4qfrc2OOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1PF3dSc; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1PF3dSc"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so4885899a12.1
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 01:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786265731; x=1786870531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApQfFv154paetM9TgIxQj41acxDPs1l/KeCboEHJf9A=;
        b=e1PF3dScL8aEvRZaPq6bnJvKfkXtuWLvhUpzYMfBcunM/oVLwPRGorm8OSL9KNhH1u
         NY0o5HTc/uCyklcOr9HmxFkcCditPBIbqA63iF/F7kHM020USljw14b8FLntjPk6Zl8z
         w/O/gubdkTVhWqdNZci04jl+g4WXnG7gYAFkgTh96BTt11Sa3quOzRSYLPkqtLTMuBEI
         H8Qe/TI4iNEvLfFL82mioaJWMQjnCYak+5mmyWUHL6LNcVdu3HbBG8jN0DLf37Lk8nv9
         Dr+NKWxazAj4HOu/6VHwYuuBIgADL7B46vX/PExUVTuR/+n+kwTBIYU49LVMLPW1rh6I
         Qudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786265731; x=1786870531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApQfFv154paetM9TgIxQj41acxDPs1l/KeCboEHJf9A=;
        b=qRb6K+LIbjjMIrhkavVU8VtQGTGfpKMrrZhIth3z+TetpOkNqDCVJuWsDsvnJfimLo
         d1T9XS/CP6zinbTu2sMIhMDIYSfYUTE+EapUu5L0K/ibuhGRQnpGvG+c6KQ4pPd6q7sO
         wUQ2jKD509c1ydQBITgoBRk2ezinqSnTHf8yx3Zv+rz90gKHPDvzYjZvwagzfSKg4GFp
         jsJLh68qtgBfCdlBlCMMpSJ7CuZjmZQdEn3wbvg1FWE9mn0HOVYsljoDfGtVrpHYiUun
         77aMnC+AQUFZ2Q3Z6NNf6nS9GJwjOaDn/gNI3yVmCwpZ2jV4B4kgwg7Sgdo69bYtwCAI
         nZNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqZdbwG2fg6x1VXihpKD/Z5LZzGOg00Wk9p+iJ/92NmOgr5BYpqSgSEA3r72aliaPj7Dk5QrOLQqVPyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZzxCfWMrAMx747xem4OGmFiJrs+JcIocMgnKvdkwYkXiIXyPG
	dglSdmTLjArRzCG8Mrb/P5pA2j0EMP18gEkmwQXMMIWhfLQ4FLl/JJo8eWPZCd8T
X-Gm-Gg: AR+sD11tKoWYD9SQ73mlAAgesxcPfF6v8QQS4GUmBXnt8EvDcbL12TR/eFnMHno1Cf4
	dGDkyv9QaqiSTcYixeR9ix+RLIROrlXiKf5hBK5zEttI3Jd0lvG8o/qw7odt1Q2ZCZTzrmNclAN
	M/OhtX9MzMDPU4tu3acfLn0Xgd9FucY9AVc0i8pqyG9HLAa2ycQC8QOA6NXO3weKbOfEWL/K+rG
	dfj0uI36Mii1MwA4HPriQC+T8pyvTDDGC7I74H6hyQGzCRjc/CHm3JT4jVn79/hWnGZ+4PVZE9R
	B3fuWFYErBqFyVDEI/jGa3uDtSSbx6NlOVqnx+QM3bHjBpCU3D6HyEYK1BP7OOzUBkZqVAHjVaS
	A0IF2rH6hD2flaClVTcydL8NVMvayK/A1J9huZPOLCno6I6sQ2GpagEK1qjGdgRSjeQs+vWiMCS
	YgRE8TqcNastYNeMKeZl+gc5i9rRgNIrhvuDxxo9vHQp26X8egMiQv70yWu0xJGjJHxERxJxI+S
	mueVN91c0PmCt23U3uGo2Ok1yHzdWI=
X-Received: by 2002:a17:907:ea8a:b0:c12:49d6:3c5b with SMTP id a640c23a62f3a-c208d3f294dmr456032766b.8.1786265730821;
        Sun, 09 Aug 2026 01:55:30 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1f630a4afsm1606681a12.3.2026.08.09.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:55:30 -0700 (PDT)
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
Subject: [PATCH 3/6] alpha: fix the local TLB invalidate in flush_tlb_page()
Date: Sun,  9 Aug 2026 10:49:35 +0200
Message-ID: <20260809085208.3262799-4-linmag7@gmail.com>
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

flush_tlb_page() invalidates the calling CPU itself before asking the
others, and gates that on current->active_mm. For a non-executable vma
that means a targeted tbi(2, addr), which acts on the context currently
loaded, so as in the IPI handler it reaches nothing when only active_mm
names the mm, and nothing forces the old ASN to be retired afterwards.

Test current->mm instead. When no thread of the mm is current, clear
mm->context[cpu] so a fresh ASN is taken at the next switch. That also
covers the case where the mm is not this CPU's active_mm at all: the CPU
may still hold translations for it, and smp_call_function() does not call
back into the caller.

Reached in practice by folio_mkclean() from the writeback flusher
kworker, which has no mm of its own: about half the calls during
writeback of a shared mapping, and none at all on anonymous memory.

flush_tlb_mm() does not need the same active_mm to current->mm change,
because its active_mm path loads a new context rather than issuing a
targeted tbi(). It does have the separate caller-CPU omission when the
target mm is not active_mm; that is fixed in the following patch.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 0dfe29b59039..d167b3ba1303 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -696,7 +696,15 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 
 	preempt_disable();
 
-	if (mm == current->active_mm) {
+	/*
+	 * As in ipi_flush_tlb_page(): the targeted tbi() reaches MM's
+	 * translations only when a thread of MM is current, so test
+	 * current->mm.  Otherwise - lazily borrowing MM, or not running it
+	 * at all - clear mm->context[cpu] so a fresh ASN is taken at the
+	 * next switch.  smp_call_function() below does not call back into
+	 * this CPU, so this is the only chance to retire what it holds.
+	 */
+	if (mm == current->mm) {
 		flush_tlb_current_page(mm, vma, addr);
 		if (atomic_read(&mm->mm_users) <= 1) {
 			int cpu, this_cpu = smp_processor_id();
@@ -709,6 +717,8 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 			preempt_enable();
 			return;
 		}
+	} else {
+		flush_tlb_other(mm);
 	}
 
 	data.vma = vma;
-- 
2.53.0

