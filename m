Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25C4264A7F
	for <linux-alpha@vger.kernel.org>; Sun, 14 Sep 2025 03:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822232; cv=none; b=kGE88hhlZrRIIKQAmJsyN08DdNV2wuxufSHO7ZaVsYqzp8nwmDrghlGDwmWth00TmCicahH5FAPgizKPUddLITXYhIx76Ozxp/rQLsqw69Y4hZI0LW6CY99rRtupTgJWrvGH9MbcSlBdgOJK1zpNrGWHpnEZ4Sl+VGrnzoj6sBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822232; c=relaxed/simple;
	bh=6pXJgBOVmgKyryw3LURicaeyD0WS1HvzY8WG0GWatOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bYsftvql4sA5Bv1IdzRCgWAAfiSdb99u+Jkl3dtUDRUU7FVxg6X1LIvz8G/yAItu1FjXLc5wLNcrhwqMt5V1oGCYOsAwV1pq5CRWq2j1DLCXCHGRwMKE5/asG7COMrkG8ctvWO1KqwXzfo1+AVti4A3yrZL2IjKHf9vSdTtp7TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRPnFhfi; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRPnFhfi"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7ae31caso554620266b.3
        for <linux-alpha@vger.kernel.org>; Sat, 13 Sep 2025 20:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822228; x=1758427028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7psSH4JIkuISYR7xy9RNjBVG2GzEUFc3+zgpdmbt9Y=;
        b=kRPnFhfit7+R6UzkS4cF3DKL1S7JHip+IAyQf6T2UGYDd+vYI9IC8v9G51KVb5WDAk
         RN/gPz1lGKSMFe9Oe7MIowDwv3N0e4/KFS91xhYm0G+VoSkSei8WkHktPa2wEMB4pNUj
         WzAE/ebYcnJlcUWXpTXxg7oBxbqGV3WM9sIv1WyWWMlOmd/DBHQ0UO8HJ8wtmu7F5pSQ
         pAM88kkn9raeM/jhalMJUOdMS5VqW/+AUemoRwnUmW0/oDdl4OSBi4zM++ZdXBaXmYLj
         VGYSY1r8rSsi6oTo3enO0OXT4w2WPUK9VtsKTo5k8z5kW918njUd5UMO2sKFBB8AaeWA
         2SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822228; x=1758427028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7psSH4JIkuISYR7xy9RNjBVG2GzEUFc3+zgpdmbt9Y=;
        b=bh22a6xRCIkqix581Y0iTAwf1mYdw2cvnEhgM5AEXkPIl3EswsxvSzI6mo00bupYxD
         hoLPr6FxtfczaAwTOtr1lCqXU++Pp5BzPmZv9+AgjFfQYqexsndKvGMbQi94B3R6LQtj
         lMo5DiLzQeA323IwFhx4qCAQI0qXBgZVw512rRvrFyvdES53aKtO9xQTTrX0sFVCJJpx
         MiwRO9pnCfgYVTWizM/Rf8oWr9iDPGHPjvjI4cJwar18TZzhWFcR2sBOEMS9QRqQzYdI
         CntSqQ3paRNSzYPIn4AS5TtHo5uwXUZHZagxKamqxxrYTYQKGP6kCL9gK8IFkrv7Scfz
         yoaw==
X-Forwarded-Encrypted: i=1; AJvYcCWefQQ9YYoa2+rS4O6LLR2cbkOri60t4vGv0RlSLILO480V/JlPELJ6Gg+RFaP0NCcsaGlS7uY575K4SA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw55ZTtk/HkDKVlxJ6Et3xivlJj2dlcAVgqetEOkf3QNMdhF+Oz
	o7Eqiz415AgqvcSeFfMdnSTYEfhbLsXTIboLYTc5NNpbo14lVEffBS76
X-Gm-Gg: ASbGncuuR9si1+KiD3uwllLST8RLxzIMeE+LBq6Vukujd0hYR/MuimevR3kLpdddLGI
	vN3lUFCpbuBO7Q+YiW4gvynpc70kQvGXYkk6woGj1dEEIMtsgbrwnyg9lGGNoRGMiKxZ7Bar14O
	HS6onN9cxL4cXTMSH3h+lZI6yypDH/Pz8BEsN5qhbtF+2DEFoD4XIwH0/myk7hbzGVGGV8Iy+Q2
	9tOx9C3Lz+MnVh/wuPGzWWawPAifwW3H56+s/Fsni+HX3nQ5iQp2ydgpG3XYegE69wZxf63hCVz
	NsJLXGETHploezeH8FRdjmjbKnikhVre/P7SyDO5LWaQltLhyZRCN77Vwq/OJx7ttLJr9YWAAZN
	6OZIlNI9s2Hbdgl5uMgR0Vly6W5N85Q==
X-Google-Smtp-Source: AGHT+IHHnPU+sOVT053l7deT3P8z3LJVFAOiksWjmZKd0Ub2gBIDgZK1/4gCPHfUrNaBqPQVOEAIKA==
X-Received: by 2002:a17:907:d16:b0:b04:6338:c936 with SMTP id a640c23a62f3a-b07c35b8e53mr876582466b.17.1757822228258;
        Sat, 13 Sep 2025 20:57:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32f1e54sm673986866b.75.2025.09.13.20.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:57:07 -0700 (PDT)
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
Subject: [PATCH RESEND 49/62] init: rename ramdisk_execute_command to initramfs_execute_command
Date: Sun, 14 Sep 2025 06:57:03 +0300
Message-ID: <20250914035703.3729713-1-safinaskar@gmail.com>
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
 init/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/init/main.c b/init/main.c
index 5186233c64fd..cbebd64f523c 100644
--- a/init/main.c
+++ b/init/main.c
@@ -160,7 +160,7 @@ static size_t initargs_offs;
 #endif
 
 static char *execute_command;
-static char *ramdisk_execute_command = "/init";
+static char *initramfs_execute_command = "/init";
 
 /*
  * Used to generate warnings if static_key manipulation functions are used
@@ -609,7 +609,7 @@ static int __init rdinit_setup(char *str)
 {
 	unsigned int i;
 
-	ramdisk_execute_command = str;
+	initramfs_execute_command = str;
 	/* See "auto" comment in init_setup */
 	for (i = 1; i < MAX_INIT_ARGS; i++)
 		argv_init[i] = NULL;
@@ -1491,12 +1491,12 @@ static int __ref kernel_init(void *unused)
 
 	do_sysctl_args();
 
-	if (ramdisk_execute_command) {
-		ret = run_init_process(ramdisk_execute_command);
+	if (initramfs_execute_command) {
+		ret = run_init_process(initramfs_execute_command);
 		if (!ret)
 			return 0;
 		pr_err("Failed to execute %s (error %d)\n",
-		       ramdisk_execute_command, ret);
+		       initramfs_execute_command, ret);
 	}
 
 	/*
@@ -1588,11 +1588,11 @@ static noinline void __init kernel_init_freeable(void)
 	 * the work
 	 */
 	int ramdisk_command_access;
-	ramdisk_command_access = init_eaccess(ramdisk_execute_command);
+	ramdisk_command_access = init_eaccess(initramfs_execute_command);
 	if (ramdisk_command_access != 0) {
 		pr_warn("check access for rdinit=%s failed: %i, ignoring\n",
-			ramdisk_execute_command, ramdisk_command_access);
-		ramdisk_execute_command = NULL;
+			initramfs_execute_command, ramdisk_command_access);
+		initramfs_execute_command = NULL;
 		prepare_namespace();
 	}
 
-- 
2.47.2

