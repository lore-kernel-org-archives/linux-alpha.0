Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="f5Ldjv9p"
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F6993
	for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 10:03:01 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6B07A40DB2
	for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 18:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1700762579;
	bh=WP2gJh9IkDa2VdWPrUfJ2njFac/+S8Z+9AfzFJLFWoY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=f5Ldjv9pUGqSgaGbA0bva+KuxN5R/wfZYGWZigFaI5BSBiBxH5oMVv05vSdDwbbGs
	 mNaUtc1uuRJCKiYgpDsyQd/OoRMZ1QaIQ8omijKEgphE2HYNWknfB/lb7KqU9YKWUx
	 LTRgA9iDA1Jbs37JEMpXifXhsrJhZiEYRBNrwjGuJd/QdiJtNUPtykA9Brsfp4beyE
	 ewqFqJeEg6KZgHTj+O1O2lIEHv+Tqql/n/5+jrJ4INwwng/+PKAIh7XT7QzENIyD2h
	 bxRq/hdl+oPi26s8TSnyTSRqTG/LdE5RrPo2RFDBrHSHjGOT5n2zlMh8A555wk2zPH
	 5WyGIAsIyw4tw==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40b346a11cdso5968645e9.3
        for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 10:02:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700762579; x=1701367379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WP2gJh9IkDa2VdWPrUfJ2njFac/+S8Z+9AfzFJLFWoY=;
        b=OIaLnt9pgKS8SL5cAzIox6cqESLW0uzZ72l262ipDA5/PTLDgJ0QtXv0gdmWZqhF+W
         oe8ClS8iQyOMaMQ34j3qbNs0aOWVBg5uoZb++xCdkb6Ll8NoxxGBei54Img0Yjrf6dZk
         OuFqtFHHrvJL75kN2IHOigt8tY+1CvkqC5ZWwWIIm7Vz/dSAI3FmyVQRcd+mm4hn5Mcu
         WptzqhDFXDlmvdmFtz/fJ0LtjkHTRbkh2boHfE+OZAuoY+FGTPTMlmufuSGUa0S/Qtl/
         a1vMY4eu8Ai1YzRaqlR7/JtjNG4xlWN3Lm4yux1kd3fzwBOURXrjEVKi91AYLre2zRCj
         mGoA==
X-Gm-Message-State: AOJu0Yze9EQgxFuDgSUE6weNDbDQ1ojUd5NwQN2lz9E20gNY1dLn5pIr
	9/4GyFiaBuxrw2e8iNtK3PYyev5bSykKdVft4t8sDre+8JGxLyJMVLIy8klMoygOKJTYjIChgtJ
	txkEVI9Ecwgw4NBBpCdJlnBMztrzraFuFlDO7KflM
X-Received: by 2002:a5d:69cd:0:b0:332:c548:3ea4 with SMTP id s13-20020a5d69cd000000b00332c5483ea4mr141115wrw.49.1700762578975;
        Thu, 23 Nov 2023 10:02:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOXAShpF/8xaYBusYO0OA7vURr5brTXNPfzFyM6rdfglnmH7BI/RAPLtjwFbymjOjB7sGNUg==
X-Received: by 2002:a5d:69cd:0:b0:332:c548:3ea4 with SMTP id s13-20020a5d69cd000000b00332c5483ea4mr141097wrw.49.1700762578644;
        Thu, 23 Nov 2023 10:02:58 -0800 (PST)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
        by smtp.gmail.com with ESMTPSA id j14-20020adff54e000000b0032db8cccd3asm2302599wrp.114.2023.11.23.10.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:02:58 -0800 (PST)
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
Subject: [PATCH 0/5] remove the last bits of a.out support
Date: Thu, 23 Nov 2023 18:02:40 +0000
Message-Id: <20231123180246.750674-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I was working on how linux-libc-dev headers are shipped in Ubuntu and
stumbled upon seemingly unused and useless linux/a.out.h header. It
seems like it is an accidental leftover at this point.

Dimitri John Ledkov (5):
  alpha: remove a.out support from tools/objstrip
  alpha: stop shipping a.out.h uapi headers
  m68k: stop shipping a.out.h uapi headers
  x86: stop shipping a.out.h uapi headers
  uapi: remove a.out.h uapi header

 arch/alpha/boot/tools/objstrip.c    |  52 +-----
 arch/alpha/include/uapi/asm/a.out.h |  92 ----------
 arch/m68k/include/uapi/asm/a.out.h  |  21 ---
 arch/x86/include/uapi/asm/a.out.h   |  21 ---
 include/uapi/Kbuild                 |   4 -
 include/uapi/linux/a.out.h          | 251 ----------------------------
 6 files changed, 6 insertions(+), 435 deletions(-)
 delete mode 100644 arch/alpha/include/uapi/asm/a.out.h
 delete mode 100644 arch/m68k/include/uapi/asm/a.out.h
 delete mode 100644 arch/x86/include/uapi/asm/a.out.h
 delete mode 100644 include/uapi/linux/a.out.h

-- 
2.34.1

