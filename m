Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333350;
	b=3sSwGm34H7zgGfw5VSI+OLa86O/IRedFhnkSuWNqo49DeCttVRNfV2w7GuIeKQZ9ke5s
	 lq2ieXpESoyFXfHLGgsilI3oe0LRST+1EnLAB40/DotXCxzEtM6XmPTarRrD9aQNmt0G4
	 Mj5hnHo7LFeMUzcoN68BwBUILyUN79Qh/LZCQAjOHeVPBOXlqv5iJycqGCHBX09Inch79
	 EXh7gwlGK2wSlWUjBnJPOWNXgoGmpJHIeDV1TafjGuWfdvVX2biD7uFFGZh4QjzL4dA8m
	 4Z1WiKfVzkywrnlK5+yktb0UjOs0lbHHeiItmJ3YJh6KyAYYm21wxsKDaLkYuVEAmXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Umq7QOntyDTFxeZl+ojggQg9hrejeZGAVJAMZsSvtCs=;
	b=jhgTbox22nNx7TRURLjifPgUlIP8MKI2pZvTjNwAXFOa0i0whAew+W2rN/Svej183kGS
	 VlS943ClbrVMW1SBKstoeQWKxUkNy++TtLlAZ1EiBGTYr1r9d+n3RLedptsuVeJxJNvzm
	 l7Bz0oPYgYl1wM5Klpo9NS7t6EKPPfsGCqvTay8jq+HXCOtT3r8Ds1ZWVPIACot1XShgi
	 krXleNSCcGlF9puliQm52p9LcD1otkbzBg/mtE4KREUWgrNVPvHsKp5qVm1ktKOzc7udf
	 FtY+6L5Q/4N4Y0XFO2d9d+A1Wda1BnpKfOZailO8HHCV1Hb/Aku4Q7VNhfClaECa4Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZJ6MiTJ/";
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EB4606A320
	for <linux-alpha@vger.kernel.org>; Fri, 30 Oct 2026 04:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45EB4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJ6MiTJ/
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ab3d3c5761so2857657b3.1
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 21:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333349; x=1793938149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Umq7QOntyDTFxeZl+ojggQg9hrejeZGAVJAMZsSvtCs=;
        b=ZJ6MiTJ/hBKa5jHpvQBqf4Ehbv1OSuLAIkedZ6IpCf+DFPiUrrDwIHgdKivymAo9IC
         5zMKRdDU2I7is9bJwqz5GJLjtWVfCXwRbLadKYFOQVTt5A2KeRp1COmVpE0YgYKYjQcV
         SqOkQhjvfOqmv26DOZu33/g9Cmn684q2OT9uG+0naOyQAxx1RnEnNHS+1ngLf0FMPfZK
         kJJVtxs3KaCMbR8EBO+1TJzS45Jb6MWujEe6r4hsnQV5SItFphO9ODVMpSz5fVj9KLoz
         Prf/gtpxxyy+OSsXhyF2bAcc1KQA63qLuX2Qqe3wnKe5vuHQA/b6StcJGObuP1v8XCPM
         pWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333349; x=1793938149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Umq7QOntyDTFxeZl+ojggQg9hrejeZGAVJAMZsSvtCs=;
        b=xcHW0mu1bWaOmsJpl3GwCKb9OEgYzV+whJilf0gVzO8dJWJZGSdVi2P5VsF1LIJqfM
         XdsU2fkqqt4PDvAdRisR2wYZcV9suV/BIkY4orUeS2tdkVVfI+XsnbFUNKLk7M0NfPRA
         2uxgWNoBLpjRs00YH2wKNL5QQXOEcJdt9z/v3HGxZ5lWouG7Js2hRdEyL0X0CLlG8G1s
         y2gVtS3KKdjafThcoNTZ0/TDgbsEIt7CcLp0jqOrKcRlBFaV5EdHQqguG4Aax1/qrVL7
         S5sUsXBwo0z+m4vjLCSxeYv8YoKsnbpjluXQWRhBP5QvP6WsUaT99jmQ00ZhYEuftimT
         8OjQ==
X-Gm-Message-State: AFq9FYIqmfEqpSB6BSK0w6fDy2vHn9vs3zxPBly3k/nxvj3p7UU8Gw/J
	8kcEgYZu1EKyPDyVZz4RuSOGlkJVxfb7YcJiIyDd85EaBN+eMiEYXmMe
X-Gm-Gg: AYBFou1PACt+vbTXx45L2qFjB2ECok1kIXf8qXhLOYR8e6j95xQqwCRN+yLRX8a+3se
	NmgtoPCg9pqzwl1X28ikXInkYsllA10ZHxMeFaGqQ3wcFobqtkAf2wJhFEW/RIiZWIHolLoBSnG
	J3eAwI5zFd1QPdvKSdaxxtrV15N6SfxaOYv90VDtwaEXf91+xX7j653YDoyjM4JQ2XHzz3ZWcw+
	hOROd5b0B1tL5mmoZDH3HSFrOhIPR1Jnz6C+wtI0gDjQUtfgC5yPl4GbbHwtpWkurz5LumfAr0v
	ZrCc+V0WOxnT7bX3Y1hKyOvg8Ip07uxuVrd/3w2G5dZlfU2NZbTOwaWB3x3HlPcK6wl/SL/qE4L
	FuUW4c8lyai9l85vAnggN3vUKdOI86UlG/+Ph3D5NSd7sfj+izI09wpWzhK1A9LVjWZreAqwgkP
	O/xK2kHi/apgCknY8yu1DmPBQl5powY/I/tFH51/ZW4APK5AMiqgaKgw+2eYe+oqHXkqHCzqe+K
	c4dZEdiW6h8c75+yz2byrhyF1AH4ew39Nkkirhec36Oks9SKWp6Sy9G/t/TutVgfucTao79W25j
	uYsalSz+UqBH/WjbI+MeMCFOSw5UOnpTtkcc9YEoErrVrTZJO4g+JHLGDctAEyTUhtHnxfGFsx4
	2vVOz/5uRAg==
X-Received: by 2002:a05:690c:6d82:b0:8ae:e69d:913a with SMTP id 00721157ae682-8b2b65baff1mr7965917b3.1.1793333348879;
        Thu, 29 Oct 2026 21:09:08 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b71b1a86sm3573557b3.34.2026.10.29.21.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:09:07 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 30 Oct 2026 00:09:04 -0400
Subject: [PATCH v2 2/2] perf python: Add alpha-profileme.py
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
Message-Id: <20261030-perf-alpha-profileme-v2-2-9ce2f0b0e622@gmail.com>
References: <20261030-perf-alpha-profileme-v2-0-9ce2f0b0e622@gmail.com>
In-Reply-To: <20261030-perf-alpha-profileme-v2-0-9ce2f0b0e622@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7228; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=4jYvywZawG2s66zCbrgxdzMhpEDGyNfCdMuMBodVvNs=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeSMQ9munqcymigeXGDpZF7451dvFLm0znuhX//Cxrw
 a17h5rMOz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYaL2NGhssM//fZXw
 xzTv1+eWZWhljizmDdlZ/EJK8sva9gX5T1yZGRoXfmnr9Vfl+/fE1W9JG/ub9u9w1+zyyNzgrh5
 /O8qu+s5wUA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

perf report shows where Alpha ProfileMe samples land but cannot
aggregate the raw status attached to them.

Add a standalone script, using the perf Python module, that summarizes
it by symbol or, with --pc, by instruction, in the style of DCPI: the
fraction of samples killed on a wrong path, not retired, mispredicted,
taken or stalled, the mean PCTR1 window count, and trap counts by type.
Mispredict and trap types are only counted when I_STAT[TRP] is set,
since they are stale otherwise. Redirect traps are counted by their
PALcode entry offset in PMPC.

On an EV7, sampling a loop whose branch tests random data reports that
branch mispredicted in 21% of its samples, and 0% with sorted data.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 tools/perf/python/alpha-profileme.py | 162 +++++++++++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/tools/perf/python/alpha-profileme.py b/tools/perf/python/alpha-profileme.py
new file mode 100755
index 000000000000..19572431aeac
--- /dev/null
+++ b/tools/perf/python/alpha-profileme.py
@@ -0,0 +1,162 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""Summarize Alpha ProfileMe samples.
+
+Aggregates the ProfileMe status that the Alpha cpu PMU attaches to each
+sample as PERF_SAMPLE_RAW data, by symbol or, with --pc, by instruction.
+
+Record with raw data, e.g.:
+  perf record -R -e instructions:p -- ./workload
+  alpha-profileme.py [-i perf.data] [--pc] [--top N]
+
+Columns:
+  samples   ProfileMe samples attributed to the row
+  killed%   profiled instruction killed before it was mapped (PM_KILLED_BM)
+  invalid%  instruction did not trap and did not retire valid (VAL clear)
+  mispr%    conditional branch mispredicted (TRP and MIS)
+  taken%    TAK set; only meaningful for rows that are conditional branches
+  stall%    instruction stalled between fetch and map (PM_STALLED)
+  pctr1     mean PCTR1 count during the window; what it counts depends on
+            the event: inum retire delay for cycles:p, window cycles for
+            instructions:p, Bcache misses for bcache-misses:p and Mbox
+            replay traps for cpu/mbox-replay/p
+  traps     trap counts by type, only for samples with TRP set
+"""
+from __future__ import annotations
+
+import argparse
+from collections import defaultdict
+import struct
+import sys
+from typing import Optional
+import perf
+
+TRAP_TYPES = {
+    0: "replay", 2: "dtb2-3l", 3: "dtb2-4l", 4: "fen", 5: "unalign",
+    6: "dtb1", 7: "dfault", 8: "opcdec", 10: "mchk", 12: "arith",
+    14: "mt_fpcr", 15: "reset",
+}
+REDIRECTS = {0x481: "iacv", 0x581: "itbmiss", 0x681: "intr"}
+SAMPLE = struct.Struct("<IQQQ")
+
+
+class Row:
+    """ProfileMe status totals for one symbol or instruction."""
+    def __init__(self) -> None:
+        self.samples = 0
+        self.killed = 0
+        self.invalid = 0
+        self.mispredict = 0
+        self.taken = 0
+        self.stalled = 0
+        self.pctr1 = 0
+        self.traps: dict[str, int] = defaultdict(int)
+
+
+def pct(n: int, d: int) -> float:
+    """Return n as a percentage of d."""
+    return 100.0 * n / d if d else 0.0
+
+
+class ProfileMe:
+    """Aggregates ProfileMe raw sample data."""
+    def __init__(self, by_pc: bool, top: int) -> None:
+        self.by_pc = by_pc
+        self.top = top
+        self.rows: dict[str, Row] = defaultdict(Row)
+        self.skipped = 0
+        self.session: Optional[perf.session] = None
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Add one sample's ProfileMe status to its row."""
+        raw = sample.raw_buf
+        if not raw or len(raw) < SAMPLE.size:
+            self.skipped += 1
+            return
+        version, pmpc, i_stat, ctl = SAMPLE.unpack_from(raw)
+        if version < 1:
+            self.skipped += 1
+            return
+
+        symbol = sample.symbol or "[unknown]"
+        if self.by_pc:
+            if pmpc & 1:
+                key = f"PAL+{pmpc & 0x7fff:#x}"
+            else:
+                key = f"{pmpc & ~3:#018x} {symbol}"
+        else:
+            key = f"{sample.dso or '[unknown]'} {symbol}"
+
+        r = self.rows[key]
+        r.samples += 1
+        trp = (i_stat >> 39) & 1
+        if (ctl >> 26) & 1:
+            r.killed += 1
+        if not trp and not (ctl >> 1) & 1:
+            r.invalid += 1
+        if ctl & 1:
+            r.taken += 1
+        if (ctl >> 27) & 1:
+            r.stalled += 1
+        r.pctr1 += (ctl >> 6) & 0xfffff
+
+        redirect = REDIRECTS.get(pmpc & 0x7fff) if pmpc & 1 else None
+        if redirect:
+            r.traps[redirect] += 1
+        elif trp:
+            if (i_stat >> 40) & 1:
+                r.mispredict += 1
+            else:
+                tt = (i_stat >> 34) & 0xf
+                r.traps[TRAP_TYPES.get(tt, "other")] += 1
+
+    def print_totals(self) -> None:
+        """Print the busiest rows."""
+        total = sum(r.samples for r in self.rows.values())
+        print(f"{total} ProfileMe samples, {self.skipped} without ProfileMe data")
+        if not total:
+            return
+        print(f"{'samples':>8} {'killed%':>7} {'invalid%':>8} {'mispr%':>6} "
+              f"{'taken%':>7} {'stall%':>6} {'pctr1':>7}  {'location':<40} traps")
+        ordered = sorted(self.rows.items(), key=lambda kv: kv[1].samples,
+                         reverse=True)
+        for key, r in ordered[:self.top]:
+            traps = " ".join(f"{k}={v}" for k, v in
+                             sorted(r.traps.items(), key=lambda kv: -kv[1]))
+            print(f"{r.samples:8d} {pct(r.killed, r.samples):7.1f} "
+                  f"{pct(r.invalid, r.samples):8.1f} "
+                  f"{pct(r.mispredict, r.samples):6.1f} "
+                  f"{pct(r.taken, r.samples):7.1f} "
+                  f"{pct(r.stalled, r.samples):6.1f} "
+                  f"{r.pctr1 / r.samples:7.1f}  {key:<40} {traps}")
+
+    def run(self, input_file: str) -> None:
+        """Run the session."""
+        self.session = perf.session(perf.data(input_file), sample=self.process_event)
+        try:
+            self.session.process_events()
+        finally:
+            # Break the reference cycle between perf.session and self.process_event
+            # because perf.session lacks cyclic GC support (tp_traverse).
+            self.session = None
+        self.print_totals()
+
+
+def main() -> None:
+    """Main function."""
+    parser = argparse.ArgumentParser(description="Summarize Alpha ProfileMe samples")
+    parser.add_argument("-i", "--input", default="perf.data", help="Input file")
+    parser.add_argument("--pc", action="store_true", help="aggregate by instruction")
+    parser.add_argument("--top", type=int, default=30, help="rows to print")
+    args = parser.parse_args()
+
+    analyzer = ProfileMe(args.pc, args.top)
+    try:
+        analyzer.run(args.input)
+    except IOError as e:
+        print(e, file=sys.stderr)
+        sys.exit(1)
+
+
+if __name__ == "__main__":
+    main()

-- 
2.55.0

