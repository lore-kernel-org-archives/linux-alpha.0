Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7492263F32
	for <linux-alpha@vger.kernel.org>; Sun, 14 Sep 2025 03:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822051; cv=none; b=Nass9nL03RmD80O9rg0cll08Gwh8up25J50aQoyItGXMVXNNwkAM1x0L6qcBAfhT7Nsu3YXyyJ3KglMk1s4vI1X9bzB0P+Q9VjSGQ+HQoYNewYckGMwZN34EO6YWJ1H0fFPLwuOB7trbAqQ1TpRcUJmSAtQ5fJaPZRsUzDT9GRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822051; c=relaxed/simple;
	bh=E3G8T/3zLMm3x5kad8USEbJCkxfjt487WTCm3NfxUQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBfB5xSmQ/0u3aUOzrDedM77loqGhjbf70qhGN/V2khuWOa5DIFXBLxnE0G/zPFvMt/h/Df/RRjzfgpc7FJFLnRsVHzYg2BAMXi6ft9V1j5VjR61Pp+HEGFtG+9vpXB0ATkyXLNh2w+7DckCNo+e8yhxx4697XIyOO1mR44gabE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7q9EjnF; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7q9EjnF"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62f261a128cso704840a12.2
        for <linux-alpha@vger.kernel.org>; Sat, 13 Sep 2025 20:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822048; x=1758426848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0YiDU4Bzw7IKNW2/fgCfvKW6iRx1DQ4l7Ssn455PQA=;
        b=m7q9EjnFFJXZKnnJWAuHewuPVuFM6vjLTLUvGfzyzdImBQ++EznbIWQrk7ZI2edCxN
         ABVvHSn4RknXX5w6azOwuYHGkiavtI++cDhw2VB+z9yMG4LKQot3louLK0jFpgqq1FWv
         Q78TRjdvR0Cw/rFvCF6EeApx0C0A+QEIwW3wsoRz53U0346Ms0IAbOFiBo7TQKjy2D0H
         6fAS2QfZ95SJNv8tL8ibrMA8/T7EUfTK9KZRsSZi0NwfZi/1IKHCtEKzDysYdoxQDCFa
         Jvp3JCGDTMjnFlQzVxYRvv7qTI5TjZp2QRR+sCsbevZnJUnSRA7koomaDueq5ksTsrH3
         uUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822048; x=1758426848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0YiDU4Bzw7IKNW2/fgCfvKW6iRx1DQ4l7Ssn455PQA=;
        b=X1XoOL4kC6ZJxA09lnLMnHs7BqsixbjDJ44FAWheT9O4DsgYApbXGeRKIbADiP29m0
         uhOQelxx/nUy3mwrjIlbbXTirjopC/Z5CgFdl6Pkj9V46SI8qBM2iA2j+AcFtzKhyn1t
         4JCipvOA/z5cLpiyDlWBpEDesMt9UDCIzkiAj8GdoRee7T5E+Pg5/jeJaHToaOqrcpUF
         vtsgVrlysmpY+DnZmLoHOoZOhVYig/NsGe6gxXyrkPWMx2ohEMjNHwP4CGRBtXrWKNAG
         oNnZpAhn+4OkvxumU+uuhvNzH7XI/JmhaZkQ2h919aVAMNF+h3+JRUX3cUCSRIKAhTBq
         oT/A==
X-Forwarded-Encrypted: i=1; AJvYcCUSr50z/O6MHjCrr/Fk3VCVHwB7T7EFzCY4ZdTqH+wKPyIqLTlt+8HDmJ7ls4zM4j0wDY6k/U/ah61EAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbzKIqyBVuTIuLmfyYdhH85Zg6X1FFcKFER8rI5aTHzsUbHG0p
	qMlsyYz95X2Osyb+G5hheQ6+2h9JB5qadocMspRvo//21mIXNUHapqVGdWDW9+gN
X-Gm-Gg: ASbGncuH1HtJXCV4juFybL8N8fQZtv3qmbcl45/jdnJY2acBZbl059kdWfn2FamNC5V
	/H6EFEFHeWYnHb8osQSxvcUshEklW5Ifrv+YQDdXIZpOciLVC6sL8ghwd51JW3yzBzDkNtHo5Qo
	U5e6/ERGZQcCStZPOghqYlSpOb+8o+u0NHWeTx0yAb4T4/i2HV0wiy4E+22pEz3sxvyICCLy+D7
	/Mv/QRPRiLZpX+vj0Shrbxlc6P35usdb6VF/spVAZIlATsWXqP46v82Lq9h4RC5C2KDFQX19t3R
	eOVKbT/cwwvlt9ZJQW7BYJ/u8KAWpZhcWTwjVACA6Q1qZrwhvH3Me8VMmTRUZwzUR9qqOdABCqa
	fkV8EKNbewuc4e0X3WdCBxdJbIeDmgA==
X-Google-Smtp-Source: AGHT+IEVLkeZlLSkzoTpPLzlBRvNTQ9m/bl133jXYp2zZldNvB+tlYKH8pXYzZ5ISfOO2+UjGM6RFg==
X-Received: by 2002:a17:907:e8d:b0:b0e:3d88:27fd with SMTP id a640c23a62f3a-b0e3d97e027mr75192266b.8.1757822048020;
        Sat, 13 Sep 2025 20:54:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07da7a8918sm303079766b.56.2025.09.13.20.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:54:07 -0700 (PDT)
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
Subject: [PATCH RESEND 44/62] doc: kernel-parameters: remove [RAM] from reserve_mem=
Date: Sun, 14 Sep 2025 06:54:02 +0300
Message-ID: <20250914035402.3670906-1-safinaskar@gmail.com>
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

This parameter has nothing to do with ramdisk

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a259f2bdba0f..0805d3ebc75a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6277,8 +6277,7 @@
 			them.  If <base> is less than 0x10000, the region
 			is assumed to be I/O ports; otherwise it is memory.
 
-	reserve_mem=	[RAM]
-			Format: nn[KMG]:<align>:<label>
+	reserve_mem=	Format: nn[KMG]:<align>:<label>
 			Reserve physical memory and label it with a name that
 			other subsystems can use to access it. This is typically
 			used for systems that do not wipe the RAM, and this command
-- 
2.47.2

