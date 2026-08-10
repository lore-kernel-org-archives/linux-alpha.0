Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B30443ABA
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 19:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390834; cv=none; b=XeWotTM9aNdxBjCHtxvNNoD7A1lvRlCIGLniuow5IozP52pNTI2dW1RPN7/Ac1RlTNW/MrhqY9hvRrlQIvkmY2DHl1TsgXCd2pyfoCkV72ycWj95Rq5pwhSfoMzz7R8aV6GKZbkLfrpceN9x2+64bh6uk3wbr15h6mwkJZSm0+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390834; c=relaxed/simple;
	bh=HHYWIbYZQXa9nFoSOde0y7v8SzeS8K4QFE8dQsCXdhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pX889FeuyQFpv0m3CT01MpmW8B/1o330UH74pyLepRrK2uy9J2m0EKVMAf8ah3i67CBKIlKLUcLSx05bfMcOPX0egVZpg+2S0NVe3xxl3rg1/ssRYPqNPc355GLCo0XU9lrihbAsLPARhvdFMLS2RBXepJS5TMn02WEJ5JnYmJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aztu9krM; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aztu9krM"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1c52d920b8so294225866b.2
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 12:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390819; x=1786995619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMDjp/2Kph0Q/Gm3PYQzClsmsJVYRNh1rwgrPz5zZYY=;
        b=aztu9krMkzBKQde2jDf5M+Z9GZmONL/rsmIxCIp92K+m1GwhOqA9mUqXR2ISJ0qsO2
         veVkeUtncRX4ZsQFianopBEpU+2zWwdsHyOJWylGaAqOh0dKDtTyI9Es2Go5rX+7RJGN
         ycb1nMlo44ImZHsAJXmpgAw3uwPT4zIpSDfo+ZdKZZx3no5hH0RVv8OGlC1bj+IBViMI
         LS7Q6tZrY4dDVkRE38FmdfyZR6tS6tOJ8NZSdcE80PQSZ24j+RNUbx9IMdgw3A9JkAGF
         RfnPiALFYfMpx+HqIYmR/Ahtz0pScXjf3hAqMZRcOfe0cwGdMQSQoCfBhAiFIBz2QUP9
         bCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390819; x=1786995619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMDjp/2Kph0Q/Gm3PYQzClsmsJVYRNh1rwgrPz5zZYY=;
        b=kFfg842A9nViMNcdxmWNouMeD5Ui3kNkYz7ZUc6TxGFL9k0VbTc8+I7ifp560GoA9R
         uQutadqn/24AWbb1cdP2lJg0I1aElw1jgQeEH44tY7/rGoOp6f59huC5R4ONk+c7mNpk
         alxjScTFzxWQqEJNgbGV2zsxMPsFn5/fCWIAoMbA95+XKN//IFoePJk2a1akOCxJlvQg
         2STJXpQaoGdfKJ4xtvW4IBraPWX++7NZb9bHZW2/OBle41P3EZjdaz6bc8oV1g+Tzea2
         gNnrzIqkFdKgtz5GIY7LqXXN/9iwgM2+g8JBeLWuP+HkZ9b+i7WUi4T8VJa8FMHO8X+C
         Be7w==
X-Forwarded-Encrypted: i=1; AHgh+RoAm/NXsSuJOoLvhAsrXOFmHJKG9gF8KHRQr/bHe1flLzyqYPCLrERSIGVy1hlTTXNrIe/eTcxHUHgR7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3iDsCf+UcoKAu6tKwuPpK4wmY3+yV9XqVpy+yaURzMZTpukpk
	tbNTATOqdfXVbcq/OqDaYtHFSgw1ZA7xvzIyHgXOfa4cgSxogproHJbo
X-Gm-Gg: AR+sD13O0VT3J2NfZwIH9QTy7w9aYIWKE6Jw2obfeTLrnhC8ZmaLHCxo3XrNaNPIUWt
	RntF0lhB/5wi3EuRJ8Tg7IHAXKX+fKtAnJQtRLKK6ZnhFsSPYOfRnqd37RkJalTaIYDSZ4pA94q
	//BuMhMHCf1HF8GTukkkZtG/Wt+BJYsJmwyQOFB3EO2cuy1ldwGe3klS6gt2hC/4yqmy1n5cZ2G
	VXQ6vgD8gX36h6qy0QrKBV/WayOT7I9F/whLRUIwEEszBPps9PlrQXtBxSJR1uGIdPTBRYEn16I
	9z5pcI7iekt8+0i1UD34X2pDGOuWXyhpcu4R2p+U27+ljaQx7l04xTkWUaSgkUSofyMY1WTbLmQ
	VfUbHPrbsFjdrubQhe5tqVQCMGREmHcHZLjvwtdGIfFeX2jnrP3cnZdBNIlWfd47mXuuIOH7Vne
	hEctwKIr1i7fntM2EJUh6HQ+2xvP3QLCmCY/G64VFiHf7DW/ylGCn9Qxl+99i3WaHLQWAu455B4
	dbvkq4wGPkqzwTfDf8EN9TCxLWNb2c=
X-Received: by 2002:a17:907:3e0a:b0:c15:f4bb:e663 with SMTP id a640c23a62f3a-c20871dba75mr1097344966b.10.1786390819229;
        Mon, 10 Aug 2026 12:40:19 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a84sm449928966b.3.2026.08.10.12.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:18 -0700 (PDT)
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
Subject: [PATCH v2 6/7] alpha: invalidate the local context in flush_tlb_mm()
Date: Mon, 10 Aug 2026 21:34:57 +0200
Message-ID: <20260810193902.3286353-7-linmag7@gmail.com>
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
2.53.0

