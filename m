Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92D43C493
	for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 13:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710163399; cv=none; b=NXMCfnEpG6Uj+h4c5PL1Vck+m5Tok9oRExplZYnjcbhays705lF1c2f4BAYcmDbTo2VGx+yjfVqxVhbFKTdhJJCrUb61u5q0AI0/Zm661eqLdLQJp73FwWh81vSplrzPQnUlBrNaVZ+P0nMzJ1FnksBQeLRKJi/WMyaR0cTLqkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710163399; c=relaxed/simple;
	bh=PTD1CopqlnZviBAic0/7ZJqfoPfNtwgJroeYOHsXEMY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O2bfaPneiKB4Yca6UMjhS0n4+Yh0wCWCZuR8XQDlW8JUgqxRwggFnQhbtWTQsnWWnPqq6uZxUDgSTI87RgM9+tuzehjQjINnVTITSXYnGAC2+hYfB78R7DqPbsrs1PdSuutp3LKRGjD1h7ZuWHUgWk6vjJ0iKxsPbdWW8F6HBF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=ZFS4775M; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="ZFS4775M"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso328079866b.2
        for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1710163395; x=1710768195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KEEU8d4kT+XLrMMmHnzIiNApm7etXr5Wz+2RZaqCNjk=;
        b=ZFS4775MbNRxHXxIFe3qrqtmyiTeybM/4CelZ0Dpv4OjJbPda+YyURCgjJpOEixPMF
         8YST3qrk1s9F0bWgRCl4PfQxql5RFvmbry8+CqklUUXcYVA7tSgxom/6KZ+aslDQVyKR
         kMIUPCPPUvnVaY8x20AJQ5v7FMCymkeNbcMHfJrfFiWPoS4E4oikYm+jV+QDXxKex375
         6x0M+UK9DV587rPxXfx6BqMe3bVRMPbdG+gl0yD7zrxT1hERp2lkwTRu4P/vseE+TpMa
         Oe5y4roZYgS3ol6NszJP23Td4vNjNz+0oGpkHvEX8iQCcQiw4dKPQs0ZSaknv5JbmUti
         jMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710163395; x=1710768195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEEU8d4kT+XLrMMmHnzIiNApm7etXr5Wz+2RZaqCNjk=;
        b=XNYCHaFTZNHKovMxLi1CAWZA2qF/vgjtGA8WRo1mE1qAbxkc300sUFtdMguezjZ9bZ
         rU/BYu2WksFuS5M/EyJf5piFEJ0T+52m9Hi/jHu67bws0sgR6pT7hJHhWQj7tk8rj1TC
         zu3ki0eQWJ73BK8tNSEw/UqVNuVpnxtdTXho9E5spRMynB7nQ0AEz7aToE3NhGa9Fc1s
         jKvGkjFJDFEFqyCKu0HlU1ENsARHI7iYc36s/UzytUqRaxgOCwVbldf0XA9DNXRAqFNT
         aOZY+orUpt43u53ksrNRH7vL7jVpIfrjXcFUvafxrY9iAAEMmi0TqK3gtlboNQ0iXcx3
         sshw==
X-Forwarded-Encrypted: i=1; AJvYcCXlrSeIbT6kY5YVgmRhkXsy6fukNmdLwwrXhBdqyccIkInKBNOdyqgegxA2sAJ/HSIrrtZJG4WIR5tXLe2RcCS0AHWeh/Qiq9+SDtk=
X-Gm-Message-State: AOJu0YyQg7172crP1aPzrBFVEqGY2NgoxHUeKcnsYSCziOD3Tb1e0Etj
	eeXWMNO/D8nlB6xcDlGXpyh56BuesMe/EINK+epjcR7gxnxmom4SXcHAees+Iv0=
X-Google-Smtp-Source: AGHT+IGNIPpebUwjJmdF3p6f9v0ildrTBwGcMIRwjX45s9shZCIz3PvWXBPrLBh2zT6Eea0sDh6atg==
X-Received: by 2002:a17:906:5794:b0:a46:39cd:5e9e with SMTP id k20-20020a170906579400b00a4639cd5e9emr57011ejq.18.1710163395275;
        Mon, 11 Mar 2024 06:23:15 -0700 (PDT)
Received: from raven.blarg.de (p200300dc6f010900023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f01:900:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id i26-20020a170906251a00b00a44cb0bf11bsm2861075ejb.79.2024.03.11.06.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 06:23:15 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: richard.henderson@linaro.org,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 01/11] arch/alpha/kernel: disable -Wmissing-prototypes for asmlinkage functions
Date: Mon, 11 Mar 2024 14:22:56 +0100
Message-Id: <20240311132306.3420135-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no prototypes for functions which are only called by
assembly code.  Tell the compiler to disable those warnings in the
relevant sources, just like arch/parisc/kernel/Makefile does.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/alpha/kernel/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index fb4efec7cbc7..5ba1400f3e4c 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -7,6 +7,14 @@ extra-y		:= vmlinux.lds
 asflags-y	:= $(KBUILD_CFLAGS)
 ccflags-y	:= -Wno-sign-compare
 
+# no prototype warnings for functions which are only called by
+# assembly code
+CFLAGS_REMOVE_irq_alpha.o = -Wmissing-prototypes -Wmissing-declarations
+CFLAGS_REMOVE_ptrace.o = -Wmissing-prototypes -Wmissing-declarations
+CFLAGS_REMOVE_signal.o = -Wmissing-prototypes -Wmissing-declarations
+CFLAGS_REMOVE_smp.o = -Wmissing-prototypes -Wmissing-declarations
+CFLAGS_REMOVE_traps.o = -Wmissing-prototypes -Wmissing-declarations
+
 obj-y    := head.o entry.o traps.o process.o osf_sys.o irq.o \
 	    irq_alpha.o signal.o setup.o ptrace.o time.o \
 	    systbls.o err_common.o io.o bugs.o termios.o
-- 
2.39.2

