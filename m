Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818173;
	b=Zwv8CnOn8xuwwzscuRCorwzCROLd4qJK/SsH1Xax7aowVU5gMIm0Dr0cFlDYOYnbmVqc
	 PrRmKF6UPoeGFIeO8w5OCQOCM25mQ8f/3S3mmSSxBJ8Ny5ooqYQq9G8tAMW+uorZH64Dw
	 CIiD8ro0bQE5W2ySsvwZNOTvS+ft0SVGCuqpzuSv7r/r+dccNfRDSq6+QVpCvmFfGMANc
	 IfpOmOgwBmCFEQtWKIrlcj+TPBfNJkPBoe5J1G2ziSZUL5fdnYEsZD2KhbHt7AZThe90W
	 aXTcL2Rm+FYWPVOp2jm2Z+jxaIj3yEVh4PuntxtnckxEat2JR/w3vmglShrJxmdOcKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=3yRFzoSASbTaPFKGmXJ3DuxTiEoC5V7x+OkyMhZfPEw=;
	b=iDwLUfF6OE4+TL/OClgWoeP++c/LgwWeoK8vFpovYEaijUsMdMncbXB6H2mvHBWeiEKU
	 Xa7BcVnpYu1/CJqhsQFJ9n9LuMhGlg15SWsUAGt5//6ucYed1cmB0wIT/0M448Nmufo7D
	 3LZQRNiPGpW3Vn8Z7M0Ni1CQrMeIs9k2sJFYD3qrMjMcByEtgvoEgmWkK+OWxpLqg9ZkH
	 YMV6KuDC7OPylu0Psko1i3MxvKcsYlRtO3tdfWZsmCewkYsBAybNeWwdFwRytGfjQ0CUP
	 XdDlz9uRg2Cmj3X/aXphqcwQbhE17MDu8aUdFHITGjOZ3yZxL2XrWPMX0EWjPFQFj1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nse9iesL;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1399E608362B
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1399E608362B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nse9iesL
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b309147589so11289087b3.1
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818172; x=1794422972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3yRFzoSASbTaPFKGmXJ3DuxTiEoC5V7x+OkyMhZfPEw=;
        b=nse9iesLNcVnO666FJ0bxh8JLaR/ys5aAbkHom8NtlJn6dsf4IpAS01l3fzN8K+eX8
         sIw88vVZs6o4YGVUQe37AeOEXsjJFQj8Yt3KYqGv0pzE4o0TEHKLlHPMiAt7+WSY98hh
         Buo5kucR2J4eKjt1iN650FP7F03g68r/hsQ2kBWyddXOds4gITB8qIfwGjsjuETedZXP
         vofMBzf/3BjBZooJAwju+KzKxGzAazBL5mzY2wQSnTGPdOixF9FWIWFUMvu9nUWbXEE5
         jv2F6NQO+cIcLIH7SOd2JBzcDrv8slh0yU3QD61ddVSsiCzNVtF10GbPh8VQ0aGgTwaY
         wkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818172; x=1794422972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yRFzoSASbTaPFKGmXJ3DuxTiEoC5V7x+OkyMhZfPEw=;
        b=eQ0t3kKv9EHFV3k94kGsFv8JQS1FA3jL+w/NDmbbupB6kQvabgfNaIoZvhSHfRrZ12
         nSIXX8JgEJhwf1mvjeTANe2VnBZj//seLBHg447m2Izilyg0LD8I4d49mDogXaqgQAWE
         O8/SXM/cwbCod2ldbZvVeWvGoQPnh8EBhckutMq6aBOaDTjeAGRUMrTNyP2CoGnACTLC
         fGGPMQ9y+pQIZFh7O1IKtgFsWaJRI2BSsvWy+f+ejte2VGDsjWnXb6OyohJ7THoJxRkH
         KxR85cseVC0awpIwQ0b20BgQSgtK5vth6Fb1lHp2NqYpvGonPLmkAGO2mAX/Riub21W0
         oBhw==
X-Gm-Message-State: APuU4Z/sxdugdG2xfRqQUMUdGfNThozHs1pfMpVtlmsPKrJMELwi3HDl
	f8L8UsQVXja8nsWnHPhmnFdCcBkA2it1ZGnpz8fEaulIw02Z00TwIklj
X-Gm-Gg: AYBFou3k9Dw9GRxgVeknh8swbigmfh1DkRv06J9/8lhrIFVvCvKgcMKrn9nFjMw/VSd
	6zeCKD4fh6MSOAhGkFaNzTV0l/POHy/Y+Egn1m5V3nvWWl5gxrBCAlJvEiA1OFb5TX3AIj+wdZg
	0phKV7b1N0haxDecW7G9R8WFGNzi27FlcsY1zv7KsSZVwT4mxH6dTNQz0/CGRFd99DeK3PMw6VK
	GlVniR5/WD6LdUIcdxyBZImv9kYJPLVJ/IQWFsE853OGuILy599mkyRVKOrhnh9U16VoXm1rPyF
	EnOq0JT0idAPB3Uz3jIf5VaLxzmC88uau9ZxRkOz8dbzeWebMjlCXnyNODcWFrgFbS9ccy10X1O
	qIjAWnZoX5A/8iHqtcp/fz1vAEd4EHC+BOWk6xdkK1RcR7cbZ3nFMN2zMU1YEpwu8S0fwmpVM/Z
	8UE/2+6aFbE8Prb9mXkagtXAtUpSRT+2vS3PO1v1AQFPFKC2O7GEuHT54dJHo/0PODfrdHEuDh4
	W2Wn46wLshjjnycH/J0wt/kTA5aH6x7y0NYwO2ZCGfj8r5Z/Wdw86TfmtlSpdER86KsbWzwagXu
	i6Q5JEnbqzfniylCGOvDq5eXOBKQoBQ0j1pCTG/mdicb0biRq4EQBZr8bBg4VfGrC/7hHYTik3W
	W5L1rKaY+8/c=
X-Received: by 2002:a05:690c:6609:b0:8ae:b617:7138 with SMTP id 00721157ae682-8b2b6769adamr130667497b3.49.1793818171822;
        Wed, 04 Nov 2026 10:49:31 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309959603sm24730847b3.24.2026.11.04.10.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:31 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:20 -0500
Subject: [PATCH v6 13/13] alpha/perf: honor exclude_user and exclude_kernel
 for ProfileMe events
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
Message-Id: <20261104-alpha-profileme-v6-13-63362e9290a3@gmail.com>
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4372; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=5F+ywxZShd6lL0yYM9T6SyVwg0AsZTHmRlFxszcsIno=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe16kK3Kr3yL7459zDS9EGPMxcznddNwi8+9B/8NNU8
 /PxDducOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaa79sY/oqeSAzVZv
 sy91e3jtKBC14HZ9reUzP58djGJrZI2+X5Lx2Gf4b1q9lfxO7wcL/w+MXTcGVO2ZA95Z5T53d9e
 2tc29hdwQ0A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The PMU sets PERF_PMU_CAP_NO_EXCLUDE, as the counters count in every
mode. perf record then fails for unprivileged users: at the default
perf_event_paranoid of 2, the tool sets exclude_kernel for them.

A ProfileMe sample says which mode the profiled instruction ran in, so
the excluded samples can be dropped, as AMD IBS does with swfilt. Do
that for ProfileMe events, counting PALmode as kernel, and ignore
exclude_hv, as there is no hypervisor. A sample that falls back to the
interrupted PC is dropped if either its PC or the profiled instruction
is in an excluded mode. Aggregate events cannot tell, so event_init
now rejects their exclude bits itself, along with exclude_idle,
exclude_guest and exclude_host for all events.

The event count, and what PCTR1 counted during a window, still include
the excluded modes, as they do for IBS.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 47 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 7e34eac0ea47..c75d204076fa 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -832,6 +832,18 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EINVAL;
 	hwc->flags = profileme ? ALPHA_PERF_FLAG_PROFILEME : 0;
 
+	/*
+	 * The counters count in every mode, but ProfileMe samples say which
+	 * mode the profiled instruction ran in, so those that are excluded can
+	 * be dropped. PALmode counts as kernel, and exclude_hv is ignored, as
+	 * there is no hypervisor.
+	 */
+	if (attr->exclude_idle || attr->exclude_guest || attr->exclude_host)
+		return -EINVAL;
+	if (!profileme &&
+	    (attr->exclude_user || attr->exclude_kernel || attr->exclude_hv))
+		return -EINVAL;
+
 	if (attr->config1 & ~ALPHA_PERF_CONFIG1_FILTERS)
 		return -EINVAL;
 	if (attr->config1 && !profileme)
@@ -983,7 +995,6 @@ static struct pmu pmu = {
 	.stop		= alpha_pmu_stop,
 	.read		= alpha_pmu_read,
 	.attr_groups	= ev67_attr_groups,
-	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 };
 
 
@@ -1140,6 +1151,24 @@ static u64 alpha_profileme_status(unsigned long i_stat,
 	return status;
 }
 
+/*
+ * Whether exclude_user or exclude_kernel rules out a sample of the profiled
+ * instruction at pmpc, reported at pc. A PALmode PMPC counts as kernel. The
+ * two differ only when the sample falls back to the interrupted PC, and
+ * such a sample is then dropped if either mode is excluded.
+ */
+static bool alpha_profileme_excluded(struct perf_event *event,
+				     unsigned long pmpc, unsigned long pc)
+{
+	bool pm_user = !(pmpc & EV67_PMPC_PAL) &&
+		       (pmpc & EV67_PMPC_PC_MASK) < TASK_SIZE;
+	bool user = pc < TASK_SIZE;
+
+	if (event->attr.exclude_user && (pm_user || user))
+		return true;
+	return event->attr.exclude_kernel && !(pm_user && user);
+}
+
 /* What the memory instruction at pc does, or PERF_MEM_OP_NA. */
 static u64 alpha_profileme_mem_op(unsigned long pc)
 {
@@ -1250,14 +1279,6 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 		local64_add(ovr, &hwc->period_left);
 	}
 
-	/* A dropped sample still counts, for throttling and frequency mode. */
-	if ((alpha_profileme_status(i_stat, pctr_ctl, pmpc) & hwc->config) !=
-	    hwc->config) {
-		if (alpha_perf_event_set_period(event, hwc, 0))
-			perf_event_account_interrupt(event);
-		return;
-	}
-
 	/*
 	 * Attribute the sample to the profiled instruction rather than to
 	 * wherever the interrupt landed. perf takes the sample's mode,
@@ -1303,6 +1324,14 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 		memset(pm_regs, 0, sizeof(*pm_regs));
 	}
 
+	/* A dropped sample still counts, for throttling and frequency mode. */
+	if ((alpha_profileme_status(i_stat, pctr_ctl, pmpc) & hwc->config) !=
+	    hwc->config || alpha_profileme_excluded(event, pmpc, pc)) {
+		if (alpha_perf_event_set_period(event, hwc, 0))
+			perf_event_account_interrupt(event);
+		return;
+	}
+
 	perf_sample_data_init(&data, 0, hwc->last_period);
 	if (pc_only)
 		alpha_profileme_drop_regs(event, &data, PERF_SAMPLE_REGS_USER |

-- 
2.55.0

