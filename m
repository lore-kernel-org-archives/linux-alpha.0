Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7876826A1CC
	for <linux-alpha@vger.kernel.org>; Sun, 14 Sep 2025 03:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822267; cv=none; b=ZmmPHV+nU2I8oTqi76GHde/YUxeoFcBbSsTZcUum8YVDsOa8/geZjjeTKxi8kPhPGqKhIT0Mqnf173ILyXhuLwcvGtzejsMy0w3HvxB79PDqoTqehgFHSsnJQlztKS3XVLxZ8BnWXX2DC/EGlSP4nFaBb8s4V4OIOP9V/ipL/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822267; c=relaxed/simple;
	bh=oKU/He6fgnkGxFwiXzfMSQvpywViA2YaDdh3D2HgJ0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tsmLprnt+taFIF9WMQMWntErLfyS5dhHm7qLtLsoCy1vaMTjbh8tryXdLLfVvPant+jwe53qlv1Xoo1vnIAswPRa7ZR4NH98kNCsPmKlKnthlmlaVAyLQ+vJ6ByT4ehFdHbBWZx/xo40uccRz4omk8RRSHEWvgGcwDzJz/qWRsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0pjvupp; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0pjvupp"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62f1987d547so802990a12.2
        for <linux-alpha@vger.kernel.org>; Sat, 13 Sep 2025 20:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822264; x=1758427064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=Z0pjvupp9oiKINjNbyeuSobzmzNc3O235l4XZaJq6+xnV8xiQNvmcPRhTjA0wy8g9j
         1e/VnNr8qqUxIu704AIAXUk3hdIHvQA2i+7JMtdyUSLBNWCch2mJfUrX3kek54B00jIX
         cpkdx+SF3alQFdxuMwBpZmAMcBz1Fkvbhqc+rqW0oPJBw3vuPYmCSOvsKe8xp+b9RN/V
         gAdtsX4NIFWKTmhvWP3oEqv1ZMtJ8kBfRF67kPO2/akOjOYC2dMCZGY8BqZAd+ytSz+V
         h3rnckiFQSpaBVNrFt5iWUY1JpIoQK/ePVg8RRD6OraLlYp4RCO48NNQFUqRkIYcPgQk
         HyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822264; x=1758427064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=VpcDdR+3xoYdAf9Q/EFcKtu4AovBefcNE6nr0pq+SII/+USzgLoCNj54SS4GVjP/wr
         RLhIHD4nDeLnT97eu6fVkDaRvbhFZFkrSW/YnUGdx9qW3nbstFZuIuL+pwuPyDBOhQ6m
         13KiE9meWkf9CJrJcB06rGiv0Z0bfadE9QZptD9la8WffUaPxTaCwvPyOJsnIkZwvZYc
         Din9fZk80YMG4kJ5TAFXwmm9+4ElD3EtSVmsSGG0Xv46ibnaXybrvVTa5gOZS+f/3vD9
         ezMr7YZd1lCPWx8L4AonXh958R6WVrjfIe8Vj4Ho41NC3X/S5pemgqW+DMRtUy5QZRtT
         R+pA==
X-Forwarded-Encrypted: i=1; AJvYcCUwKgahrb5+3FVL2VrDUYckQXNZDRX/DiAe9ZaA5Lez+vJ+HDj9KhzB9rAknhXFUDiHYr3p0MUooIPDsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCoZhp8OVsszX8dkhu2fs272CcMaXsEzaKXIkbm0GzLya8G3cj
	NLyZpAKy+dg8jrD5glKytAEEt31bQQ5MTbtuzHtwYk3kKsJeF2uJR/mE
X-Gm-Gg: ASbGncuIfBTPnvXZOA036QtoxEieJNXnFNLuZlSD8X9ugdYPVWk5sXbzKY1791pLQKe
	ZUsQuT6Rq3BwJ3tDMZRYB6HrbtbnheLlETw7lxio4R+XvWydlfoFE+ehuShDXLNPmOzowqm66ZI
	JY2pWgofCBoRVb5tKt/BwrHS6SGmBCj9f99WTQkOtN4hH5J4EnLT3Lpn9FLgjDnDSNinYf47ZsO
	fIr9y1T3OpptnR2LCA9Sj83faSuOjshewyIiwBjf5mGAopiTD1dMpn5xzXr4RXjspxOapfG7OE7
	pa4DDke9UC3YqKYeWIh1OSGh1gA/bfHZj0kE7Xbjqy/ygYIC+0D+vrnoSdsp5Jo6a5ZHlLxP2IW
	VxW4BJJVzqmA2Q1JXkRDF+FUTLeLB4g==
X-Google-Smtp-Source: AGHT+IGOdPvfXOVddm8G6LJhfH2nNJDoTTLKR/3NE7kowNRoQPIuzhxmV+feQvXrrMYzfjsz5Ubcxg==
X-Received: by 2002:a17:906:a84d:b0:b07:cf04:8a43 with SMTP id a640c23a62f3a-b07cf049441mr520202566b.41.1757822263792;
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b31287cesm676665366b.30.2025.09.13.20.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
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
Subject: [PATCH RESEND 50/62] init: rename ramdisk_command_access to initramfs_command_access
Date: Sun, 14 Sep 2025 06:57:38 +0300
Message-ID: <20250914035738.3741007-1-safinaskar@gmail.com>
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

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index cbebd64f523c..a42f1f0fce84 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1587,11 +1587,11 @@ static noinline void __init kernel_init_freeable(void)
 	 * check if there is an early userspace init.  If yes, let it do all
 	 * the work
 	 */
-	int ramdisk_command_access;
-	ramdisk_command_access = init_eaccess(initramfs_execute_command);
-	if (ramdisk_command_access != 0) {
+	int initramfs_command_access;
+	initramfs_command_access = init_eaccess(initramfs_execute_command);
+	if (initramfs_command_access != 0) {
 		pr_warn("check access for rdinit=%s failed: %i, ignoring\n",
-			initramfs_execute_command, ramdisk_command_access);
+			initramfs_execute_command, initramfs_command_access);
 		initramfs_execute_command = NULL;
 		prepare_namespace();
 	}
-- 
2.47.2

