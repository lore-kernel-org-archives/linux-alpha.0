Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884362;
	b=xKsKwkegAQ7lKDYmzcbwtEyMwWyaBzo3oGDH8DZYM3Y/YQxJF4y75CYl1iXDyxnDdorN
	 aPbaKZSctu7bvr7tOvzsBgEmT+T6zNwddviNL1Zvzsto/rZ5/Yai7e8KW2RFuwpdK2PKm
	 Y+6QxUcydfAhWWfMHBJZQBJU/vxyVQRKnViTwfDhy8Xe2hqTmyxHAB1d687RH/7aW18/o
	 HFHiT0axOkTub9H4ysv3JR26ZYGuci0rfh44xHWmjdo9w/ZZOFbu3wjiwu0ef2QVKNISb
	 1H6EZTbysHBJbq+/3P7T6eGg2hyTp8ZHUXL5d258HV1cvLuSbEfTDR73zduU+fQL9CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=wbENZChveauVVgT6hKm3TIJcmjheLSG4uWx2lXGAyh4=;
	b=1p79dKz2QoWOmrO7WU99rVyiehqhjbtvm/wLwsXkyRHrt+W+zhjzZBzpFDJhgtydTp/T
	 QwEsrEr4UGnIeFbc08EKy364AyiMTPtuS4lasoyNv/9GxhprLxKKPQztLLrt3s1rvgYXr
	 cQL/M+qy7IuT2iD32GKAZvXBbaBkvRlPOGTitRk1TBBHGO2J3prWjrW9ZqkyrvXzPJkRk
	 ZjdVOyI0vePVNwc0FxREW4ZxqN5XI3hRCg1jX1Lm2dnsS2hyRWyeAKbU3oHhh5X0dbW0r
	 SPjwo2Uk0NWxynvoJmROGjnC10iw7YCqBj6HlDEpSM4MwuLl7bRK1Y1jCJ3A3PTzf8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oeuzk5Ca;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B82606A8B4
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 02:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33B82606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oeuzk5Ca
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b305d38bafso27715247b3.3
        for <linux-alpha@vger.kernel.org>; Mon, 16 Nov 2026 18:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884361; x=1795489161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbENZChveauVVgT6hKm3TIJcmjheLSG4uWx2lXGAyh4=;
        b=oeuzk5Cai02QOkBVatxcY76kHfgc4cFvWlnpleAHdg9txREH7h9S63Rah3Hf8VA004
         rApn2ryC7wf3wixS2C5v9d+nxrdBRPFsqQVsMHYUW69bs1hg7TZzFPWNolRXKDZT0zpB
         zrPI97ay9iTjEeY7smrBvfuG1B6aSR0zGUUy7HPPSnMD08IctZxQr2n8499W6xc0mIUf
         Z0zjBDXEktA6Hx6B1eUYH8E+Bl22URiq+HnqD4lo5SxWvmebTSRBVDIm5qwat9HfrGOg
         7RnQTCAMl7JbXkSYpp51OxYee5NMgFK41YUFAPRxc64TzWSYKIbkAqI4ffH7HTTzDUnO
         54Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884361; x=1795489161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbENZChveauVVgT6hKm3TIJcmjheLSG4uWx2lXGAyh4=;
        b=008b/FOwXmRKurPY7VpVlGccAaw8htugbu9T8cUijh6V19u3SUrb8/qVqAFerVLjDn
         jn7hVV1aMlxvUeuudlf7CybZx3E9KSgciZ8vifQOA6UDezCvbgH1Kb1K7w5exwzxoxQJ
         aLo8v5ydqjlfV5RjWfFfmQ7nKJZ9HG47juOLEQSYYlB38I2KoJvRuhwc1NqZ1UwYneae
         g3GpLxdAFAyhTbryfeiwblp/ZvCEr7LBhvn8fsM/mfx3Ovg9WNw3/8ugQotbXKK2E7tH
         KuJk2crVuaAGIm5RVw7P67VAX2harKacxijBh8fPvB3W+ltbDAfUG88+iO2jAoD3ssa3
         w9gQ==
X-Gm-Message-State: APuU4Z8kXZ1rQgYY3dXjb/1AZou3c200ctoAC5Ut1eqGL+HbLHa/5d41
	4PqF6e12FLn4BtirE/Cw1K5Df7pMq6QrxU/4yVye1rxyplDIoNsubl9v
X-Gm-Gg: AZFdTZc/oQRGiLJel5rzG9SRNx5tfuPnB4p7fuPRyz+BsO/aMyymUWehAYGohfnHqDk
	uDscw6H3M1JcWGCpBjjAtBQ075ujscMUmL6viUwt1J1ySvX/xrR+HNmF9/NQ8UfvT8CVVvnIEJR
	wqGdbOhW8bd04AfS4ctHb5p5kdS9pmbuB7N24btBb0WECfTJiXrcX6LybUsXBuiaHkx0xmXedvu
	5J6C2CTzjlISrSyOkUxEyLrlc+AxrCFQlz3tivbWt/1rh5frlHWyugLGH7lVdNpKmY74I9S5fai
	py8G9jTKFH9KRE+ujyH2U2vto6mdJoIWLBCWOxGcNWZfTQFTo5NwIfMFlqEs297htqifdvZARmB
	luvzid92CVAIGxhDhMPJdDA+PKEdIfTmijeAhW8Hrort2mDjJFsnN8NqTATDZYZx/FJNoy0RbIh
	XG6Q3KpD9LdaMBgE5tMdLl6BarpblKH5RBuhgJuIDaNgQFpVrXCwqcYY1Hwl5RZhCNvr54Gnoum
	AjDOp19O6PSvjB0jrZOKWRX1XsW9Y7I8C/wL5DmvUL68FP9rwkyyCedkyBlr0GyP04iRnbY3OMT
	SIgniDcoKicCKOJ9OnxnLpbQaBIB+B3eY2l/4p//+sUpQZRmnXEBJI8Qd3AHd4oM/7QESYM5j1R
	ZX3VhabFntmvGrgBUuzeeNOD3Xe5ehhAkHJgd/oP2txJCoKuNxQQALJC1pFMWuPNX5SXSkUX+eo
	Ezq1jauatlArAOGz/LyztMW6/iLGC5Qbq+iYkG9OE=
X-Received: by 2002:a05:690c:4990:b0:8b4:d9d2:df80 with SMTP id 00721157ae682-8b4d9d2e1d8mr21916577b3.24.1794884361016;
        Mon, 16 Nov 2026 18:59:21 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4eb7f0530sm14639707b3.1.2026.11.16.18.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:20 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:12 -0500
Subject: [PATCH v2 5/7] alpha: marvel: register a platform device for the
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
Message-Id: <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=5M8/bkKqDW1fR0jpsWeEFd603SI7R5txSS4IygbKcb0=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/rz1dCx72xPpqbywdN/3jC0WtSu4M80OLKmd/7El
 AgfxeiSjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmYj8jwxzzhKipG2
 N+O7z9d1t8U4jUYsULYuzvNq/rvj4tJ+ug4C9Ghh8JOjw2RRnhLwsj5R6/2iVcqOzztbHJa9uZr
 5vvnlHhYAIA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index 7525f3ed6b62..169a1df6adb2 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/memblock.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
@@ -1139,3 +1140,13 @@ long marvel_cfgtree_partial_update(unsigned long offset)
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

