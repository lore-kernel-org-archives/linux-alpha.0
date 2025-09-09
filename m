Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31BE2472A8
	for <linux-alpha@vger.kernel.org>; Tue,  9 Sep 2025 08:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757405595; cv=none; b=XgRh2+/ibedJNx0aD8kmNLTi6yyg60PSU69e5+OBCeBzOSV/SYgkHt3017jUwcUBr/9CFKBIy8B1ZYsnPBfGkyXT7Ogujvss57vgSj6OZF0kFDWo4tJ5Uzc49OwMnTP28H1vq78hU+vmbxo5c2CE4tOpt0GU5Z8H5Fz7wi01tNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757405595; c=relaxed/simple;
	bh=zqf1+LbTORxR6nLmizBjAcnmRRmXXgKVnMQT++abQHc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=oUtOctx7ATjYh/gEzIGf7tfQ3xLVzoLNBs7xnHmKX8yY+i08L9178Cn6weRPB6QT4mmKpq80rG8J60tR+j2k4Wuu8b2h4kfVq2cKI3YrK4e6iluLD98GMKzFY6n+0OLNFzIZ5dxerYPQzh20mqk12zYlfHmZfu4Tix64S8rYzfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Q2AnvXi+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Q2AnvXi+"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3dae49b1293so2708712f8f.1
        for <linux-alpha@vger.kernel.org>; Tue, 09 Sep 2025 01:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1757405592; x=1758010392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uc+B8kk1sBtw2n6JodNl4cIKG73Gr6sjO1mB12nXlpM=;
        b=Q2AnvXi+A1wnALxLnkG1JfL0ZmbmaHUuJjyI37allATzAmxs73kP5VWSz97gmJN7aQ
         pGBZiba+srDrJRJQZZyc46ssJ693w1o8TPhignO6aYECyZl5uPNtHkjIHSm6DLxQV3XB
         yQbAwFUpgGai88cpxab33WRSnwcFxfEydJzDjKvnzCaDLOtC1EO/6rABonwjBdX0R8Xa
         +U6ibUIgDbsrye4zTF05q3FkxK54E1Qv5woGJvdVzqMr83jQKdENj5arLxN57iEX0UPF
         /2cdafLyLFwI9lC4RAio2QFoU8QPeBK+eqEVNaIspJsjDG4rcsNlNzw/MeEBI5d75dZ5
         J0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757405592; x=1758010392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uc+B8kk1sBtw2n6JodNl4cIKG73Gr6sjO1mB12nXlpM=;
        b=UXJDNWY4wM/N5tpPx8jOeJciCjYIy6TMtwtvIeGAO7eXGgiflnF3tPflJTH/4bqPIg
         peFv+JEA8HHpBv4xT8lu0Qd74CUoXC3fWUy96aP5uNqL5pDcCa/ncal2Hk1odPxD9K5D
         rj4ad5UV0CtFpJ0MXKYh0df0t5e2Hdl8Wu94v+m+wa04MHFi2ZYGsOuksYjgdSaJab6w
         4D5XJa5eJXITd+9d5j2rJQQ/8G+qsptbNJ5830wTectMzHQaSCWLRyBPQkIZbV/+KIml
         URuejGWAsMp2go/plry5TveWLu/ipd8mzHOO/Xi1fDcadQfZSEO2GqzojYBbmgL2GgGc
         fBmA==
X-Forwarded-Encrypted: i=1; AJvYcCUuK7FBViUtj4f6bzbM5F/p4ifhJfjYzUDrP/9x1mhUz2tjGbrDx5O1hyzg6QPIa6BH/RDP5GjnpvD0JA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1DVLG/JKxmK4MOmSTTind9Plx28CEuf6CXBJbqM0QTpo1yjHw
	nQU1sNhwmyzrsw+NuqncjBXvS/CgvKdHoKj9cP745O2+WKhM2l3nvmUaYHQ7H2DSi0c=
X-Gm-Gg: ASbGncsxmxWeAu/1lcFaF95hAH95wg2qNMaz/rtRHiL0onmnJBBq+N0jYyJqlpH2ZkV
	JKZfoUxGJLAha+uwVUjaO7AQU0RF9vcLAJ+p6Y5Dckb5huqwAiWuUxkZ7gd3PcXlVnLqEeDJjAZ
	oPJPhzJ+/qk+qtq0VUZpmFg11f2wfNMYGHVYPGhDMRTC784G4bUazM6SIN+IPei9CNqhNJn2zqc
	BdUCaZ9pYVli/3QGhz7XjBpH8YVWPEOXeTQLjQx8NOqnM6KiBgxK/Z9KqMI31fskEFbrNz1tPMr
	tNz5f+bZaiaoG3sUcPWz+juqLstVljC8vgHxzu7GpyoOAkACtWMf+4j0ectZm0bVRN4I+guUTi0
	a8QL+W5MlVEqkFbuxOzGTETB4E1Jw/u7yqkYB8/OyLUta0oCgvZ1286N2Wnab9rOSlJj0D8pPC6
	XxH/PGE0klIJKZZTiW0vi1Mk8=
X-Google-Smtp-Source: AGHT+IFQY53b9Lt9FJgcVQgAWziqwA6SQuP5nQ0HtXCEHhXITcGNSSmEk4gXwM/tj/M7Ors/YxANkQ==
X-Received: by 2002:a05:6000:2f81:b0:3dc:2136:7523 with SMTP id ffacd0b85a97d-3e629f21c5dmr8819285f8f.0.1757405592148;
        Tue, 09 Sep 2025 01:13:12 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f1b3000023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1b:3000:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de18f4824sm124970235e9.10.2025.09.09.01.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 01:13:11 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] alpha: add missing SPDX headers
Date: Tue,  9 Sep 2025 10:13:02 +0200
Message-ID: <20250909081308.836850-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/alpha/kernel/audit.c     | 1 +
 arch/alpha/kernel/bugs.c      | 1 +
 arch/alpha/kernel/smc37c669.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/audit.c b/arch/alpha/kernel/audit.c
index 3ab04709784a..ec61f20ca61f 100644
--- a/arch/alpha/kernel/audit.c
+++ b/arch/alpha/kernel/audit.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/audit.h>
diff --git a/arch/alpha/kernel/bugs.c b/arch/alpha/kernel/bugs.c
index e8c51089325f..9f61923a9910 100644
--- a/arch/alpha/kernel/bugs.c
+++ b/arch/alpha/kernel/bugs.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 
 #include <asm/hwrpb.h>
 #include <linux/device.h>
diff --git a/arch/alpha/kernel/smc37c669.c b/arch/alpha/kernel/smc37c669.c
index a5a6ed97a6ce..b9a03563b277 100644
--- a/arch/alpha/kernel/smc37c669.c
+++ b/arch/alpha/kernel/smc37c669.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * SMC 37C669 initialization code
  */
-- 
2.47.3

