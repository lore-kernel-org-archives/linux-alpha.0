Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE74949E15D
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642352; cv=none; b=grw0nhWHl/vg1CRvlNK0ZXw3vpRB6sxik5V7cHJpJ0oYlbwie8uvfShabRh5UsoEyKp8DWHvwX9i2ze6H6XJGXP1VOIZyZ1C7+IvfeDIkjViXrOhtsK8djFUVepz8RowI7d0nfKa1QIBLydm75LjnIvOE3gk9t196gYNCPD/HQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642352; c=relaxed/simple;
	bh=cXkMIq8q0zl3V52rVeK1piAZiIn6KlSymnHMZWG51BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8+9B+/ugf50D0Perx/h0ZFM2N2gttcxlBPMx03N2ZZHc10bTtIP9ONyhE81h/7ylK14NZOlB+oZwhZcI+fnMIbKZaW99Ue6hdEqndiDZo0fL1RWyhFFO3Ccvcwul0YcfF+bx7vCwDftL+hl3Tu+ZzGsT01YZ3I6+LJ50iBfhqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNXJOjxW; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNXJOjxW"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so966912a12.1
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642349; x=1792247149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVnDfPQWDbfz+z7bzr+fAeI6gucp+XBlKaScYOwyp+I=;
        b=HNXJOjxW0ptz1QlJo8zynhmXR0GJJtNxcWpblcUqt8avQoc2GwYVOF70fkE79RDOt/
         e0nC56VchERHygXPmmBTosRZpZ5NJrQ9Le5pBw/UbqPsqXWP75XHKfYq5t5NemCCmE/P
         00FWiiqTFvp1KupAK7OxRtWvqbiyqu9gq+EGZB3+h4eHwS1lt8ujekvLylZazUSA8DW4
         z5l+ay5iFow6KdVtcKjmEsGCOjsQQlHAK+En9lfmqLtsbcW/xuXIkUffqO1jCg5lxLPz
         fSNymp4BkbIcfDS6C9Ywn7NKAtni8sGtUP90Btn3R3RIhKmmxwZx0DI6gi3pRobrJqm3
         JLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642349; x=1792247149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVnDfPQWDbfz+z7bzr+fAeI6gucp+XBlKaScYOwyp+I=;
        b=JgC4ypzohQTbsnpxxLZJSAjgAdB6RV5VI4JUEQP01FEcgUdaO3vaaaXyI1N7Tvxks6
         zXNKQDDaUHU3TbJoBwNRguKYX4Zic7XwSXXRbbYxEQxIvLLZmEPcVp0h8Y6VZzD3NSuK
         Ds1ajH1tUU5mYWW20pcjvHyZC3968wmiZ5rj+Xw5C6ATpR+9V2TNNBbVR6JIl0d56dEq
         MMCJNC4jFzlbQL/gXWevBDomP/NfSsgQ31uI580KJXTl+7ILMe6bwatTCouY2/nf3FV5
         kdZR8bc+yTuzk6dbRRSR6hFWU4sDUvW9uJKnfgo8JeIbokaP6B3r9N4YDYqUcfIgHZ2z
         T3JQ==
X-Forwarded-Encrypted: i=1; AKwUvByJaMGRK9q8JDwlC5sl4d1j5mszKsJr5RfhsNfILMun61MO41VryZdGMhkM/PeT2DEFjBWZ5Z/p1AxGgw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJibN1/Sz5N77t/BKkHsZa2rCsoh4cn8ZAReeah4SjRTbAYvncF
	vJ75EousUMtN2MwuP2q2Uz3zIAFMoL7N4dMv7NsdUoWx5jVUMPZd9qth
X-Gm-Gg: AYBFou0yHO18N6rFlRWMA0VlUSVaROswzyrCxqCWNxSyDutZIAB2ZLMn8Bk6DS6QOD6
	2WY77IP9U26ERFbB50XbQFYjghzG2aEDmLyXhxT3zo4MaVU79JywFh+1DJsXYLJ9SiZvC7fHc9X
	ug5ZsaQngbVWYrXwSmLl/Bf2rRVQgpijV6uvpPhQcYzl0M2pNksELDTWnTLyL6e/3wb0X0R82Mx
	+S4Ez4Uxw1eZIAJN+hO6NTSiMdsqmwlG+vI3x1o4vKfVxCwEagMmsVMTFjWuwjHDHEgLre+ohS1
	UnICatqRmWD6GpNUH6YZHZlRKU3sNOtSxfjui/KzIOWnwdnQ4UeKXBjGfCq3df7V/Z3oJBB9WMf
	Uv8wwWlSH/dYRIo6em0WoZOQT2wq2F3giJiXN3vkt6plPXIh2wxPRF5T9PoAWgL92MXSqFprJKc
	EP3hAGjdMB3Ry437imImVv3dY8xJG24A7qaikfHqA6ZA8mtGKHv5042LcGTwAmQB6lc5tCuxINB
	9hmymEf7rbqJ0G+WJbGXF19c82F8Q0u2G+o9yt5
X-Received: by 2002:a05:6402:5189:b0:6aa:f809:ef44 with SMTP id 4fb4d7f45d1cf-6b17c296a4bmr4478915a12.19.1791642348794;
        Sat, 10 Oct 2026 07:25:48 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dfff40sm2635586a12.34.2026.10.10.07.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:25:46 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v5 3/8] alpha: only use a targeted tbi() when the target mm is really current
Date: Sat, 10 Oct 2026 16:24:29 +0200
Message-ID: <20261010142533.974797-4-linmag7@gmail.com>
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

ipi_flush_tlb_page() gates a targeted tbi() on current->active_mm.
tbi() acts on the address space context currently loaded on the CPU, so
it is only guaranteed to reach an mm's translations when a thread of
that mm is running there. current->active_mm is not sufficient: under
lazy TLB an idle or kernel task keeps an mm as its active_mm while a
different ASN is loaded, so the invalidate is issued against the wrong
context and the stale entry can survive. Nothing retires the old ASN
afterwards either, mm->context[cpu] still being valid, so the resuming
thread can reuse it.

Test current->mm instead and otherwise fall back to flush_tlb_other(),
which clears mm->context[cpu] and forces a fresh ASN at the next switch
whatever is loaded now.

For an mm borrowed through kthread_use_mm(), patch 1 of this series
installs the context before the task can take a shootdown IPI. The
current->mm test therefore covers that case as well.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
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
2.43.0

