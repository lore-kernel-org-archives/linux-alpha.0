Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939216;
	b=xzi9i3A17C22x8m08g+B2/t2yEK0qU8wCLKwNZ260mt6hJKrcL3lRTbxNMDpgg8+35Na
	 Rqcb/kwmhL+SBMqYmECJxVRZo/kPG7lmMxsHHjo3fWT0PIIifqlZOrT6ST6ATeOg1roUF
	 AmGPxB2FzayhatAujnhy+FLqIDXer/inAjenCmm6XWglunX758uecINybQcHRd+cN7Jsc
	 BjNpMCYROhD16CeBssbpa6X8vRiQ2enzwiDyCayrYH1mr8JRlWucoFyQuqiM6QH0mXF+/
	 q/Vr2zsq2fwbp8LKHeLf0YZ5ucxizVx5pNkbt+AiYPoyNEqG/TI/5eZCuVCysanfcTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
	b=QKlnxYvjTVVp9CkKCNYy3bBFUbxPorYeR7F08r0vbgCHTlhwOt3mEm1FvbZjtXKy8V0c
	 ng6tgcANSL9MtewuYFUuj9RQq2dTlyCTVoKdNZNQ/ME2uig8M/fC0ownju2FMVBKcTW8g
	 6K6JceOex6zsKkycUhGYqjAu02/N5l1nqFA6u4KYfZsnTeGjWvIPme4rIuEMe9tfB90n8
	 CFR/OKTEpUIsJp2ctGSAS6MIuuajMMz4cVDIIzcZ34fyYXUux6WHK6Kkclay13qczx2jO
	 7nWQm1FF2+qlGwR2eY2j1YZzS7tUUEDR1VHyZ88uRRqiRxulXllNntPpemrwJaIe3fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Rqr/hizJ";
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F231606A89E
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 18:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F231606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rqr/hizJ
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so6196736d50.2
        for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 10:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939214; x=1795544014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=Rqr/hizJwM04N5r7rdBlI1SrpCZm1YU2VwykcRD4dToC01j8O0eiPOi8Zfdo+cSsEe
         KepkZt+HzaSliry7cfleqlm+vsu4kjci8eNfqf8ZW3D7n2FU6NT5ga6OyRwovGfvl7u3
         moafL7fNIaKLFfV5rLTysxDKefHgo2Ste3Vh64H4ghp2hsu/BLV6Pa4fKa+pUfA0nXT5
         POTyodqTZK1gOQDkzhdPVkul/bv3zKZlZuhLJIo88VWu96PktIZfaiYanN37OPuObyx9
         vgeQG5E4qagJYZGOTrtTjO4v+BZSFK2wUK8eHyxLKXvbbb1hzVoVMMYRSQdGAcRYgpct
         78wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939214; x=1795544014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=P4BogFeKKJVPk2IU8QtGPNMgbgCJIHL8UiR71J+TsBiVMFCx+0I4b17nu4jnVxUoas
         RweT8KwRCQ7Q2kpVbWCtytRPi1QpaKko2GC7uL4FGAxGtUpkCR0E32ZZW0Trii0OfNjR
         GrcUs3m5ibdu+nF3rp5VqYmPx216aQgHvXDAP1AwC9ANgVm9O4sq2pbvf7lCV2MkZZ7s
         7GpRniOZ81KsUWjsNJDje4C30TjcZwg8MkH+RjSs11pZtwen0oXK5tSz6Bs2cz1l9EE6
         ftS9ePXVUGi1ATYAtlku8fO4pDem1UAESgbEnAp5n4xJFJG6hnnqiSMtRcjTSHa05GnN
         aUSA==
X-Gm-Message-State: APuU4Z/+Ot8spSr3dEAAZISP2/LGefoTsB0UYmQr9sXm1/xm8caUliNo
	+g+Q8D5CQ8zJfYgYlHyGBplezMTWCHcelC/Cnt+oLjVRwZ0+1jbcibv1
X-Gm-Gg: AZFdTZfs6Y4lmRma8+IJtu+wV2NSRRyxVK4GZYCRh/Wd1SR7ybyDG3L8FWbqhIQAkMC
	QOv3WnGI8QROXt9l9YGefaeld1huWWKXL+rm059Ybjmim5fLrH+GYlWvNeY+K44QKY9yXbpC4DU
	V9JXc6zj6bzEkvbijix0C6Flt0BL/fPcmilLr0KEn7U/J3p0RLudZe3A8+UtOcbDn9XYWVnOlGu
	1cjZvvhYlAEvS3q2sK87HhA0N9NF6WEUsAx0RPVaO5gkWWsZUeVM05GXWBPMiLNhhDwiHg6IhSZ
	NP1Yck6GLOavdtNYscrcJ4+tFDtDQyb42qvx0jRCxbxJHIZ2NaF8CLbcCLHdgtve7ICAuXKn3m3
	hc8uiCUYVsJb6qbb9tawegK40VsOVA9hhR+LVOk4+KNTCsmqc3QTTudEg1YWN9hDayPa49a6mE9
	vxLjpQVEQTNoXFXpFupPVLvA74F28vwoJLTvvG/tpHequ8EOSl4sS+bSZYoZWaujEWw3+HRMV89
	T1avUO2r1WkmcBqJAMywnk4TEk5mRD+hEi93KRuaG3XBX6ah3O7UvHkfZ8zk/7D/Q8lrxyhmKmm
	HJecNNBk2b1M5hFlLsjo82bIAbvm/k8sqPV3/Xc6xOXiNu10SIidFUCx6Ze3AFfRzhk4N9NM1uU
	h/S8bCd/y8NhY/jjREnLSq2rgqngWI2stGrFhpma8Gk2SgBNRPEGayGxQ61DRYdFgzmSwVoS8u4
	DTDaHa0Zd9hokhQEn40Q==
X-Received: by 2002:a05:690c:6884:b0:8b4:e4ec:ce6d with SMTP id 00721157ae682-8b4fed78f0amr379807b3.73.1794939214002;
        Tue, 17 Nov 2026 10:13:34 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd3fed5e0sm269767d50.5.2026.11.17.10.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:33 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:29 -0500
Subject: [PATCH v3 2/7] alpha: marvel: report environmental events without
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
Message-Id: <20261117-marvel-env-v3-2-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=oaDjaxtiZhTza/9Q+dIadPybMp9H7XVMHIR6nixhj7k=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPS4do6tJej8Qo3K4pUai1r64iQ/OB6bvq06wFnh9
 enzUVa3Oj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaac5KMDEvyCxZoVf
 DXn7AILdtx97zkt38x8yqdFjlJ/23XMjfpfcrIsP7flWshMtsm+FV29HNHPRM5XzcvbOWcLY5i+
 nZVP89d4gMA
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

