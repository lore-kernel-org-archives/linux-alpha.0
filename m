Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BEB3C8722
	for <linux-alpha@vger.kernel.org>; Fri,  3 Apr 2026 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228591; cv=none; b=iMha8izedYSqIyBmV8YETDE5iW8kEcafaKeZwXPeCRM/FuiN8+2H4SwYxrLc6XIsA9RIsTkyy6cFKUbyeNDK03gWaJqYWKVK95ReMUX/leUwZJAPXWYVvbuFMgmzkUoD+Qtbi6Rh1B0SL/1NKMnIX5rPyx+OAEp/6oUnR88rcT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228591; c=relaxed/simple;
	bh=lT7Q9AKU0YksR8P3u0Hl8ckPI2kw2qZTOZZEUhZ9SnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WMfnxjFhB1WpJQJmXhdyhvqGW88u9ZiXZa9q7dVDR8xSArGOv8oShRU+Y6RnzSKwfd9a/Cl5GqCfkVmwDng2w4JYQmbjAy9gOKhuA9pvvBCpvni4Cy2F9KkM9P9oEXvWTo83Mpy4TG+H3SmLkFfD2A2nAe/GBkztnufUGmuOvlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4siv3R/; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4siv3R/"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6501418152cso1973421d50.0
        for <linux-alpha@vger.kernel.org>; Fri, 03 Apr 2026 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228588; x=1775833388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZONuljCFXzlQguSjIaUcivQnI+ZVq0hotudKD5Kl3Wc=;
        b=Y4siv3R/APGbEQD6113VFjnS/CPEZQX81CzK9i87SW6iCXGqSXB1UVWxshiUc2aD1b
         CPhydhLyqE9ozWIaFDy8z4LytR63ZR+e1dFnY2TQTfH5urJ3ofxcg+ap+8sqQT2flUX6
         2y7EN0NjUupjq02JN4QfEMVYz7Mf140U6hp7c9/mi34rBEf9TpI/f6/XvxZ9uweyfATq
         1GYheaEydDtpny93Gmt8n7PqqKfZLJ4FsyuT7rJfq63wvRmaiuqZwP+feKKvfqmCTgRl
         sRtl/d0VH//q3AafTsp199U1w5Dbs3+CS7dtP+GL0cgmMeufA0BevWmksDowAS8xJsw8
         iPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228588; x=1775833388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZONuljCFXzlQguSjIaUcivQnI+ZVq0hotudKD5Kl3Wc=;
        b=H89076p10eAS6sKHImFXnTmvN46nHBbOnHGU3Jw2/Kq5xPptmzQmCvVPfzbKqywqNJ
         +5Oc0i4Ao//9tTGJveFt/u6wId+YAUtiqrruQmhPtE8AROWt1A7IiZCQLTN6b/wEu0lb
         iorcBz7+M2ZyAJVi9NKUbOUQVaucOg5sfWDJqFAWlVUaM3FQcaF6xq2/q3D3aQWVqrE1
         bK+feVUZwuk+sGmuPHfK7xISUJQMMNVw6hPY7qFSFyCQxZvUFPUXHX9OmcEvgN3NKi5J
         7J7t47gNvzNndfZ54YPkgkQI3EoILnZ0Y9nzlOJKoBHWswNA3Xw3bjUfV8IZSSVymY4O
         1dgw==
X-Gm-Message-State: AOJu0YwIdFxOfvYJWzYCJxUCDPRC0hvk/PSaIe/e20iNsZx3+SSYNHTu
	QJBUCnv6JmklVFOM8nHHtSgQX208ZLNjIzEfsd766c1f9J06oFJzyW6o
X-Gm-Gg: AeBDieuiXRx913XW3utlUUKyrM5h5zrkAPAt6DV23TYocOJu6ZWSU8Vts5Yjqa7Jy4C
	4cvwx0eLvHDugVXltV23gdcFDhARhZe4FPWDvB5P0mYHPEVdYVJH6xp4Wsxvbjmpybu3mM05vNk
	e6zPCUuqFxDpIQHVZsPMqkGGkCbie1AOuPYnEZSJVQKYzlB0TOz3lYTJ+cMpI7l5vnX5HmyptoG
	avO20zasc/tWVLfdPlUXp+4cZx0/T3VA4YQQmZAG6DhJXd9Gvc8Gzq6vGBD7jjgjCTRkj9tIKRn
	kHRRKawmXODV2UP5Ir6qSNF2gYL2aQUvgCIi+x/6dwITSjr/bsGV8z1EMTQeVTcdrgSn6XdMnHQ
	afAkOY77T6agil8HSxv4iFoCStrFFgP7vGvNcxZCdhfHAcKUtNpjpJEv+DwQpjxJnAzDVdOQsrt
	rGjaZeIKYywncqAVnwTYE=
X-Received: by 2002:a05:690e:138a:b0:650:2ff9:d656 with SMTP id 956f58d0204a3-6504879b8ddmr2902375d50.29.1775228587764;
        Fri, 03 Apr 2026 08:03:07 -0700 (PDT)
Received: from localhost ([76.195.202.134])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-6503a9b6285sm2472521d50.17.2026.04.03.08.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:03:07 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: Select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
Date: Fri,  3 Apr 2026 11:03:03 -0400
Message-ID: <20260403150304.489061-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha has a clean split between user and kernel address spaces: user
space occupies 0x0000000000000000-0x000003ffffffffff (TASK_SIZE), while
kernel space uses KSEG and vmalloc regions near the top of the 64-bit
address space. These are strictly non-overlapping.

This enables optimizations in BPF and tracing that can skip address
range checks when user and kernel pointers are distinguishable by
address alone.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index d870529fa251..394e49328cb6 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -5,6 +5,7 @@ config ALPHA
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
+	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_MODULE_NEEDS_WEAK_PER_CPU if SMP
-- 
2.52.0

