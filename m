Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627B649CF36
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642365; cv=none; b=b1QkQzQMyYvuBw/oGtmBokKvAPch7evasW0+lDVNqQcpW4KS64dmdRhx0maHbRFk51yDKlUk+z/7PTMKKsP+gA6I84hbjq1zYU58xNmx3jI5stglSOXWZ4o2nzBdj0bDnc8dVqKUUzp9xxlzjjX2scBcykI9/iCq8DksS/0ZDrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642365; c=relaxed/simple;
	bh=o4/QakPrunlwH4+UeYVVLEHPsvh/uElL+9OeE2y1nUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XtvY24nWdRr9KZ3ftJykf/F+Mw0bCOq0mZFIhhsd50Mi44J+WmZyZILZ/H9vJkzMH+uXVOTPVKqF6M8vY+kwBt+2W9ogBPnBdgNpnW8/6o4OWpk/eE+sCv4e93fwwV+qGNNQXlbsjVkhz2nLHZtEGC9gsnhx5vMs2zOH4cPx5fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAyEGIyq; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAyEGIyq"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6afe29c08ccso698334a12.1
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 07:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642362; x=1792247162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7L40EAbnIhHyrYuzeYb9zTU0QWMZbUjoIPPndxqWSw=;
        b=IAyEGIyqkCRD/VWxTmVyyNgTyG4zaOuUlexdPM2BSlIWPFFYPNcM7LC/ZSBBqMJqxy
         iK7tt8udx1w+Ql23zpcjcK2VATVESP4flCAFrWg7CZc5rt/TDg6RSnphpZ1NJbYYpIF/
         DrQR9+I6r4ACVDQ52RMoTzXpO3ij8YcqdwRbuP163JCvH8GlesyKXDMffyVVheKtVXnQ
         +r8wmDrMJcvtyUIkSReBX+eoV9SxWfMtVLo+JBUa/3LPbiXXxjMiDjN3p41s+TCDNpi+
         Jxzr5OJqH2uNN++Z5/6Og+zOcj2HOtM/imSrVYneK912lKCP5DIwFGgW1w7q4Wc2p8qI
         BssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642362; x=1792247162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F7L40EAbnIhHyrYuzeYb9zTU0QWMZbUjoIPPndxqWSw=;
        b=M0+e/Y2zWTjxOaIayvJfj3qnHHXQ9sZgMk3m9+FQM7GGFEahxUV73kkWbDcbppb5Ks
         Bsc4idMrbpOfdOluVVqwDZyrKUhst0+eP+msrOLbtva10Z+Afb3iq2ZErNJWI8yHUyZz
         J9DQF9PBQigq3UaAIYRnKQJ52Prj/xADJAdtO8Om7boE6Dy7Hl+8KCR97ee53TWPZOoi
         08S7NArbftzAQXLusHcGnE4pmK9db328IaVmTe7r4WRnN3av9jaUS2ooFyZjV3VkVAov
         vn7rz3sGqB4mRYvy2Vltg7ck8VNh4bMmMehYMS068CsNw5GFU4HMjDUEn75Abg3jS8cT
         fn7Q==
X-Forwarded-Encrypted: i=1; AKwUvBztJuAQVrvHyWpt18qqspFwazOW2ZrEv1qNfqFmH56Zl3ivWAr5wTWcbYi/WaPwdUlBI3zrxvFcxE3KMw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJoKEL7RKmh7+F8AA92iWpfoBHH4sPEfYu87QCGmn1yDEYkbJ1e
	+xZ25bICNYEK0WjuR9QbxTPBSGJljdjNGoB2SkNY0mLjJmytOp6oCvgs
X-Gm-Gg: AYBFou1xhFWoZ6NA5X94lLME9CzLqV8VJw749iVJmukmCvF5/Eb6hVyH4uldtwcJm8I
	Nqi6vT/QNM79EipYkleKp+fIAW1JW8MDdpXnHr/enYXKpZVyiJcpslfAtSQG8yrEVhG7dt1Uaz3
	nGXSUa3R8jwvPSzqqRxw65T59N+LL8LHTtiuReEO+SxGzF6HWSnl9vvn5LePW6b28/djOxxGd4i
	FVSPJBzD2CgYxRd5pg5kFBwrnFIOUuL503KJLwVoKPTAkiyLoSV1ghix/sE674hX4qtOymzjJcA
	CZlKrD0KUPIUidACcIjzFRRcp8w0S8QhRoGAg7BY3krba6RKzqGb+qx6bEPknQxY5s9mHYj5/Tm
	fMybM2esrvX/Zjpr1HBU+huVN8TNQY6Z8z5Y/OguRxbwnTv+TocxUuK7D3IKG+zTTDFwSREFVSs
	cs/uQXzxAnRrDcmN7b6NeflS6PuN52+nTuKQF78u052ozQ5D+e+iO9oXYRtHVT/6c5j0vpw1Pj9
	YKnCBVHwePHVSb9H3BVODs8q22cDNg6/bPu4AI8
X-Received: by 2002:a05:6402:50c8:b0:6a9:946a:d085 with SMTP id 4fb4d7f45d1cf-6b17c2b1ademr4491217a12.19.1791642362505;
        Sat, 10 Oct 2026 07:26:02 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dfff40sm2635586a12.34.2026.10.10.07.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:26:01 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v5 8/8] alpha: invalidate the local context in flush_icache_user_page()
Date: Sat, 10 Oct 2026 16:24:34 +0200
Message-ID: <20261010142533.974797-9-linmag7@gmail.com>
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

flush_icache_user_page() has the same caller-CPU omission that the
previous patch fixed in flush_tlb_mm(): when the target mm is not the
calling CPU's active_mm nothing happens locally, and smp_call_function()
handles only the other CPUs, so this CPU may later reuse the old ASN
together with the translations it still holds.

This matters here in particular because the function exists for
operating on another process's mappings: the comment above it describes
setting breakpoints through ptrace, and access_remote_vm() reaches it
through copy_to_user_page(). The calling CPU is therefore often running
something other than the target mm.

As in flush_tlb_mm(), the uniprocessor implementation in
asm/cacheflush.h already has the missing case.

No imb() is needed, here or in ipi_flush_icache_page(). Alpha's
user-space I-cache flush works by allocating a new ASN rather than by
invalidating the I-cache: the entries stay, but they are tagged with the
old ASN and can no longer match. An imb() is only required when the ASN
space wraps and numbers are reused, and __get_new_mm_context() already
does one in that case.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 988e397b0b8a..e21bc3920bec 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -758,6 +758,9 @@ flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 			preempt_enable();
 			return;
 		}
+	} else {
+		/* smp_call_function() does not call back into this CPU.  */
+		flush_tlb_other(mm);
 	}
 
 	smp_call_function(ipi_flush_icache_page, mm, 1);
-- 
2.43.0

