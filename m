Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B9743CE5D
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277861; cv=none; b=HbgioLRKoSh2RAMJAhy56TWdDzaInN1t+9aJMqBtxFk9J2KlKW40XWVkOrf1uM8BsoztldsbYSXJPGCoQy3iIWbx/iTXm2YdELgZJJLVA5gTj+qIWWv9vuSewoq44MMs4o9RjMatXZkgeP5PiiEK9ZgnzSyJ6UvO8Js0/jA5f/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277861; c=relaxed/simple;
	bh=3lOQEUDybbd+0QiixzpLYFm6hRd9mjudXB8HqiCXs2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCIl2boo9oP/wcwL5vNScUQcmT1Z1WqFdqv33iWgzmyvfSiSrwRlizfWTXIhLaCmTf52KlZ/KpvPHyl/iWi+b2+/32p2e2dFJrN51SWIz2RdS3GJLbHBexQwokKnfXwQ4XtyvTXQjzJ5dOVQSOOwJ/J6gQUcyOM+FVVUfP4aaZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHLPnLh2; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHLPnLh2"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8200b55dc47so1094507b3.3
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277859; x=1788882659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r284T3Ls54xM3Z+Z7Ip63aactiab8jQhrZfKc2EHynQ=;
        b=QHLPnLh2sRZSkneAI69J2eCvlJlZdfyfIllLDSiG/Yno9a9BB3vPIRb3/97S21MrW8
         c3PDoSQm3JrLILM+ZmNCZDdkF67I2NKFtXH44ARYM0lNdTUB2hdlhpKhSKKrNxEQ/JnJ
         VBjaoguQkqYYYwK38oIYVuTdvtnYOvvdHx3jFGrvyME/JmwU+D721HAEiUxGHdhiov23
         lb/R2pyZgrExMknIYfzrL6MpnYVbUvuPfxHwYdhU2QraIsmihkO7cn9r3a4emXB0DFBG
         NqyFIqIkbnmxYwYh9vhg2qVk16ItE9UiWmtppVx7x/iW/DIiak1lYrO7tumz2cRiH97a
         oVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277859; x=1788882659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r284T3Ls54xM3Z+Z7Ip63aactiab8jQhrZfKc2EHynQ=;
        b=lf92jBJD31W2m5FMCB/1H9WAj527Hu06pFjV4ZjOavMio2dVyFVnSdLNUm6JhA9ifk
         QsRBlRO0+UIRotblNuQyobzyTYUcqVE063HDgXpz6hg+mrk9l9y60AyHW6/bdYbVyLRn
         kImheWl13zIutYMB5kuD1dvyllBEFW2auz1tllapDXnJ86gEc9QJhZUPwUICq+WdPuxd
         rnSVp0zOp8daS1I8h5lDgLtzY8fnbpR757+mPL10r2/3gFY+hbSjZ2Y/tiRDqC5BlwsY
         8yW3+g/zkdhCGXlZTXM+O1GfZYbP+2uQwb4aTOf8hWnuSbZox+jVpT7ACIn+fLyUggp0
         V5YQ==
X-Gm-Message-State: AFuF++mtE9u9D1UBBXz8lPnrXAI185lyFqNpf1in4WZhnIfIk5UyiUFR
	CGuWT1vjoMTBN4VhUo+SM4NaF+4ndTovYz6q78Urgld4aasc9tyRXFUmDrvMgQ==
X-Gm-Gg: AYBFou1BdlqYZ6zSdabfJooUpTm3+o3I/5jwW209M3xNBDa7lCnJp6sUOJ4Em71DWcH
	mKY/J3AN8RX95G56RQMUbwDl3ubAy4+hCwzHFE2ylQB+h4hzIZHS05gNHdY3qiSNBIgbzBdGTST
	e9fz6PGzu6eGhNcm0TGjGpyg46BAJzlUqGUy0pMd6M1XrgjqlvuCIvn7SxyYVxo5ujLn6cQ4DRS
	2JVmGml5ToQ32VeJywXIJKuaCd4+Xk4AwmeY2ZVtxXh5JH1vWP8BpLtD03UxwoMTa93BfOUadEw
	jgwGTWB4MaUvgL9fXW0nRG8eR9hBiqXSiEy1a4ZyddXrs9WHRBDmlSl1v/KoSKH187WGkxpBt+F
	GD1iO5vM2nQ6U/maBvIcMpz8hE3D44wOiWi9e65XvVZ379l/Ed5IsvIVHCyCUMFKN02f+xwu9Be
	QxRFJOKZSRK5OJd1i1APOUXr19lEKGSKRH7AVhussdFhx4wFAD6FMo3aZTJri0hc4f2FupMyRXB
	TVBWn1F+jG0mL5YlQKbv3uhtNPDpPeX9Sp5Rm/DJlpbSBMG1w8=
X-Received: by 2002:a05:690c:81:b0:864:6f4d:ef7f with SMTP id 00721157ae682-8646f4df760mr77130987b3.7.1788277859417;
        Tue, 01 Sep 2026 08:50:59 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5ed19446sm76489177b3.14.2026.09.01.08.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:50:53 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/24] alpha: select EDAC_SUPPORT
Date: Tue,  1 Sep 2026 11:50:19 -0400
Message-ID: <bceafe2ff479886d45eb410d8cd4db0027050bd4.1788277742.git.mattst88@gmail.com>
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

The EDAC core builds and works on Alpha; it only needs the architecture
to declare support.  There is no Alpha memory controller driver yet, but
the core is what a future driver, or the existing machine check error
decoding in err_ev6.c and err_ev7.c, would report through.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index a435b71203f0..d2f9ef592f78 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -30,6 +30,7 @@ config ALPHA
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select AUDIT_ARCH
+	select EDAC_SUPPORT
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_SMP_IDLE_THREAD
 	select HAS_IOPORT
-- 
2.54.0

