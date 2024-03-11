Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186C23FE4F
	for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710163405; cv=none; b=PouL8h3cS6d4paD/Hpzwc0YJZGnOmkQDgGZ1irK220GQkTGAd80d2iFEeloHkwGPL0TEvfqL0h3T7Qj4CTipirmH6/7AU6NyxOa5t+Y+TDnpFIvKHx62cbWxRNCWKZ0lYprenMQ7K4BiHAmK5ZjUMNY8BEc+7PDbSidP24sXpUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710163405; c=relaxed/simple;
	bh=++b1Hp5v+ZafpN1rfbdsbIrHdB/oRUlmtmRPZn2q9HY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=stfCwxWQwNxUfHTqR71C8TDvHWDIcAS1Yb1DBc/gCEssF9OOmDUWzcwxYgGsze2EMxgX/uny8EGXvLWWQ7lSCdpgD+JG9gm3AuiX0IZFItIqxF8f81HZf4Zpu8x4k9TPYxHab9lUhUmna+nrj8zKU/pn9kcpPTaKq7YVqxq+vZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Tu8oNqV/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Tu8oNqV/"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a461c50deccso152196266b.0
        for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 06:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1710163402; x=1710768202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8wg/GCSWc11sCWJQlZhQbjR19f7OlqscDESiBNq4wo=;
        b=Tu8oNqV/ybdiPlRHmHDhD35eAetpGlxNgwqcHvxTHoTtO7JQZvyO9uzFjnQRziWTGz
         ru4EY8NvqCvbpDLBbrlLhkpADqzIkalBwXDjdJqEOSHzQj98s4AFle30rj4dFHlyIM9H
         R2oqmgxGWuksrJ+1Nrg5xlfALGaBWuuLcqfl5VpWqlTRZaapZl4kJ3wQcLbYSHBKcZHy
         EYJpF1ogpfXjMY3euv9mi+I1DRTexHeTtk0rabFb13H7XzkQPkonCPGGa5FuEsN2vZhC
         IxxVRIvpCAEvQMzR2hcobcx/a9gSJmuBqhIywdx2tZkCbGkjs8luaCTebEljgdE996Bn
         5UAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710163402; x=1710768202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8wg/GCSWc11sCWJQlZhQbjR19f7OlqscDESiBNq4wo=;
        b=PLrxrgWRzO/+c3hjcILoAZFiMZGzV9AfDTSGa0B/kXD/hsiBiNFBqwTuYXdvASA2+w
         9M9K0E5mfn8geY8TkPhUmnGyzQ3YA1lBIVSSvYDbtG1T1YhjUMUBb1eFCd19Yfyzapri
         +96bDuo8TJuHGKcOgecOH/kDexLW/lbcU2i/juJ5h0RyN8nKgK53Js5ydhErarihpeU1
         2wkhMq5lZA7rlqcWvjzYTVRHp1wVpyFnulEqJYxd/iCMjHoq9EDvA59xJ4CexrxyVVjy
         zqGsYiXy9yr92dT498QUNfzLTXImmyibrhoNZHVSDnDSsZbM8BbVYEEHQWEFYwJ78N7v
         MwaA==
X-Forwarded-Encrypted: i=1; AJvYcCUVM63wsesPg/xO7Xn2sE6SRQt73sQdTgMH5n1ez/eQEu+gJ1VnekteKGJep8uXDQ9sjPCBDaTKEjguhf7Ba85UCDje1hZOptwcAJk=
X-Gm-Message-State: AOJu0YwW1lWe928rZloTBmtlhMKzT1agmoL0AV+YQdQnukyydJNc5a5J
	+c3ZnYpv4Q/z5bcEVl4prjporwfpWMfurIz3yXuJCS/wERvuuhC2LFl5r3v+nxqMSveDUKhH2cD
	2
X-Google-Smtp-Source: AGHT+IHyyDKtPVD7kpbPYbrkf2QrQKWybWVF1u8QgQ3Zj1Sx8LN5Ovc3IzbKUJy5idcT5X+BdrFVKw==
X-Received: by 2002:a17:906:f80d:b0:a44:2218:4817 with SMTP id kh13-20020a170906f80d00b00a4422184817mr3932195ejb.39.1710163402683;
        Mon, 11 Mar 2024 06:23:22 -0700 (PDT)
Received: from raven.blarg.de (p200300dc6f010900023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f01:900:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id i26-20020a170906251a00b00a44cb0bf11bsm2861075ejb.79.2024.03.11.06.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 06:23:21 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: richard.henderson@linaro.org,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 07/11] arch/alpha/perf_event: make init_hw_perf_events() static
Date: Mon, 11 Mar 2024 14:23:02 +0100
Message-Id: <20240311132306.3420135-7-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311132306.3420135-1-max.kellermann@ionos.com>
References: <20240311132306.3420135-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function is only used within this source file.  Fixes
`-Wmissing-prototypes`:

 arch/alpha/kernel/perf_event.c:873:12: error: no previous prototype for 'init_hw_perf_events' [-Werror=missing-prototypes]
   873 | int __init init_hw_perf_events(void)
       |            ^~~~~~~~~~~~~~~~~~~

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/alpha/kernel/perf_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index ccdb508c1516..1f0eb4f25c0f 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -870,7 +870,7 @@ static void alpha_perf_event_irq_handler(unsigned long la_ptr,
 /*
  * Init call to initialise performance events at kernel startup.
  */
-int __init init_hw_perf_events(void)
+static int __init init_hw_perf_events(void)
 {
 	pr_info("Performance events: ");
 
-- 
2.39.2

