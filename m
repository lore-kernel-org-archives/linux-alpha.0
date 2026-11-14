Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677993;
	b=GYIfvlMY25b7ueggviWKUc9wM4MeQN3OBIsKRTukYJJtDDuXiSxCw5vMHIKTBFXvOEb5
	 BXM7lr5iDnL4LemQXDdBbwlIoVluD8rwwmapN+L8bd6QthaRUTS1tWmEq7y2VX1hocibC
	 +08xIx/Cbu0Azxi4ZDK3UYI9kpvWCiS/ZwXn76ioX1/9S6siJSLpP+ktRX/F5/nHbgGoG
	 AE7KWUDN1kO1AJOKCliGcv8Ic0T9M/hZnbKWakpjtHYfR36+nJIRALUOpMoZgVCR1z4dw
	 hQJ5ejaH3tXzofp2bZIYu34nvSsk+zJbiTvb6vzpxfY9ehvCa3CvS78EC/EIcx0+sPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VxZtbVvnscbmuUMEF/QIImjGr8Jjr0RTY5dyxl7471w=;
	b=3kJkhEpX6o8FrjGWduVixV/suCpWOOs3kBMszYMgmw0lZKqdp1o7yA+lXwsvMfzK20Ph
	 /845bREJyvCzfucqdeGh2x3ldGZYIQgrGF7RIqls5xN+yJIgJjburWiTHJ9+eR46Pg/cM
	 A2G8rDZChhke9FdErNfEGTtm9vMvHOW6ZHYWTSXC7rxlSshYKBpFqlm41utX+mRTtFhRA
	 VthE7CS+bdnd/haEvbakT3PHO0uIYsjU5f/m8tnUC4Qvs7Z9puQOvtZ03he02sYiPSY8v
	 gdBo2C8XeBhvaf/rry2H5T3iZq3LyTOUSbgwbI7MhOPfeHGAg+34iBOKB7wZmo4UnoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNgFT9c2;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B6E606A336
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 17:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48B6E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNgFT9c2
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b30ff12f84so14397227b3.2
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677992; x=1795282792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxZtbVvnscbmuUMEF/QIImjGr8Jjr0RTY5dyxl7471w=;
        b=hNgFT9c2jrdkCXe55vN/stCrCyN+Lw640rnMSlUyfveTcPAERNwY5hXqsDsJ1Cploa
         mdt7EAcxVlt7g2rsjB2Rh9n+n1dhScx0bu7VqwBr501yTwPD360zJP1WmZfpRbhqYXxO
         5o2yA/UOKUK/dVFF459TiKvjZ27ntw3yptNDpLX68xbamI5YeWuyQiU3HOSz9dQDk2VT
         wjLEX0MYiLPIH9ChzzHBrwlWbi2Ae4xmAy1TNymeGDAumaqPIgJeOqc6v7o1PzePMM1+
         gBj+Xo4LhOm0QVTVxSM84IqijNXmWy+89k21MaEkHgwe2VG18EWvkvY5hC9saz5qYqTJ
         yKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677992; x=1795282792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxZtbVvnscbmuUMEF/QIImjGr8Jjr0RTY5dyxl7471w=;
        b=AZG8Hh32ojbYNXA+sbcrfpsYEV/ntgvTVkIJUgEBRDUWl8NBlIOWHYCj52BEMpXzXx
         akM75IFQgX42UNXlQyozhHyszbzSu81Tsy1ovnttcdk5nBXCv1zilyPgZsgM7yV6awIg
         9LYyukhynDjGSyjlARX98dEKbIifpVcN3N0lz0Bj9ozdNaH6xLFpGBzgzVYPMw5Q+9oq
         smhSGKKx7XTS1H90mBY8/uVKyy98vtTZyFxC+MFn4NRfxXURSXMZZPFrO4UuRlZVnO9U
         0L5xapYYezYQSIR2d1v1pB0EWkdlFQXu/K7mbbfi7LqzEFP3NVL1TY1hCAjvM8ilSGQ6
         GGig==
X-Gm-Message-State: APuU4Z+95LkpUw+5Ycri6fKCfnQvhosmBZeTTJYvSLmeiUlYyGR2dRsw
	8zaAuJmjKfyBiTShKdHV4pQxH95uUi/GRob5p645Z+aO8FxzA5QrCZGx
X-Gm-Gg: AYBFou1WQ6dURI3kpPbnNXWI1rT/2wX93h8iyUnsnSEpW0oWjzwy8bcAI6IkPbNfm1Q
	ignbLJ2kI8+OzCEv0VqAeQOv2/RZdPSHm9/GfNecSzIHeL0IMjNUI8NfQn5FGt5mb/S2DnOaqlV
	is0W03X3QmWthmAKEes+z03BKYADlILtVWF3YhfpBxyNmzSKJxXn3jjSCaXHM5xFC4RTxt81urq
	TmL/Um2r/V6Am5xtrL8wBEQHYekzlJmuzMqrAGpJ4tQZQEUS4LcoKV98FD5yd95azmHdGxDHBYn
	mRd6Uo0LQ2boIAMk1me7Y8tbeGvMJUKnHArHyVKAVH3G1h/am2/7JaWiwWWYLPIVww3SVGSTXoF
	W/U5mROmWw4/UPR+QWZjLY3iH5S2C9BwnAoHERaabCHKrE9EBzQxsXLXjhQkMYHcJSNp4gWz3Uv
	KhPlx4k9u7lRFFM71fqH4Rev76TZOBicbcefYNmeOrFdfuHKGMvd9nUN1qWDblyWVbVrifMgt48
	0SAsgalKbvBFoTmaGELnC7QUgaYHL31fb9KNzKmqOav2XyAI9TUahhVi8DS1YOV+QsrHN4hoEMf
	xN2CmVZIlDoCov753FVS7jYHi2arRvUi16grgIBxsVuUqZmvwO9OUUhdovZKP3SbcMHht8gH5uq
	zPybBqiIzhv0fcZfW77FRBuKjHH4fgI/EAIo/qPlerljHO2S7sREm/VW/KioBBg==
X-Received: by 2002:a05:690c:e3ec:b0:8b4:b5e4:e7a4 with SMTP id 00721157ae682-8b4b5e4f2c0mr27973607b3.21.1794677992256;
        Sat, 14 Nov 2026 09:39:52 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9d05acsm48540367b3.35.2026.11.14.09.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:51 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:47 -0500
Subject: [PATCH 1/7] alpha: marvel: report environmental events without
 VERBOSE_MCHECK
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
Message-Id: <20261114-marvel-env-v1-1-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Y3Z+L3Q1B+1LTrQWdh3AhhyWOlCmGs2mmWLvmmWQrZY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHksxnqmP3lDM0usxYK/0c0pPTY7/r1lnCz6bZp9r
 nSy5Wn/jo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLlG0pDhf+2LB+qXxP
 O2lV9Jygq3cygu3GHev37zmu9d67755yuf2c3wP+39hz4HjcAfYg8vS3Zwb7j3MEFxmegenlsK0
 Uc4sx+6cAAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors report temperature, fan, voltage and power supply
alarms as system event (0x680) logout frames. The frame is already
classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
header line reaches the log, which does not say which sensor or what
happened. Print the subpackets unconditionally.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/err_marvel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index c0c0ccefc467..832567a3ccbb 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -24,7 +24,6 @@
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
-#ifdef CONFIG_VERBOSE_MCHECK
 	struct ev7_pal_environmental_subpacket *env;
 	struct { int type; char *name; } ev_packets[] = {
 		{ EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
@@ -62,7 +61,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		       env->unit_id,
 		       env->condition);
 	}
-#endif /* CONFIG_VERBOSE_MCHECK */
 }
 
 static int

-- 
2.56.1

