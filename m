Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C7F3D1A98
	for <linux-alpha@vger.kernel.org>; Fri,  9 Oct 2026 21:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579916; cv=none; b=RofIHKkNQBHboQ3dMPUPWjO68G9LnLQ60Af6ittoxCa+t7v6sLNTudD+xBIg1bjKUy6ai7etQV1fWRxgr54DO5OYSTw4FW2QlLX09XiXqSoVb44avig5jQNkW6SXT2FR31y6pydn2OyDbBxZjf7wkSLF5hT8oCr1bN05jzz1C9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579916; c=relaxed/simple;
	bh=+Nu025yH/RvvFjIsxob/PaiiM4yn9tn386mu+W7ZgwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQ/YZeyWZdb+POuIHiqIVbZjSeydIQ+8pV1/qMWLl2TUTnsmaLWLE11mMBAkUiTbKbOt5toHj4m4zdvbNOncqkvbOxjUEAmowASL25mlvSNFc2hYpMkOaf0xJ3UBZBtR8cvf0z8eW/TtgwGD3ffnlaJvf0QdWjES8I4GLXpZ3ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dk6HjfM9; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dk6HjfM9"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso27380366b.3
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 14:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791579908; x=1792184708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/XlIPI97fbGdQAADLsaTAsOTEojxnbbvXQ30uj6lYg=;
        b=dk6HjfM9+LgAu1Z+5GzZH55S3NB7h0qsM17iUVgFToT2OdFU6DYA/t8fhbs8w5p/c5
         NTsxMB7Uz0IivH52PegUhYJEUZ9XGklPv8hVOAEPepFHnGH8FKOLjx0Jkdr0F8xeKehJ
         1RlWpu+tFw4EktFqvmQHacLpDGdDSagKLEz5520BUGvXSsUOJ6sRVbfftoK6mqWNfmZQ
         THPhFoHryfsbyF7FuX7ZJhm8RoZygvXnkwiRZt3GLtCzRI8/+E/ZqyzIYQjOhWYsYQq+
         3wt5NUaWWv7laNSxc3cVoQfl9C0+8+vhYBnX607ezGneB6HyOsOAY/+SG5Zide8ql4V7
         mrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579908; x=1792184708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g/XlIPI97fbGdQAADLsaTAsOTEojxnbbvXQ30uj6lYg=;
        b=1Am6gxYzLqPY6FcBpjS/9vHbAdW+2X/UFhw/5p8il9xU2tgsMbn7eVlGnx5mS0ZJb2
         sgoeUGil5etwbVfD2F2+bxnKjcEotT1PeSEkrgYb3IM6ZErcr0NGwd49QnF106TAH10p
         /LOICghF2QVd3QDT5PnsZGhDOR6xoqWSWAvI1UU9wVn0kPkfBreuFIQgsxWVvordkN3I
         O/128YRz2EY0dnTnX8PT5rgOFe/8i4f+45+KJaWabtjN3anIjsb4Qvza/yGI6u0/vrOm
         G232ppuXUiiMVjMJ0+P5UlgAj/zi6MmUKnWEGCFf1LaqiNvFrRZtucxPrbL6GPscyI1m
         XJbw==
X-Forwarded-Encrypted: i=1; AKwUvBzchIwfwQYniyMQ9Re2rB6+mW+Pw53xUS0UhwbttBqvEkYIYWnGMs/M6ZCzQhKbVYw0TsU/6+dpDEHwzg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI4DNsGb4fiBXXBuxVeJb5PIV42l6YwP1P6SPFUip5grEC6Yj8W
	7i68VNKj6txlPpjQnLYEMM0r80tBaGGdvEF7UDkvaMLYXqNwAlj8woX+
X-Gm-Gg: AYBFou2jIXUswlRdb4jozQeyCM0WJfx5wgCnXXh6uIuRgeTIeZMUeT1g0vZydyyvgLN
	I+MEguKiet1BmAeXEKttmhZD7XgdrCkGA43mkMQHBDqRlsL+uDMXAFfKDmXLvsk5Nun81aXpGXt
	vygTZD5A/PhJsD1+kURT/fghAkNJ79QYCIAI3L2u0npomI1QoZFDP21SdHcZ2o9HmtZ2LpMspmx
	BHRJ9o8+sQouvqv5dD9rrKYShN9SLRpDJtdtI1+dr/HqWK6PMLPFBAQnQwsjpxwr6XpL4l5z7Ku
	IBZpKQmTU7t21T6ELoS/2heQ5owQSmA6CAQSK/rKsbUUOxE3rv6VLwXlY5j8DCfZWWf6xREC7Ui
	rk8VgGdbp5g5ze7l4yn7HQ63g8LTcyVxFn7Z2xis/lmIuGQY0OHJmNwsxhqHfVTHZf9NyW3s0lK
	N4Zdb0bqtf5C8jmePZSqzOiHvNlFSEQeKOrpoxEYtMpSXqvhJhriEmbTZxZA4+gLZzLm90JXWW6
	00DTotzC5FawkviHM2JBhoDrpJfXD+lelDSu/mx
X-Received: by 2002:a17:907:c1c:b0:c2e:1f89:df5 with SMTP id a640c23a62f3a-c31aa05b441mr323689466b.29.1791579907647;
        Fri, 09 Oct 2026 14:05:07 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm142141266b.8.2026.10.09.14.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:05:07 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 6/8] alpha: fix the local TLB invalidate in the UP flush_tlb_page()
Date: Fri,  9 Oct 2026 23:03:51 +0200
Message-ID: <20261009210449.971057-7-linmag7@gmail.com>
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

The uniprocessor flush_tlb_page() in asm/tlbflush.h has the same wrong
test as the SMP one: a targeted tbi() is only guaranteed to invalidate
the intended translations when the target mm's context is loaded, but
the gate is current->active_mm, which a lazily borrowed mm also
satisfies.

Test current->mm instead. The else branch it falls to already exists
here, so unlike the SMP side this is the whole fix.
arch/alpha/kernel/smp.c is not built with CONFIG_SMP=n, so this is how
the same defect reaches a uniprocessor, where the flusher kworker
necessarily shares the only CPU with the writer.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Message-ID: <20260923074903.862898-6-linmag7@gmail.com>
---
 arch/alpha/include/asm/tlbflush.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/tlbflush.h b/arch/alpha/include/asm/tlbflush.h
index 0c8529997f54..9ae1902faf8e 100644
--- a/arch/alpha/include/asm/tlbflush.h
+++ b/arch/alpha/include/asm/tlbflush.h
@@ -87,7 +87,8 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
 	struct mm_struct *mm = vma->vm_mm;
 
-	if (mm == current->active_mm)
+	/* A targeted tbi() needs a thread of MM to be current.  */
+	if (mm == current->mm)
 		flush_tlb_current_page(mm, vma, addr);
 	else
 		flush_tlb_other(mm);
-- 
2.43.0

