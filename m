Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FB3480DF1
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277918; cv=none; b=GBFtSgAUQpvdTLM0+l0ikfavSg47C/bLI3CggGCyDu3ISY+vVSmIZdRDgMwJXY1JDn8+RcNRP0az2325Ophq7jwL0wBa2tEYXDtQHcLLxh48pJImos92k1vyaNHnBIqtZJ5Q8gNNSQonWhHeGC30eE5JbQp79KNPf1akbKrCONY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277918; c=relaxed/simple;
	bh=zu8KuPSubmuoE6ltdAxTasohyn2lxwD8t4JaCPhTGX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ReRwD6z2Uk5Id1ohoyJb253mh3/Pm1mPEjkNg/lMgZunDp61DyZSevxgbYW5On5HBedOkMMrDk/fKa0+M05VuUSiJMvscymDbwRLGI79oa45eKxvF3bugBgD24ogsX4jl/OZeqJfwCtdmO9FePOX3q3gGx20F9fp6boeN0K4ScM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fu0fD3f9; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fu0fD3f9"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-861f30636f9so1442507b3.0
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277916; x=1788882716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MdHgZtBfTREn4V8If7CDYoqsV/YDIXtFEG1CpRc92k=;
        b=fu0fD3f95LgoqKCVOCayZBI21PE6fSDU7sFjJj6HUdEFffafr8hUnGmMR4dTkgdcYe
         FKD21LHwtnzThm34nkIRhpBZ8XlO+Rgt1Hg1RoQOiX0HlDg/JxgJSTHwL/OwEMP72FMS
         BQY5c3YFz0MAYfjyPGvoh6wPlZ/926anoQTv1FzpdwEA78UPVLNc51fysHA08cC68ynA
         GzEb7Iyd1/8rwmuZ1BJtf4LkFpBoygmrLGowZTfx4PBgrmUCta7vLNW0B5tjjWgHs48V
         JuoxDAEnVl8qjTbwk4SQeZyFYpyTdfy3ApgygWrwBrR3lqKIMazbrCFPhUewffaFwrbI
         ZeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277916; x=1788882716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3MdHgZtBfTREn4V8If7CDYoqsV/YDIXtFEG1CpRc92k=;
        b=TLb0Ghuz+rA4bbFxxnfFTWfUln0ZSYv2WhFxRDXD5AVh4b3gExeZcaoP6DXqDpgCCW
         9sCjmfbKPEGHA1WxDku5ubsaprbu9TlNSEDWNKF+oJy0Db03l2TWikK43mSh120pptvN
         3X5JnOTYWmiF9OBW+l36tZHu8qzB9rsJM7kIHvPXgh3iPTUpNJCQz9GIYNp0Bv3I/zkc
         0Heab/KBfSjsL3UAVOc4z5a6GrGgdxy+xuWX8GAVzAlLeTJuCryhkhc1wET9biZU6w3N
         84hC+urKzjA4sxTbc/SzkvOI1gwWG5c3WblU30a0NIT/XJQuwAt0cN4bwx2XFxgJvOt/
         X+hw==
X-Gm-Message-State: AFuF++lQKHRQ8IlNL1+Tl5ubWCmO5ncobvoRTXZaeMPpqBg36HOKRRhG
	E9/hvglIpHkEWUW7ORhVlUq8Xy1+yhvMit68+4raJ6ftwUbx8z2dnnWQkQFJIA==
X-Gm-Gg: AYBFou2+qtHSnydar3nDLPOAFIZVQ1dgQH8H8lhD+R9MdR9pdWETs6c+pQPHEl5Q6Fl
	TBw36t+p9j5LdyP7PtKHH6cAUrPnQirXZJlIoXgpsj+erJhFnVXBTMHTPLZ+8PBS1rcLS3Z2YB6
	M8pS3fNKa6QPI/rXuJifkCkk/3sFV1B+zNKGnxPRvkKI9in0KGq6WYnAlhM+l9NDvpi+l5/+2f+
	yuQvnQhnYnGeaIfGH7rFj14VCKfFYYjMwSMpqwJzDa/dmZFdTNQKqM1brp+ivaT5Hj7wB2mPlxW
	lUItlJXcbwATzirOJn8/Xkb9na0/XPEdxIWrPQfO8x8NuVK0xIXuF6ZnxWVTwt1SIYqG5PR1yiA
	lXW1RO4ronWoPSoLR96Adq1b3yg4IeFkHwypM9pw+QzV57dlz+3fRr13geOOya0ewJBpKlHYomR
	4L5j/GdOPQvwtRqemKdNmV9XFIfCahtkD1Dw0OeurN1kReZki/I+H4sQmzfcfi10i93FIlYYcdJ
	wk9tbFX/RNkE8H8ZCmbpqhyNQ8Fx+irF15iG14i
X-Received: by 2002:a05:690e:454d:10b0:66e:542c:cb48 with SMTP id 956f58d0204a3-66e542ccd37mr7096765d50.48.1788277915671;
        Tue, 01 Sep 2026 08:51:55 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f7efc9dbfsm4424690d50.9.2026.09.01.08.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:52 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/24] alpha: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
Date: Tue,  1 Sep 2026 11:50:34 -0400
Message-ID: <46250102699dd2f07b6ee19ca58edf3a9cdfa0de.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

activate_mm() on Alpha calls __load_new_mm_context() which assigns a
new ASID and invokes PALcode swpctx. On SMP, an interrupt arriving
between the ASID update and the page table switch could see
inconsistent state. Ensure activate_mm() is called with interrupts
disabled during exec.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 827b224f2f8a..bda8443a7323 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -37,6 +37,7 @@ config ALPHA
 	select GENERIC_PCI_IOMAP
 	select AUTO_IRQ_AFFINITY if SMP
 	select GENERIC_IRQ_SHOW
+	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-- 
2.54.0

