Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939222;
	b=qXde4cfQ3u6vEQtp2/TtcrKcj5GMJ3wDGTfh8MlLHaZw2c9H/Aas2D/Kb8Ko3AvIAvdg
	 APVWeiSDwqT/yP0xDJYm5dJth4eM/TO9IgihCPe7lDEnIimkCs1Sx/E+I5/hc3Ae8yxiR
	 i9uav68JRTSp2++M2fioqKI7nM6CFPqI8SehaTXf9OjSAo5ulOfDWmHQQrHqtgP767FjN
	 2CVt1HbqTPnTpcc/WKCk3cx3lCPFUYKW2nplX2yVADo0DzuFxcmqyPcEV4FVfTEj7DFg9
	 FrUmnahwfv4Ynw/ms2ZaDE1ROtwDty9F4dD4lVoK162U0qs6sXkyUSqN1099DFTeFxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
	b=cOSLGqOb2+WmU+6RyegxHQ6ObviXFQoKT8tK58oMU1W/xQC/s/ndglGn7yrf+qnINWUg
	 a/UtAkHRhwp4y2CknmN9VLAsS2bAEaJfFLsa37s8gg2XD3nJbea3tMECOUS+vl0DtUEdJ
	 Tl5ZAS9/EDND9HLIXdQBFgOQIbpKc58s1sHJd4EdEk/xUmF5xliHdVjIKkkmGj5Jy+wV8
	 HrqO8+5CJBPBNjtUnzHaCJwVNH8CHNj26JzpyaS+G7PJt6Ad7fRNlR0Iuzuf0xnQEA32B
	 QWZ9T+PKSVpEgIIIjrfkOvOT/NLzG461b5bnbaFpF3zokV9p4Q0+XcM081CJtFWkN/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+eNLKGi;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B51606A8B9
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 18:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B51606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+eNLKGi
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4bc5b8de5so9496867b3.1
        for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 10:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939221; x=1795544021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=O+eNLKGizaKvCjcBFEPklrUdI6prwcylupkEF35VptnltgWqNEux7MOuHb+SDkx5jB
         O2YBkx70K56s4/CYCkiUSvGtyup8Lsx6SgYv0nnjy/nYnX15phR4QjgUy+4HIpn192gF
         kJ/5qnLgAvCPteGUvEgMXDzynLfgCneUUtyhyqT9ItC5tbMECcJW5nViiMWWqg5htRsK
         RdPzqrR+FATHhPikVmvkp08iBo2mqzvqGqqnkDbzguZ9r3QlGPxRnttdluSffAKHHH0u
         uvOVPqUyQmHk1gGbq9ONEY4DjkvDKZytgBIF7ddU81D5WDv3kwYq3MVRRANuE4pFuWOG
         FVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939221; x=1795544021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=bIqMJM8TDlov/ZHzn0NuqyOBP6IaLDzt86XfWrMxbblsqrU80W1k6lkmNgC6CmG51+
         QsnE+Atrlh9M+kBiFD9UUBHX0ukvCg1lMYWvNlmLg+juNGC8M414voaRWZ6jqxtsQ5pl
         3vgsAw2jLCx6HdlNO5wD90CINM3bF2Gn8SCy/KO3qrGVSUfvnWx0PbfLgpMd137LJOrZ
         OXB+u8H8i6L1L4Idv6cvjMsbDQrMSuaAvsuVAFftSu/EkUOR+YlyMLmQD+rXVoPGTK1P
         JwcoIOjieZcGGkkts/T21V7d3FDcXBLIVbCt4ldmN+lzpTF1DYYTE+1axR2NpznAMVID
         O+iw==
X-Gm-Message-State: APuU4Z8mJd7PqduhN26MFAfRou2rPtyFjoV+E15jgf2PDnElAJZMr9zd
	wxBPBulcA40AenQvb8meyBCTSbntLlmI/e1yJbKXp7e518eE3702hafU
X-Gm-Gg: AZFdTZcKEHem1hMxbNUD7J26Qej7goxQF0+JXzA9pjlDUQ6TAH/Da2P8/Y2CVApCaQg
	WjTsXMDL3lGBafSmW/0Bstv10yzd/fBX+xdX5XmwqfsO6ERoCWOxIEtiF/jn2/k5ue8BLT7k7sT
	0iiKsv0TAch7ih7RyktBzJY1pkLNbzQXfVoE1e25ubvP8k9wnxkV+aS5pprejrJO6kcbAR8osEe
	FxSiFQvTnOGIempAYB8qc0JqpDF6nrw/q+ztU9R8WNyWpzEoiTfHdsJ/i4U6KvnxNqUQfZyGQ5D
	cGFsdEthiGfFSC7g08jPiYUzAx3GpfkQt1uUSoiaYSXbtKwY7J7/brgtOcfS9sJpx5xRutosaws
	qESYdtvgiEC8b53ro/+1KoqGXkoWl6iEpnj7tgQrh7m/CE9RpybHYHH+e2uNkoc80C9frnLi8he
	xOisCcSzKmOtLfu/RRgXquXajl2hPa66h/GdZyEovUPMHSXeN9+bFBxtSX5GFWymosHPvmexPww
	3JRDu/DYBuWyG3wkPZrdmQu4SR8FWPTQtIoLoUrNzbL5j5Ufj0GLw8VI1AL93z7KlWmYqX0UD2c
	G9Bwuf8/1/nJkzz0D6J3khnIB6Da1GHtv3c7MGE6jmGLExmMLwNqMES1OIfRozPyfDlOWlZsMVh
	KecG3xwZg5tZzMoaFx90eh3cGytxoOdCInquqbuErAvv9kS8G4nA1wVUZqShdi38Q19aprpe24w
	/04VqERigsx0SJu7nqwtkwkrfc455Fyp7LKn86Rhs=
X-Received: by 2002:a05:690e:4894:10b0:677:c90f:46bf with SMTP id 956f58d0204a3-67dc7869e78mr1202178d50.17.1794939220704;
        Tue, 17 Nov 2026 10:13:40 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd3f284bdsm291489d50.3.2026.11.17.10.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:39 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:32 -0500
Subject: [PATCH v3 5/7] alpha: marvel: register a platform device for the
 environmental sensors
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-marvel-env-v3-5-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=eCxTz6/wFgOEYqUhWdz1P8hGqwqPQw6s+J+8BeCiWlI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPTY//i0pq3747akHGmzgvRFG/gWHTaQnx15YdojP
 tlTJjL/Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaQGGGv9Iqi2oDCr
 /0brrgzSkd4LnS+st1+S2qf2cssukOjV95lI3hn9bcpUq5DX4xr3g3SE4tuD9z+bQP/CHXdu4uT
 itTuZdVywAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index bd918028b410..d2e1e45cdf1e 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/memblock.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
@@ -1142,3 +1143,13 @@ long marvel_cfgtree_partial_update(unsigned long offset)
 	return status;
 }
 EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
+
+static int __init marvel_env_init(void)
+{
+	if (alpha_mv.init_arch != marvel_init_arch || !alpha_using_srm)
+		return 0;
+
+	return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_env",
+							       -1, NULL, 0));
+}
+device_initcall(marvel_env_init);

-- 
2.56.1

