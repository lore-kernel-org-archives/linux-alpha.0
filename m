Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72696353A69
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 20:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786393719; cv=none; b=XVa1rgVZZKISvEefowIYS2ZH0sDFwjayCcJVPl+eyO7JsU8YcUh/F+BpCIxA7wvgPm26z/9t8hjqNFs83FuTM/EIN36d4x0DrDOWEK5oPXuGDncsgZsA+M6u+DeI7LlPHGgtRE7raU7cYfDRr9j8w7DTcEll4uzFGvDlOKIQD7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786393719; c=relaxed/simple;
	bh=9C9TgfXvkBzp6XYopWkeSHxNp6MGu7RsULLPbYf/Sfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G9+rc/2gcb5zdXJk1uBUOYqr5mz9UaZt8ftOrsjDZpWHXZrOCS6IEcFrKiWuC6eJvTrPRPNcyqkH4cKixD8D9+ZonudzmOthnoXbsGguDnh6+buDgE2ZTCnTSDFLfewWo6cY+AsIFiQEhnTXMAr69pgnjELLyDYG8Enxrv4zHA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RprA09/n; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RprA09/n"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6688acd1a51so65232d50.3
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 13:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786393717; x=1786998517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+DPdTtuH5XAk98BcCWRfP1NphG14hosZAKK3q89iAc=;
        b=RprA09/nfs+uWHRW0p56tJNoP99vLWIhzaqPzsksaXU9eJv9E2wtoPepfC5g9fR4Zi
         yMGzy6TP5xMv1OQBjw/z0dQjOqVlddBlBe1uNltSPeQD5JYqEwZ3CN2J1iFPlR4+Tul0
         /Sb8ibjwsI4QU/fq2MHvP19qLl5E8d8I+j71yo8JXafsqhU/IonpgiQcKCeNXfzKaYZe
         EQj/LzeAY8XUrE1ifUUT2lS2cFJwNQ/U3S4AcIMLchP+rykGSlSq71kNRes161XC2isK
         ZCI1r3mrGM5xdqSl+rLAQHC1Dhj0BcGkHmSjpPkJNpoDHq7oomYmpX4tZYKdSvHQ89qS
         JbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786393717; x=1786998517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+DPdTtuH5XAk98BcCWRfP1NphG14hosZAKK3q89iAc=;
        b=sXmX7imyA4FpNPSB7i9TbBA9FIxTHfW5/PvfI6QF8bnaZ85QeTdov6QNLp1FBTDOYw
         L6nuKTz3Wxjd6mUYjcPGpXDmXe2GvfQagCLLkJ6QIcHUaAd6X8vn05PXPAy89eVJrm7u
         /8vSnABvkt9cdfudHa2CI5jnoWsxbOkWPgYSsfQ9Ht7bB3YH83auIkiARcSla1r+5N9e
         ZeHr/5cUtnefTg/oMSiHaADFHA8WyZ3XUAcho1Gmiq/+WadXvaLncr89w9OkEJ/pW+Ll
         wWhu2sxk2xghGV5KgVj6eS5u1kRrKlddUm/JfxhzdJ7ycscEsb24FNH2VB2sPnTfngcl
         XuWw==
X-Gm-Message-State: AOJu0YxXBJFtu9H/j9xj6F4aEKWXCL8SQDvNOMTFNCh6Jq282uUHjstl
	+kK1iKY9GXXsXFWB8m9cDSyLYDsdNJ98oPQ9Oitf2oKAI3KECkRK69HA+VHxzqfaSlI=
X-Gm-Gg: AR+sD12qeIQpbgqxDkWWTNVPz2GLWyrWQsUW5Nw06yzmG30eDwiqZNzyx0fMp1MyNjF
	OmTidPpu9bFGFtyo5f/B3RW1y4gm99YxMqEDrBM2ZM+ZNAM/Ls6qyjPEKeqOSIcpHYSHdAC+pns
	5/7H4NHiD3ljNPdli6xmlk2tj3X6QiMuwRGPzCXAojXI1Nv62b0LC/qEDF6Z5EC2CAAS5WY/3zY
	2FAm9AZizUYgelD4yeT9Ci4jLaRSIM0oTNueT0xWx/hbUQyGiaCTNnEmB4tRSZ+TGO8fS/zQgBA
	+la5oiaSoJD50rP7ZPNgC9aioqSggloqfm4WcNbuzsG63kMfhe7LraW5V3wmxe2hUfkJejcb6bV
	3gjpZ19y4p+oTJc3g3zw+iZwu0VuIOO0SGWo580p5E1rdVaNuaWxuV8GXTnGfYlmjn58JnC6vrx
	zDJAPtemPHvRF1kJXo8K6KaeerClHC6/Wg9Q2h0uTrANdY1ZAGCjCpKsaL
X-Received: by 2002:a05:690e:488a:b0:667:5cde:6f36 with SMTP id 956f58d0204a3-6699ac4cafbmr19992520d50.33.1786393717369;
        Mon, 10 Aug 2026 13:28:37 -0700 (PDT)
Received: from localhost ([67.197.119.189])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acafbbd4csm7020690d50.17.2026.08.10.13.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 13:28:36 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] alpha: run the remote RTC access in a worker, not an IPI callback
Date: Mon, 10 Aug 2026 16:28:34 -0400
Message-ID: <20260810202835.3592833-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Marvel the CMOS clock is only reachable from the boot cpu, so
remote_read_time() and remote_set_time() bounce the access there with
smp_call_function_single(), whose callback runs in hard interrupt
context.

alpha_rtc_read_time() calls mc146818_get_time() with a 10 ms timeout.
That waits out the RTC update cycle in mc146818_avoid_UIP(), which drops
rtc_lock and udelay()s 100 us at a time until the update completes or
the timeout expires:

	for (i = 0; UIP_RECHECK_LOOPS_MS(i) < timeout; i++) {
		spin_lock_irqsave(&rtc_lock, flags);
		...
		if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
			spin_unlock_irqrestore(&rtc_lock, flags);
			udelay(UIP_RECHECK_DELAY);
			continue;
		}

So a clock read from a non-boot cpu can spin for up to 10 ms in hard
interrupt context on the boot cpu, while the cpu that sent the request
spins in smp_call_function_single() waiting for it to finish.

mc146818_set_time() does not poll, but it takes rtc_lock too, and
rtc_lock is a spinlock_t.  Only raw spinlocks may be taken in hard
interrupt context, so lockdep reports the write path as soon as a
non-boot cpu sets the clock:

  [ BUG: Invalid wait context ]
  -----------------------------
  swapper/0/0 is trying to lock:
  fffffc0003690470 (rtc_lock){....}-{3:3}, at: mc146818_set_time+0x74/0x450
  other info that might help us debug this:
  context-{2:2}
  no locks held by swapper/0/0.
  stack backtrace:
  CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.2.0-rc1 #1 NONE
  Trace:
  [<fffffc000102ebb0>] dump_stack+0x28/0x44
  [<fffffc000110efcc>] __lock_acquire+0xb0c/0x1060
  [<fffffc000110f5f0>] lock_acquire.part.0+0xd0/0x300
  [...]
  [<fffffc0001b0d834>] mc146818_set_time+0x74/0x450
  [<fffffc0001f090cc>] _raw_spin_lock_irqsave+0x7c/0xc0
  [<fffffc0001042f90>] do_remote_set+0x90/0xc0
  [<fffffc000119c1a4>] __flush_smp_call_function_queue+0x314/0x5c0
  [<fffffc000119c474>] generic_smp_call_function_single_interrupt+0x24/0x40
  [<fffffc000103d984>] handle_ipi+0xa4/0x230
  [<fffffc0001037044>] do_entInt+0x1a4/0x2e0

The rtc class ops are always called from process context, so there is no
reason to run the access from an interrupt at all.  Use work_on_cpu() to
run it in a worker on the boot cpu.  Alpha does not support cpu hotplug,
so the boot cpu cannot go offline while the work is pending.

Tested on an AlphaServer ES47 (Marvel/EV7): hwclock read and write
pinned to a non-boot cpu, twenty times, with no splat.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/rtc.c | 37 ++++++++++++-------------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/arch/alpha/kernel/rtc.c b/arch/alpha/kernel/rtc.c
index cfdf90bc8b3f..9e7d714ef6f8 100644
--- a/arch/alpha/kernel/rtc.c
+++ b/arch/alpha/kernel/rtc.c
@@ -15,6 +15,7 @@
 #include <linux/bcd.h>
 #include <linux/rtc.h>
 #include <linux/platform_device.h>
+#include <linux/workqueue.h>
 
 #include "proto.h"
 
@@ -142,54 +143,40 @@ static const struct rtc_class_ops alpha_rtc_ops = {
 };
 
 /*
- * Similarly, except do the actual CMOS access on the boot cpu only.
- * This requires marshalling the data across an interprocessor call.
+ * Similarly, except do the actual CMOS access on the boot cpu only.  The
+ * access polls for the RTC update cycle and takes rtc_lock, so run it in a
+ * worker on that cpu rather than from an interprocessor interrupt.
  */
 
 #if defined(CONFIG_SMP) && \
     (defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_MARVEL))
 # define HAVE_REMOTE_RTC 1
 
-union remote_data {
-	struct rtc_time *tm;
-	long retval;
-};
-
-static void
+static long
 do_remote_read(void *data)
 {
-	union remote_data *x = data;
-	x->retval = alpha_rtc_read_time(NULL, x->tm);
+	return alpha_rtc_read_time(NULL, data);
 }
 
 static int
 remote_read_time(struct device *dev, struct rtc_time *tm)
 {
-	union remote_data x;
-	if (smp_processor_id() != boot_cpuid) {
-		x.tm = tm;
-		smp_call_function_single(boot_cpuid, do_remote_read, &x, 1);
-		return x.retval;
-	}
+	if (smp_processor_id() != boot_cpuid)
+		return work_on_cpu(boot_cpuid, do_remote_read, tm);
 	return alpha_rtc_read_time(NULL, tm);
 }
 
-static void
+static long
 do_remote_set(void *data)
 {
-	union remote_data *x = data;
-	x->retval = alpha_rtc_set_time(NULL, x->tm);
+	return alpha_rtc_set_time(NULL, data);
 }
 
 static int
 remote_set_time(struct device *dev, struct rtc_time *tm)
 {
-	union remote_data x;
-	if (smp_processor_id() != boot_cpuid) {
-		x.tm = tm;
-		smp_call_function_single(boot_cpuid, do_remote_set, &x, 1);
-		return x.retval;
-	}
+	if (smp_processor_id() != boot_cpuid)
+		return work_on_cpu(boot_cpuid, do_remote_set, tm);
 	return alpha_rtc_set_time(NULL, tm);
 }
 
-- 
2.54.0

