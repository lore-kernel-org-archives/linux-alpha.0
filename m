Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333044;
	b=oyjRdeeGBnLUL7ZqyV2CRwR2Im/pljnpUBM8yV711rM7EOWIE14yCsM1jZkjGgh3DHiA
	 up+IIJBCW/UGHs7Ln/6fw16os8qkA4YZuFPuZu+AvbcLzMLSvRm0c+fBc/sfUKeuAMWwa
	 81A7JrRmjUDFYZlXv8SrQba3E2z+nhRQRXDtSpZI3TspNOAO1QTzfdx/B2DW1ruUJFJcx
	 h0lZqikjmyosprSx/n6dt9QCZ4L1czBHmu+Nf56WxzO5JRi281T60Wk5N4umUc5xbh47d
	 XRTf/4f5W5HxfZHJM2E6UzOBZ8+i23qcH+YYrzJ1gGfcdcDqVZmkJtIsnoa4n4NCpvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=IGEY7xpKT7BuVDZ492nljPbapi/lh/U71wUYUhMFTsE=;
	b=nKDYs8AwnnsBLCvcBjdxQAucAQ+xhGVlN9fyN2QJikzjuX6SbMbQvYG4SdxPc2NQaUMH
	 xK50ldJdt6DrjecGnXlDTLzGjmaX3x1t1Z/UKnzaSqJhrOPpdKFdr1BJrdTfFbiytXnTq
	 l9r7J366dKu+UjJXiv/sjvs6RCVOA8tVwBjTkTW59MavRVHWBK8vPCNeMiVRxQKS0gOup
	 G421El/p2nPlRZw7eqXJlCS9bCDvjjwds2vtAZpa03yrPaV+uDTKmw54894j6u8bNy5Hk
	 ULQI1Rue4p5iIdmG8btgQZEX4ERubheuZj5Fv6ejDV3zD/gAEtzDuWyZ6U5STATu9QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0CNwkmqf;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9091D606A31A
	for <linux-alpha@vger.kernel.org>; Fri, 30 Oct 2026 04:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9091D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0CNwkmqf
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ab432273c5so2419117b3.3
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 21:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333042; x=1793937842; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IGEY7xpKT7BuVDZ492nljPbapi/lh/U71wUYUhMFTsE=;
        b=0CNwkmqfD5WwHRzoOUwCaJebj5k1i01Igxi+rSihQaLeqOZ2Fa0jivzSCjLpFY5X8D
         ObA3/sn4B9OFOxtT9KTKrJWU3WAiw3BkmMHjndMACeXMhfkKOwph77bbMtR3oKt5fc+f
         syizFJT2n9dLc3og9eeqmbj59Vjt60Yiu1LNMlSuX8cEDkr4wO04An4TsfgZhEH9Nh1+
         S9WG8/TOeoFDmHeujzJAn1yvmEFJpOkWqjZ1Du3b64pcLqxmYNM92Lk/lrYZWR+gisMI
         0ECE3Qg9BkEv69/3QbGNFr+pDDcxnZokKKkJH1ZbScmqJpCLk0JXdOdMtVBi6sSBCJ5m
         fHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333042; x=1793937842;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IGEY7xpKT7BuVDZ492nljPbapi/lh/U71wUYUhMFTsE=;
        b=onWuWeWV41RTdWld+fRucHAl8k+av3LdaUaN0O0/urn62k+WNLU5Ko7LYut0gQmiqs
         0ltQeIv1rAUSCj6h9eWhhuaRUPVdvJVUDWcW8cjKrU4k2opkkhCnHAFT00LEgChaamb7
         /D3e6VkbA9b8d2LVDzDKYd1E/B3cZUyb4Ydxxtr5kcj5vnhKgwp2ZST8+YPSt+xF/kp7
         y77VlN1/toGnPYLbverW9tX1JlxMJXgFPsy80p0/Q5OjObB1Yd34LqqlPHQxqRYZTtZS
         j0s8hGy7Z7qeTX1sR/BfMjh7Yc7KFZ8s5g7FGHO7UH3g9RtLtao5SRG9Qcb53WxjdUA8
         BXcw==
X-Gm-Message-State: AFq9FYImSRQQzx7bV1gHFktkI4ahK+3Us9o7qwcD9NQLZnOH9lR24+Jw
	HpwHZc0zLU/s/wXTwMvowFjPj+eis7lhJbLc85CMQMw4M9MJa7EikD5P
X-Gm-Gg: AYBFou2aewNoyOGVUX6k3JmDYOZdue1zjwYqWmQxeUa5DSKjBpKB95/BWINttT2U2VE
	ES+yC+nlO2MQD+ymDe53GmsfrxmsVY0V+toy7eJJBIlJpKE1t1nraJDno7D+X4+ePJIB/yERSgE
	1TZdJ48ikkGYXvTEWiDw6XYER8oNa+4xK+cj70Lj7gGo29BtR6c1f44RtYXgDrFZQpqKZt3EV4u
	OsxJXg+4blUqbs9NB8zxqxp/2Mc5K/szp5MVClYsc/OmMCsDxid+gjOwvzrRlkerz3AKix/5Ygf
	0fKAJS3Skt5pdt3xqwPEIz6d9alYWcA9GlRn6587DAhigY7xRzNaFhpuEQWxmuwod2OA2bdCTYV
	N8lZjhVX1ZRPTtdJWBLPXLWqk/rTzJs0Bx3RNjbNccvniOrTQs3uudH2JCDMQWAd+GPkV/E0onH
	g6VdQOoZ2GKJYqyzYEU9V17NCdOxKDGcR5O5cIui6uE9NAPTHANM0UjOvZjZQvXY34zLkcuUV3X
	2ASPG+l3op4T6V6/yvMfzsIdDrEy3Ds/p0H+K0Yv2jts1oXo5NeLa9EytpUPA10h/Ti471WicS1
	hfkXW0bdUuDIhfsNcR/TBvs1IC52R3gR7VvhGVtHvEkbljDtfADFiN7ZLj1HmV147WAZQks8hJ4
	EFxdcRoMO3w==
X-Received: by 2002:a05:690c:3481:b0:8b0:c71d:2b2b with SMTP id 00721157ae682-8b2b67a315bmr7858347b3.45.1793333042366;
        Thu, 29 Oct 2026 21:04:02 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b71bce56sm3416527b3.44.2026.10.29.21.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:04:00 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v2 0/5] alpha/perf: add ProfileMe sampling
Date: Fri, 30 Oct 2026 00:03:58 -0400
Message-Id: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNyw6CMBBFf4XM2prStDxc8R+GRVsGGAOUtEg0p
 P8uYFy5PMm5524Q0BMGuCUbeFwpkJt2EJcEbK+nDhk1O4PgIku5kEwPc6/Z7F1LA47IMiwLXea
 5NUrCvpo9tvQ6i/f6y+FpHmiXI3MYPYXF+fd5uaaH96sXf/U1ZZw1UholTCsU51U3ahqu1o1Qx
 xg/bXSWr8AAAAA=
X-Change-ID: 20261024-alpha-profileme-6e98a977cb54
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4916; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=tIQ5QTNuAEPX68X7q36sDokkva1R0R1MN8RNpvCC9iM=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeiOsf1bBr033W+Lo34lh339Ww85O2TFuv9fkN8zeHC
 7+E+5XSOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaxeYM/71PX8hwE+
 p+47Z6ckh41+MZXKv2Bscp2/5/Yqzz+Yb2pQiGv4JTPy9gyjui87DwbNn/vxf+3z4jv/YHs2zeb
 OVJobflbzABAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The 21264 from EV67 on, and the 21364, have a second performance counter
mode, ProfileMe, alongside the Aggregate mode that the driver uses today.
An Aggregate mode sample reports the PC where the overflow interrupt was
taken. On an EV7 that is anywhere from 15 instructions before to 12
after the one that overflowed the counter, which makes perf annotate
output close to useless. In ProfileMe mode the CPU picks one fetched
instruction, follows it down the pipeline, and reports its PC along with
what happened to it: whether it retired, whether it trapped and why,
whether it was a mispredicted branch, stalled before map, or was killed
on a wrong path, and what PCTR1 counted while it was in flight.

Patch 1 fixes a constant passed to the wrong PALcode call, with no
functional change. Patch 2 adds the sysfs format and event attributes
the perf tool needs to name raw events. Patch 3 adds ProfileMe sampling,
selected with precise_ip or a new profileme config bit, so cycles:p and
perf record's default event use it. Patch 4 attaches the status
registers to each sample as PERF_SAMPLE_RAW data, and patch 5 adds an
option to randomize the sampling interval so that it cannot lock onto a
loop.

A separate series for perf-tools-next adds a decoder for the raw data
to perf report -D and perf script -D, and a script that sums the status
by symbol or by instruction, in the style of DCPI.

The two modes cannot run at the same time, because PCTR_CTL[SL0] sets
the mode for both counters. A ProfileMe event is scheduled alone, and
perf multiplexes it with any other hardware events. perf stat does not
ask for precise events, so it keeps using Aggregate mode.

To try it:

  perf record -e cycles:p -- ./workload
  perf annotate

I tested this on an AlphaServer ES47 (EV7). Samples from a
16-instruction loop land on all 16 instructions rather than on 4 PCs.
DTB misses and unaligned traps are attributed to the faulting load. A
branch on random data shows up as mispredicted in 21% of its samples,
and in 0% with sorted data. A 12 minute perf record -a while building
git took 4.45 million samples with no warnings. Sampling every 10000
instructions, which used to wedge the CPU, ran 66 times without a hang.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v2:
- Patch 1: explain why bit 0 clear means all processes, although the
  Architecture Reference Manual says otherwise.
- Patch 3: fix a CPU wedge during high-rate ProfileMe sampling. The
  ProfileMe counters are now written twice, and a stopped counter is
  moved away from overflow, as EV67 HRM PALcode restrictions 32 and 38
  require.
- Patch 3: set the profiled PC in place in the trap frame of the
  instruction's mode instead of in a pt_regs copy on the stack, so
  sampled registers and stack values are those of the right frame.
  A kernel instruction whose interrupt is taken in user mode gets a
  per-CPU frame holding only its PC, so the user frame is not changed.
- Patch 4: drop the reserved field and pack the 64-bit fields of
  struct alpha_profileme_sample, so they are 8-byte aligned in the
  sample record and the record needs no padding. This changes the raw
  data layout.
- Patch 5: compute the jitter with mul_u64_u32_shr() and saturate the
  sum, so that large periods cannot overflow.
- Link to v1: https://patch.msgid.link/20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com

To: Richard Henderson <richard.henderson@linaro.org>
To: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@redhat.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Jiri Olsa <jolsa@kernel.org>
To: Ian Rogers <irogers@google.com>
To: Adrian Hunter <adrian.hunter@intel.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org

---
Matt Turner (5):
      alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the logging options call
      alpha/perf: add sysfs format and event attributes
      alpha/perf: implement ProfileMe sampling
      alpha/perf: attach ProfileMe status as PERF_SAMPLE_RAW data
      alpha/perf: optionally randomize the ProfileMe sampling interval

 arch/alpha/include/asm/perf_event.h      |   2 +
 arch/alpha/include/asm/wrperfmon.h       |  14 ++
 arch/alpha/include/uapi/asm/perf_event.h |  31 ++++
 arch/alpha/kernel/perf_event.c           | 309 +++++++++++++++++++++++++++++--
 4 files changed, 345 insertions(+), 11 deletions(-)
---
base-commit: 330517c63aa9b48227b6ab45f01003effac77ae4
change-id: 20261024-alpha-profileme-6e98a977cb54

Best regards,
--  
Matt Turner <mattst88@gmail.com>

