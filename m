Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBA93FB97
	for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 13:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710163404; cv=none; b=r+lP95cv7/WdSWgbidhKCKDr07GCFk2EFJoAOZANlE4nWvmhafakmWE8tmUPq1Y2Y0v1fOougaVn5uYW4ULrTO+02a2jNFZfFKtqW5elzUuvzvdbkJN5WJYKTQhV1wlY6CkBVTkvde7HPGkYiq2KFiOLg1lrcjIah1VV2UPohi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710163404; c=relaxed/simple;
	bh=gF/49PRWqKIOjN0QBPMpilOg6At99mrH6ur7Cuwr5iI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E8WEHtFB11ePkWmfaWOcUhhwk7MFtbuy9sNJ3dXoR50gesjOBTdY9G83+qq3WgPLLgDZOTcXHgTThwrxU33Tb/VzClmOQJgiIPHij6LopGQ8r+s9qiZbMNXqUj7QqSBvdfEXTuVRh/RVeKEBGIKSXHfphbdflL+PFvd6jQMIm94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Tg/qee/E; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Tg/qee/E"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56845954ffeso2132389a12.2
        for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1710163401; x=1710768201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2W2hX8GUo9AmFrcWY4mRmRpD/vlwywol2TBSthqDcw=;
        b=Tg/qee/E5yy1veoiTimuimDecWz8DvUGC8e/O89HHWcDOpALSApD3T7OcEe3/cZUW7
         GJHr5KXJKQZKN883XYQENdLpxPxqCGXFFNxqIFS9XRjq+IFwux+cwwbGwsDEUoNXTDvw
         LEHP31j0Sze0wCJi2rstGunFrQk4NzbuIbJoxO4dzx1/T3bEX1CeJE7q6FZxujT1TfpW
         fYTqnEdGLDje4Y0VtCznxCiazfiYW1Ucr/bJt8GSAyVd51gsdZi/XvnduGEnJ7VCZcJ3
         Jv0fH7EmulWWn4dBY2k753pglYnUsMROvw8E/0dW12G1cqATUK7u42HxZ39/5pFRgHmy
         5uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710163401; x=1710768201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2W2hX8GUo9AmFrcWY4mRmRpD/vlwywol2TBSthqDcw=;
        b=h9QKxDF7wgxq6yoY8i0arDnxr6Y+kT67W4IEE63mVMuM+UrA860ZpWBvup1dtIety8
         fPTjMGyuvVHlFE+n8Q/eR79X9rWuWKUyDDSSWYusfffnID7fFs6RJEuRcCQDxftcQbUm
         fhM1+jmHCwXyOewGonXzW29lxgzWXo6GT2zJkHEPuHVcibnuealmC0APzZ4Zcq0QzAGX
         bLSswG8q+EwtA2o7hTsLTdj0QJPhlPArk8duRqAiW2a6s+w0xSKTc47P3KzyW2222OJ3
         Bn74e5jyg7Oe4mgY4NRpKSvoVYuI+Smzllek3++A1TAbtz7jSlt1O348boRU56ONhpP6
         OKWA==
X-Forwarded-Encrypted: i=1; AJvYcCUxq1cd5apQj7JxEJEROn0D+niJ40uGNHIWrX1Zp3+cuRWzmLyTZvdRZAG6VugwmOKNAd28XlZXiOY86y2EpIFtgaCY+qRm7dj5xyA=
X-Gm-Message-State: AOJu0YxvvJk70L5Aj4pwgGR/6eRdHvKU5zy0KrAFvPD+LjZhEYZGFSut
	JYeS6OZrViR1Ogy3yATup9mHOY1DkhCoCvOliyDw+vXCaNQVFGvqdHXXqlH0pbo=
X-Google-Smtp-Source: AGHT+IHtNPRHx+nhe/W1rI9HjfcbHrjBo2RFzoD+F/seDSm9TKBHirWLtcCrIYZTfrXNi5foWV2pwQ==
X-Received: by 2002:a17:906:1843:b0:a44:71d1:dd9f with SMTP id w3-20020a170906184300b00a4471d1dd9fmr2987117eje.70.1710163401240;
        Mon, 11 Mar 2024 06:23:21 -0700 (PDT)
Received: from raven.blarg.de (p200300dc6f010900023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f01:900:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id i26-20020a170906251a00b00a44cb0bf11bsm2861075ejb.79.2024.03.11.06.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 06:23:20 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: richard.henderson@linaro.org,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 06/11] arch/alpha/irq: include irq_impl.h to fix -Wmissing-prototypes
Date: Mon, 11 Mar 2024 14:23:01 +0100
Message-Id: <20240311132306.3420135-6-max.kellermann@ionos.com>
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

Fixes:

 arch/alpha/kernel/irq.c:96:1: error: no previous prototype for 'handle_irq' [-Werror=missing-prototypes]
    96 | handle_irq(int irq)
       | ^~~~~~~~~~
 [...]

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/alpha/kernel/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
index 15f2effd6baf..51c1c87ad8c4 100644
--- a/arch/alpha/kernel/irq.c
+++ b/arch/alpha/kernel/irq.c
@@ -11,6 +11,7 @@
  * should be easier.
  */
 
+#include "irq_impl.h"
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/errno.h>
-- 
2.39.2

