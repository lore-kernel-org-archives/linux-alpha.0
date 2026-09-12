Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594CC3914FE
	for <linux-alpha@vger.kernel.org>; Sat, 12 Sep 2026 19:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242954; cv=none; b=jCpR5JI+mYRWXVrcsCjVbL1Ai5epFQblc0ALJJ4Xej2ZV4uTPvVkkzOFCxE250Ovb4y1Yw6OCr3/QUCjWHKciG5FyCLmzm3PnGHgMopnnSazWlpL7N1+pGtdriPPB+9uhjl1cVUMt0oKuo+ZIci9EOswk/iX+VBS55MRUAIF8fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242954; c=relaxed/simple;
	bh=6WBpY++pP4wmpap/0jVFlCXobQj6RCxIU3+Y23QnWmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rk+xGoU4sidhECFkfhF1Yufhwxyb7Y9VgUBP2I1zQkOhd/BxTB1lnEahmqpG8QOnKR2WokrnH7c31e830gk8eSnViWWPpMmm4Wh5GpzKznjLcfjcKUoqlofkiZGeR7D9ZGZpJ9YrbAr7V9NZbWIhoDl+PLpVoPqJFj4WYZE4KgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irDBkSld; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irDBkSld"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-861a2ae9c51so18145977b3.0
        for <linux-alpha@vger.kernel.org>; Sat, 12 Sep 2026 12:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242952; x=1789847752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/xtiDuXddajfEeaRITCEbehQWNBkWU4am5Icja8HbQ=;
        b=irDBkSldOQhBaBPKdG0C2n9xu6CzVX6satzk8cfXQfTcQoeHaeD22yVns8ndDrQNgF
         HqhiyQmUkLM1o8OhZ+5Q24tTjFaaNrHIm8Y3m1J/ZftaCGNsawUPLT6u9utTg6lHXWZh
         zJ317ZdKk33770NND0DCpHHZa2BxDwOlklUuwabS4RigKYhsmopPqNXnC9qot4Yzy3VT
         LSdQjX0TKgBABQszclpIjqGxHO1PULzcBmVWMuBvqVWAgiluJMhlvg+4pKiVhWwPiVgx
         PDN4aitBD/Dq9upJJykI4ta8mrUHrLo4Mw7ZgdlhkfTSSMx0czsijRRBVcv+tSGh0Z+Y
         K1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242952; x=1789847752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/xtiDuXddajfEeaRITCEbehQWNBkWU4am5Icja8HbQ=;
        b=GGJFJ4PAMYE2WzRNwWqa7X8/44Tqzh7ebLgDx1L30VDNc3vTNX+R4MO5tdtc4BPiqN
         pOeCzYAAtnRD5lc9vPx8bsPgWpi7NquWt+Ly8tU67f9kAxvUk/cImmwe5DVorRZmTty7
         z1J31zCaQRxLfkOROR6kwwIsnPaMXlTAfdXlhoJMTd2OMUqiqjfBw/rDECdzFuDiDSH/
         ywv9QLdB5s+T+4oz6sqrncYzIbl2S/VhLbVnbvaOECVhE5JOSrIg9RLAHClA7AGUTMCr
         rVLgnDmWNkAgIUW88BJc47kp3ATMvJ+i4HtVJHCb43966WwIotviZRp2oSx4VYW7GSxf
         KjPA==
X-Forwarded-Encrypted: i=1; AKwUvBz2etpPhFaIscxtX0g62hUjkWdxZhDzXwJ8qDMYBorHEolDotZ3SlPkVzbhN7Y2PhKRvozIoRR0lwlrAw==@vger.kernel.org
X-Gm-Message-State: AFuF++nCX4bZ4CPOwi7jTI3m4QyRd2RZNF+HmMFrCVT28zbVz6n15lhL
	uprpLxacnwj141Z0syQlUvs0HGeEtBGjIwCM7GQJPAIFCRqJd2PBR+jM
X-Gm-Gg: AYBFou3PGnRp8UOENaE5oGQgHaTur2TZlL2xckJgAncFre8jHII+rKhPEDLXs1+qD1i
	pUJcVGxrqUC+2OOpRn8+YYmxmrcWB7akA5On96w7ytI05rv4AIlHj3o7HduwfjxKE/s0AvCIZ0F
	clgHAXNEcSvuBknME1OF0pw+DPP75hUNwLupXpzrnSmeirQo2kuYdyOeQeArCh/Gu3nC0YGiIyS
	8sxfox8uuixKid/9inzYm6iI1dL/lRMtlgKjVpkwDeF2XB/kpNzOBK5pnBFdZJC1BRx0Ikwe42X
	fMKaZJMtGu5qqTqsV1J859lskEgV8gle+5Py2bHDfJLLKwPq8CqLpyeKtWEmKGCZDxKHMg0z5+d
	uYheor5PZBmXgZK4+BXzZRyXoMoPSVaVrQNYVw6sww1Nfe149rc9iIrU+3nnGbvYoevBrVgqm+s
	K3Q1EhrM0ePTlwd+orol5LW/uCGerZCNtG34v1NptsKSB/3h5QZleBsHs15525sP+grMBCvAjG
X-Received: by 2002:a05:690c:dc9:b0:873:17c9:afca with SMTP id 00721157ae682-884af455988mr32505057b3.29.1789242947517;
        Sat, 12 Sep 2026 12:55:47 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88487ea6026sm22569527b3.32.2026.09.12.12.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:55:46 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 12 Sep 2026 15:55:43 -0400
Subject: [PATCH 1/3] xz: add arch-specific tuning for alpha
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-alpha-kernel-compression-v1-1-ce9d55330193@gmail.com>
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
In-Reply-To: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
To: Lasse Collin <lasse.collin@tukaani.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=6WBpY++pP4wmpap/0jVFlCXobQj6RCxIU3+Y23QnWmU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKWrrP3bfLPW3lE+iqTE+MCvXx+4yTf6EX3GjYt2tX/6
 /D5i33/Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaae3MY/ils79i75e
 nlO12C2Zdv35omH5VzkFN8i9JNRuF/dZ5NJzwYGZZ/0hP9xvTiRSXn6VxD05OT22b+if7TsuHwt
 LzV+10VV/EDAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha has fixed-length, 4-byte-aligned instructions and no XZ BCJ
filter, so it wants the same LZMA2 settings as the other 4-byte-aligned
targets. Without an entry it hits the default case, which warns

  scripts/xz_wrap.sh: Arch-specific tuning is missing for 'alpha'

and conservatively assumes 2-byte alignment. Alpha gains HAVE_KERNEL_XZ
later in this series; the correct alignment also shrinks a UP1500
kernel's XZ image from 6469320 to 6448840 bytes.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 scripts/xz_wrap.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/xz_wrap.sh b/scripts/xz_wrap.sh
index f19369687030..5af0d9045cbc 100755
--- a/scripts/xz_wrap.sh
+++ b/scripts/xz_wrap.sh
@@ -10,6 +10,7 @@
 # XZ-compressed kernel isn't currently supported on every listed arch.
 #
 #   Arch        Align   Notes
+#   alpha         4
 #   arm          2/4    ARM and ARM-Thumb2
 #   arm64         4
 #   csky          2
@@ -44,6 +45,10 @@ BCJ=
 # Set the BCJ filter if one is available.
 # It must match the #ifdef usage in lib/decompress_unxz.c.
 case $SRCARCH in
+	alpha)
+		ALIGN=4
+		;;
+
 	arm)
 		if is_enabled CONFIG_THUMB2_KERNEL; then
 			ALIGN=2

-- 
2.54.0

