Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818169;
	b=xRUVojHtiyZpLPI+uUgXCKrCb6a+0nX9MplA0aXjiS8r3mSgTCJskkHQ/DYvdaqWRQVA
	 2m0cdEQ9EzBXHeKTaW3be/z7FdeSMdEUwQMkCcXHSm5UQErPuoFGs1Ys4fJncEzSsDm62
	 P+QsD94vRwD9hfzBlRcZ1a6ZnHcGUkFWard/Grm8cEtON0V+SSsZVtD9/fl694CDg3Qgp
	 aPoJO+wNFqAmxLZBjep9gnzqIWFOBfQOhh8PalqAB61rmsjHL3XG0TnJjllkyUQrNv52k
	 ET8+v8C6ExsstcDv6tUvSO1LzC2EYtsH/APsdh/eV4jtELU1qoFU8K+m4W4KovyRKow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=w3DDS5VxfGrOk4pk1sx0ix9DF6R6TCLK6co5C/H8U0g=;
	b=kXwS4p0KbSaFAD3HiXJRX5SWc922PnrIW+mjXvIadOU/fjCjYP5OjWxcc8oC42o40ipe
	 Eqch3fq8p0KQJ9KpIEvnPgwAEQHffDiBW/EfB3uZDjU7lq0oYaLxglfSrY7IUPQLKI50A
	 f8D7ljtNQsCXBAv30ExPgQ/FYeUN5ePgmIXxCSMGd3DjsUIQ8UamyWLqgDDPslXaz0M/5
	 rbPWBCOX9FIXg15iTLFk+SityPaBwGTLK2pIhPDbbSFt8HIQYxaTUxIrkCaT7wU6Nyju8
	 FiIjxnjSg1yN1bRvP6fVO2si8cYn07Zdl8MF3o0rG2eRECyD9AvqTwRSH1Zaz1AgaXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W8MRFYf0;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B398A6082BFB
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B398A6082BFB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W8MRFYf0
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b308fca7c3so11049867b3.2
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818168; x=1794422968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w3DDS5VxfGrOk4pk1sx0ix9DF6R6TCLK6co5C/H8U0g=;
        b=W8MRFYf0VWsmAa88+3a65HtE3Hh6Ufrv3XV+IZjOWPRNRjwrAN0TK5PtCCWy0EeBWf
         msMYhFbYXnuFsCe4G6pSqt9P7H0sQgVHL0aJnRcQ9tzeOP9RFkkErjh/wg0chudt0Vc+
         xcly1vFE2QI8NfI7Smifq4mGU10b57+LPVyclIdZNjqpVqX+eVXK8Jb3QgXuNpLASWQL
         m23pZR9gbxMWRHZCQXm9Pc+BWdPuhll19PedOH9Rf5jEfGFibJ3CgszKolbgkYJqI4O5
         Ye9ZRQECvHMjw/aSnmwrtVK8C/TRExgkHp0n9P09K45L3evRP3hzrPAXXMflp8b46UuV
         8dVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818168; x=1794422968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w3DDS5VxfGrOk4pk1sx0ix9DF6R6TCLK6co5C/H8U0g=;
        b=lUfmf8ppMCmuUg1EwlaqOSgBcsW6Rk9CMm6vtvwEb7tvZ5Gybs+Z79zLPYgfdajkgn
         a7JsjXEMhyVdv2KC8/fjEkEC94P7nVGqoGidYxwQ9uIr+lCyIXEGApTl9lLUgtoaW8Jt
         E2JxFGL4zgOS3GtPk4JQNht/HAAAVXUQaVIsXGo9oQh8ZYz0q2Ac3uuIrHdNg50GmUv0
         SsgvyJMDWY6gJFmNsP31wuwoNDhTcWwRZvY8ghZ+J6JS/qXRksuBJJI5Rzm+d0aR856I
         TE3QKs1RA0UdlcnOw2UDlXtH56IheFT1Sap6ugIcYaYYhw2aj5VLBXAyRZunn7c6nq5l
         TrRg==
X-Gm-Message-State: APuU4Z9s2Qjoevi1ZBMWFju6IsAv/iJoYhkCz51E6Dcs9yfX0cXJG96m
	pd+tLsXJlVBxShaxoCPMCQeXqMagN+LvnbugxcloPPwCF+coqtzUAMbB
X-Gm-Gg: AYBFou0y/AZmyUABLKX0TvW3WMQI8mGWiuZMd5NRezmcI4RVQFigZTaY+9nft2z+R1K
	Q08K3YFGyWkG9iaZ5EZrXsSpkOf2X426edLT+Q5qADokhGSHVGcQ1ufjX+7YMBBtx+NOkdO1HVm
	IweXJIwVjA5HDjp8PYsVM8o457M7iAXnUl9+HupOCvSv/eKeSHP7JlYDh6YDJE6lK1bR3ZXoy+g
	9ubMZ99I3D4WUD0eh/UE8UOz23Q+s2yMEcBDSJtow30Ntca7uu9/8Xr4gUAE5eD9rZqOulejWBL
	PbD/kjFc7KQ2pIOS/Xfiu7ixvTC43z0wDqM3ZgpYuY6PxRnH2e/u0v2kEwk34YxHNam9KwhG6E3
	KJzCh6vOOlin0UlkOJ4GgjQ9eTOtYikP284oSANEQJAyvVBGALWE1aGrtdWd/ITyvntsaUw6gH9
	ztnZc3vlDbpppQvO/CKUeRajHVWPisfFbtrv/dZPHnM+w9EOE7nz8cBZDsAvn6CA1NvhAqYnume
	OULgrhmEuplKa0f3/JhIdrl/ps9Ms9bI3SWK54cmKfvfnGt6DAt5REnuaZJT8JiMm/0AbYbsPcg
	Spszb2cTyDPtMUsxwGwkiQXLDN5VgbS/NqxOSeWIJpaShYtlyuze0KK4XaNXRZTLE8U224fzs/X
	qQegRCR3awSOI1p7J+KSKS7bZN5ZRRs0=
X-Received: by 2002:a05:690c:c513:b0:8b1:e7c:cdf1 with SMTP id 00721157ae682-8b2b67224fdmr113642617b3.30.1793818167397;
        Wed, 04 Nov 2026 10:49:27 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3099ae415sm24128967b3.35.2026.11.04.10.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:26 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:17 -0500
Subject: [PATCH v6 10/13] alpha/perf: report the data source of ProfileMe
 memory accesses
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
Message-Id: <20261104-alpha-profileme-v6-10-63362e9290a3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5788; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=pyzx6//j2OdqKwRssVgKvGUx0hM35DoDJu9pQTTqBO4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe16l+84t1KFV4o8R41loz//zpjPj8reWKr1Ou/rocM
 i3+J3t2x0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFxj1crIsHZJkuAJ/Q
 t5hT/fvja05j8hznZNd+kznyczW3/6rV7ldIyRof1V1PvYT/5rTxcGqQU9eNmRdoqzjPv7a84gQ
 56eO1+PcgIA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Whether a ProfileMe sample's memory access missed the DTB is only in the
PERF_SAMPLE_RAW data, as a DTB miss trap.

Set PERF_SAMPLE_DATA_SRC for the samples of memory instructions, so that
the memory sort keys see them. One that trapped on a DTB miss gets an L1
miss in mem_dtlb. PALcode fills the DTB, so one that retired without
that trap hit it, and gets an L1 hit. mem_op comes from the opcode, as
I_STAT does not say whether the access was a load or a store. A load
into $31 or $f31 is a prefetch, except for ldq_u, a UNOP that is left
out. Samples that fall back to the interrupted PC get none.

On an EV7, a loop that loads one word from each page of 64 MB in random
order had as many DTB hit samples on the load as misses: the miss trap
aborts the load, and its refetch hits. A prefetch into $31 takes the
same trap, and its samples are reported as PFETCH misses and hits.

I_STAT[TRP] is ignored for an instruction killed before it was mapped. On
an EV7, TRP and MIS were seen set for killed instructions that are not
even branches.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/wrperfmon.h | 12 ++++++
 arch/alpha/kernel/perf_event.c     | 86 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/wrperfmon.h
index 7fbbfd74926a..dc24c7cb45db 100644
--- a/arch/alpha/include/asm/wrperfmon.h
+++ b/arch/alpha/include/asm/wrperfmon.h
@@ -100,6 +100,18 @@
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
+#define EV67_PCTR_VAL (1UL<<1)
+#define EV67_PCTR_PM_KILLED_BM (1UL<<26)
 
 /* PMPC bits 63:2 hold the profiled PC. Bit 0 set means a PALmode address. */
 #define EV67_PMPC_PAL (1UL<<0)
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index c9ab40ff76ad..0723e1042145 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -20,6 +20,7 @@
 #include <linux/overflow.h>
 #include <linux/prandom.h>
 #include <linux/sched/task_stack.h>
+#include <linux/uaccess.h>
 
 #include <asm/hwrpb.h>
 #include <linux/atomic.h>
@@ -1053,6 +1054,88 @@ static void alpha_profileme_set_regs_user(struct perf_event *event,
 				  sizeof(u64);
 }
 
+/* TRP, and MIS with it, are stale for an insn killed before it was mapped. */
+static bool alpha_profileme_trp(unsigned long i_stat, unsigned long pctr_ctl)
+{
+	return !(pctr_ctl & EV67_PCTR_PM_KILLED_BM) && (i_stat & EV67_I_STAT_TRP);
+}
+
+/* What the memory instruction at pc does, or PERF_MEM_OP_NA. */
+static u64 alpha_profileme_mem_op(unsigned long pc)
+{
+	u32 insn;
+	bool r31;
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
+	/* A load into $31 or $f31 is a prefetch, except for ldq_u: a UNOP. */
+	r31 = ((insn >> 21) & 0x1f) == 31;
+
+	switch (insn >> 26) {
+	case 0x0b:					/* ldq_u */
+		return r31 ? PERF_MEM_OP_NA : PERF_MEM_OP_LOAD;
+	case 0x0a: case 0x0c:				/* ldbu, ldwu */
+	case 0x20: case 0x21: case 0x22: case 0x23:	/* ldf, ldg, lds, ldt */
+	case 0x28: case 0x29:				/* ldl, ldq */
+		return r31 ? PERF_MEM_OP_PFETCH : PERF_MEM_OP_LOAD;
+	case 0x2a: case 0x2b:				/* ldl_l, ldq_l */
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
+/*
+ * Report the DTB access of a memory instruction. PALcode fills the DTB, so
+ * one that retired without a DTB miss trap hit it.
+ */
+static void alpha_profileme_data_src(struct perf_sample_data *data,
+				     unsigned long pc, unsigned long i_stat,
+				     unsigned long pctr_ctl)
+{
+	u64 op, dtlb;
+
+	if (alpha_profileme_trp(i_stat, pctr_ctl)) {
+		if (i_stat & EV67_I_STAT_MIS)
+			return;
+		switch ((i_stat >> EV67_I_STAT_TRAP_TYPE_SHIFT) &
+			EV67_I_STAT_TRAP_TYPE_MASK) {
+		case EV67_TRAP_DTB_SINGLE:
+		case EV67_TRAP_DTB_DOUBLE_3:
+		case EV67_TRAP_DTB_DOUBLE_4:
+			dtlb = PERF_MEM_TLB_L1 | PERF_MEM_TLB_MISS;
+			break;
+		default:
+			return;
+		}
+		op = alpha_profileme_mem_op(pc);
+	} else if (!(pctr_ctl & EV67_PCTR_PM_KILLED_BM) &&
+		   (pctr_ctl & EV67_PCTR_VAL)) {
+		dtlb = PERF_MEM_TLB_L1 | PERF_MEM_TLB_HIT;
+		op = alpha_profileme_mem_op(pc);
+		if (op == PERF_MEM_OP_NA)
+			return;
+	} else {
+		return;
+	}
+
+	data->data_src.val = PERF_MEM_NA;
+	data->data_src.mem_op = op;
+	data->data_src.mem_dtlb = dtlb;
+	data->sample_flags |= PERF_SAMPLE_DATA_SRC;
+}
+
 /*
  * Handle the close of a ProfileMe window on PCTR0.
  *
@@ -1168,6 +1251,9 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 		data.sample_flags |= PERF_SAMPLE_WEIGHT_TYPE;
 	}
 
+	if (exact && (event->attr.sample_type & PERF_SAMPLE_DATA_SRC))
+		alpha_profileme_data_src(&data, pc, i_stat, pctr_ctl);
+
 	if (!alpha_perf_event_set_period(event, hwc, 0))
 		return;
 

-- 
2.55.0

