Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046994;
	b=CEiGonuJrmr/cR0NQg/O6mnleyGxxbR+Sm793pcFTqT8hwRu0ymE6ebHBeUabup/6D8h
	 r8WldcoGsq0qItun0dINmwbDCg+Efk04K4Rvcf1uZQX6tWH6qk4g8YlMrGnvvEbkzUPuI
	 NEa87kc3ttaN5sIaUzj3YFH1h0iY+dYGO2T5rrt8Aeog7kfsoK7dBE8/SeGyHZnLJsh4F
	 lMjA2p9AoO24dX729QCMqPwMZq3Grp+17TGI+5jOtvhZuFpQLhpvT2/awzWly9LazI2qF
	 RRZqKaNnS9Ml0ktQXm7cmUpUfbyIPY/Pz6GynzqCqMdYQvYg2BxFgKlaR/BnEClvQuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
	b=3Q0Rbs5XXh50Y5b5A3srzuONo7UOJGvYUhgiy4mE/CH8JaKVeg4CVtCxoTADHx+PWp4K
	 kYbg+NOBJpwtuX6O7H5xDV6PHLmv9/N1it0BV0+YfOL4x3RI7XadjeunX1ljfylTkd43P
	 oi6gHYQDGFKEe1ojGzua6ZsK/grXq+2ERH70iDk51rrTnIMaCULV2yecUpsbLZHfz0qvg
	 gpNaebpjVraFE98utI5xiIXXjwffNjCP+NUUnvIhwiHGpUM39v7fyegG9Y57f8gZE2QL+
	 owvyhuqw8nA7EsbWf4hmbPEIqola8F1aaM3i/lqYpnWFG5Ike003IH5eLzSXk86a2HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhtTpJ76;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCC060A2601
	for <linux-alpha@vger.kernel.org>; Thu, 19 Nov 2026 00:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BCC060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhtTpJ76
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b10d24345dso15755727b3.3
        for <linux-alpha@vger.kernel.org>; Wed, 18 Nov 2026 16:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046993; x=1795651793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=EhtTpJ76+FnPhG+PiTg1598hHMEeBs8dAYpnflx5oDdjN3405Qwl+4BF8HE7knr+Gw
         4fpmK3qFzpggPK/eifxkZaQ8Nkp4DYQBHOYz0/moedP/klluSBnwanY/otpG8U9L1TZ8
         xMpCvCylHLgiTv9cLZHw/CYT+0wytXHaxK50M3U5CUy3U8XoNmhkJM+tCXrBHcFyEhqp
         dumcD2MgkYrpiBT6ndb54Mr/qJJGj/vzeCLjGfKyudL2OJb6ErGELWyq5OTsWWdEBrtt
         jLaaF8hkXD4kq7wquuECY3gcerl7J+3KB1MMpEn2SbRpYJSc+AL+OoyQMqxvkJVi+jN3
         IHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046993; x=1795651793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=m/rkdWpivAzQsDEVaw9aB7lrXKuenG0tGIvlrUWfu5jy1220fuCk+YVBG7TRmnN7Yk
         u2llajD+l+E88P0qhBnkewz/7O4xTdhUpuMlLDtZJmlJIo4hI6BFEyIjlEF8BpuXmX3+
         BcGy0X5wmx/9XG6DXv23bT+Pwd+RHdCnzlhA4F4xGkt0EW10hT9YsRY20QSHe5f94bzf
         RMQmU5kfAj4EpQnjLE/PerdBtJl6SfvW8l+9OYaY/2/QDgjwd/rzEsuedxvAZsRL8coK
         wvaftOCHOq05ynf7a1ZT/xm2sfhEPXGeEaMM8zcRurYApqRiHx49O+RYTW53jgQNb87E
         Y2Dw==
X-Gm-Message-State: APuU4Z/tHX6azF0YesT6SFHqUJ9L5+MOKBo8OPoXBMP4IBvU9RUDz3E9
	wDAkAEyC0AJWpLu6gMpv/5Wma2Ou8L68jmL11KinokMqbCdrRsO/XnGv
X-Gm-Gg: AZFdTZcnXbqO5cbAr4JEPS/YFb8xlGcDZ+qpCAEDrBeIqFqGlr7VjEJnj7/j0WSA1BY
	jKl8GUttSJo4DG3ZKysLl9VAQeSBqw1L2gX1BLvTDEPYfrj2+cZ82GxDwLiCBIKLbuR6og2i521
	hU5Bdm1f5Hq5EiKDrVpvm1CJ7NUnw60Q7KWKGkY7dmMKmFvQeEBdj4XMQNMbdtYv8WFDzhwBknB
	EbF8m9bo9bSahvzvdjdERuzzQadE7QG8nfFl4PCe86lkNtL/c+nbEeKKBqDGng55PQG+HSn9ppx
	YI5Gf5CJk0VPNBu4X9LsOBwhnkQ4a2sw48xgZ4p49YCTV990Rh9ClEf2CcJwyY3biQ/EdTNNAmO
	OQ6eirDBiRN2H1l5oEaYX2dHlVmeBSCbV/zzulpiaBm3B4mjccnt51cxFBUh4qQ/z2Klf7nDzFN
	N6vCIys7NR8v68bYtYo3QH2zqWxNYxi/XTUUNSZY1d+ZAyfOvHRBh42bnmfCw5EcLUNOB4cgRNm
	WgYw01vNvpRkriO2eYXI6qQ7N82HGPF0wCQfuidEZ+MeQ8yycZhXsfZtoH+RFFmzjN1VyE0XwY7
	Tq1TnFF5swTWe6l8rSDN+megsTjOcsDS87Bc8F1V3VjQPiDh9fr2IYTmnogrXz+teYlVyd2/6g+
	4YKDB7WULhiUlrzLeHXYN0K/JMmpCq75bZyrFRDFjJW3RZvSe9KTyzAGJMSL61sKSYcVSWZ463G
	yKTypzGsxZfoJ4pyx1dg==
X-Received: by 2002:a05:690c:446:b0:8b0:e238:271b with SMTP id 00721157ae682-8b4febd9edemr19519507b3.2.1795046992979;
        Wed, 18 Nov 2026 16:09:52 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe03091esm26035277b3.12.2026.11.18.16.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:51 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:47 -0500
Subject: [PATCH v4 2/7] alpha: marvel: report environmental events without
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
Message-Id: <20261118-marvel-env-v4-2-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=oaDjaxtiZhTza/9Q+dIadPybMp9H7XVMHIR6nixhj7k=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2XklqMwT/PPvSl/C974Mp0mfRe3/KXuU163X3rMxs
 qvpdvGcjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLlmNTsjw+kNJuUfey
 XaX0k+rDLh5fnh6md/bdsfpxUl79uqVrHN72VkeJj9oNnukvqD5x371YVYpbdfNUub08OVFPalM
 /TOk20bWQE=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors report temperature, fan, voltage and power supply
alarms as system event (0x680) logout frames. The frame is already
classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
header line reaches the log, which does not say which sensor or what
happened. Print the subpackets unconditionally.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/err_marvel.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 9304ae74877d..46c521cea9a0 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -21,7 +21,6 @@
 #include "err_impl.h"
 #include "proto.h"
 
-#ifdef CONFIG_VERBOSE_MCHECK
 static const char *
 marvel_env_state(u16 state)
 {
@@ -34,12 +33,10 @@ marvel_env_state(u16 state)
 	default:			return "unrecognized";
 	}
 }
-#endif /* CONFIG_VERBOSE_MCHECK */
 
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
-#ifdef CONFIG_VERBOSE_MCHECK
 	struct ev7_pal_environmental_subpacket *env;
 	struct { int type; char *name; } ev_packets[] = {
 		{ EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
@@ -70,7 +67,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		       marvel_env_state(env->state), env->cabinet,
 		       env->drawer, env->pe, env->sensor, env->state);
 	}
-#endif /* CONFIG_VERBOSE_MCHECK */
 }
 
 static int

-- 
2.56.1

