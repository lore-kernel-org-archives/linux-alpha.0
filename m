Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CBD42A159
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 20:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786393723; cv=none; b=BtW1I8oQ9pgvyUChzRkb/BvF2knjY4hLgsmIQ8msKkMQ55pI1ToP4IlE6SO2Ij2tPi+3hikwgD94jK9UjHJp+Yc3lg1zFeBTYW1dieo9lvfv2w6ZGPU8LI7HvAHfmwmh09BAxXceKCbApYFFrpiRGmabi0G/7eLwPUEOCZfTqHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786393723; c=relaxed/simple;
	bh=vtv1tMWdbKnZqo0yWrkZYjCGs36Cnpyg0x9FhtFbTT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDPTYWTdRi3zVMVSnN+PURRzDBN404X/9lZu7tsry6tN2EL2Ml88m4b5s1HMy/em8wtgJkEdN7Yj1aQYpcKo8Kz3tC88/XCm+GpLa3IavBUpGqfGaq3eMOh/UlKcfWd4Xitc6Ecm8MxAXpuysH/PHS7Q9S8V8CdCG70CoqYZWcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OevLOEju; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OevLOEju"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81ee6b2da98so32433887b3.3
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 13:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786393719; x=1786998519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1xlNC4igzw4eN/fnv+cxxiQQoIssMMJKb2EEAIS/7g=;
        b=OevLOEjuMXUTMAauFayUmHVg0vIjy8LygAoVQh5HrQi30e5yfDW8iOdrMYbcBfKqlz
         UFPXSnB4abu8CsKP9eJjoc8Rqtaznc+GOy0+pp64Kfcv/UiW7h0DArwPqX1hYIw6Kham
         nmkDCJhECvvf/d3TPsoDJTKUGQW7iF+6DezHUmEqotSskZI2mvlC4lYSBfb3lkqFur9r
         KlQubtiohYZlXetsCFylkB2dJEUEpoxQHF6ReV9G9ClU2JOg+tWo4AsVe3OF4Jeh7rCm
         /9D7yEDO+ngpqLuSydUOiEf1uOBcgbMoSLzBkPysH3qrkFi2i5olXXSCS8QboF1fQ4HK
         opgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786393719; x=1786998519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1xlNC4igzw4eN/fnv+cxxiQQoIssMMJKb2EEAIS/7g=;
        b=BvS9LPGHw3gjvDiDgnvrrXPwDcL7rlaLmY5roFa8LDpbb25cSPm5GZztqPNMuqnH1B
         nzYAxPydaYQsBrt1solJVdCZ8PzebnzqSBJgfwQQiGk9J+xF/LLhHS93bSxPHK3UTgaY
         kdbtnReJ/grk1o+pet9hyThKu3slGdJ3HSaLfn6XQrEUGTtB1d3RaH49xEusHV2womgn
         vGvLaeWkJBmdnE1UKPOP5bZIMRed2lDPYlp+3sob1MTkl/XAN8ORAONBV4PBPYHTUrLf
         Z9bbzf2sLdZS4O9/n3+/FpCaSF2isRKOPg1hqr2DOExD/8WP1KmwnIvigzDZu3itjarJ
         VusA==
X-Gm-Message-State: AOJu0Yz6K86ePeg32IPNPC56z9Sh6XHQ/nWXJTQ9nfWEjsb4T/MlylwZ
	5E+y/TRMwU614k5mb09SqwKgukGeG7C5lJ/KoOplEdyc7gHxllwwpDAjHIKf6owxt+g=
X-Gm-Gg: AR+sD11huRs4RWhKbjV4a0lPIQaVl1wnWj9WJlGxOLXVIiT3vwtJmow6UtejU/eYhOx
	hwHaTL2ncrJQtw+p1FLpzGlFYDUI34LyzXp3LHTjEPwiA8xYqXIO11M72pwDe3xMjNdC+iJmKKb
	OlXe1c8gdhol3VvFe8xE5R/3KiuYlSqW2OSB0QXfc36mnFuIBU1XqgmLmtetVsDjjbgk5auk1QT
	Hk6XTGYgZ1fc8pkx09hxMuT2mEnp5khoWLMO9ZbnRx8f7nFjTgz1Fq8HiNP1CX2/f0O5Skwh31O
	M9yV/nuq6TfujWAVjjjltUiEH35pSbhkz0QvRnu8t7Sso2ZHbsO/aTNTXGY1ePXOYz3H3BvxmVx
	TgE49VVZ4iKTx4qyJBxg3e2ySrW+RZwqCKlc01ReLb9fNLSbmlPfre6+033h/Bg6IVLTSzrLT86
	9k18ZztnYHEHZTq7b9ra1R74fNWcPXnrH3q3/w8a7CSnAU9rJlQxiQ8RNF8wDyVDAbs9Q=
X-Received: by 2002:a05:690c:6f02:b0:820:dd2:3c84 with SMTP id 00721157ae682-825778a524fmr162684357b3.22.1786393719227;
        Mon, 10 Aug 2026 13:28:39 -0700 (PDT)
Received: from localhost ([67.197.119.189])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f577de2esm62738577b3.31.2026.08.10.13.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 13:28:38 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] alpha: annotate hardirqs-off on IPL 7 interrupt entry
Date: Mon, 10 Aug 2026 16:28:35 -0400
Message-ID: <20260810202835.3592833-2-mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810202835.3592833-1-mattst88@gmail.com>
References: <20260810202835.3592833-1-mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_entInt() opens with local_irq_disable(), which with
CONFIG_TRACE_IRQFLAGS only calls trace_hardirqs_off() if interrupts were
not already off:

	#define local_irq_disable()				\
		do {						\
			bool was_disabled = raw_irqs_disabled();\
			raw_local_irq_disable();		\
			if (!was_disabled)			\
				trace_hardirqs_off();		\
		} while (0)

On alpha raw_irqs_disabled() is (rdps() & 7) == IPL_MAX, i.e. IPL 7.
PALcode raises PS.IPL to the level of the interrupt before entInt runs,
so for an IPL 7 entry - a processor machine check (vector 0x660) or a
system event (vector 0x680), both IPL_MCHECK == IPL_MAX - the gate is
already true and the annotation is skipped.  lockdep keeps whatever
hardirq state the interrupted context had.  If that context had
interrupts enabled, lockdep believes they are still enabled for the
duration of the handler, and every lockdep_assert_irqs_disabled() in the
interrupt path fires:

  WARNING: kernel/context_tracking.c:346 at ct_irq_enter+0xc4/0xd0, CPU#0: swapper/0/0
  [...]
  [<fffffc0001ef74d4>] ct_irq_enter+0xc4/0xd0
  [<fffffc000105ebd0>] irq_enter+0x20/0x50
  [<fffffc000103707c>] do_entInt+0x1dc/0x2e0
  [<fffffc0001031d60>] ret_from_exception+0x0/0x10

  irq event stamp: 735356346
  hardirqs last  enabled at (735356346): trace_hardirqs_on+0x68/0x220
  hardirqs last disabled at (735356345): do_idle+0xf0/0x270

The stamps show the problem directly: the most recent event is the
enable from the interrupted idle loop, and do_entInt() recorded no
disable at all.  ct_irq_exit() warns the same way on the way out.

Ordinary device interrupts arrive at IPL 3-5 and IPIs and performance
counter interrupts at IPL 6, so was_disabled is false for them and the
annotation happens normally.  Only the two IPL 7 vectors are affected,
which is why this needs an environmental event to show up.

Take the hardware IPL out of the decision and drive the annotation from
lockdep's own state instead.

This corrects the annotation only.  An IPL 7 event can also interrupt a
region that has legitimately disabled interrupts, where irq_enter() and
irq_exit() are not the right primitives and NMI semantics are needed;
that is a larger change and is left alone here.

Tested on an AlphaServer ES47 (Marvel/EV7) by injecting system events
through the system management path: fifteen injections, idle and under
load, with no splat.  The same injection on a freshly booted kernel
without this change reproduces both warnings.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/irq_alpha.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/irq_alpha.c b/arch/alpha/kernel/irq_alpha.c
index cb4d58079d83..014c1e98e922 100644
--- a/arch/alpha/kernel/irq_alpha.c
+++ b/arch/alpha/kernel/irq_alpha.c
@@ -52,8 +52,19 @@ do_entInt(unsigned long type, unsigned long vector,
 	 * Note that there is no matching local_irq_enable() due to
 	 * severe problems with RTI at IPL0 and some MILO PALcode
 	 * (namely LX164).
+	 *
+	 * PALcode has already raised PS.IPL to the level of the interrupt
+	 * being delivered.  For an IPL 7 entry - a machine check or a system
+	 * event - that is IPL_MAX, which is what arch_irqs_disabled() tests
+	 * for, so local_irq_disable() would decide interrupts were already
+	 * off and skip trace_hardirqs_off().  lockdep would then spend the
+	 * whole handler believing interrupts are enabled.  Drive the
+	 * annotation from lockdep's own state rather than the hardware IPL.
 	 */
-	local_irq_disable();
+	raw_local_irq_disable();
+	if (lockdep_hardirqs_enabled())
+		trace_hardirqs_off();
+
 	old_regs = set_irq_regs(regs);
 
 	switch (type) {
-- 
2.54.0

