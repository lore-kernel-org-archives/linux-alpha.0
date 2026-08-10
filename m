Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00799443A9F
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390832; cv=none; b=Sns63niN/DEEWI8bXc5hPuFG6OgTAA7mJ7hQpFEwRSmcAmNI09Lh1YPiPQyespg/bJlE3r063byl+C2NDbG4MGN87dSsV1g4AGWADjpHauLAkPDYdeuxkTeqXL9eWq/T5s/ZUHsG7ZVaMSdOquoiVeQ1/+ecUQ8W6w4Irw4m71c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390832; c=relaxed/simple;
	bh=SPL4waYZ68I07oMi9zqix6oLnOBZXLRhkO7049FeIOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZLb+o3jwbA6VKP+aWb7wTozWOWO2qN7aFqh8V1tUtOa2ossZAOE9TGdbZbPc0dbXfVaDgnECNffg05wyzXRkpDKRxDP0gIeP4UleLynkfduy07mCxyHyvJZ+IxTmne+nAzQHgYQ6a/6egFq6Z7Pph+8FwhdYkIIFVQ5obRynlJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhCqFi6U; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhCqFi6U"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c16794450aeso2980966b.2
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 12:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390817; x=1786995617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPXRarnAO1rxE2tnGzCY8f31rq9Ep14HorPF8zSq0IU=;
        b=OhCqFi6UtJdECMQe/r3cWXui8d7fzyM7NFq1YW3hBuE8bPwf3PA72L47soGZa6xj6p
         7xC/gxrRJAtKZb+5mYJZrPEi9KUVuzc+/YpJM2n1oWlEkw2dzKIEoraygiETm0oi0v/S
         lS6MCWZUNGrHp/3X1Hb4JCi0ZTbzdrNfo0jNTLRhefGbtEJFQpX+6LtL3m9ZTzEpqch7
         buqCzIzbfv4h/1P1Kar/R1LBAKdVdAcnxs+lPKt6748TkGC98o2NnjW5ygnp/BvCXbqU
         vZFccBXWCKmnHTzW6cvFvqJ9tH+b6drCRqIvdgc6wW9LYA5Uj0FgTsNcP9C4TVkUaCg+
         CqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390817; x=1786995617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cPXRarnAO1rxE2tnGzCY8f31rq9Ep14HorPF8zSq0IU=;
        b=IiKbpF/yLFSslfs/5t57yIBMN82R+I5oJudlx90cDCp72pp1abFIm4WxvX1gSu9OSa
         lJyg/syEAgkwQVAqRv60CCwUbmq2o4C62HoBCvS8X/9HO2kcWR7c8KPESjnUHlqQeTk8
         FOZnneRgsnZcyIep/xOqqlEjegkTBTEn5hlvm/lXuu8P/GlnBtnXUu+s+AJw+9cN7gVo
         k8tnKjDp1SOvqRVZz5Vr3olIsaFrumIjXfbpfpPJ590QNyu0SZoqb604Cm+wy/DB7+Qy
         X0tTqqtGoma5QpHvJZ/kP3yxWgAgRYI3TI7NsxSZpDUZOQoMXSaAJTLngDgUQ9UZM8uf
         fAdw==
X-Forwarded-Encrypted: i=1; AHgh+RqQY5SYVSkJtjOJHV199mvx3IxRYmb5f6aOeultYGDGmIcueA/0dUBQgK5+yqt4rKoDOyM2USAdmDwKkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1IBqtERQqG9xQ+KD0pfsS8W3jnuzbqjthX0D6LGr6yjjStspJ
	tMT/lo/aWMRp1ypYKJgsoKzHOfe2dxTx8WKusao+3HRYHbSgyEdFoCSd
X-Gm-Gg: AR+sD13t2H22iPCzrlNYBBo5ZyQcv4qH5gzMkxpdjMBmzsLWCaqzu6Yq+sPYrKZzlfw
	uJ3nNUfircpgCGlkgMXY8culcVHQ59MaCpHyWuuEAPy0ctI1VWeFPoyHfI7RRIWPdPF2JWDB6O1
	nWz7ERokmHn62zzkUxSgoFzFNNc+80zFUeYbu7muuZZM04K8at88XD+ny07LXzXuwTjYxmrdZVJ
	qBOBxjyMB5i5QN8S1Z/oyACOwdmbd11dsi3oEn9EWdrBghALtyMfap3SOfsqscfi59xMj+rETWd
	5wnsYHHRay0Uota4mSt9yLyEZdy1GBt2aV4RJ7t/tGwmD549vcHmiHghoWKqldnDMIvZLR4fr6f
	3w1C43YIUVibRkOZF9agm0ituWOQw/3nsID7YDbqrwex5mHhXndupHjYzjB4C5TNvCjBCH2KW1H
	ZG3iYBmS6ZrgNEOUMIi45H3HGb0zzg9EApABVJkFzkiNoua+YwAvv+XNOAqcWw9dshtd8uNVpX6
	mPbOm/zRvV3lqbPG1Do10iIQMtyI0M=
X-Received: by 2002:a17:907:3f05:b0:c1a:5d49:f99d with SMTP id a640c23a62f3a-c2039c03342mr1839607366b.7.1786390817019;
        Mon, 10 Aug 2026 12:40:17 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a84sm449928966b.3.2026.08.10.12.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:16 -0700 (PDT)
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
Subject: [PATCH v2 4/7] alpha: invalidate the local context in flush_tlb_page()
Date: Mon, 10 Aug 2026 21:34:55 +0200
Message-ID: <20260810193902.3286353-5-linmag7@gmail.com>
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

When the target mm is not current, flush_tlb_page() does nothing locally,
and smp_call_function() reaches only the other CPUs. This CPU may still
hold translations for the mm and can later reuse the old ASN together with
them.

Add the missing else branch. flush_tlb_other() clears mm->context[cpu] so
a fresh ASN is taken at the next switch.  With the previous patch this also
covers a lazily borrowed mm, which no longer takes the targeted path.

The uniprocessor implementations of flush_tlb_mm() and
flush_icache_user_page() in asm/tlbflush.h and asm/cacheflush.h already
contain exactly this branch.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 7856d23b3384..a5a42ae4a7d8 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -698,6 +698,9 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 			preempt_enable();
 			return;
 		}
+	} else {
+		/* smp_call_function() does not call back into this CPU.  */
+		flush_tlb_other(mm);
 	}
 
 	data.vma = vma;
-- 
2.53.0

