Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820373D7D8C
	for <linux-alpha@vger.kernel.org>; Fri,  9 Oct 2026 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579908; cv=none; b=HD+k/jNLtHjxrky80T5N5AvZsh/pHZ6sLVcfLzUKYQhOP9/TNPQXHoeT0d8djYu61FbztnyqRW4hYFYclawkCc9friQ3ZfKzktayZHA6rFY91f818G0K3QYqWHn6Xev3/vhFEQeS/UbPkRHYdwWPpVB3R1dMVIIgyPz6f+TnBAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579908; c=relaxed/simple;
	bh=lv4U2JoYCAddpO2oEpUCrNtOq6iSFh+gZ2nPJ8zjVKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdbaXWO6K9UrJFAbG8GOmG/YPrxuBr4cKDJaS8c9yR9JU6MN4pwAkpZWFkibnotYvmN7DifWYDd+jbiSBGRG7bI24VeIFf1R4y33m/XN5v7GNxxEMbiNRkGFQFZKsDUP35+TVptfkQ81j9b/wlTtZTn2sVBcbgFfwRB/bXipiRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGBOdr34; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGBOdr34"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so221856a12.2
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 14:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791579905; x=1792184705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMJNXVDBr1Y/oZTvHICO1h8qIMsaNHo5+E377B7YCuQ=;
        b=YGBOdr34B3OKPh6yNO677V4lRh80sYTMS+vsChsfzcqAWGhkMT97jebZUMfxpYCyd+
         FOzZCCiOrI/Zo+9RL6uN9UsTxjaK/jI3/L8v7cCxGmtTVUkCSmp51FdmuF4yZRO5uXeM
         2MedQXNZNAv8wqu3hyNfspwS1ct7iLsppzIgINNOzr6kQo+n2EYBLgR1qkXjPu2DXA1A
         x2b3prf1loaNeRzZrsmtEihuE0XIda0HHJGazoeMIGyTdea6t5guyuK3rjGhxXNherSV
         xX0uEzx2McRt6gD1jwnvaY7EP2uAqB9RiJKs7uFv3HQ7ervR36njCEBdimtZglPxqhBp
         Kh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579905; x=1792184705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FMJNXVDBr1Y/oZTvHICO1h8qIMsaNHo5+E377B7YCuQ=;
        b=azELzW7jFArTTcmLucxNCIKGNNJoYF9nOrwGdP8HtYKcCmGwUAEVoAVFMYLoJ8W+ja
         Y+6EXaKRy1NRBB6ZFj0WMfnKM9/vq3+zWOnG9Da8RaJJPAcKOBOZmqURDY5bIKQHwMJu
         WSE5a9YcSuNnwB15WYggQW08GLx7e3X4LBMR/rvOSre8v1LvOoe0l2ANjqf/vWY7YCiS
         lNv1djb7xyoID83/8KWJN+q/vp4OwIKvsdM0TKnTpF0Qc6wwa/k74YX2/Y2E9wRk0T9L
         WK+6rZkUJH6GLjh+8T13vGiLHgEyA+Ej7iNibmKk15D5PnHUm5MjDANtTHAFWcmQ+VgK
         rAUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjNK/faaLxV9sovZXeWOKRbyXzwGwYZLosUVj6KLsvSR1STMmkCf+GtDzBdem0S4+a4aNz1R5vV2EG0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ0nGE5L832ZpdZOkSLFqEXoXi/N0qOIOtkOBzOIFTXm36eNDU
	zkcS3sHI0LTfpUKENPLYGgPAPg7kSfQka7nNZ0y1iWb+S689xTAuz4j+
X-Gm-Gg: AYBFou1f73eenrZRZKJ8SdGhYVaN7tb9Y/ZXsvfDk2HMaW0k1OpFE8uJvau7XQcTYiC
	S1Vpa+1pnQiWJYMzepagJ3Xpi93IuQLM2jTTqEfwlcbg7JKyykWeHiqbUSHeKms5IGiH4JJrqSU
	Dy22nq4revThEgVwYtJs5kgkSddUu5U/y6dASV+lC9RzAAh4glFL36mW+0GqlyDg3D7lu9l61gm
	LjiHDt8UbnoL6Y2jwolMBmwJouIlDqvdaK8vdLOw3v2SlnsEu7ahiq0aNRWz3x3dBM0xBgBnmYL
	ulDzaI8E/UsyGLaaIQJOKt1t7ZsEaxMz0NciVZDNts73UVVJ0Ko1HjO6rS0Zz/NCtnA/ZWD9fWE
	BhwBgJuDjJ/P0GOBfLko3FlxJfxR70QEkt3gLeh2PAcWWQRbXrtuAOWPjo+Ej59zNGhgpBxH9c9
	aR5ZkRvAq/y1ttvFNCMS6isOAN8MxYmQwjjo1odKQY1hqIgUJTPSx1TE6WZMejnVnyjVaBMmxRF
	sl3y+M+6T3SVQvB8ANFH3Ds/OIdQjDsADPRmOerpw==
X-Received: by 2002:a17:907:724b:b0:c2e:1d6a:6b78 with SMTP id a640c23a62f3a-c31aa0e0cb8mr335909666b.47.1791579904459;
        Fri, 09 Oct 2026 14:05:04 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm142141266b.8.2026.10.09.14.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:05:03 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 3/8] alpha: only use a targeted tbi() when the target mm is really current
Date: Fri,  9 Oct 2026 23:03:48 +0200
Message-ID: <20261009210449.971057-4-linmag7@gmail.com>
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

For an mm borrowed through kthread_use_mm(), the prerequisite direct-switch
fix installs the context before the task can take a shootdown IPI. The
current->mm test therefore covers that case as well.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Message-ID: <20260923074903.862898-3-linmag7@gmail.com>
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

