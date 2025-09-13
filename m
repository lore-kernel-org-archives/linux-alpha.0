Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEF61A9FA8
	for <linux-alpha@vger.kernel.org>; Sat, 13 Sep 2025 01:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757726112; cv=none; b=m79OHTJNZur9aocnS6avzszlLY4MdZSFlwlI/MXYrbch/jiaAr4ou+W/UEOIlT+foT04p4aPEH4X/yBbGIu81UaV71RLmkJ3kF1usnSm4YE/6k6/CrwKvOmOSPH5+/vYGtHqjaE70ycWCaS6uBqtwJ37uQp39KYaDryZ2NSRi7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757726112; c=relaxed/simple;
	bh=YCPpMauct/lx0d7FW5hIc0XQ6n2+DOQok3eBS/uAsZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXDWIoiTfFsmYQVGiBhwoaqCd1guBRYxsr7oGpET4LDTcE3IDkSi6U/hfyM2fkT39H8AOA/ULx1cMqewNniAJNPSUWOvBnGrQMyuogM6spitr7/5S7mOpGvj1fRjByqOgGxR9ppxyZJlXLuYMT0JxoUd63IiK2BsBXnSASkA5+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKbvefFf; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKbvefFf"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b07e3a77b72so31770266b.0
        for <linux-alpha@vger.kernel.org>; Fri, 12 Sep 2025 18:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726106; x=1758330906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGsRGTypi9NqdtciySRZZEpkGgKS+BdOkJag/Ax3VcI=;
        b=VKbvefFf6JBv8ek67wEer0RqEYwiljoVukI7dIf37vTbdwK1pUDhIfMM3hyeTN6/rL
         +1tAIenyQG8OqtZbzMV84BPV5G1aCWIv8OKsTJdJCmdh8ibEuPlEt02Wr6PDdRhds8lK
         36BYIjOUazY9M4I/TbvOKS7ix9db1AJlvb5AIqciXeanKK2+T7Qz06EPR7eVVqWzdFIt
         55yW7b9cBiZDy/PaCCDOvTFq3VdctKrn0CCpd+aBZ3B04KsgueUe5rfniJ084iwg3uUj
         SYQehXknTBTUmNRmTROPG26td7Qj9x6WVquBc1EaiO4Lfi2lj6ZlCNjqKeme/nh0bOah
         Va4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726106; x=1758330906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGsRGTypi9NqdtciySRZZEpkGgKS+BdOkJag/Ax3VcI=;
        b=MNuBbZ0iYzDh70eCv7Qdhg6JfQjZBn0LnEp+/gu4PdynNVoED7+VmINxkbvg9vC/FM
         0UbyijzbfWnf7XGyjr5MNaZnqvGZumsPjZZ34oCB/RM5jzVJC/ir6eIvaBg5BIUgyu3a
         Ns4SP2os9n6t9/ccmae+bVypd/FxNhO1r9Dxkku6nh/Y8blS6NzCZlkn1oUWhepZFSHw
         y2DVmN7U0O10RPPenPP2N0OMCHgKIddd47aN2657PVmSkjAaqVwVib63lSB+YTDDJyQn
         pOwoZxdgWbtblaNl7XnR3hKZClfGPrPnHADdTi1RWyLyw5LH2WyrE6rvOQeEv8TnYavz
         Ifyg==
X-Forwarded-Encrypted: i=1; AJvYcCUw4OmKMjs9F9VBvpWiulYwDyk/g+JU4ILLxiinWvhQJW9IU1Y7hXpawi5/L0ccCNT4sujzcHjhP1vW9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQK+d8WsmOtQqlNDT1Mx/ldQUnTRwU630sCpW9lhBeX7bPrapZ
	2p1ezH+ta2tPBIJRu7EMGv7CDFBb9ZLfmZg42+tMf2835zMNXqhLJeqT
X-Gm-Gg: ASbGnctXU9DcR8wbvi4SckGxj8kD6M4WDC56kk9c8xVh6dqP1tx/cO4J6gW6u+YlV+p
	AM3QBxpRcwspJiMI3aZMU9cwXDJPIFns0hji34KBxpx7dRw6S6JWFA26j2lgoDPG3Hw/wFbVL24
	njq/mC7SzJipdGonVXgyRZiI+ovoIO/pTam2qPr3FcDBLxeSnqTet9DIQewkoO+XhDitsPHxoA4
	xVNrb/VAOW1iwoNLQAL5bb31aZoIIbjNRGcDi9qhCfUJLL7KQa0BLZpxBXA8J09y8/WEbPFTFlt
	gSdx6wuZr9km2FXiVtfUwEu97blNNQ42QfT3faW7zcoQhcdqG7+T5Se+z3CFmbo4/y5RHk3FU5D
	l+clA8mCXwg2IeFUYcm4=
X-Google-Smtp-Source: AGHT+IF9BfFXzJCfAH1j6Whgn4db4w3JHUdrGBSr/SBtjDaVKK8KXKnwXgawQKNvW2//sA4Wp0ETBg==
X-Received: by 2002:a17:906:794f:b0:b07:b19c:1389 with SMTP id a640c23a62f3a-b07c2543931mr499914966b.23.1757726105874;
        Fri, 12 Sep 2025 18:15:05 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b334e4fesm475799966b.106.2025.09.12.18.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:15:05 -0700 (PDT)
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
Subject: [PATCH RESEND 32/62] init: move initramfs_below_start_ok to init/initramfs.c
Date: Sat, 13 Sep 2025 00:38:11 +0000
Message-ID: <20250913003842.41944-33-safinaskar@gmail.com>
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
 init/do_mounts_initrd.c | 2 --
 init/initramfs.c        | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index d8b809ced11b..509f912c0fce 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -12,8 +12,6 @@
 
 #include "do_mounts.h"
 
-int initramfs_below_start_ok;
-
 static int __init early_initrdmem(char *p)
 {
 	phys_addr_t start;
diff --git a/init/initramfs.c b/init/initramfs.c
index a9c5d211665d..90096177a867 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -601,6 +601,7 @@ __setup("initramfs_async=", initramfs_async_setup);
 #include <linux/kexec.h>
 
 unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
+int initramfs_below_start_ok;
 
 phys_addr_t phys_external_initramfs_start __initdata;
 unsigned long phys_external_initramfs_size __initdata;
-- 
2.47.2

