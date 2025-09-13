Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8A813A3ED
	for <linux-alpha@vger.kernel.org>; Sat, 13 Sep 2025 00:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725118; cv=none; b=IxLaOOJC0lZqqRvL/tXkXKAXym6B0cwwtzEhdHC7VZCat0HW+nyHjs7qYvhBIMMDTSmyCFerGP88Rpsxc4D5UIUSHiX7Bb9RS2LorIFne9KOj1YrESbs9UplJ/UNciB8Jsq+mFw7k/NkLZ1iaQOl3UT15pVWtc2/5AlD8dHWJig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725118; c=relaxed/simple;
	bh=riLYrwvey4IG1vm31BCl7axPrjxd4nPuzw1Lf4FnM3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UJ+82RYBssCPtEz2koBg88yJ8yHY80anL5JVLTmo26IAqUimL84v3VmYh24PtIe+Zx1QiczLApv2DX4uXP8oWn6C+HbUW2FtTPzMoY8Oj42ZVMzeYAhwvxFX6fSv6yaOCcQ6oLUxUhiGL1zgZpDOBlmiM4AfAwwVgxnf4d7/XMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKAdVg/A; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKAdVg/A"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6228de280ccso4861914a12.3
        for <linux-alpha@vger.kernel.org>; Fri, 12 Sep 2025 17:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725115; x=1758329915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BXXMTZbWkKZqT8QgJ9Z777RqiFOaP2Wc1It8eJXku8=;
        b=hKAdVg/A1cgqKS6p9i2KuodzZogaEVcz6+R6REIkiNiIbFfMinE02lC9EOoe6YQ662
         QoLR9T6aT3+M7BjTiV7UHhhnL8XkKjyZyIXFiPtCqdXyqRhXZQVCsC5d/pExy5n63UVD
         aP3IcvsxqqlBvJIhGWqLfrRjmqsx4H8gcINoCK2y+hNmwLXGrio/G7e159/gpZcMF69K
         kaZmEu4fumfSdszmb6RAwXH0qFnnNqWRKA9VZMV1du0FKs+yZoo8fyd8Vjq+UH3lzPCr
         jJbdtu7AJXlgY45fa3FMZxSgib30KPPXZPVWOybYPPZXcTs7CcclB57K/d1DO8TrpOBv
         6XDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725115; x=1758329915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BXXMTZbWkKZqT8QgJ9Z777RqiFOaP2Wc1It8eJXku8=;
        b=DOgPob2fonVgx1yh3fW4DbQTlrcNM/VZOpRffKXh7YBh3Uk5q87rCdrcojAXI9BwIJ
         IWgZGHLIPYdjme6bJ2DzyKqlJZlc7pZv4l9WWr1/mbxW0S15GySQSke2GBtZL2Bk+67E
         I7/nlZgBainqXDniRjypZS4gvnsI0+OnpCL88zUbS2w/WDgc8HfdjZX4t4u4GFJrP88Z
         EQDBS/xECji8tgqSg1qHM4RPRSibvZcme1bdM0s2pD2e1D1LlN+K4nI5mIaAq/F30Dow
         ID8kzH3WEET/5FoDaHfIfJZbv9GjBKiOrycd1l2f4CQySvV0jRiV4zcbrPL39kAl9fox
         Nvcg==
X-Forwarded-Encrypted: i=1; AJvYcCUo5turVgbxWY0s6aK423uBAQFB4gjVGVZMjQRtWBs5JNKzv7lcx61fQesybpW/j3gs42qnPU9GVERmnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbj6M5FCmNtSMRLOsXUw6mu/oZjHSpTODB05+7eL8W0PpEu9GK
	gS/kvLLdQmSZwIZmAxabs8+1JiAgXT9GJUdbSm1HY+k+MFGOiazoQpHI
X-Gm-Gg: ASbGncvLbxvXWVpLSdV/dbzJq3n6v2BdYGrYX9KGA9YtCQq09ke5sI9DLmKOfHfXXca
	DX6vh6xjPQkA3MQqeggCAcApOre2shaxlEjCF6aX0GfFZAfmrmdhXH+Qu3w/qyBFckbslSc2Uo+
	V5d1c5+DLPcIt/7tsmetYCaEUWtSRhGtqMTYF3RzOeb1JodQEmmX2hFgmz/QUBD/9sYn/YbgWcx
	lwzY3mTO+Eq2142EWWJ76D+GloKBMLUPXr0wg9JdJMEjs9M823GEsD5rumdE63DxnFfrt1r92Nx
	lPdyW5i82Qv1Sg93V5aNma0HWqldtfPZrvMa9+N39vkpqxdx5T8ESBN4xVT1BCF00y94E3m/fzr
	obmPholzw63yIWf8Yf22QokpXYHa38A==
X-Google-Smtp-Source: AGHT+IF4XezAq8wXNO6voYrJeDnCFhU1tJ+TfyE7OJRqFWOCMlq1YMWoUA8uaJ4xPb3fA3w8qZjP4Q==
X-Received: by 2002:a05:6402:5242:b0:628:a4fb:3b44 with SMTP id 4fb4d7f45d1cf-62ed825998fmr4961876a12.1.1757725114882;
        Fri, 12 Sep 2025 17:58:34 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f3b16sm4143925a12.24.2025.09.12.17.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:58:34 -0700 (PDT)
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
Subject: [PATCH RESEND 17/62] doc: modernize Documentation/filesystems/ramfs-rootfs-initramfs.rst
Date: Sat, 13 Sep 2025 00:37:56 +0000
Message-ID: <20250913003842.41944-18-safinaskar@gmail.com>
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

Update it to reflect initrd removal.

Also I specified that error reports should
go to linux-doc@vger.kernel.org , because
Rob Landley said that he keeps getting
reports about this document and is unable
to fix them

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 .../filesystems/ramfs-rootfs-initramfs.rst    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/filesystems/ramfs-rootfs-initramfs.rst b/Documentation/filesystems/ramfs-rootfs-initramfs.rst
index fa4f81099cb4..38a9cf11f547 100644
--- a/Documentation/filesystems/ramfs-rootfs-initramfs.rst
+++ b/Documentation/filesystems/ramfs-rootfs-initramfs.rst
@@ -8,6 +8,8 @@ October 17, 2005
 
 :Author: Rob Landley <rob@landley.net>
 
+Report errors in this document to <linux-doc@vger.kernel.org>
+
 What is ramfs?
 --------------
 
@@ -101,9 +103,9 @@ archive is extracted into it, the kernel will fall through to the older code
 to locate and mount a root partition, then exec some variant of /sbin/init
 out of that.
 
-All this differs from the old initrd in several ways:
+All this differs from the old initrd (removed in 2025) in several ways:
 
-  - The old initrd was always a separate file, while the initramfs archive is
+  - The old initrd was always a separate file, while the initramfs archive can be
     linked into the linux kernel image.  (The directory ``linux-*/usr`` is
     devoted to generating this archive during the build.)
 
@@ -137,7 +139,7 @@ Populating initramfs:
 
 The 2.6 kernel build process always creates a gzipped cpio format initramfs
 archive and links it into the resulting kernel binary.  By default, this
-archive is empty (consuming 134 bytes on x86).
+archive is nearly empty (consuming 134 bytes on x86).
 
 The config option CONFIG_INITRAMFS_SOURCE (in General Setup in menuconfig,
 and living in usr/Kconfig) can be used to specify a source for the
@@ -222,15 +224,13 @@ use in place of the above config file::
 External initramfs images:
 --------------------------
 
-If the kernel has initrd support enabled, an external cpio.gz archive can also
-be passed into a 2.6 kernel in place of an initrd.  In this case, the kernel
-will autodetect the type (initramfs, not initrd) and extract the external cpio
+If the kernel has CONFIG_BLK_DEV_INITRD enabled, an external cpio.gz archive can also
+be passed into a 2.6 kernel.  In this case, the kernel will extract the external cpio
 archive into rootfs before trying to run /init.
 
-This has the memory efficiency advantages of initramfs (no ramdisk block
-device) but the separate packaging of initrd (which is nice if you have
+This is nice if you have
 non-GPL code you'd like to run from initramfs, without conflating it with
-the GPL licensed Linux kernel binary).
+the GPL licensed Linux kernel binary.
 
 It can also be used to supplement the kernel's built-in initramfs image.  The
 files in the external archive will overwrite any conflicting files in
@@ -278,7 +278,7 @@ User Mode Linux, like so::
   EOF
   gcc -static hello.c -o init
   echo init | cpio -o -H newc | gzip > test.cpio.gz
-  # Testing external initramfs using the initrd loading mechanism.
+  # Testing external initramfs.
   qemu -kernel /boot/vmlinuz -initrd test.cpio.gz /dev/zero
 
 When debugging a normal root filesystem, it's nice to be able to boot with
-- 
2.47.2

