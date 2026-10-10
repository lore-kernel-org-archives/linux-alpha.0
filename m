Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C331C3F8246
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642363; cv=none; b=BtOy0r6vpquJz0wZw9d6L34gZk69bJuQ22L+Yk738xPv04i4Z4kbxAs3Dek6c0tum4LocP9+Eu24X4DvPa+lqnhO53yb4pxalTqk46XRtdNUqHCF8Mp/pPEFzFm4pkAtz9I5C2t/PwMOng/XIjLLPhntjECMiVurw1Ci3aYR8sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642363; c=relaxed/simple;
	bh=mw0uQktkLnEmrtN0ERsFxWHjWYRwLcVyb7ARzOK5ubE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jzAVDvJW4GUGm9ZSBGWJEbx9da9Yt/O7U5x2LKlEGE9NrR+HU0FQ3VPJmg4269LNiobK2yXUcmoYJDwrlJ6Na074uxF+vX0PhS/HixBlxFnxETYRqSpMUhwLbJywAA6ybHXvmdodbqeT6IBlMxBAsRRIYS1pMQPI4tdcU0VzDWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSAWu7TE; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSAWu7TE"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso907436a12.2
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 07:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642360; x=1792247160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b88sjkJ/RqBf+LyWYx8z8VDQ3/sowwhU6O/+Md+JWNs=;
        b=CSAWu7TEoIKwzGgU1AlAAj1YqP1UrzMzHpodzbIzfOmm4quml4b0d4S3gIVbI1X92n
         A6zE93ssYVRqr8ALcTL5yIRnthLHUsweAZ7vuaZKBWei3Id0C1qYZNixW4wKuuWxZjGx
         794DbKVvw4P9r948UX2vYW1nPdx2+t7jDc+orj4PaUMt/RRl2JjgTJKHsNwtA2bSK31K
         j+E0UqT9y20plkNPyjnvTVRWGD6bjHDr//hs/eQqg5I7qiKg1Q+IpqZtBl5avTci6cY9
         v2pV7PN7aTK7rKHhMl8m/w0WScjjCmBp7hBZGLJIRdEMTJEHSDHXn9R9A6Gy0iONhaow
         sX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642360; x=1792247160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b88sjkJ/RqBf+LyWYx8z8VDQ3/sowwhU6O/+Md+JWNs=;
        b=eiCuLI8cBKP7GKnCRm83/tVm7xL6z2oq2BC3gsy9dtqd8W02GLyMjLztK8Ot7LhzBc
         jiUXfjP2ornojbFgwpNwPLYrRHmMzB8QjCh+wDMkRqNJHu787KRwk57PQArB1bpb7xv9
         8LLvqO4IXHX12KY//3CSkc9qNvMtjt1I8beIQjcCTe4JV0L/Jy3omiO0RgYGgfDjb4WN
         bJcPd8xKz4ZQxEe4/v+/NLstD237zN92ddlFSEUZdHp1K2M0L2uSUtgj9QACFDvtAOtq
         sasAi2fqdnPCX9fE3x1RVDacrmw+RiH26D6e9UCrmPsyd+1V6lJKfk8kfWj0/wHHREAf
         G0GA==
X-Forwarded-Encrypted: i=1; AKwUvByHvE7O4j49FDOVSRxIvW2uOBe1ldN1O9uKDVtgDpRI6lMDlGJci1p++eQJaRFvXaotMhRO5o00haqEQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLowNmP5eB7lz0dzMPR4tkuN3OasHnWIWlG0MVl5gaE2H7RF7XB
	GJV4thlrKBetZnB+vUAKIRRGxwKZwrYHI33lZe4H+xHyYJcP/3uY5Er8
X-Gm-Gg: AYBFou3+4wYByEScEL06eKN5QHvWNA3hlTeA+/XFJr7uCIlqC/URs1phjKgYQVLtqP5
	pXver6ITasqTPSlocKYdjCh/Tf6d+3kSo1l/K4DCSY8DV+w5boIRkCRcHf2GsPk2Ehtt6iZrJpB
	YuNVVrkmWb3k1eQlPnltylGSPNbtUpM0af10D8/T6Bi3DGsBUo00OYhm1NK3JlXBaHL5zQ0Bmdl
	klXWhIbydE/TQZSyHk17YxGo1xM86bUExHbxBFlwnYmrqMO179KNlW7LuJVnbe+rliJn/w4/Kcu
	XNtZ9wUyanp48IyLQ/xu9wV7mBtGD2yGq/FcUSsQQZ+voeKU1mzd8YGRHVjSBYbQ97Mq9qyvZ4m
	nITKd0UgHZiOIakC58T/OhS4IVgSl94gS6eGEyD5/9QV9xLnOTlHuWiioZQahfe7BfSd13lNKrB
	jaSdzyEGs+MhlYEawFYokOWjbbJIaD/slYKRDjjMyD8JUN/5lVi9/6XoLKIjPOV2LNt/kpvp3M2
	Td3RA9ODx6PCNetFwvoN6WutBXnniRpHJCbX2pIsW6YQBHJylA=
X-Received: by 2002:a05:6402:11cc:b0:6af:82b2:90a with SMTP id 4fb4d7f45d1cf-6b17c291040mr4765042a12.43.1791642359841;
        Sat, 10 Oct 2026 07:25:59 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dfff40sm2635586a12.34.2026.10.10.07.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:25:58 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v5 7/8] alpha: invalidate the local context in flush_tlb_mm()
Date: Sat, 10 Oct 2026 16:24:33 +0200
Message-ID: <20261010142533.974797-8-linmag7@gmail.com>
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

