Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6DC3D986
	for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 13:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710163402; cv=none; b=j40Q+UVoMBOl9Xk4qepZOBKAU3Qp6Ku9nyHDuWAksejprMU25OTb2ST2U6qw6SPwkBrV5bP0IIHpRNbs/O4T2H+UmZ06hDH2fXiI0VNyZ8276Lb/pzbDtVcCXvJGb0JYSBQTaS8WwYZ+lPuZcl+qWX32VO+EtrZURINh27b72AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710163402; c=relaxed/simple;
	bh=vHiUpEvuO96B4Rc+ogaAyicJ9hfsK28eqgBuOaXlhQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KNuj085vwBoeuNJ2pUYtE5agcwS/DLc2GJVwkNA6LyeeLi6BQLZ8n4J00oYwAtTpULqZIjfDd3ffQU5u5+SvNhVZ9ZUutB3h/3Eqwsy6HHyD+gFiSWeg6/tCZcWwqt+wZX1VRZuHM2Z97fLoEDQw5UGDRohl6DIO55+y7bfbayI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=WHdulmhF; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="WHdulmhF"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-563d56ee65cso3738800a12.2
        for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1710163399; x=1710768199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQG8UtqxKlv15zUD+AgvjHi/8YNO+wmuxzq+WcnhXlA=;
        b=WHdulmhF6dcjJ7WgpLK3xMtFJIS8O4/OmuWCzTqPhO0reR4vW1J9axh3gi4zHw5Y5p
         E0HrYRdzzuzOCnpVJnppmFCEyQZZH+zFtMz9qFg9WAkwHsf2i2A9OPR7NBhOH9yIHgcx
         PfmFSY6P/RB6jNaWBIS8UvO57BTdk3yA0Rszl/DdP1+DEL7VmTcUQfk/wFBHiO76IxFm
         5VbECxSXahQhuD/4VtLAHwJ5AgAz5rnu7+1Fy/sxqlcdcyT6hdkNzvxC2srAD2XaJGFW
         s6bw2kYGuQHTsVISu5ZR57dirf2daynJmq5uoH4pGrASg0EjCe9MRw+Tv9SZMq3spXko
         i/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710163399; x=1710768199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQG8UtqxKlv15zUD+AgvjHi/8YNO+wmuxzq+WcnhXlA=;
        b=PMWDZiC9jsMYj4znyH7PBD2Y/ae0kLqcm/qEvhdw9X4APBxHujuLPY9ZUAy7YMCrO2
         ufCT+AbQo5Hv98Fsa3+0DQS2L7zNymcP5+mDTUI6zFGayG+5b4/wDR3sqbiLrX+KweJn
         3P1VUDb4XjUYd6/zAWZI7oChjMkxbAUAuyp628g0afp8l8494wkqwXNtJz4qYMumZTaU
         bHsFCsRNllpUdQxymfHlzSHvCmZyuWybC4ZMCtx/ArXjvb6FlmXIzLbSN9Q9gaj+dUb2
         FrE8odXarPOkgx901aZRM3xc0MhnhwuLt6nW2Ex5ZUIMYP04JP5b8q0z8NVT4XdbyHnh
         fWyA==
X-Forwarded-Encrypted: i=1; AJvYcCV8SQGPVcrkWwRK+WrlWRLnovNNpWgfkrbe7DrmStUtzk97HxKi5IXCk/a1SiAuDxR05e+rlhnNbn4tGmzasZ1STKiVLO+ldAMp/VI=
X-Gm-Message-State: AOJu0YxI9BhhDZDH15PDp32/Z/Li4zERU+yq6bFDn1kTnw9/7y4saR3+
	1cO7+Ypsa6KNDpwDIRPypzLOBTw/ih8G7Vq7ugGYqNPNer9erOEO/3VAIl0BE3o=
X-Google-Smtp-Source: AGHT+IHb2fhNwTheUYDdvSqYIzh/k2n+eFQ27Xf8cLMI4Tkne666B4zE+owcBNxAMlvlWXe9zCBlxw==
X-Received: by 2002:a17:906:4ed3:b0:a46:36a8:67bf with SMTP id i19-20020a1709064ed300b00a4636a867bfmr798941ejv.33.1710163398832;
        Mon, 11 Mar 2024 06:23:18 -0700 (PDT)
Received: from raven.blarg.de (p200300dc6f010900023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f01:900:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id i26-20020a170906251a00b00a44cb0bf11bsm2861075ejb.79.2024.03.11.06.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 06:23:18 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: richard.henderson@linaro.org,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 04/11] arch/alpha/io: add missing includes to fix -Wmissing-prototypes
Date: Mon, 11 Mar 2024 14:22:59 +0100
Message-Id: <20240311132306.3420135-4-max.kellermann@ionos.com>
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

 arch/alpha/kernel/io.c:654:1: error: no previous prototype for 'scr_memcpyw' [-Werror=missing-prototypes]
   654 | scr_memcpyw(u16 *d, const u16 *s, unsigned int count)
       | ^~~~~~~~~~~

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/alpha/kernel/io.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
index eda09778268f..fc5f7b80c7ea 100644
--- a/arch/alpha/kernel/io.c
+++ b/arch/alpha/kernel/io.c
@@ -8,6 +8,7 @@
 #include <linux/string.h>
 #include <linux/module.h>
 #include <asm/io.h>
+#include <asm/vga.h> // for the scr_memcpyw() prototype
 
 /* Out-of-line versions of the i/o routines that redirect into the 
    platform-specific version.  Note that "platform-specific" may mean
-- 
2.39.2

