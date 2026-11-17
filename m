Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884360;
	b=Uc/XT3xiYOIY2kH3T1oyCb3OrMmuFvZGL0L4NJIExeR/qpbrbrQeJSecxxX30IYIRMvY
	 W6DKZlCY/DhGrhLNKT4zQpNkviknkCY6d7xDw1jmMzq9AXe5dkBVg7Mc1NCAkql9/VYWq
	 1gkWrXir7pI7iGEc+TdrVn0vpd1SXxeeom5L+gsR8e6cpphZGu2qotugGLX8jb+oPTUQA
	 WkYHO2bNdKf0aG6P3QYFVZmvF3ks459vxCrEOxhZu5as+YTLAgDV4UTuCEPdTYiQY1rj8
	 KBS2g8zMKTeV9ia07Bnf+OAy/k9vCZAFAFy9MFYwdAZAOGPR4AaZFS1TKShIBAKRa+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=689Tm9O+vBEQHj/FM7Y6c1v93wlxXsLmvU6MsCP0/kA=;
	b=cxGFypGL6lPIlaCmI4PwhTaCh6Z1+4AldQqFghl/8JHnT94Tg1P6DG9DFREER4dda/oS
	 BtdBLz2mMZOCHpXvDAVYFXgLlGOwDsIO3Z68rpyMqOPG6uxjxu5ldlb5/GrCGJtmLEor3
	 3wIbZOxYz1DbwVregeYit5p92904U2UtUdzACSBVSTiXG0NOJLeYiHOij6A9f1OzsQXcw
	 /YCJrGidglp1fvfAppLOE2r6MKkumYjKpReN9yCeVPIPBxXHChv3FaBpiXIMh6bY4yyIU
	 4Vn2Q9PPuwl3EcB3ybVF+tN3NKV1brZ4gxVK3Z66UCJkR9BxxiCj5NsACeAHmscGDIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GF3ZIRbU;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F0C606A88C
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 02:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65F0C606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GF3ZIRbU
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67db89857abso2101421d50.0
        for <linux-alpha@vger.kernel.org>; Mon, 16 Nov 2026 18:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884359; x=1795489159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=689Tm9O+vBEQHj/FM7Y6c1v93wlxXsLmvU6MsCP0/kA=;
        b=GF3ZIRbU7LqrXGuYUzXiVeHsCoUZGHberWUzLzJSu4GkotszijPt0mqboO5i45yf86
         1Kpq8r8oxv/AwTrhJAaagVPXl7sUccrAFod7uS7R71tEWeAnpr8yofaRz1HBY/12skTk
         fqi5nS24DdzW46ZgmaWeIZmF1nXJz6GUQqkn2LrrX18L/z3w6Ac4EbXY0Sgt3vBRNV22
         C+eT8/iWoqrfdoKnEWXyWwQg/yZzPiNoWtRO9gk45o92lcABpkHG3x9FM8VpP49qIMaR
         WDOApUvYOZtwjvHIUdKuIZtyBE6UG5y2+QW3Z/E82tIdWqaCeakF6+Ny4iN+KyOK17TJ
         VwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884359; x=1795489159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=689Tm9O+vBEQHj/FM7Y6c1v93wlxXsLmvU6MsCP0/kA=;
        b=SSkQzLIVk4oESkYX2voDFo1cIKQe2rdSngGWS5+MucO6xNxmnZm+8xmvlDUoNsCkQX
         8XF/l201zNxXGtdRdHRgWFTSBQh9+xDya/uNH6KNUYZQfw9G3iWUbyLQ6eXEe49MhSoh
         Y/2JOZJBo2FUPoF+GFy1kJYTfzXSmbT5v4LCX9cMptgjhlrXfB1sNEBSPn2MkTAG9s07
         HkUd8Ok27tKLvkOP2iXPESG1w0VsKUztEAs0E0yGnHhCqOFkCsb9/6Oj/Rr/corWUSB+
         axxyVlSe1p3By2gmi63MeF7KQmeddZf8WptyOaWguZe8YKOfp1AkLtg2G093dbfUnC3Y
         Eu4Q==
X-Gm-Message-State: APuU4Z//pmQrwTZoVC5DuG4xQeeKeJ8P35uyw2U2Skd6r6CZgeldlDCi
	p9UhmYTpXmkyUpb87NsedrWPA2qjrytAvcLxp1hctW2F2wvz02SMSKpn
X-Gm-Gg: AZFdTZdTQTl9gzggZ9x6BUH9q9CnVeD/r9pCv4QrU7L6NBTqCjGoLgnh1oZeILUyFel
	aiVeYtDTluimfwQBE5UW+GEty4EW+2n7hnPJdosCTBzKZsBAX3+70K80woV1S+WEXVnQPNDLoSQ
	Q01ttU9BW0u1tgcmI4bNXLwbpw2prdFNEU9+LlOQviYbguFtokkgLhv5hjhi3ZQDdD7B1qX2zH5
	4IolIo2mAXwYRJTEO64BxokmXp9vWL6XmRcnI6x22aLr1L/eecmVRI51cHNSXBNdO7xdW3JH7Zo
	kfy9FI7KJ1TQJbY2Jgy8HcwLUKeuYMhdibGoGoXybml6Ih6/65Xr7jacCdPXvt6+5e7uq6z6IU3
	JJu9NlDm1pFaS8ZriIgIyuuM0vIF34QxjJNpi3yG8GaDzvQqJ1BHFL5mHWQt+tqtmWe5w3eeQyZ
	C1+pJpuplHQXTFBESI4RFo6gatk5sy/wL6a9mqqZejcksV0bUlAtTL3pqweCuku3et8DK+bFU4b
	ADEmwLRYJyhAm6Oq1C3neq7rtEmZMUyRhKkVzfbiRKWIAx2Mfdk7j34avOy+PQyi/+YezueeYk0
	RHqKKr7XiBJ4ITgskdijWgZllD55K8Srq7j7QFIDbaumlawouDvvwDyj2ZQRdVDTJNULhGacnQl
	6dqTlDoAFCZafDU1z5cJiT2pNZIIi4nNpoCoPQDOFZk84FV1gYwelsm9KUiCTnZspzmybKnYOrS
	r1NSIVG0hkVhOaIbFLyIY=
X-Received: by 2002:a05:690e:1388:b0:67d:b4ba:b4cb with SMTP id 956f58d0204a3-67db4bab988mr2441881d50.27.1794884359223;
        Mon, 16 Nov 2026 18:59:19 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dbbdb9d0csm3768907d50.1.2026.11.16.18.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:17 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:11 -0500
Subject: [PATCH v2 4/7] alpha: marvel: notify environmental events
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
Message-Id: <20261116-marvel-env-v2-4-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2087; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=DL1ALKxKn/ychnU0MAIXks8gfYB5EJCjJIeCgE+gavc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/oTdbLrVEKd2SzHxK2p4Y+zItjcnJ5wi+cfEH3Ie
 ldYdcmXjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLkmIIfhJ6OdfMbWBV
 Pm/Lue9DZq+83lhpXaC4s3sfel3V6TdlNsSg3DX7H4o4axMVKP5Q164m++1rJtef7ypVRC9/Hly
 f8VK+5ocgAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A change in the state of a sensor arrives as a system event logout
frame. Call an atomic notifier chain on each one, so that a sensor
driver can reread its sensors and tell userspace without polling.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/marvel_env.h | 5 +++++
 arch/alpha/kernel/err_marvel.c      | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm/marvel_env.h
index 16ccd2002a11..dbbf827a18ad 100644
--- a/arch/alpha/include/asm/marvel_env.h
+++ b/arch/alpha/include/asm/marvel_env.h
@@ -2,6 +2,8 @@
 #ifndef __ALPHA_MARVEL_ENV_H
 #define __ALPHA_MARVEL_ENV_H
 
+#include <linux/notifier.h>
+
 /*
  * Ask the console to refresh the environmental readings of the GCT node at
  * @offset from the start of the GCT. Returns the console status, which is 1
@@ -9,4 +11,7 @@
  */
 long marvel_cfgtree_partial_update(unsigned long offset);
 
+/* Called from machine check context on each environmental system event. */
+extern struct atomic_notifier_head marvel_env_notifier;
+
 #endif /* __ALPHA_MARVEL_ENV_H */
diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 46c521cea9a0..6e0b0aabdaca 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -17,10 +17,14 @@
 #include <asm/smp.h>
 #include <asm/err_common.h>
 #include <asm/err_ev7.h>
+#include <asm/marvel_env.h>
 
 #include "err_impl.h"
 #include "proto.h"
 
+ATOMIC_NOTIFIER_HEAD(marvel_env_notifier);
+EXPORT_SYMBOL_GPL(marvel_env_notifier);
+
 static const char *
 marvel_env_state(u16 state)
 {
@@ -82,8 +86,11 @@ marvel_process_680_frame(struct ev7_lf_subpackets *lf_subpackets, int print)
 			status = MCHK_DISPOSITION_REPORT;
 	}
 
-	if (print)
+	/* The frame is processed twice; notify on the printing pass only. */
+	if (print) {
 		marvel_print_680_frame(lf_subpackets);
+		atomic_notifier_call_chain(&marvel_env_notifier, 0, NULL);
+	}
 
 	return status;
 }

-- 
2.56.1

