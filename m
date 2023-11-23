Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Ar41MqkZ"
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD28170A
	for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 10:03:18 -0800 (PST)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3102C420C5
	for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 18:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1700762589;
	bh=Rm0AYGktCFDwiZQ3qlgqUctwWO5n1BUkIpQTDe2RZHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Ar41MqkZdDfnVnP0i1hKvpuuBVR+OvcBpG4lF65J6ExgiQaNOtCFNUyFyHLSxDOXU
	 x6XfiG8eVtmGwwfrnn6hjhWHMuPDUeuPXRoAhgVVpPTn02IGtWEDjz7oyDWtVYKc4x
	 JTXTvd3IZm/fxSNQNH+RyMrlZeh2cCmMcPsIR7bbG+kTgpw+5SMafP8BbVEEvou2le
	 x3EVnmc7b+AVqAwy+NvD6qat5G8DARJL2espUsSOwKQbY+8e6utC97gsxQVIq0WEbQ
	 eqjdd2Lsh/sl8Tx014QfuDiSdZtx6afWJfcrHC44Zkf/6Mb+f/9RGIMsfglI/lqupO
	 3eXi6BHegKOIQ==
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2c5194d4e98so8998231fa.3
        for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 10:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700762585; x=1701367385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rm0AYGktCFDwiZQ3qlgqUctwWO5n1BUkIpQTDe2RZHA=;
        b=uWBWTqM0fmfMstb/xaIf6rR7I2MYu8+CRon3wKQYM52fObggFvO51dg4ve279AwZIC
         lZsKd/SWZEidnSbgLX9mGRriazEHYAuvjk4au5hRIrclYFvmWDHZkLVNGQ4FTiy3qs3H
         7EbtNUDz46dQOucie/lUC231/QIPCr1rTcM6T+JAbY6uMUiq3Csq+B3eY1qbvu9dh0Jx
         XA8EdIy1KUxugWEDjrQf7sSEaFcqF1lzlmMxYAPW/ftDq0kJ0WOG7molwXlXkSXMkm9B
         4teM3rnek9EUtah7Mal1DNypbcT50DezsnvuFwD6n3Ne/ha+NvWLO7yrqSnvgoiV8Dvz
         qBow==
X-Gm-Message-State: AOJu0YzcWJTKlX6K+s2SsYKBszt/4OXmpoo9Lg8s8KcXsFCTTeXqiNjL
	DTUqEASCBttcv6AE5A1/KT6Yj8OIS0UgoHsYvpwDGQylzM7WF/1y77p5AcjjfMHnI9j4XOcQKKk
	ZqCXh5V7X78WbAUNjUS6jz4P+ZJZCnKzhOM8bTazG
X-Received: by 2002:a2e:8ec4:0:b0:2c5:380:2a10 with SMTP id e4-20020a2e8ec4000000b002c503802a10mr75212ljl.25.1700762585151;
        Thu, 23 Nov 2023 10:03:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHesVBUJYAMuhXm2aJM3OcIgDBJBWLRSC2IvYeJ+0Iszdqg6ZuVQphYDAKfGHjKuvTwytv/NQ==
X-Received: by 2002:a2e:8ec4:0:b0:2c5:380:2a10 with SMTP id e4-20020a2e8ec4000000b002c503802a10mr75189ljl.25.1700762584814;
        Thu, 23 Nov 2023 10:03:04 -0800 (PST)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
        by smtp.gmail.com with ESMTPSA id bg9-20020a05600c3c8900b0040836519dd9sm2700868wmb.25.2023.11.23.10.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:03:03 -0800 (PST)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: linux-alpha@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] m68k: stop shipping a.out.h uapi headers
Date: Thu, 23 Nov 2023 18:02:43 +0000
Message-Id: <20231123180246.750674-4-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123180246.750674-1-dimitri.ledkov@canonical.com>
References: <20231123180246.750674-1-dimitri.ledkov@canonical.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop shipping a.out.h uapi headers, unused.

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 arch/m68k/include/uapi/asm/a.out.h | 21 ---------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 arch/m68k/include/uapi/asm/a.out.h

diff --git a/arch/m68k/include/uapi/asm/a.out.h b/arch/m68k/include/uapi/asm/a.out.h
deleted file mode 100644
index 3eb24fd8b8..0000000000
--- a/arch/m68k/include/uapi/asm/a.out.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __M68K_A_OUT_H__
-#define __M68K_A_OUT_H__
-
-struct exec
-{
-  unsigned long a_info;		/* Use macros N_MAGIC, etc for access */
-  unsigned a_text;		/* length of text, in bytes */
-  unsigned a_data;		/* length of data, in bytes */
-  unsigned a_bss;		/* length of uninitialized data area for file, in bytes */
-  unsigned a_syms;		/* length of symbol table data in file, in bytes */
-  unsigned a_entry;		/* start address */
-  unsigned a_trsize;		/* length of relocation info for text, in bytes */
-  unsigned a_drsize;		/* length of relocation info for data, in bytes */
-};
-
-#define N_TRSIZE(a)	((a).a_trsize)
-#define N_DRSIZE(a)	((a).a_drsize)
-#define N_SYMSIZE(a)	((a).a_syms)
-
-#endif /* __M68K_A_OUT_H__ */
-- 
2.34.1

