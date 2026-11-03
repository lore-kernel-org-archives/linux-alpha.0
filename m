Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738279;
	b=N5ODb6a/QhY2O0uu47qyEQMjzSGvv0Og8DSiQCloCIy13itNO9zz+BkRPAUNAwAmOipo
	 6Yh2t8Gcp2NJpEqCu/Lj/D7CGFDvM8ezE9dI6weFWvBQvEERhiAwFeU67Y2yvmnAbx77w
	 4L2JFhgdq77Dt8PGJnJCNBGXL99pi7wJcTILb4K8x13Hz+j5lAiv+eX5y2nVVFKqrUWNS
	 KDdQDqT5MEitjEIGELOXDRN/kPVUCune2QeO0IzIGu9DVek5ZYjvewmlYohsNUeRF7XZJ
	 LllrM5IVe7bMUVT3RpdrWLm4ff5lYp58amqfY/oH05UzDgniT3tx8Rj31I0/hC+TxUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+7f/U9bbjwoOVmJVDcG5X7lMyLUMSgLL+Ij4BWsRihI=;
	b=mCGmSeSddb6s/9K0MK24TXrCNZQ76dMsyNo8kMoCKlHyzN3FuTmuedpmIbubvTrizWdR
	 eSRtJJEepwUxnF9lv328yu0GoCo5PFDW794/IQRl8nvmPrXgKv12EsBKvmaWiQEeBbxCC
	 YKNFl4eydmiKHyHPI6ybrI5LY+2u//VtX+c6SJTlepqrFqwV8hrgg4t/k97UXdSrLEYVR
	 SabkxP9egCI0JBi7CpiSHTVz93I9n8tnjOcpXkk0HQGdsThoXlQ/zWMiRjlsTmYJ7Cs5a
	 GV4KYno6NJZIKzVJN9LqLqV0/QmnYbSe5RyWCsy4pv7csgLwFBsEjG+JyNPh4YzZV2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVyTUZuv;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CA0606EE9A
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 20:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41CA0606EE9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVyTUZuv
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67be6030c9fso57736d50.3
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 12:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738272; x=1794343072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+7f/U9bbjwoOVmJVDcG5X7lMyLUMSgLL+Ij4BWsRihI=;
        b=EVyTUZuv6YkiiZ+uIbijHQq2io6l6U4ec+XZ4dsDdcwYqxkqO6TdawujTUdtjivS/o
         0Oi88XBRzYjEeBgJrrmmHu1kzgvZXIV0FFfmsQX1WRkgmDH7QjlS1+Cr1+/1XGectDcC
         XjSs4P9S1NJfNu5j49VxegGAp7XWSo9yRVyw4wePRxnHHARbHSDn/ctb9yRE2QiBIp7x
         p5OI58mDNbEXswpUnM6Xs6CZeXRDTINAouAT/+DfH0PuJEcA7iz7orlTTvfgQaGqqHwp
         0dE5RX2h8B9coN7ylqlCij5z/GklSkdVBMMDTKfMOvIim4WJlWoIhoqAT6Q+SbQksvAJ
         TGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738272; x=1794343072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+7f/U9bbjwoOVmJVDcG5X7lMyLUMSgLL+Ij4BWsRihI=;
        b=BTKY2MLaWwFCx2WPXwFpy/iVfWErZjT63oeXBNKSNdP9QOUH/R/UKl0hl6kfL7bzJm
         Is6PQavlGt6CnxuNTueAn9OA46AEOrBSxSLF/CUfGDSOLc86B/Z5UgsUaYtvGZV688vz
         uaSsxiYo0EsKTBMR6BU1sLBmGy0QwwhBtWcqfsl+tka+mV4dUMR8LTWK73HOUOzrkXZ8
         6DHll45sFxFgugZ3PVP3+s5DgUjcR2F+i8SCS6h60WW3Qt6pm35SWW6VlVaBSdpzXdKO
         p/JUUd69jDMz/udGC8RwC9iZU6NIODBMcvoh+ZRCP81mepjq8smMYZGbS2VVL8I92l22
         6sJQ==
X-Gm-Message-State: APuU4Z/U72bIkVt3EyCcn7DBXiwdlJzvlZY6FaHtSIHaKuvi1Fl2FgGO
	LUkwPa0+rKZxi4VNfLD0727Tsmy1dNqmx1yiIYnYpbgeWG6TKG9sj72NmCGUmg==
X-Gm-Gg: AYBFou0MZ62rkzFXF4vJ8LUYbs79nxYccsRmjioaJIQzO+rI8x9R6DGSMMpfQK6Us3Z
	xle3elpmJJdEFss16umfccaPMv9sk8AYGIySHoMlLmi2BShN2pqh1ATEhJoApgxQ52N8ArFfH5K
	meFDlJfn/zF/V4nM37WsgyDLCYq8TCLEHaEldMytGI3B1KZQo3ykpeeimw9677b/CEgBvtz+JtT
	sIT/Q5f7NkpCMyjad4NtGQn/BsaEoqSglLzLklMv6Tbd/MjvJTLNfzpGxxx0qUgwx+/Uxqgvbt4
	RvVuS1ITcdigVObzllQHjfSidiOZO0WpaiQl/PDTB8CFkubP8Gmtp/KLgGuHYwSFI0lqpWlQZOj
	nvyWKlh8sCxuNG85FcFsfOJhreROT1WvseqkBh31WzUlh37JeCk6TujreKgg8Y9UievrSKFURMd
	wJSc55fY1C5Josz6r85vSRDnKG/fN+0kVBwF3LNAodkA4Dy/5vdzha/1V4oXqtmoTjjg7nFZa4Z
	FU2h7XBn752/6osKbaVcEUW7gB8ZIPUZu2pXDLDOc/k0ytGf8U60e3kV+g+YdE9JbA7flVUtifE
	mx3fPRa8aXnEFWRXvC8dso//vENdqUKkISSuvVWI2itDhcsLHE2ZzSosZKEoZ7ZHPCHkXfoTlKs
	6eKHfDBfM89U=
X-Received: by 2002:a05:690e:43d4:b0:679:c86f:cf6b with SMTP id 956f58d0204a3-67ba506edcfmr7459500d50.72.1793738272335;
        Tue, 03 Nov 2026 12:37:52 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee285be7sm143757d50.16.2026.11.03.12.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:37:51 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 03 Nov 2026 15:37:42 -0500
Subject: [PATCH v5 09/11] alpha/perf: report the data source of ProfileMe
 DTB misses
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
Message-Id: <20261103-alpha-profileme-v5-9-bbe3937fbf3a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4260; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=ThdyPtCDGcliaCjOAS0KHbzlPZhBU/4z3/FVVxSxIz4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeufFZ3HF8uKFXOPbU6aAJYtv+xfUr318VUznpfEuiy
 o143vKjHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHPNA0+G/4FfFGplYt
 /GbxfdfbFXcfmstgtGC1quzpSdzLW3TdBY0Ijhf3TubYM3RjJphlOLlv+7X339b7DMbK6F35+He
 udsWjb9BCMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A ProfileMe sample whose instruction trapped on a DTB miss identifies a
memory access that missed the DTB, but only in the PERF_SAMPLE_RAW data.

Set PERF_SAMPLE_DATA_SRC for those samples, so that the memory sort keys
see them: mem_dtlb is an L1 miss, and mem_op comes from the opcode, as
I_STAT does not say whether the access was a load or a store. Samples
that fall back to the interrupted PC get none.

I_STAT[TRP] is ignored for an instruction killed before it was mapped. On
an EV7, TRP and MIS were seen set for killed instructions that are not
even branches.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/wrperfmon.h | 11 ++++++++
 arch/alpha/kernel/perf_event.c     | 51 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/wrperfmon.h
index 7fbbfd74926a..489b3e073a32 100644
--- a/arch/alpha/include/asm/wrperfmon.h
+++ b/arch/alpha/include/asm/wrperfmon.h
@@ -100,6 +100,17 @@
 /* ProfileMe status, from the EV67/EV68 Hardware Reference Manuals. */
 #define EV67_I_STAT_OVR_SHIFT 30
 #define EV67_I_STAT_OVR_MASK 0x7UL
+#define EV67_I_STAT_TRAP_TYPE_SHIFT 34
+#define EV67_I_STAT_TRAP_TYPE_MASK 0xfUL
+#define EV67_I_STAT_TRP (1UL<<39)
+#define EV67_I_STAT_MIS (1UL<<40)
+
+/* I_STAT[TRAP_TYPE] values */
+#define EV67_TRAP_DTB_DOUBLE_3 2
+#define EV67_TRAP_DTB_DOUBLE_4 3
+#define EV67_TRAP_DTB_SINGLE 6
+
+#define EV67_PCTR_PM_KILLED_BM (1UL<<26)
 
 /* PMPC bits 63:2 hold the profiled PC. Bit 0 set means a PALmode address. */
 #define EV67_PMPC_PAL (1UL<<0)
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index c2c367b51617..7f53aea261b0 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -20,6 +20,7 @@
 #include <linux/overflow.h>
 #include <linux/prandom.h>
 #include <linux/sched/task_stack.h>
+#include <linux/uaccess.h>
 
 #include <asm/hwrpb.h>
 #include <linux/atomic.h>
@@ -1015,6 +1016,39 @@ static void alpha_profileme_set_regs_user(struct perf_event *event,
 				  sizeof(u64);
 }
 
+/* TRP, and MIS with it, are stale for an insn killed before it was mapped. */
+static bool alpha_profileme_trp(unsigned long i_stat, unsigned long pctr_ctl)
+{
+	return !(pctr_ctl & EV67_PCTR_PM_KILLED_BM) && (i_stat & EV67_I_STAT_TRP);
+}
+
+static u64 alpha_profileme_mem_op(unsigned long pc)
+{
+	u32 insn;
+
+	if (pc < TASK_SIZE) {
+		if (copy_from_user_nofault(&insn, (const void __user *)pc,
+					   sizeof(insn)))
+			return PERF_MEM_OP_NA;
+	} else if (copy_from_kernel_nofault(&insn, (const void *)pc,
+					    sizeof(insn))) {
+		return PERF_MEM_OP_NA;
+	}
+
+	switch (insn >> 26) {
+	case 0x0a: case 0x0b: case 0x0c:		/* ldbu, ldq_u, ldwu */
+	case 0x20: case 0x21: case 0x22: case 0x23:	/* ldf, ldg, lds, ldt */
+	case 0x28: case 0x29: case 0x2a: case 0x2b:	/* ldl, ldq, ldl_l, ldq_l */
+		return PERF_MEM_OP_LOAD;
+	case 0x0d: case 0x0e: case 0x0f:		/* stw, stb, stq_u */
+	case 0x24: case 0x25: case 0x26: case 0x27:	/* stf, stg, sts, stt */
+	case 0x2c: case 0x2d: case 0x2e: case 0x2f:	/* stl, stq, stl_c, stq_c */
+		return PERF_MEM_OP_STORE;
+	default:
+		return PERF_MEM_OP_NA;
+	}
+}
+
 /*
  * Handle the close of a ProfileMe window on PCTR0.
  *
@@ -1130,6 +1164,23 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 		data.sample_flags |= PERF_SAMPLE_WEIGHT_TYPE;
 	}
 
+	if (exact && (event->attr.sample_type & PERF_SAMPLE_DATA_SRC) &&
+	    alpha_profileme_trp(i_stat, pctr_ctl) &&
+	    !(i_stat & EV67_I_STAT_MIS)) {
+		switch ((i_stat >> EV67_I_STAT_TRAP_TYPE_SHIFT) &
+			EV67_I_STAT_TRAP_TYPE_MASK) {
+		case EV67_TRAP_DTB_SINGLE:
+		case EV67_TRAP_DTB_DOUBLE_3:
+		case EV67_TRAP_DTB_DOUBLE_4:
+			data.data_src.val = PERF_MEM_NA;
+			data.data_src.mem_op = alpha_profileme_mem_op(pc);
+			data.data_src.mem_dtlb = PERF_MEM_TLB_L1 |
+						 PERF_MEM_TLB_MISS;
+			data.sample_flags |= PERF_SAMPLE_DATA_SRC;
+			break;
+		}
+	}
+
 	if (!alpha_perf_event_set_period(event, hwc, 0))
 		return;
 

-- 
2.55.0

