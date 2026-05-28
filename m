Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F130566B
	for <linux-alpha@vger.kernel.org>; Thu, 28 May 2026 23:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780009678; cv=none; b=KyDwOLAF7vRPcQ5FzKX7Edj6KfnXaA/8RqYacpHGlzAoXkdum716H7HmLKEmjq6AQjG6b4gcWXK4kT5oXDcq0BLsVQZheFfhD87bziWm1K1veU7rI6qowxEg29i7fiiN2Dg6LMNuGT/BM4kDtp8sRnkq7Onw6CZQrz+vq6p/JDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780009678; c=relaxed/simple;
	bh=+4t3Gs4dNBrwz9KCzJpmkQXSngU3pbblQPUNrZVuQ5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tg6YWjEBSBjlsoQpa1Hdn4NYbmlYrWEhVeGJP5+xGmPWrvFThXJVxCDAyPHFDKM913Zw4nTzJsTCulc5nzDCdYvv9KiQOJu3IxpkjuWnmmnHZ9EgV3sjjen9mfgGAh27gEyeUV9yoqG95In6Paas2uAiGaIveFsw0q7a93bzz5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfaItyyV; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfaItyyV"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7ca947f9b00so130866017b3.0
        for <linux-alpha@vger.kernel.org>; Thu, 28 May 2026 16:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780009676; x=1780614476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EsmYLjdQXSnwyvW2KX4QOuwimq2GRxmHKitgrfKsf1E=;
        b=pfaItyyVQ3VRBPrEIMVRSoFwTEhToC5qo2g8rtcSBCqwxBqe5ymQ2M2P+SlUoR4wJ/
         3fukwAIYx7/XGalSMZSXV7Y8DB3XFwVkJBo5sJlEGc8PyQR5kH/vjLLICvxGXkVnfqKs
         Lx2O9ymxQFFKeVEY3PtgnPFC4DswO2XZ9EdJz64DKOYfGu3uFJmpM5P+y59642Sbzr+e
         HN0mTldDSYTY6qpg42/rIHE3c9HzLDCK7Zs6Yicp8egokRVi3NvcVV1MXMBb/Ire8nIu
         SpJJMfjtOfOG2xlGPx7Pb90iAZ/Bgwq1w5vF89oI05FPJUlAn+a4bVKoH2mJ9DeRqu2a
         YGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780009676; x=1780614476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsmYLjdQXSnwyvW2KX4QOuwimq2GRxmHKitgrfKsf1E=;
        b=EYTdJUHTfLPX43o2GdNAvC049NXVhT5XtKblvqEYmIcjGHVV9NcozmL2tkIKOo6DHF
         +WMN2qYw6FN28f2kine81hD8eOktvztwLHo+l27gTxBMzOth+N8PIdQE9F6fNTPYBMGV
         OovSP54E+gQ84lX17uUh0uTbnrmDelEFbFE1xRph8VoMC8nrtCAn+CWlgczyPKBpAAtQ
         r9xkA15IKFE9Onrr0F+27/qE0A3At8yuNxu+xNGIFqFX5Io2/8v5sRZ1MIGzbdQEAcL7
         3W6GFToDlKGLmAR8xD6g9l6FbEsh+w90gkSxToF7bZwx3xWr5VksEDok4hG4tjTl+AcV
         DtZA==
X-Gm-Message-State: AOJu0YxmrCLy0tOhHd45k9nONQvpCatU5T+MVEoHPJbaUQ8Ryvft1Nno
	hRsj4AoMYfpbrLe8bbnlUU4eIXugWOqoxZIVLG1MxfijG+DbAwYz4emz1gTy0uLH
X-Gm-Gg: Acq92OGrfYnTMesUY3wAYmBP37LqbPVunvgS3btUviGiCAvhaAKJb7c3uTI1gbL6h4e
	/vWAoiOJHTV5trCxocJanBOAYaLKuV664IMUTDEwihxlR7MltwZrXr5WoAcvkrb4Q887gsuWcAm
	NNRb/SfKaHEPudH01Vdogu4vzKWSICdgsYBNHeU602nJ8YlvoLGecBn92gDH7BA6gwr1j2pE6Wa
	wTHGrAeJOCfjnMpz8z+qdZy1yliHYJXEL6UjTMyCzrHCosime0o8C3pEg/yy6n7699tYhezVrjl
	6XAQ/Q1yFrozYkIVF4R/wejahuXtZiQieHKEMZly7+Ri1uS3RfcRD+17svMUTU3exI2T0j4XKo9
	FekUJjxm6w1rROjvVzfRnS5KIOMG7WsZ2pS6clC4Hy9xrGQpbOLO1uFRGmvYrAOlb/o6MRNTuer
	EDf0tVVwi49+mhVm0o2v9nnmep+M+52g1fAKwfw3+Hrpx3j9ZgoNKnki7uA4VWZ1SbvsWmiLd4N
	eRRWyIKJ9t2/zZRqfXDrMWK
X-Received: by 2002:a05:690c:e3f1:b0:7cf:a117:4ece with SMTP id 00721157ae682-7de43b55932mr3086127b3.10.1780009676141;
        Thu, 28 May 2026 16:07:56 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7de6d1f3943sm69177b3.26.2026.05.28.16.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 16:07:55 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] alpha: Use work_on_cpu() for cross-CPU RTC access
Date: Thu, 28 May 2026 19:07:50 -0400
Message-ID: <20260528230750.1840681-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smp_call_function_single() runs its callback in IPI (hardirq)
context. mc146818_set_time() and mc146818_get_time() take rtc_lock
(spinlock_t), which is a sleeping lock on PREEMPT_RT, triggering
a lockdep "Invalid wait context" splat on Marvel SMP.

work_on_cpu() runs the callback in a kthread (process) context,
which can acquire sleeping locks.

Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/rtc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git ./arch/alpha/kernel/rtc.c ./arch/alpha/kernel/rtc.c
index cfdf90bc8b3f..4ad5846a1d71 100644
--- ./arch/alpha/kernel/rtc.c
+++ ./arch/alpha/kernel/rtc.c
@@ -15,6 +15,7 @@
 #include <linux/bcd.h>
 #include <linux/rtc.h>
 #include <linux/platform_device.h>
+#include <linux/workqueue.h>
 
 #include "proto.h"
 
@@ -155,11 +156,12 @@ union remote_data {
 	long retval;
 };
 
-static void
+static long
 do_remote_read(void *data)
 {
 	union remote_data *x = data;
 	x->retval = alpha_rtc_read_time(NULL, x->tm);
+	return 0;
 }
 
 static int
@@ -168,17 +170,18 @@ remote_read_time(struct device *dev, struct rtc_time *tm)
 	union remote_data x;
 	if (smp_processor_id() != boot_cpuid) {
 		x.tm = tm;
-		smp_call_function_single(boot_cpuid, do_remote_read, &x, 1);
+		work_on_cpu(boot_cpuid, do_remote_read, &x);
 		return x.retval;
 	}
 	return alpha_rtc_read_time(NULL, tm);
 }
 
-static void
+static long
 do_remote_set(void *data)
 {
 	union remote_data *x = data;
 	x->retval = alpha_rtc_set_time(NULL, x->tm);
+	return 0;
 }
 
 static int
@@ -187,7 +190,7 @@ remote_set_time(struct device *dev, struct rtc_time *tm)
 	union remote_data x;
 	if (smp_processor_id() != boot_cpuid) {
 		x.tm = tm;
-		smp_call_function_single(boot_cpuid, do_remote_set, &x, 1);
+		work_on_cpu(boot_cpuid, do_remote_set, &x);
 		return x.retval;
 	}
 	return alpha_rtc_set_time(NULL, tm);
-- 
2.53.0

