Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339104;
	b=SyXKZKTjDRwMsRMCN+JODkuJs/BHYYy10BXioSnV/b0vtfGlHYFWntB3nn1glFjooK7W
	 JZXy2eVZirHxQ6UtiMlrGvimE6wydOrRUnkujW9bJXH981nnELuTT7fwG/dAYMI+0NZbB
	 C/8nUFHrUvwoK+AewJavtcKWGun4j+s3dTPA4JIa4AKtRFwH2ZFnoEb4RAHZLmpLLNK92
	 aGgvgENgy50SzD2PqYT/+m4TLYGYhGI1aUkfmx/kDDSVKrjVf+i7SQyKHr5u5/fNTDAJp
	 glv9IT5h4JpaGsHfCcxnsnAAS9BjSdIzg7L9D2bc5xhKBDgdSwuk3xPto0QwjfwsmxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xjmeGbSDLwRtsksfduOyWlQv0emM3beeL37krDzg/Q4=;
	b=ZxGKrfje6D6+mtN/cO+KHH2fWTQF5cw4YX4rPW263ISfNNFFlnDhl+JRT4GyB6Q3l6sG
	 qtbq9+DET/n5wo61GpoiUCzEae4aK8tgOAbv4LK/Vuihjpdk9hP/coDeFTp+VRxJt+25z
	 s7bL0WQ79OGcL8fzHtnWDqsh0Jq9qgD5DvHEsSc9q6mjnYGbzmhdYWNkuBfJMsXIP7gm4
	 5+7Ah14XNk6NrqD1ZjH38VNtzRCLI1PWchu2GuF+7rz/kRrzCEPpEmRUOFUd8zrFzB62S
	 V1yekrungYMrwV/KYWftUm5g0AJX3Jien17CPAeQ3BMvf60ROluCn6ZEAfGu0wsfYrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iGRcPxfs;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CB4606A321
	for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 19:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06CB4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iGRcPxfs
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so3261394a12.0
        for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 11:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339102; x=1794943902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjmeGbSDLwRtsksfduOyWlQv0emM3beeL37krDzg/Q4=;
        b=iGRcPxfs7RVh0UZOjwjZIhSWKi08sujWlLqPEmYOZenXFrCTwJG1sQkjG4j61wtyn+
         tTpMeuLgh9F9GPofpb5UpSIwHxN3RxhM7n8CoRQutgn2A6B5b/wl8BSA3P5MY/zygecD
         tvGdBRVXTqd9iFqo/CITsWjdXh/3kKGXQjNJPpymx+3QA+4lH6VUCtDo+QtgI9c3FLIt
         HNN/QJ6Xpbgromq63yAbQR/iRlOQxlTby7C1INmiW0j8IQfc4mV9UrTHDC+uyrn/Z8jN
         9yFkjL+LpBfwsIOa9HnGnFUctGp6O6YK382/uRP9abItXip0GJIWAT4ti67xLZU9T4uH
         W+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339102; x=1794943902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjmeGbSDLwRtsksfduOyWlQv0emM3beeL37krDzg/Q4=;
        b=m0dG5v8niUsL3i8HznDdQcI1bHJpof6RhsTJ0tmeQT99j31XTuyHXBBjl5za6xD41r
         YbPprb7xLlQ3//1a0WOoF4iEVJQYu0YEG0o9I8vB8tj0bi/YkHAeNV5H8bWgZDvfhOCP
         WmHnbUuhT7AeZhV3vaSEaKnYaKrv/MZHqVhoVMy4YIWGgbPj23LyTF1MW/pPQPN68tz5
         MQH5vyUfp+XSS3K1OlzYl5h2Dt7FbZm6YlbpuKA75uqRcsH9mywD+GXbuxJqaimmMgu9
         89iN98HjW3Pq+qRhxWAkLDz+vv0L7mvTnHfqkCdqT2toPcenu+VgB4wgVYhSznS2+rp0
         iPbA==
X-Forwarded-Encrypted: i=1; AL+hErEqiWXP7YL2WxaO7dvmnv8YOQablE5hLpKVoUe2/SWVXzRDqTOYTLE1d4ttoKGh+ZJZ/5cn5Q1IafhWqQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z91ZQWVtIMmZVZj4/aDEuLTqW3ctm+m5aE0uC/zd9THZfxnKvx2
	e0VSPvQ4KaLLqHjO3nLsY2Dbib4Vxe4dF6+KhZloRI/1ts30VizjudPW
X-Gm-Gg: AYBFou0P+RFcwD2sraCIoAGY6Tee1Uk+tXf5HD0wCToCqJs0OF/We3/+zW35WpFgBLA
	xMCyhmTAa47UoFIY0em1L/c5CLoa2w6Inc6b1oEVqqgSl3AeWvVDz7KcK9xpoRHi0Nbodzu3F1X
	gTmWpibhuSlmfCu+OQllC9oQf41+2/MU2S7GdKAEhFIQmDzLkzJ94NUdLjpz5qQ051Ymak9VVHJ
	fTELp12ktwqN+p7+9+GehX18I9qK6r0mHaahojDMVUkSDlv2rETh33P9g4jbiYOAfGC7rV5zXKE
	w1qW+PpZxu8jbylpvd29dEtCe76uJE/9mWHgqUlGQl5/bASjDya8YCYMm4u9l3xGNyrDqRkG97y
	GHBmdTX8sRwQHMIFSMui27EKMy9D3+t0n7uZZJiZRxCUnqDSub2X4nyU+aq3OSFA7tQrTRsCG4t
	ZfO3UoImk9MG9lilXbcNTJdE1ceoS2bX6R6QhPYa/hliccmZf/4V5TvZPCms6zQqFkWiHqkZZ/4
	zqGVve0l8H1lcPeHRCEW3+oTY3+4Bgyyo6y6UOfNW2kbO+GCw+t+O7wo2ypxCch/KFdKi2DfoiK
	P0Oy3E3gcdtfVIrW+OnUTPguMq4dUG+bUB07enZLsuiAoypzvIyuKYfr6bosJPnlkxMPbkA=
X-Received: by 2002:a17:907:7b85:b0:c29:4a1f:76be with SMTP id a640c23a62f3a-c5066ad1a71mr9096566b.20.1794339102364;
        Tue, 10 Nov 2026 11:31:42 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a66b9sm147465866b.9.2026.11.10.11.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:31:41 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v2 0/1] alpha/perf: Enable duration-based sampling throttling
Date: Tue, 10 Nov 2026 20:31:31 +0100
Message-ID: <20261110193134.1151112-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changes in v2, following Matt's review:
- Describe the unresponsive-machine/RCU-starvation symptom in the commit.
- Include proto.h for est_cycle_freq and use cycles_t without the cast.
- Precompute the cycles-to-nanoseconds multiplier/shift and mark both
  __ro_after_init, removing division from the interrupt path.
- Add Matt's Reviewed-by.

Both v2 mainline and ES40 integration builds passed (vmlinux, boot image
and modules), with only the existing saved_config COMMON-symbol warning.
Disassembly confirms no division call in either interrupt wrapper.
The multiplier conversion checks cover rounding, overflow and RPCC wrap.
The historical hardware results below apply to v1's division-based
conversion. V2 also passed seven bounded tests on the ES40 with the
alpha-devel integration: the 1024/s and 4096/s CPU0 controls, 1024/s
controls on CPUs 1 and 2, and period-17 tests starting at 100000/s on
each CPU. Duration feedback reduced the limits to 7168/s, 5120/s and
5120/s respectively. All 26156 samples were recorded without reported
loss, and no new RCU stalls or kernel faults appeared, including a
30-second observation after the final run. This does not repeat the
full v1 stress matrix below. The selected-frequency cleanup remains
outside this patch.

While testing Matt's v7 ProfileMe series [1] on my EV67 AlphaServer ES40,
I found that short-period sampling could make the machine unresponsive.
Once serial logging was enabled, the console showed RCU grace-period
kthread starvation reports. The failure also reproduced without my
generic-entry follow-up patches.

Count-based throttling was working: at HZ=1024 and the default limit of
100000 samples/s, the observed cadence was approximately 98 interrupts
per throttle cycle. However, Alpha never called perf_sample_event_took(),
so perf could not reduce that limit based on interrupt handling cost.
Setting perf_cpu_time_max_percent to 25 did not provide that feedback.

Keeping period 17 but lowering the limit to 1024 or 4096 samples/s made
the tests pass while still exercising repeated stop/park/restart cycles.
Adding duration feedback also made the original high-rate test pass,
without changing those counter-state operations. The minimal fix measured
average handler costs of 24-26 us against a 2.5 us budget and reduced the
limit to 7168-8192 samples/s.

Reproducer
==========

The reproducer requires Matt's ProfileMe kernel series and matching perf
tools. On the ES40 I used the following one-second workload, built
natively as "busy":

  #include <stdint.h>
  #include <time.h>

  static double now(void)
  {
          struct timespec t;

          clock_gettime(CLOCK_MONOTONIC, &t);
          return t.tv_sec + t.tv_nsec * 1e-9;
  }

  int main(void)
  {
          uint64_t x = 1;
          double end = now() + 1;

          do {
                  for (int i = 0; i < 1000; i++)
                          asm volatile("mulq %0,3,%0" : "+r" (x));
          } while (now() < end);
          return 0;
  }

  cc -O2 -o busy busy.c

As root, with serial capture running:

  dmesg -n 7
  sysctl -w kernel.perf_event_max_sample_rate=100000
  sysctl -w kernel.perf_cpu_time_max_percent=25

The period-10007 control completed successfully:

  taskset -c 0 perf record -B -R \
      -e cpu/instructions,profileme,randomize/ -c 10007 \
      -o control.data -- ./busy

Changing only the period reproduced the failure:

  taskset -c 0 perf record -B -R \
      -e cpu/instructions,profileme,randomize/ -c 17 \
      -o period17.data -- ./busy

The unpatched runs required a manual reset; a userspace timeout did not
reliably recover the system. The commands above are the essential
recording commands from the controlled tests, which also used a timeout
supervisor and saved logs on another machine.

Validation and submission scope
===============================

The v1 minimal fix, without diagnostic instrumentation, passed three
repeats of the high-rate reproducer and the two low-rate controls.
Broader testing covered 21 cases on all three CPUs: randomized ProfileMe
instruction sampling at periods 16, 17 and 31, ProfileMe and Aggregate
cycle sampling, and concurrent ProfileMe and mixed-mode workloads.
All completed, with 1352488 samples, no recorded losses and no new RCU
stalls or kernel faults. This was bounded stress testing, not a long soak.

The missing feedback predates ProfileMe. This patch is therefore based
on mainline and can be reviewed and applied independently of Matt's
series. I cross-built vmlinux, the Alpha boot image and modules on
mainline d48723711bae with the ES40 configuration and GCC 15.0.1. The
only build warning was the existing saved_config COMMON-symbol warning.

The hardware results above used Matt's v7 series with the v1 fix applied;
the mainline-only build has not been boot-tested. RPCC supplies a short,
same-CPU interval because Alpha's tick-based sched_clock() is too coarse
for this measurement. Counter programming and event handling are unchanged.

[1] https://lore.kernel.org/linux-alpha/20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com/


Magnus Lindholm (1):
  alpha/perf: Account for time spent handling PMU interrupts

 arch/alpha/kernel/perf_event.c | 35 ++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

-- 
2.43.0

