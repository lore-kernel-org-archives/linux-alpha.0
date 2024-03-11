Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA0B4206C
	for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710163409; cv=none; b=O0sxVhQIg7fnLRn4i8g717dwkflDvrYXVwcOwX/Pj62a/7SA9W2pWwP3jjxGuHYh+Xphy9vpyxGi//xROOXFN7tm1sn0BdoFRouQawHBu0bJ9nRw7Xaj+fT8yN1PWusrDz6YfATRJLrbVVAKQzVZL7dR4bjG0olC4y6ZgX/D0Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710163409; c=relaxed/simple;
	bh=xFq2r254un10Vo9LCdFpXbLV/oBD8Dnl4Uq8M82cuaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dxRAMquTF0OV07oUPq7VRuvaAzyG4tuwLzVaY5jQsa7f913TUBbtlDbzD8fsn8vRNtwNhdZ3ACkm18kYh+h1XWT6XcVJFr09y7DrYE+UJTkR2zdYfDuwM2RtphdnBbgI5st3pN4A3CXoDkx+PSkvn3lyJh7EgAi8aDLPRBD18QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=aFtMVzve; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="aFtMVzve"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a462be1b7easo114603566b.1
        for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1710163406; x=1710768206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2c8Be14Vo5XsbELfBJJCoD5NMAbQazGtWYb9r4LXMpE=;
        b=aFtMVzveYSBwQd1SF3wit0yf/llnVYD38WFYe/MfDtp3RYdgBn4FzcW/K6+mst5vHF
         yui3mFJBD83J3QEqY4YpzBTiIMwGb1Vn0WoMn1B41SFf2gDf4R2GiJPRqM0Zy5sp5xC3
         32tc6ZKIbEZcPVQb5TR50cXxCUOtav2PwbIk9wkn9rgDSKplAkqIjlkmaXfZ3xQACJN2
         3w/+93sbE8nYeeSKa94BCeQ4UXH4NTmXnHFAI4Jwiz0x29wmgSHxgWTkSV9XW1lk5unO
         3AqjrW3fle1JIJIwmLxlUd9zlNlDVL/akn3EheLJBmuaSzl2P8LsFtEsGeQHzCtErKkT
         /DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710163406; x=1710768206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2c8Be14Vo5XsbELfBJJCoD5NMAbQazGtWYb9r4LXMpE=;
        b=dcbb/cVZTCJRuvZqPIu3n9fT1bsYuEm0fZjxIX0S8j7Uq5OTL3+1u2YDLuk6KEhXBh
         P4dh/q54RgQLgrxMQf55/jbt91A72LyqIB5J635HtadvbrgfO6KkNo/c0qtjEHg+LLzR
         VGSKKisYYxtGT78TXA6q0yaFRMGEEKsJnvKnk6afLeGPMbdAn3ISR7LSUJsi6sShNULg
         lswXQtODXBVrb7FVXsPbKzo8bJjswwX+hnPEHQQ6r4n6m5lWmrTahsPEjM/JhDNf795F
         bBAXjMwkm0TrLK4nH0+85DlboTAUniMWDlngzrJt/MolNZFZhQpTtlVQY7rniORzqGV3
         J5/w==
X-Forwarded-Encrypted: i=1; AJvYcCUOEfJLfbO90VZDzcj37LdnIPUW2UpxdjNfdZuYZEz9mOmPiUqDY7E/HkqOhY2e78tUQWcLPRwaW/fGA5xDgKEDuoVCdwfmsT5P5YE=
X-Gm-Message-State: AOJu0YxELEnsPECF4QHv5pt48NI/Jg81nW7INSVrDpgVU8DIBvJRPQ4O
	Hx2qDQ0S1BXPRGlNZKSafclCHj0bf1JZYRp7XIcqN92B0/nFHReNMEMXWHjXE8w=
X-Google-Smtp-Source: AGHT+IFiK5DxhHhYV196iGsvV+mZzp0074MZ9wUlVApB+317DFC5cWlRCMV+BM4l5k6aFzdnL402ww==
X-Received: by 2002:a17:907:d30b:b0:a3e:b523:90b with SMTP id vg11-20020a170907d30b00b00a3eb523090bmr4861550ejc.14.1710163406323;
        Mon, 11 Mar 2024 06:23:26 -0700 (PDT)
Received: from raven.blarg.de (p200300dc6f010900023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f01:900:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id i26-20020a170906251a00b00a44cb0bf11bsm2861075ejb.79.2024.03.11.06.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 06:23:25 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: richard.henderson@linaro.org,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 11/11] arch/alpha/smc37c669: add missing includes to fix -Wmissing-prototypes
Date: Mon, 11 Mar 2024 14:23:06 +0100
Message-Id: <20240311132306.3420135-11-max.kellermann@ionos.com>
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

 arch/alpha/kernel/smc37c669.c:2467:13: error: no previous prototype for 'SMC669_Init' [-Werror=missing-prototypes]
  2467 | void __init SMC669_Init ( int index )
       |             ^~~~~~~~~~~

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/alpha/kernel/smc37c669.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/smc37c669.c b/arch/alpha/kernel/smc37c669.c
index ab22ade3dea3..be71ea825690 100644
--- a/arch/alpha/kernel/smc37c669.c
+++ b/arch/alpha/kernel/smc37c669.c
@@ -1,6 +1,9 @@
 /*
  * SMC 37C669 initialization code
  */
+
+#include "proto.h" // for the SMC669_Init() prototype
+
 #include <linux/kernel.h>
 
 #include <linux/mm.h>
-- 
2.39.2

