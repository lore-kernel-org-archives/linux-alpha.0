Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE9543CE5D
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277844; cv=none; b=s2P4PtCPqheanCx6/wEQj6tk6khX5BaB8FV3okuFi+R4SEoBsiH0ZjaS7pmX/nSHHLiGnBHmI4qsJ/buiVpHrACBqPqvGt6qiQKv4uVudYCIuU4KXp6Qao0Mu4wiYnlFrkHPsXGVgftt0LPSET8gJ4cLB3DAOwrSwPG2DjRNzj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277844; c=relaxed/simple;
	bh=WQoSIzYzJgd9aUe8n8CVqwVbxtU867PzHtqdrR/HX00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTm5FaUu56n97oFLPdDNURJxWny0QNoG8InOIU3W/8GBckhTS2JeOvVonNZVwmvAtYoob+TKCpElFNQe4T4w+P0q1wMb+X8+Fvh2N1+TkbHKFYqQiW9bzlZbp3j6C8JwCqVzR5FQu5i3jBV0GrnPwLTd7j8OolWpvriS062NMaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSCJ3ozE; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSCJ3ozE"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8200b55dc47so1087187b3.3
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277842; x=1788882642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ppu/yo9Aq5WWQGCOvmRG8xNokhwlxyNmQ4R6XLyNpC4=;
        b=KSCJ3ozEz9DB0wdQ3+0/h0sLksfNCLZErFQd7d4Pp8JgJUfV19edG8SAbAVitzCT8d
         qcZD1dnspThJ98s0w2orAMtWTk0sUD9v3QsiMdfwul7TqZta8Us4NGHQ3j3J5DVYox3b
         8K1rT0hmS9ST9ZayH+WOC8jTsHhDj0VY5ATa1g6wDOImL+o//NqfM+mBCZuTbDYqZUVE
         NV2utanPxu5kFb2Z4RjVvI227Ehgtsp8RcOzKceupO1Sy0272Zj1vvpc5mJmkypncluq
         S+PTUzXt+wnpr66rhdpmoDlZQv/WfhFYpQwLlNY4fB6wiGnQZ2vSovir2UAHT8GtEFdX
         OyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277842; x=1788882642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ppu/yo9Aq5WWQGCOvmRG8xNokhwlxyNmQ4R6XLyNpC4=;
        b=d82j9Jxm6cXDf0n/UA+tJUz8EsRiGjktv6wGulzSrXmBJIzMoxwRrjq1gSpXEMzEJ1
         /OJLNFVZ/aG9uGS6yxTZH6yvLnirnulZCU0YzuotJSYnWlTj+SZy95dNDeTPxqe299gq
         MonV7jSCI0QVrr7lj51GG0M3T2rUnUkcnshhwiZ4VXlgaAZOAtnSNj57c50DfZEb3Mea
         sWnqYYHvM5MI/ThLJjVt8JqUiVCY3RRhK8kzl/rxz3903BKq+/IuhD9z7XGLsRTtGPPQ
         XFeRKFbdvWwCOCdBHVVITno/+ziS4jXs+TGjkuvWkVBEfvSHGR36A0wKXRPb+A2LFDz1
         UVfw==
X-Gm-Message-State: AFuF++nwBGiJsNiqds82fV2hV1CycizIfbR3swqcQd3rpB0HHV06Uz8W
	AVE+D/G8Z39KxVvFOv6fehvEAKfP8gcmvCjifH7l9kyQlkGmAyfYaOLIOrZBsQ==
X-Gm-Gg: AYBFou0bisGc0Gg2uw6TGtZT8SD1Hj/0Ibx5v5j9ZN1ZKO3NAS9DhI6Zx0H9Vgc8Z38
	sh2Bhnk9djvOl1Rai+Ms8hBN1NHVID0yjJjVN4OTnGg+1xh8xf/YmthwXc72icfFDG/kdQ9l49G
	oAHNZSqWvcImA8IBPHx5Hc8ExBCuq//PZxqFKa75a4k5GjQztvocdoYLUHWMfs2cMLPOM3Az+z0
	u8OfE49SnA9i7BRKHmKxTnJvRPcI8ZDPik8xtzs+WFHYbBmO+IswxXOuKN+EUiLJ/og0SsQKRDC
	JCoV81wPPR4zzhzFLciHWC3YSm8xFoGtIPgOWIP+TkH6nnJlwoRqwj5cN8wzmsogXDiO5STO9pH
	I4dPRDSXYoGGaAnRcPZSBNSqqycb0+waBJRFB2kAKw7bJCylFvqqlkZsHqSkxOnCk9+Bzm73XAy
	VQKJrS567/bFUWUc/BqlEomuDSEq49l/+sNr1tYytsjXv6w4SxGZMItBDwaAQisgIbFjDVVOYMg
	hyZ75cCpKKhjie6TkqYg2pE70nt6PH1d5aZwyVL
X-Received: by 2002:a05:690c:e1d1:20b0:81c:89a2:dbce with SMTP id 00721157ae682-85d69640d56mr1212907b3.3.1788277842373;
        Tue, 01 Sep 2026 08:50:42 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86326649752sm52508337b3.3.2026.09.01.08.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:50:41 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/24] alpha: fix arch_irqs_disabled_flags() to treat any raised IPL as disabled
Date: Tue,  1 Sep 2026 11:50:14 -0400
Message-ID: <50d449ba9c3d1f6b694fafd82f2b3f72db63d202.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch_irqs_disabled_flags() only reported interrupts as disabled at
IPL_MAX, but the kernel is not the only thing that sets the IPL.  PALcode
raises PS.IPL to the level of the interrupt being delivered before
entering the handler, so a handler entered for a device interrupt runs at
IPL_DEV0 or IPL_DEV1, and the timer at IPL_TIMER.  Interrupts at and
below that level are blocked, but arch_irqs_disabled() answered that
interrupts were enabled.

Treat any IPL above IPL_MIN, the level arch_local_irq_enable() restores,
as interrupts disabled.  This matters as soon as lockdep is asked to
track hardirq state, where irqs_disabled() is expected to be true inside
an interrupt handler.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/irqflags.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git ./arch/alpha/include/asm/irqflags.h ./arch/alpha/include/asm/irqflags.h
index f207544f52de..ebbf5801f7a5 100644
--- ./arch/alpha/include/asm/irqflags.h
+++ ./arch/alpha/include/asm/irqflags.h
@@ -57,7 +57,7 @@ static inline void arch_local_irq_restore(unsigned long flags)
 
 static inline bool arch_irqs_disabled_flags(unsigned long flags)
 {
-	return (flags & 7) == IPL_MAX;
+	return (flags & 7) > IPL_MIN;
 }
 
 static inline bool arch_irqs_disabled(void)
-- 
2.54.0

