Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738260;
	b=vF86WHEy06P4CRNzFq+92yz5Mnoeps4I/yHu6QwUq0T2zbtJLQ+yQKyibgZX5p27ZuFb
	 uW2Ha7tdcp0a+bDGYe/AlOQN7p6Y0MIsIWSxjI2zgIPjRjKAndVZmdjKyOMPRvh0Z09jd
	 LgyBDXdXSH/TrLSWWUlYzI2LJMQ1VOAYwAOTR+T3BODKLYIT04tdfdLsXviDOgD1GWoh2
	 1r6O3FZyd2KN/lhxy0NrrWrp+HhlVU/M2xweYQDc74TrYR2tpnchP1zqLW3tndOoam6e+
	 YOQXqrpn64tha+hQ6C7derxiuriEKCBvAJfwooXEg+VScM9JCbUiuPBgjuO/U4c8v4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
	b=w9mO+dGEqL0CKHkxoL1CpkQYEPCcSRSb/WsxDC6KTwrZHF3YemEQ9UvsdWi2SvTk/k/q
	 Xu59KVa+5wqmGx8D1h9pO3T6TEb7PzvOIvUhkZ4lICIYOJwBx1w4b1Trn6ns/tXg/D4GW
	 LGfYFee6H9D3gHqsuOC47llUctP4r89keVMnXnXJSlDC5GegR93xmbVHSmWuXbfdJHkjt
	 GjjlDdHzgG0yR4YTPycmHz5CefQ/grA7MMjB/3cJPnQ7dJxowGjHSDDq/EyBVyC5/NsRI
	 izZTD5C43l4/v0DSfNDlY6TR+U6STVtE9NTHdVK0pAGYxYWeXxARxEdXN/nXT6Dq/tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G6WsBRKD;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF15D606A333
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 20:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF15D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G6WsBRKD
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b09e07e149so98237b3.1
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 12:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738259; x=1794343059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
        b=G6WsBRKDefsIufqDF2PgOWTttnEsYB2O+D3e24zE6JmeBPruimavahu5TJQyhcuNQF
         TA/o7n8WMqsIkYCeXTtFXZQSIDdBgri03yFDPfbQkiEatp7WXaZqDIdH9NF86AqPaNCN
         G7j8qzycEaJT4ySI7xFe7IVrhsHFVTmuGxvuHAslrC2GvyzSWpvZQYkk052nXTO9UGv4
         5Uaq53mOTGaL8htrPpNleU3wI8J1bRXzfZ8qBFk/TeDHiE6o8+3Vt0f+sInxx9IXlqNT
         5DATrVLeICErb+hVkuIiDfQ770Mlo/2VPaTWhlQmwXfKB3zDT8AL/u93LNt37XAxRxNk
         AbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738259; x=1794343059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
        b=Y+TzZ2oVg8RPVXwepv9OIpro9oUdD+1hMZi9pFoudK50ISwPkL4eB3ZugeAh7i8OEB
         +gz4xivkTHI1dsT5Db2P0p9ScjKJIHGFkUk6Wc3zx/FW0tdWDFjfgzqh20XumfKCegyY
         ASoKJesIlBc7nqR96vUykx6zwWGlJNbfP76gGhSS1FyE3v46teTfYlok/Vq4jwy1T4ni
         LLmb8Ll28tpYFIWt8AlFwHTLXgc71N1xoIg9rT6Pz5svbt+A6cdNauGok6kUKlW/WVG7
         S+rUdGXmJRrGuCiRbPMBSStzujMEbVWYLugbxY1TMJivn4dAGxmTNee0o2MMQLy6AxA4
         fmpA==
X-Gm-Message-State: APuU4Z+VxgPIM9TXzvX+Ft2QJK40aNpG6qX38u5SRj5mS+3CVzlh3lHx
	ojhRLTzKh5kxjEvlDhPM8f8aGV4N8EbrDxr2egJhCxH9r67MVCM7pJRrML8ADg==
X-Gm-Gg: AYBFou0lKcGgw9sD9gQETiB2tueRh2j6vE9bdlRtWjMZhhtxPsElZRJSaChjJPSJV4u
	6JagKwZg4JB0eQX876ThY2VmtEk85MTur+v9404Mp9z6gYU5Sr55rqekT+fR4NOgWODBLLJiCg2
	PAoQgmz4FsxQdaE5OVso5sCURQTlVP7gDoWXvX0aJZ3SdnR/Y96bbZHKefwBhE6/jjFWVMsAPj1
	diOaQX+hr9UWJHOxcn6ckbOKnWj82AOvDtflhuVEMNZE7/OxBKRZmJteiYYgXTXYSBLMDR0pgYj
	SgL2pW8Q7bVjPuPh+0OvoPBoLuBT25nlTPDC8EGkuDGInqjhl/nda+L4QgIUdzn9UQfPPHhjw/R
	K24/JEPIc8WBbNt5h2/I2IepKLReCoXsMafAJx5S971NXIp21DXS1WtN4PpPcKZv+4lcOWpjrgv
	wMOy+z++XZmRsldkypc4sJjZisKe3xX6XGt/3+NFnGcm0daRFFqX+WzkebJtBHIg1PVcsZXFgxP
	Lmnhkua055G1/6R5AOqAgKOJCAMSmQmc1KlqEdDwT8Rie7u7PTktYrLdQjsDmTwg4Q35G6+omtp
	Hz+ggTo6iYMNV2a9UdpOJOT1sDtCZdZ61eI355e5XBjVj0ojN4LqFaX3n/8knPUIv00chKer8q9
	LHFZbahXyXp54DP5FdJlUI/+AX07VBpc=
X-Received: by 2002:a05:690c:e208:10b0:8ab:41a5:63c with SMTP id 00721157ae682-8b2b67d34ddmr54698687b3.108.1793738258573;
        Tue, 03 Nov 2026 12:37:38 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bd1672sm4539577b3.43.2026.11.03.12.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:37:37 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 03 Nov 2026 15:37:34 -0500
Subject: [PATCH v5 01/11] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
 logging options call
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
Message-Id: <20261103-alpha-profileme-v5-1-bbe3937fbf3a@gmail.com>
References: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
In-Reply-To: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=IGfq8dWu2iMEFoz3MC34tYu6sOJyy2DqaUpgqZ45fio=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeufEtDZiVNCO80aFT6zGzWkp0iursVqYlvAfcGAW+9
 b9m+SDU8ZGFQYyLYaaYIkvcekWWWW07lvqclv4FM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RvEQOT0Gjczi4tLUIt20giKHvPySxJLM/LxivfyC1LyC9AK9tMy0koyM/KLiVKARenmpJaa
 ujm5GhgYmlo4WZk4WjqYmzs5Ohk5ujo7Ork5GluYmBs6WjiauluYMXJwCMNf8nsbwV6iH6cYXXr
 Oi8HwXt+c3+TLlLiUs2JKqseVSHf9kt/3M3xn++776HK9v/jnu+uSAM2/mrD7nNqP0p6zznbLND
 Te2SZmlsQEA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

alpha_pmu_enable() passes EV67_PCTR_MODE_AGGREGATE to
PERFMON_CMD_LOGGING_OPTIONS. That constant is the counting mode bit for
PCTR_CTL, which belongs in the PERFMON_CMD_DESIRED_EVENTS argument. The
logging options call takes a flag in bit 0 where 0 means "count all
processes". It works only because EV67_PCTR_MODE_AGGREGATE happens to be
0.

Table E-18 of the Alpha Architecture Reference Manual gives bit 0 the
opposite sense, but the PALcode in the ES40 and ES47 firmware agrees
with the above: it sets I_CTL[SPCE], which enables counting for all
processes, unless bit 0 is set. Linux never sets the PME bit in the
PCB, so if 0 meant "selected processes only", nothing would be counted.

Add a name for that argument and pass it instead. No functional change.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/wrperfmon.h | 2 ++
 arch/alpha/kernel/perf_event.c     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/wrperfmon.h
index c97b82a1f7db..1fa9bc813263 100644
--- a/arch/alpha/include/asm/wrperfmon.h
+++ b/arch/alpha/include/asm/wrperfmon.h
@@ -23,6 +23,8 @@
 #define PERFMON_CMD_I_STAT 8
 #define PERFMON_CMD_PMPC 9
 
+/* PERFMON_CMD_LOGGING_OPTIONS arguments */
+#define PERFMON_CMD_LOGGING_ALL 0
 
 /* EV5/EV56/PCA56 Counters */
 #define EV5_PCTR_0 (1UL<<0)
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..2d9383425357 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -728,7 +728,7 @@ static void alpha_pmu_enable(struct pmu *pmu)
 		maybe_change_configuration(cpuc);
 
 		/* Start counting the desired events. */
-		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, EV67_PCTR_MODE_AGGREGATE);
+		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, PERFMON_CMD_LOGGING_ALL);
 		wrperfmon(PERFMON_CMD_DESIRED_EVENTS, cpuc->config);
 		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
 	}

-- 
2.55.0

