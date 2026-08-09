Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE8C3B71BE
	for <linux-alpha@vger.kernel.org>; Sun,  9 Aug 2026 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786265739; cv=none; b=RemEXzwUQHPhfmXifUFqV48+/R+JsTgI/ptkz3CjCQCmCGePeiXHAlqO2XBQBOshAeuOHQDfO5aipgAbAfgRerYvPpHYtQs0Cvn4kMbKC4qILOgIpjQugdaOfnjFJXk7Wq1FS46g/XE3l04qW5m2DJaqx8FFyrG5gKyO6fyf2r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786265739; c=relaxed/simple;
	bh=OLtwvEZhh/H9sdbvrxT5KViQxXMRD5pB2TH7wole/jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lUjX/h4wix6ka0NBqRA7LTwAwBwul2A485v82LFC6NNshEI8nU6Mb7BAnytp+Q+pD38RL1qYHAJCLco2dnvuYkYz63mHBB8jYobL7r+OHDXeZDjav3zpE0sd83BP1X1zoEuBDjEPNcMkLCyrY0VlaSp1GXb9N7apRMh8pgQPb6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYNGnY23; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYNGnY23"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a1995ac437so1603490a12.0
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 01:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786265733; x=1786870533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Im1M3BLw7bmxcZcAK4CCU6quas0ztWTFGLp+A3NEnA0=;
        b=RYNGnY23uFdfzFxfyojAQA/YVEkNCVMmi/EYE8uQiLtb8Z5t037CDVRa9wnLEipqeE
         g7+a7P9pJ+mkb45NfxHG0KKRfxXMGNPC+vwvyzterZN8rQxi3BcWpn6xnqpMrOdhL9HW
         0cIe6EGuBPSpQTXVqpk1tpzv3b5dG85ddVPYy0Z7/C/FUTFHYwS6vnufI7lNAty71tOB
         OnYGqaQv6o6JLpzKYNgFt3NKJHKc16rJ3/l8TRw+WwKYBYGEPhTSVdDThgTQmpNk6fND
         Y5ttXWUaIxoS3JRvJvM9llAkch97y/so70qStmQYVVooye7zn/16E5KpdfQKmw6B96Ee
         QjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786265733; x=1786870533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Im1M3BLw7bmxcZcAK4CCU6quas0ztWTFGLp+A3NEnA0=;
        b=R1jqCCTeffLrE0LqBIM7TyOPuzccVCZgWYCNE2zPYFo4f/S4azYSa4UARngjwv/LdG
         +5+hMqK7NRsbh/XQ0Dh/OzBJoZumWuc4jx4U5Q5fKbb8+UuIos+Icmf67bRiTQ8emjBf
         usgzI6MWUgKUW+tE8HFTnEfHTU3v3dBAseB0iC5cYYSpCzuCVe+ub1pkHyr4N9gm+RGB
         uZrb/+IjuoBWV4K7+Y/50/2PiKXQdsYO+GCsLLnsrw92AwxkmfBHP+IUcdylx694T4yg
         GA2k2OTdpsiW8wjK3owtLcDPOUJY+RMSg/L382RqvM7h86wItS1UkxyQGBoTUqUrLyAj
         /sVg==
X-Forwarded-Encrypted: i=1; AHgh+RqLv90mEYahZ+YKhbSv9JX7/bRF8nmNxI9rK+mir4F0LoNxHPInSIzKgohp1FtT+Siz/D5PqZ6tXu4y2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNWDkr67hNoYuqjk0FB/hws9iJghhsJ6X15Sllh+ZehAFRmc/H
	A5fxaJW/fNqq7+Bi2ctcE+oYrX2yYvaCCweR7Zns4YbqnzHbDZ506T1a
X-Gm-Gg: AR+sD13p1nh3nrx4TW3LbEmMyTxLaZgCyrub22KEiRdLVPrJUkc0OygtOZ2Jl8kHVC/
	JEjXnAexLkzs/VNHsrzKQyZeBXofd2/zO4ga9TqgRTahJlVqxudmahJ6iENCLwByGREjh968QHa
	CQj5hULNbWrKth32s9B8qE++gBPCSV/m4jY0e3/Mej3K26KwU9HUkWQYPewd3mgolKY2fFr8frD
	NS9Vujpu/8d9dnksEExKBohwuJxrVKi534AdoIXYGqAKvg6k1q8nk7GUozEXdSfLWpJoApWqUFN
	iiSsiDJjlqQQYybDoZ6BWkeFnhng5oMaRQnWudeJNRXUfSKVKGW+5ptHtyfx/l1bgtkqhxKKCrv
	s43l8bPBSnjC7eJ2zF9ZxzHR/J7RYKPT3LzckTVbQFUcvLEf8QNCqkBDLaMC+gX6s+7Az3PUFc2
	6CjA0V0tIgMto+c+6jk2JfxIqi9cozsv8bAaFdqcQ/iM5l/41du3/2J9Mie8JRYy+f1UELOksrm
	fTWUUdPm2T/Qy/lKPB8plMWmTAtbic=
X-Received: by 2002:a05:6402:44da:b0:69e:14ab:5966 with SMTP id 4fb4d7f45d1cf-6a1f4e32f44mr3820453a12.8.1786265733291;
        Sun, 09 Aug 2026 01:55:33 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1f630a4afsm1606681a12.3.2026.08.09.01.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:55:32 -0700 (PDT)
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
Subject: [PATCH 5/6] alpha: invalidate the local context in flush_tlb_mm()
Date: Sun,  9 Aug 2026 10:49:37 +0200
Message-ID: <20260809085208.3262799-6-linmag7@gmail.com>
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

The SMP flush_tlb_mm() only touches the calling CPU when the mm is its
active_mm:

	if (mm == current->active_mm) {
		flush_tlb_current(mm);
		...
	}

	smp_call_function(ipi_flush_tlb_mm, mm, 1);

If it is not, nothing happens locally at all: smp_call_function() does not
call back into the caller. mm->context[cpu] is left valid, so this CPU
may later reuse the old ASN, and any translations it still holds for MM
stay usable.

Callers reach this regularly - counting the branch gave 2934 such calls
over a fork-heavy workload and 632 while otherwise idle.

Add the missing else. The UP implementation in asm/tlbflush.h already has
exactly this shape:

	if (mm == current->active_mm)
		flush_tlb_current(mm);
	else
		flush_tlb_other(mm);

Unlike flush_tlb_page(), the active_mm test itself is valid here:
flush_tlb_current() calls __load_new_mm_context(), which allocates and
loads a fresh context rather than relying on a targeted tbi() to operate
on whatever ASN happened to be loaded beforehand.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index d167b3ba1303..f501a91001cc 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -649,6 +649,13 @@ flush_tlb_mm(struct mm_struct *mm)
 			preempt_enable();
 			return;
 		}
+	} else {
+		/*
+		 * smp_call_function() below does not call back into this
+		 * CPU, so this is the only chance to retire what it holds
+		 * for MM.  The UP implementation already does this.
+		 */
+		flush_tlb_other(mm);
 	}
 
 	smp_call_function(ipi_flush_tlb_mm, mm, 1);
-- 
2.53.0

