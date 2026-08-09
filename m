Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5693B6363
	for <linux-alpha@vger.kernel.org>; Sun,  9 Aug 2026 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786265733; cv=none; b=kIp3wFgwqOqZx5d6WEWhx4vOPoDnpmXSS24K49mlfnilwDnHHBagLerDv/v1J+PCJp042rbBSHx7qjtXVXKH2fYBK2rFIYqQIKoFU3Ro9LTwUZQBMAffFuwBgRtvVa3GkzHCEca0EqpH2jHCnPAb/P7qpL+THMsjd7MDzUyywvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786265733; c=relaxed/simple;
	bh=i3uCb971qBsXhOjlS4VI5Z1LyED20fQEVi2SdG/BSsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MqdSE1TEctzevCbJ5nbF1PTw2Q2RhzuhLaGXZHqJz2kf8PeFcQFmEwFPns82lX6Up7dn4v9D2dU4Kq+9vcNYC4MeG3loh0UPaJy0a6Tk2k+6IKqvfXpu7Rp0oL4q2uIflUescB3mkawF1nlIdKaIg4/bENJ82EzA6/lN9+VrV8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VK48gBw3; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VK48gBw3"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a205b0df35so424145a12.1
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786265730; x=1786870530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TtG+LSzX5pGhXF98AP6Y+JUcMCLF755yYvd2Fbb8syg=;
        b=VK48gBw3RB1BN3oSHPhZRFQAHCETyEwxlZtJ4pIFo6TTgm8SsQ0Q5qa9241R8PJZMW
         KnWJWgzWgAJjrNpEeGXv+DuEP1K+o4Ca8+wYzGv21940KBR/SjeW6kINGEJ2PoYAt8da
         DoVQl6LXSsKphtgdqP52f6u4WqIcJAxyONkZjf93tdS52gVNA6CcOVRvTBWZnaas3qhn
         VXw4IAlSILNWGoZ65b20gZhQ8vHdk1V0uD9oexS+w+gfr8Fi8EfH7415XWckDp1pOsIp
         VcKXveG7dMA4PO6hxX0/Ng2W+oM03D6MGxFlVXld+W5gi+qi1NGeduJd0JxjHZnkwwIS
         T1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786265730; x=1786870530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TtG+LSzX5pGhXF98AP6Y+JUcMCLF755yYvd2Fbb8syg=;
        b=IEZYkWXCDrIYuDGt27bKN5sLdwkDqYpLHOjQUrs4DSpXDDdhKH6kFZRTB/WKGzr/5k
         TuhxchgNPkoNYtla89lkwg3nKvL4AuZ8wLS2WKqwgqFRDagqmmPew7aFIDb3pEMwvDgo
         hyRKUzhoWg/txHpaDoorPp8CjdPW8Tbb9l6ImzvYHOIe2yKI9ItRwDdM+lXRMHJJv7HG
         c1KA2zN674WYlWYWc6V0JDYcHQXg0SHHlKKiEDgNpTqOQjJRyDGsHdzDTSBT+uHDuooY
         CjJGjhobUP7SLzM6AQqoirHxQsZ5y4RCkIMU2hssIA32z6ZeXc31f4MkG6ZcXH8Pk22V
         qMDw==
X-Forwarded-Encrypted: i=1; AHgh+RpXtjbof0tYX6SpE7D3LdWTYLIdaqO8XBLYcCWptIZAMC2HulgKRen2Qy2O6sroIgXRmHUuPUifURAv2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ8uJa87a9ZN6rOXFDgJ8QpfzOlTaFoIaH7RldkTfWu3g2HITt
	U7eQU/R/Dpgn8vj9wnZJF0y1Jo4SxgzqwbFdejipzFWDioIl5zLNo6gQ
X-Gm-Gg: AR+sD13gSpuoqOKzm0Eta/gR+yyWdNTkfegeJ/bgeVdzlYFjD/AhuD4mjx9Q/nFvF1M
	qxiQ7CioO/2od2iJ8d2BD8jBrxMrYIMrEYn/zemkDGV21fZj4mqIcFHL/2Hcwv+1gHP6CN0dSsO
	KnIgV6AB9htGGZJ0Yu6BhWLU/QwO423c36nv0dZtjEogbR3CKnPjLE676wQOJth6LDaAa6Lssg2
	Zb2gXpmqcSDxXMflbSxc+3Mab4ZYhTH+7MrKJWOF56L+VN07QFGDhaPzi29IGT/KtOoGPSE9bXe
	G/AscmwhkMiB0+hvbF3GxtoZlZFi5uONdOytItUJgbJiWKgWAGyoi4AJpUUeNlBo9HB6Ovj1bVu
	AzTRE3cQJuMjzSaO9gqgXy3loLxF0zpnPxjBBt7E/qHxU052CMCZWPSbzxugfq/PBa1hiIalYmw
	rJqDUdw2stID0ElEkVjbh1A/OZO0SiXkI/94+4ofsaq0bVN+bOhz8aQrk9Ho41axhBNGEruGvzN
	oA3BXXqaXnKcTKSA7w+AWaCG5nUtHk=
X-Received: by 2002:a05:6402:5515:b0:6a1:f95b:8ced with SMTP id 4fb4d7f45d1cf-6a1f95b8e6fmr3310458a12.4.1786265729760;
        Sun, 09 Aug 2026 01:55:29 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1f630a4afsm1606681a12.3.2026.08.09.01.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:55:29 -0700 (PDT)
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
Subject: [PATCH 2/6] alpha: only use a targeted tbi() when the target mm is really current
Date: Sun,  9 Aug 2026 10:49:34 +0200
Message-ID: <20260809085208.3262799-3-linmag7@gmail.com>
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

A copy-on-write fault replaces the page and calls ptep_clear_flush(),
which ends up in flush_tlb_page(). For a non-executable vma the remote
IPI handler issues a targeted tbi(2, addr).

tbi() acts on the address space context currently loaded on that CPU, so
it means something only when that context belongs to the target mm.
current->active_mm is the wrong test: under lazy TLB an idle or kernel
task keeps the mm as its active_mm while a different ASN is loaded in the
PCB - enter_lazy_tlb() updates only the borrowing task's page table base,
not its ASN.  The tbi() then invalidates the wrong context and the stale
translation survives. Nothing forces the old ASN to be retired
afterwards either, because mm->context[cpu] is still valid, so the
resuming thread can reuse it along with the stale entry.

Use current->mm instead. When no thread of the mm is current, fall back
to the deferred invalidation, which forces a fresh ASN at the next switch
and is correct whatever is loaded now.

This does not make current->mm a guarantee that the mm's context is
loaded: kthread_use_mm() sets current->mm and reaches switch_mm_irqs_off()
directly, which on alpha only prepares the incoming PCB. That is a
separate problem in the switch path rather than in this handler, and it
is not addressed here.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index ed06367ece57..0dfe29b59039 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -669,7 +669,20 @@ ipi_flush_tlb_page(void *x)
 	struct flush_tlb_page_struct *data = x;
 	struct mm_struct * mm = data->mm;
 
-	if (mm == current->active_mm && !asn_locked())
+	/*
+	 * tbi() acts on the address space context currently loaded on this
+	 * CPU, so it reaches MM's translations only when a thread of MM is
+	 * really running here.  current->active_mm is not sufficient: under
+	 * lazy TLB an idle or kernel task keeps MM as its active_mm while a
+	 * different ASN is loaded in the PCB, so the tbi() invalidates the
+	 * wrong context and the stale entry survives.  Nothing forces the
+	 * old ASN to be retired afterwards either, mm->context[cpu] still
+	 * being valid, so the resuming thread can reuse it.
+	 *
+	 * Otherwise fall back to invalidating the context, which forces a
+	 * fresh ASN at the next switch whatever is loaded now.
+	 */
+	if (mm == current->mm && !asn_locked())
 		flush_tlb_current_page(mm, data->vma, data->addr);
 	else
 		flush_tlb_other(mm);
-- 
2.53.0

