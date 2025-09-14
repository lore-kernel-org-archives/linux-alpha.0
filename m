Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5077326CE2D
	for <linux-alpha@vger.kernel.org>; Sun, 14 Sep 2025 03:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822162; cv=none; b=DiPP3s72E0ibGgjouSKhC+q3cS+RKMz5w6AoPX5q50St9o86hsLg54C8S5sQRaEutlN90I8HB1k0EAO/nXdaoCAeOq2VWMTQNJXFGN/GTxn0zJWv3luiv9Gf6lPca8JV2uwCK6QuXIoYyO5xKoINaLjuhg/sa18ABWTGXrCrfuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822162; c=relaxed/simple;
	bh=n+mmy3PjKTU6Jj1te3ZtONq7xS36QH+38sfXYxmW5ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0KU9CWJjV7OW/2+DPmvNujOjEr55oW7IJRQj/6nLOSkMhOOH0ysFxa2PE15MYmhOT7zCSQc2ln9nAEJet+lU0xBwjKB7rhSMjWd/B3QQSmdI0t7tR41Vra2C2INQcG5lXeWd7hpQgOQq5t1xVKpbxN1WT4GgDh/cmo3cIBcR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vnx7+S6v; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vnx7+S6v"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-62f1987d44fso903895a12.0
        for <linux-alpha@vger.kernel.org>; Sat, 13 Sep 2025 20:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822157; x=1758426957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=;
        b=Vnx7+S6vR5uXvbxbQI6Y2nSi9+hEKUhrI+HwiAIdN707y/+/0p2YE+/GeqFmuX1GRJ
         UmfbavpAMsUNv/JYJb/rHEKQIImz68EFaYQS6v90t97us53l6aJTcciPwYDeAptqB5uE
         KIVroc2zNs2ycQRgXSexOBVTJGNWyP0I7PBdHbRfFW+/H6OrVTg6b6+9tLmEf7kiELSY
         Wh0ffdJCq58eBl69bD7bPJX2rKH96f8FrWO8iO46le5j7Do/KceVIc7/U+x0Jpi9Um1d
         9aLhofIKfXtovdWaTt6eDwUVr+rWqj0/U7p18dRBUBcBFfwoO+WWnrDPTNnaIkPi+hV9
         p0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822157; x=1758426957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=;
        b=F7TJtbPrgJW3JWGtMUY5cpxFmc54vzd4B+YVGDcGncPAS2U+pHyrcDHTQ/1GxWnNXB
         iTgv7o8SiuZPNqwHeE0Qqn4u99r+aTyiSUknoHofcboar36AMTg9FpqQOtcv1KWOBxOt
         0fHy5eQ0UC9GFkIHeSK5ihgUcExvgXM3VJe63pucTD6NtFGPnDDICwvIBA6vtaGTG2q9
         IOa33zj0Jty1XzgvnLl/ex7VuKxhEALkNcS6UttCqS9pZbKNOQnb6kRGJ0MBPm8dX9Of
         NvytW8XXUCH5Rpq/4TapJzdN46x4saC66TTXLAP+oAZxpwDcUKOcDe2bwIXw/3mMGDqY
         ByMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV69XkzhwoYtAG6F/qJx77k0M8T6AyuIPfTFzd+IheoTTm0WahHBc4xsU/gXr2uwUqFNlRHk59x4cF7LA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9RlSYNs7LJy6mnyd7SW9KSzJVEvTbI18R//9gJqY8Uido7XrX
	0IrVdPn0W8YOWZzeXjQxTm8mu1PERNMjjP3l3wwC8Iov6JcjU0SZtrR0
X-Gm-Gg: ASbGncvKA4/0MlMN6XVR32Wv5V1KM/qeX6BeZO9wqugHsPe/Cq5nNWyvcvd3efqHK/L
	30eWdxJY6p+l/jO2HS7mr/USceCw3EK6v+xAytbnht0KN47bEV/blc/SoQBxW7fsyfZ5RKeB1rv
	2RIYl0WsdnyricQNczviSC5IBCtNCjFM2Vc4Iw04N8dMc/w6DzT7abod330STlaRsjZaVCNaD6b
	4Cq3iol9pQlZ0UIrgKD5kXEMKZTmPUJ6mscFFAVioiC+7f4n8MnJpKc1dCOa2Mo283JC6Pw3Qqt
	EemwDxtRHE4bVc++updm2GiyZN7+BF355G77ETn0d4VHBBuKPDCmwGwV/XDvPufz7h+iMNpxfiJ
	qxqhTABExuRH0Qwd3MplHm/G8P1l33g==
X-Google-Smtp-Source: AGHT+IHVlqrM3WGO2PMhAdJqFymXZDFmcHUFnmRqsIL52zZcyiB7/sntw8UcjJnO5qIuj3xo01B0kw==
X-Received: by 2002:a05:6402:278f:b0:62f:26f8:fea0 with SMTP id 4fb4d7f45d1cf-62f26f91103mr1500285a12.33.1757822156480;
        Sat, 13 Sep 2025 20:55:56 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62f2b2a8c38sm677327a12.31.2025.09.13.20.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:55:55 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 47/62] init: fix typo: virtul => virtual
Date: Sun, 14 Sep 2025 06:55:50 +0300
Message-ID: <20250914035550.3706342-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/initramfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 8b648b09247a..cf19b7c0c358 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -636,7 +636,7 @@ void __init reserve_initramfs_mem(void)
 	phys_addr_t start;
 	unsigned long size;
 
-	/* Ignore the virtul address computed during device tree parsing */
+	/* Ignore the virtual address computed during device tree parsing */
 	virt_external_initramfs_start = virt_external_initramfs_end = 0;
 
 	if (!phys_external_initramfs_size)
-- 
2.47.2

