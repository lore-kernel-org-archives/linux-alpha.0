Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DD63BBFD6
	for <linux-alpha@vger.kernel.org>; Wed, 23 Sep 2026 07:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149782; cv=none; b=lhCI680oGk82/5KxB0wzzXDKERVaJKZEw/2zHpBsAC4oGbESxiw/1GTSAxfgTlrWe6zLfpZ9PBeQrzEslRyrv0FCeY/Fm84KIAohI1pmuGKdNHl/LgmI/t6dbkQRrg8Gnw7OFKZWSCFpujZPeBfkOovBIBDbLhCiHjfjdsaixUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149782; c=relaxed/simple;
	bh=EMwactETkXe8vSMhHk5uaUdqn2lrxvQM56NTZ34bIRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5kPvImaIHtC4CHtFQnQ/3/fgq5Gh6aYcWwIchixbrJuY6g4uNmxQtqLYk6kgqWYo6vN1wSFxVPIOnQbRHGuvbIc2RGrHuCrJJosQlxFPcx88g90Y2zCjF0xOSvml1sPqPJnhbjku8tZySLfY1k6kO4En83gy1TQsNyJBaFM2Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=syp5ykIp; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syp5ykIp"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f9f0b20so83296966b.3
        for <linux-alpha@vger.kernel.org>; Wed, 23 Sep 2026 00:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149775; x=1790754575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I7gkSrqkOM7ln6wSKzbmSt+3Xyd+xuwsuurc3B4YbEg=;
        b=syp5ykIp1P5RwEZfZuEJrfw/7R6aSkybJWheEOX7MzkZ6b5EH/xSKgkhQMVrBtyLbL
         R9oECc9+HP/K6J8nqdXdxuAtuxe02+a7D3xtdb5Z6La5ik5PGY9L3dto1LwrQJn2bRYN
         QFGYjoVlkCuz/DeR6QbrtWSh5fj+UAtjtcoJ+UAZNkH35e2gmQogoJU/3tGNk0gmIhlh
         17Z85XlLcH219CQJpxjXeNAvGJl+vrHW5KT/bsiMmqUN5aPdHOBvtwtBzskhqnSh/gPq
         1VF5yMhXH6D+ZZdOKKBgeJq+kRxXGBh+XR9QF5nXgqm5s55UgTQxUWtYqstqHsYP1UHy
         oC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149775; x=1790754575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I7gkSrqkOM7ln6wSKzbmSt+3Xyd+xuwsuurc3B4YbEg=;
        b=xQ1Q7zomUO/JZ4/9ROylZNPwvI+fSOGD54p55Lrw1YzccJt8g6dHHSPNwy8dT1pMd8
         luQzl3ur+L+JmT8HbxaOycAtevbWbiEIqj6vfYLNf9nBdf1ocO5PJ3AdpSzMKaM2QuJ3
         56HFnuO+1ZbP1J8DPxnMeuM9+63aeAElxEVSzQivkaRzA46lUhVtpkD3tN7SqUte4Lb5
         MFJqUNUdE2xWmkRmLsWasqyKXumL5GyYujTLmvujn+UPBA4HRZK+b8dEXoS5u6XYOWQo
         6uCS4XuNNLmXaiEc3qvzDNxljhJAy5WF9ggG7XnlqKd2/GzQsg0HPvfT6b5jJRv5hY4p
         Aipg==
X-Forwarded-Encrypted: i=1; AKwUvByyk27+TJfINlddBrAi7ObzuDV73dJ+PfrgONwycXa1U7MH2d/LE++mq1kqNpn0e/Vz9QrML22wZxKbVw==@vger.kernel.org
X-Gm-Message-State: AFuF++mvMect+yTLeGyZO3iVC+CgnHHhhFWVCuctFpfb7nq6dYIizW78
	T+7wg/YHN25dwUw1d5EojYDr1kWkCDdaIdD8VLF6wVml6iWc+McpT66H
X-Gm-Gg: AYBFou341YY36qw7/Z14Iinse+KVnjjtyaPG9SHFo39H//OOjpdyMIq+TMuVhv7AIC2
	/QythhdBL+KuyvBq9oLqx2Bn5ZCkQejzHpbgaM+p3NZL/nCZJVdmNxx3cECAZrWQlYgsPduWVuw
	zgrGxtP336CkSEqQhbBUZ4dLblaqJj3qYkzDNOh+iPCPBVCkSIA2yogUeQIVfb845xkqZFRhzxo
	sgqxj5yk/GhUZFF9MuFdZnq998FzWHIqzKF/8cTV453DDI26VjA77IHezVpqIVjP17b82CNqBZZ
	C5N2vsTL05AmecuoWPSgzO428PYjxwcEwDX/Lb7/HaC3HEEZf9FTa8Gg0RsKc0+LDnOilqCBfFo
	JAk6pkdSMLJDdT92/SCZnxw/nxEo0O1t32AvvjMIzS3Q4zq64FtJY46Sbk1oo8nPz/onm7prEg6
	QP+yCFU79JRW94n7e77Ne3o5zYnOrFRe4MQiNJ6MAy5UCHJLZha26kuwh4HGapsZT5Jh+GNXA6s
	G70HFduElEWsVI7LoGb4tJkX4J+af2x1HAg3rqpah5jFLscYOLlGxgoxG/X0g==
X-Received: by 2002:a17:906:dc8a:b0:c25:2688:8212 with SMTP id a640c23a62f3a-c2aad863bd8mr138436266b.0.1790149775100;
        Wed, 23 Sep 2026 00:49:35 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6f5asm64951366b.15.2026.09.23.00.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:49:34 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3 6/7] alpha: invalidate the local context in flush_tlb_mm()
Date: Wed, 23 Sep 2026 09:47:49 +0200
Message-ID: <20260923074903.862898-7-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923074903.862898-1-linmag7@gmail.com>
References: <20260923074903.862898-1-linmag7@gmail.com>
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

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
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

