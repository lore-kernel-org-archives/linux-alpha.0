Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879263DAC13
	for <linux-alpha@vger.kernel.org>; Fri,  9 Oct 2026 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579915; cv=none; b=pXIZ37M+hJZ/Ac/OSxep/l2Rn0/bYXruocag2CYyIMrMwSZBM7Jlksdq4mxjC0RNbunaHTur4TzwccMrjyFVdC1jjwF7AP0S1Wdts2SiMT0Rds4AFbCFgUse5vVelJ7JJLPP3AgjT4ZwP/tc9aKMHNmHtRiwf5oVrqi7oJKSKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579915; c=relaxed/simple;
	bh=5andsTa8guQZkx+SfoPlH+n4TbEPX6cOtCcngDLHNCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h9sgqubab4IMS68+ml9ElOb5nOwtsyIdgj1/U3fFZOaA8vWr7PaXGLn8XOw26Uaiyh4n86/mVFDv7uG4i06BPOd1fw7LT5XGnQOoDd1905uYbh0XGQMVxbKwbfGtRcpukJlBHlB0yuCkqBA8cFXUslNVk5REyz4BIb59aAMOAjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a58sNPl2; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a58sNPl2"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so221925a12.2
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 14:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791579909; x=1792184709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6x26UZ+wvq3ZWV1vplJdUFrejcdIKhR4wACBzfYHUKk=;
        b=a58sNPl2kqpxmxXEvJoV8cXSH59JQ8QYsEi9aAbEmUFgoRtXROcL94ikEONSO+Z/Tx
         pZGGKd5gBzTKATrDSC/YlSFLsGTeRLRJXHjSdDEtMoWLfG7Lb3+KArWAVUWzBgT09h14
         c9wYRv4INcl0BQqoLxTmJuBegjY+4Oo7jb5JiSFfWQ0uzcSr3lxUAvS+8dL+afflwqkz
         D9qQ5/DcKhyUyVhcZEUMn0SPNxYWojaUKSaPckVFv7Kj+X6xDtpg/vymMijvm+rVT+gy
         uVXfytF7nMQ4qoe5HSjVUbvCulWxuOx++FQnwJ0yi2TTdDcov8dL44XE4ae8X3p5nOQQ
         8x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579909; x=1792184709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6x26UZ+wvq3ZWV1vplJdUFrejcdIKhR4wACBzfYHUKk=;
        b=l264/tgs43SAZ7TGZ4xZpwgqUny1+xMC/5PBTB5OwLGOUEME4MnRY79zKZjjx3z9oL
         6aktC/8UN9gG9Wa1CE056cotxcam2yMDk96VPTert1dHMV/bqXCRzAzrhkIUD2b2IFjs
         IFuyvCOVgfPdRVF0zrR87x19B3BGptIrEROLGdT3WkQP9y58WebTYnuThvgHJ5+kkxIF
         MW0zTiz4aUME5o1/oiZ6nqBOc48kLoRtT7VZImL8EDs7x/a+w1yqTs5nQSlts5aZBl4K
         zWoAOXdWcIa4PFyVBHCd4EdLaxVmpfzBdJBdo5/MR7Nkfl360JMWzIZAPfz5/T2S8aPm
         3ZtA==
X-Forwarded-Encrypted: i=1; AKwUvBwOGl7Fkzt7Ynk9Aqt3zHR2mSSyPRfInMghHReCLJjoI2yOb5yOAz9a8iRtNd9thnqikPhqHRbCNJchWw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJVp4rCRE1haV0l1z/FxhEYkIYZuEn4SRKJ5+HPTolTFW//oMDy
	9irIKUbCFyX3SECyawwlm8BFblQD6DCNekYe0x/p2Oh+K7xXuYOdIcqq
X-Gm-Gg: AYBFou0ArU+3U32QFXBIehAcPLqXukOmZf0cFqJNFDXyJmZh6JLnCOpuhfrhx3S2PSa
	SplYQwqro+pZiXOct0nJG6Q7SphTrPJnQYQ8lawocn+JSN8d1z5fjL9W6GrOMzKlvV3KYcYuqOG
	lfPkLwUCHO64KHFeYI523MRhNhYHBut7vkLbHWKHgc+T/M2lFJSYsXlSiuN1BoUNfbe4gspQ4U7
	1jIIY1eqZyizzRkfoQzVVDH7C3kPfdNGEIOZZBtraMPhpMZmOj2W+/TWbY5+epxxNbZkTWi6RNq
	C9ocaGAm0XYBifLwOLN835nNHtU56CONvUQNND0nHaX9jrs01Qt8VhkkOy1N9TW0tNMCbZD3yHA
	PqGK0RcF6//xtMwZdBE1dLSBpZEIjTo0xnZUzDsmnME1Da8YHSh/CjIAuwQoK5FC6nevoWujlql
	Pvt2m+cli0JbE6Hsg1VQiofAQ3kvU9ujieznL5Ex8+tNhEIa4+3hQJ0MQfFkbcQnnbIrTtWOKKy
	1pmB5yeUK6Rj+1Da9Eg/+lifkeVza1Zx0hZwKUC
X-Received: by 2002:a17:907:6d17:b0:c26:1648:a069 with SMTP id a640c23a62f3a-c31aa08e576mr337775966b.36.1791579908651;
        Fri, 09 Oct 2026 14:05:08 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm142141266b.8.2026.10.09.14.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:05:08 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 7/8] alpha: invalidate the local context in flush_tlb_mm()
Date: Fri,  9 Oct 2026 23:03:52 +0200
Message-ID: <20261009210449.971057-8-linmag7@gmail.com>
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

flush_tlb_mm() has the same caller-CPU omission that was fixed in
flush_tlb_page(): when the target mm is not the calling CPU's active_mm
nothing happens locally, and smp_call_function() handles only the other
CPUs, so this CPU may later reuse the old ASN together with the
translations it still holds.

The active_mm test itself is left alone here. That path calls
flush_tlb_current(), which loads a fresh context through
__load_new_mm_context() rather than issuing a targeted tbi() against
whatever ASN happens to be loaded, so it does not depend on which context
is current.

The uniprocessor implementation in asm/tlbflush.h already has the missing
branch. Counted over a fork-heavy run, flush_tlb_mm() was entered with the
mm not this CPU's active_mm 2934 times, and 632 times while otherwise idle.

The proposed Alpha hugetlb support routes hugetlb invalidations through
flush_tlb_range(), which calls this function. Unmapping or migrating a
hugetlb folio from another context will also need this local invalidate.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Message-ID: <20260923074903.862898-7-linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index a5a42ae4a7d8..988e397b0b8a 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -649,6 +649,9 @@ flush_tlb_mm(struct mm_struct *mm)
 			preempt_enable();
 			return;
 		}
+	} else {
+		/* smp_call_function() does not call back into this CPU.  */
+		flush_tlb_other(mm);
 	}
 
 	smp_call_function(ipi_flush_tlb_mm, mm, 1);
-- 
2.43.0

