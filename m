Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC58267B01
	for <linux-alpha@vger.kernel.org>; Sun, 14 Sep 2025 03:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757821910; cv=none; b=rV39/v+t5W+C8EWWepbGJ+g9iVTVIxxwsCm0MzQJzuTrb/K8sFXiaiF1qGY6RyL3HMuKSaldSwdZG0ew6XnDTCFOj3uKv46qL3Em+aJeVKGvqkfOT1xQbp0wOtI7Fb4/TZf03Wfuqdbps+F2s7Dxbu0C3JpISsClUGymB9ziaq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757821910; c=relaxed/simple;
	bh=E44LF/8lHGTYomA5WWH/VDahlaDv99Wi8d81CdQz9ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ENmyYgeS/eBmXiU8OniBgKymQvUy9uwyur32y8n2CMpe3KVTLrSJduvOT84W2CZntnfQEOCqnHMIUbrFyoxcqxVqzMnXweZ5dBK0i62GvAhX0ybO1IUui/en4RuUiqNwU5DU+T4h/VtB6wAa27sRWClCovSWFukX4TIPCsZjsfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvPFXZJ3; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvPFXZJ3"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso697955a12.0
        for <linux-alpha@vger.kernel.org>; Sat, 13 Sep 2025 20:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821905; x=1758426705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXT46s/O30O5D6iGHqIIZ8OQqeCOoCO9YfqStJzQ+0w=;
        b=BvPFXZJ31jpsL4MeINgm/PhbCj3+Kor/W2sgiEY+e/xeD0jyjmm3NGEe5ipXjFcwfh
         Tly0jR3Ua+cBpmJXCPZ5AskPNQojr/9CDSvRxdNSq8A1rMJzg27q7vMcYsI1s89GCuBM
         5aDRsLN3C9uYggpc9DJ6TiVdxRok7lXsfXcjo+6f4kkeZ8oAy7QTNvz5rYfLZtGhmFH7
         17VwQaeOaEdgDebYfTTyBacPnnL3DepEX2BpHD6j+6bw5kLDdtGsDExJ1bVgaiVC4Qqq
         stg1f48eoFfsLbQrwSYzC8oskYz/ny4gvFb4DcYAtuF8xeDcnKxO0ZWwzcbAqudVtNDU
         Dsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821905; x=1758426705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXT46s/O30O5D6iGHqIIZ8OQqeCOoCO9YfqStJzQ+0w=;
        b=DexNvXnTTXULpyriCa8spjCDFsxpbDElMFAjvt1NwfAHBszWL5emr6mvY7UDSVVWyH
         aJI1QKlFFqFO5XO47GJ6K2jwHfc7511o5nGfJq4sjZXzW7SBQvjD/1EqzpneUxZAJAaW
         3d68T+NSaiHLKr40yVhCcs0omUc9difI+LqbIP1nJfnrpJ0wB9u6me1hl8/Ru0m/v8Ee
         QeD2ygpntYhTLBsihsbr60hlpxfsxeCWhfU5r3mfxnlIcyofKajS9E8nq7fiQIuXQzro
         RK8F3IHqkegFYWPjKJI6LdJUbBlmIaURnmGo3LhPxpOy6ye+DTgdu343jm9Ek9qkF6Xp
         foxg==
X-Forwarded-Encrypted: i=1; AJvYcCUxcDyXuHH1rCnU78/y53YRHM+rv7tk2/Stn5UsuKXJiwp/NC43gjH1TBjWNIm5nG4xahkMb/mK9O2PqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXFHBiQNpHQRFrTPzi9Q2Dzt5L3HFQSX6OzGEO/Am4ysczyiPi
	zt/gGMK7Gt7ONNxIrcQ9u/p20J07j9U6D8H+0aS3KD5Lb08cebWEJzUa
X-Gm-Gg: ASbGncuMgsX7m6VraVXGNCdcY7gZRlpdnoXZcQ8X1T0L6PPtdH4NQajXgpd+mrU+75z
	fIHY2BVI7u7r6CAGZZc1n0iXcKX2LqZHiGpoINdUjZKEFHcD9XR49WG34acSg+FzkHyKiGFqM8D
	QhKcFDnfP3LXkDXlD8imJ5ayU3CiW4f9Q71RBDs3kOisavntmRUrnRxKfdYqR+8JO4qbOQSxs+Y
	u1BtdRLcD9WHpcB986MvP7LZ31V/4TYuaiBscvmHOOBhcUDR5ubCd+yxsWHa8PAaQX+6hK+RkPy
	DaJEk/Is1bCygbz0hx8U+Yt103tjVExEKCG6TZ06B5L4kvZmgj/kUrmWdY0OqdMBEQpfQnq8blo
	Kz5gVdBrOkf3LlrcQTm4=
X-Google-Smtp-Source: AGHT+IEAFUpwy9YyLhSCGMZ/kQuTAA3iwfbEpQd1MDgVvquhbXlSq99pqpi7zF/bJ0OEdeyJIf4Tkg==
X-Received: by 2002:a17:907:3f07:b0:b04:7ad5:b567 with SMTP id a640c23a62f3a-b07c35be704mr853139866b.16.1757821904788;
        Sat, 13 Sep 2025 20:51:44 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32f35cdsm661712966b.92.2025.09.13.20.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:51:43 -0700 (PDT)
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
Subject: [PATCH RESEND 40/62] init: rename free_initrd_mem to free_initramfs_mem
Date: Sun, 14 Sep 2025 06:51:38 +0300
Message-ID: <20250914035138.3631173-1-safinaskar@gmail.com>
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
 arch/arm/mm/init.c     |  2 +-
 arch/x86/mm/init.c     |  2 +-
 include/linux/initrd.h |  2 +-
 init/initramfs.c       | 10 +++++-----
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 4faeec51c522..290e9f9874c9 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -437,7 +437,7 @@ void free_initmem(void)
 }
 
 #ifdef CONFIG_BLK_DEV_INITRD
-void free_initrd_mem(unsigned long start, unsigned long end)
+void free_initramfs_mem(unsigned long start, unsigned long end)
 {
 	if (start == virt_external_initramfs_start)
 		start = round_down(start, PAGE_SIZE);
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index bb57e93b4caf..c7ca996fb430 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -981,7 +981,7 @@ void __ref free_initmem(void)
 }
 
 #ifdef CONFIG_BLK_DEV_INITRD
-void __init free_initrd_mem(unsigned long start, unsigned long end)
+void __init free_initramfs_mem(unsigned long start, unsigned long end)
 {
 	/*
 	 * end could be not aligned, and We can not align that,
diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 55239701c4e0..b2a0128c3438 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -7,7 +7,7 @@
 extern int initramfs_below_start_ok;
 
 extern unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
-extern void free_initrd_mem(unsigned long, unsigned long);
+extern void free_initramfs_mem(unsigned long, unsigned long);
 
 #ifdef CONFIG_BLK_DEV_INITRD
 extern void __init reserve_initrd_mem(void);
diff --git a/init/initramfs.c b/init/initramfs.c
index 8ed352721a79..7a050e54ff1a 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -642,7 +642,7 @@ void __init reserve_initrd_mem(void)
 	if (!phys_external_initramfs_size)
 		return;
 	/*
-	 * Round the memory region to page boundaries as per free_initrd_mem()
+	 * Round the memory region to page boundaries as per free_initramfs_mem()
 	 * This allows us to detect whether the pages overlapping the initrd
 	 * are in use, but more importantly, reserves the entire set of pages
 	 * as we don't want these pages allocated for other purposes.
@@ -676,7 +676,7 @@ void __init reserve_initrd_mem(void)
 	virt_external_initramfs_end = 0;
 }
 
-void __weak __init free_initrd_mem(unsigned long start, unsigned long end)
+void __weak __init free_initramfs_mem(unsigned long start, unsigned long end)
 {
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
 	unsigned long aligned_start = ALIGN_DOWN(start, PAGE_SIZE);
@@ -707,9 +707,9 @@ static bool __init kexec_free_initrd(void)
 	 */
 	memset((void *)virt_external_initramfs_start, 0, virt_external_initramfs_end - virt_external_initramfs_start);
 	if (virt_external_initramfs_start < crashk_start)
-		free_initrd_mem(virt_external_initramfs_start, crashk_start);
+		free_initramfs_mem(virt_external_initramfs_start, crashk_start);
 	if (virt_external_initramfs_end > crashk_end)
-		free_initrd_mem(crashk_end, virt_external_initramfs_end);
+		free_initramfs_mem(crashk_end, virt_external_initramfs_end);
 	return true;
 }
 #else
@@ -744,7 +744,7 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 	 * free only memory that is not part of crashkernel region.
 	 */
 	if (!do_retain_initrd && virt_external_initramfs_start && !kexec_free_initrd()) {
-		free_initrd_mem(virt_external_initramfs_start, virt_external_initramfs_end);
+		free_initramfs_mem(virt_external_initramfs_start, virt_external_initramfs_end);
 	} else if (do_retain_initrd && virt_external_initramfs_start) {
 		bin_attr_initrd.size = virt_external_initramfs_end - virt_external_initramfs_start;
 		bin_attr_initrd.private = (void *)virt_external_initramfs_start;
-- 
2.47.2

