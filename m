Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE3B392C20
	for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 01:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202177; cv=none; b=V+K+K9VpPxV7TyJ6D5x3Q1/M6uiFHXXLFynEbI24Fw+Pkz3ADYF4q1qa0LqZFkGaqugTr7vYSRNQlXlDINDKNt/t9cIxboWTo730g5g3+aB/78yw6I/u+LDluI5Wl4/XnqVx4FmfNqalCBZ4YoYgFuok/0qUJBFxKG0qXZDG7cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202177; c=relaxed/simple;
	bh=Wz3AynSRouhjdOCDf3ZwA/+MVGmp61qIW0ierhI97O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImiyfSe5mV6R3tlnanaWGr0Gs6P/aPP0gV3k0JZ69eQPNtWlT23ohdT/yBnZSO30lEYTWJojPNLTIsnJIQf13IO/0VJss/f1NCfBBqORW5zZm25aWa7PbP2Uc/MdOfDnOfBOwC7rAxc65fm4Ny3urpXpiXs4gElIVjDyzGqZxtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il3L/+7I; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il3L/+7I"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ad98c3fb15so4226487b3.2
        for <linux-alpha@vger.kernel.org>; Fri, 16 Oct 2026 18:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792202174; x=1792806974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UaqrgWMwy8tCpgosdqPhUPyluySo43hO1tIzzayAGmQ=;
        b=il3L/+7I7mxcfA2VvtNp+Jf+OvDkvjfA2HjoQm2XTSdD2tkB6Rh+bRZ1cozRDmuDja
         KJpsrehU8XvBPvfyAJJDB81GbXLb18c/k7uRc8Wb87RI2BSWKhcu/GQZf0bEnbbMrrCu
         6iXLBB5cq6oWufex4z5NC0C08oxlxmJ7U1zWuAOWSnb/fzMUv7zgh9qFPMHxDYlPvgOh
         jzIGBAU+03/PLFmcNatsACOf0fcBjKzNPk0XkHhxfRp9sOzHHnG5UBKNE7ITK7dmRl+K
         wR8qsoRP8sRuiqWHZW5qXvlrndWG2jy5NkVHzCqLOPTTj00OSGOFZ4D94wQf2m2C0LYl
         FCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792202174; x=1792806974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaqrgWMwy8tCpgosdqPhUPyluySo43hO1tIzzayAGmQ=;
        b=rnSj+DU9NeeMUruPik1Q3X+xVojhQY3FzQm6dX5vcB6rC7i0Vs8tFaE0IA+m8JVPmv
         cb/nF26sYOjV7sj+xqtCA3S4eKOhxylMkoZTIZSKXvPR8PsY+KCC7yH8wFSBuR0FCzO2
         8LWcAilQMjckfagMvBYKzQkMKjkzubK0RvY6gCMhd/xf15oK88DspeWAzgYyfoQnMDE8
         JkxJ+Qx4qGMidqlMk05snhWYhT4t72UL4aADHGId1qK/b85bignijT8zvatY9OuUO2+8
         +/QvHfwpATP3UmVL9i/ez+GYH7q1Ro3gbXqKlo6gG92SBc4my5r0sv+DRpvuHr2YIKIu
         yuDA==
X-Gm-Message-State: AFq9FYLmjBmlGIYICcVc6OyORp0ZAQ+kg7zXogHcOvwfJiHxXJKnjMDN
	526UkBZjx4MtqwqETvQJ9goTp5kSJEgQPfjAmNFxJroAY5AGMwr+ueO3
X-Gm-Gg: AYBFou3hUlFAGcP/nIeZyJsu0dpZbig7KVGqVUNN0jJrkVJJaWYvu48es8c6xfhyQXx
	QWy+dU1ojy8WA3w5+6KXWFCvL2qPePh/M8Lcr6Xvs29b7F3orbJpmWPz2FoyJw5zcl3eERO9u16
	3pP6FMwQBz0YKcQgWMsV6vrUMX6raaX5GYb8AZViuLdKHXkOhcK7vffri+NtSg7BI36dwze8zzD
	AcA+tT3FT4M2//47rPI4hjyIStOzMhX+GhrHYJ3wI4zoMerhPJ4LSpwXFXaT+F1NVBmpO5CyPP4
	GTj1HaVMdDQlsV9Rd8dud5gSCML7E9G9j+NYKm5h1SWJqfdpFGCy3nasgg4OYi75f/TrWYv6DVB
	er2+pT8Yx5rK5sCtG6HyNfEQIeO+OKO3htGTWTqNfaccRJiVGlb7ntyDDimveAAAsTCfih63Q1n
	YVq6h1oYtgZC2mGF4WPq++OZBGTvr1qS9+rNsOmAqg4s3LisZgaO5zCXlUfAe55HjrbZMHR5Uus
	8BQQVcUDpgzwwpEDGyfWibpSftzo3nt28JHtxlMLWsi1eo1QP6czj6DEW7ArFVq86ehjfgRVGgY
	Tkj8DWdY6/taO9U3VW04SQ12Jxjg
X-Received: by 2002:a05:690c:6087:b0:8af:511e:3b11 with SMTP id 00721157ae682-8b0f21eadb4mr6904497b3.48.1792202174247;
        Fri, 16 Oct 2026 18:56:14 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e590f2b0sm16451427b3.32.2026.10.16.18.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:56:12 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 21:55:49 -0400
Subject: [PATCH v2 3/5] alpha: use user_stack_pointer() in KSTK_ESP() and
 dump_elf_thread()
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-alpha-perf-regs-v3-v2-3-17654742226a@gmail.com>
References: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
In-Reply-To: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Ian Rogers <irogers@google.com>, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Wz3AynSRouhjdOCDf3ZwA/+MVGmp61qIW0ierhI97O4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIuXV18oaedwXBtcNY/PU7ZgKh3l60cBdk2iay4Iudgv
 OkJ332Wjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLkmnYeR4e+2bUnzM4
 v8Feeqlt+s8DNP0IyQ03RvC3j369Ff4yc3mBkZdtYfW9l3r164yKCWw/lqS/eTvUU7frZzbxKyf
 2CyIr6KEQA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Both open-code the same PCB lookup.

Assisted-by: Claude:claude-opus-5-5
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Acked-by: Ian Rogers <irogers@google.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/processor.h | 3 +--
 arch/alpha/kernel/process.c        | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
index c461a26d47b3..73251cd671e0 100644
--- a/arch/alpha/include/asm/processor.h
+++ b/arch/alpha/include/asm/processor.h
@@ -43,8 +43,7 @@ unsigned long __get_wchan(struct task_struct *p);
 
 #define KSTK_EIP(tsk) (task_pt_regs(tsk)->pc)
 
-#define KSTK_ESP(tsk) \
-  ((tsk) == current ? rdusp() : task_thread_info(tsk)->pcb.usp)
+#define KSTK_ESP(tsk) user_stack_pointer(task_pt_regs(tsk))
 
 #define cpu_relax()	barrier()
 
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 06522451f018..7861c9e767b7 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -318,7 +318,7 @@ dump_elf_thread(elf_greg_t *dest, struct pt_regs *pt, struct thread_info *ti)
 	dest[27] = pt->r27;
 	dest[28] = pt->r28;
 	dest[29] = pt->gp;
-	dest[30] = ti == current_thread_info() ? rdusp() : ti->pcb.usp;
+	dest[30] = user_stack_pointer(pt);
 	dest[31] = pt->pc;
 
 	/* Once upon a time this was the PS value.  Which is stupid

-- 
2.55.0

