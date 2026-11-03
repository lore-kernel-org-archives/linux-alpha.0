Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672351;
	b=AgXhZTpiYQVqpV9loojWeijcQK5ElHOzCIcu/54f4skbA6WPHpeLtGOxoWsKjw2wIUmL
	 378qNR68H8j/dBAMwy3+DTjEfTlUqtHQEcCRzL959vo8bCnm5rKVq7TeUuqfOGjmaLG7m
	 K1lG9fwsAJOyNlsR/0D1QSUyxApn8E2ad12ODl+3EjY8d3P+UZ9PVBWJh8HBLzh4vZu1b
	 NDXTDrtoXRpAql6BppRgLbmg8pWxX6jKM8SJqrRBSVTvuTfNtDN1Vb53CS0xR5qndDv5+
	 RXI+ETbLXsFrVOJBzQctVFcU64X044vrI/YG69eaPldHtjL8hAow01JYgHq+IObGVnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VyzpExeelLAR9HxeoHhIVWRIik0hjXGnpC16hisKM74=;
	b=lYSb0CNtM/VlCACRZJJguPgOnsoBKIRi71vbVjALTEkHOM6nLv4LlGncvLcpfYJtsHBi
	 tcjAvbtmR9kq678tRRNGVcJJMXlrxfy2FoNc+9OyzRWBqLI5RBYoMKDJonv7xwxTos6ji
	 0z60p7eJohBH7DPD7gYkWklIj479XAZ2QEXegA1QZYZCf+wy94Dgv2mt8UPYG34FGTR62
	 sV58DfZ4gYw/OPpIECQoEQnYxSQhmKMEUMA72WHnMxvS3eS3SYBBVMKjeYV722yDvNo9W
	 u3kJzbm2iEnirzncqwAl5sezXK2McrtdH4kWlxjoH8iLiUPfZAbKeLF6bqOEzSlC5YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPG3aHZN;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B82E606A327
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 02:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B82E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPG3aHZN
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8aea7b7ca0cso31842897b3.2
        for <linux-alpha@vger.kernel.org>; Mon, 02 Nov 2026 18:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672350; x=1794277150; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VyzpExeelLAR9HxeoHhIVWRIik0hjXGnpC16hisKM74=;
        b=YPG3aHZNwjTy7pqWgk/wgmpwgP8ccjFKXRuzkZWDSlc/gqhvKcBtIS9Atqu5CKZc8F
         Qxvs6lhqCkdN0GggJRuirt72jv0IiyAZ4U+y+zTqGyQDViGkq1Nf8k1jUpeNm6iTxWlZ
         hqYAMYVzt5kMk4XC7lhC9YBv2eURF/zTxz29+wj/9rDRikIYgw10piczw3R+QqNZV07K
         RZ6JLQUMZhwKRP6h/vx2jNaIm02X0YWj7CQ5CYmI9E81EL5bU9zwuUn7YcQN/VwBmJAc
         Y7zYKVyxX2Hw1I92lRSVsG0sdToJGEF8k8lnnqu6Y/d5SA6uW8VbLr3yX5PGVKdjMDif
         SvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672350; x=1794277150;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VyzpExeelLAR9HxeoHhIVWRIik0hjXGnpC16hisKM74=;
        b=wJpE/Q8u0IVTye5TTffuJo2Dfdkrbw6PchdABlKbnvHOnCaPN2e/tC9fWbmGJwHflM
         MHDpJWTO3vBkV47ooSyOMdECjtO74BQoO7E6RBGr3D1OgoHP8MVmToebBwxEDcujwfHO
         ZKjsy084jdJ7JAclL5pnoU3HThF4DaKK0I5UmPKyAwkJByWhTm7peZ0yiXdM8+4AE8o/
         5BWdBFlOy51+WTcQX6vpGW0TWBTqtHyjiYV7ZUlRjrBFhsQh6g1TdjAdFQJiMHk6/6iM
         RXVJtl+UnGuZyt3iQJ8bWmu6ZGAJRWNf17HMm6m8iZU4blQZampCNgS9azCyD3CLIZyg
         4nLA==
X-Forwarded-Encrypted: i=1; AKwUvBwRra8hjhgVLbI/kmDpzIAMoXM1qZhj1dyZUchOJw7g9qFjDt2/s1n2pP24emaYSBAyYHOkfnVY0+xyQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8FXxE2pzJQGSis8T2vvP+NJMq7lW7vddEZTFrQizRPj8VLz0+b
	cOaKrVz3Wi4Bl2entZvwiF5rweJjO+qZunj0tZjFIi5T5cgCOVevw6kI
X-Gm-Gg: AYBFou0eQ1hHrzn2v8rXGxkyn3ScvJl9wzlGWpQp1joIan8NgIQiJsR6l0qFWqoFHAR
	iFVKMlshVRwnSp4kyWcLZvXvWaN42adxarvv5N//a4TS3HguXU8Hj/4t1csUAHdCDbuJVoAc/LI
	r4brY9eU7Cmql7baF+GYGZ3pCttK43AKm2ZFLGJ0XP/Pg4FZ+vKrVlNpA18sZdFI06QLqOSww/4
	+lwlqfAryJUVkmUO7tpIjwUFuOBfaJe+3orGXgDLTGng8o/C4xPj7x8QHSSyH/kT6q88yOnaywt
	rFVDj+bsfw5DnnKKgv+dd2kZxANf6PM4ZyZ/kdaEAiPI7mhC53wbUG0AWNR/DRvQsMOEXxoexYo
	Fkr9DWetIKDbQKwxyC3+mWf8S47UyOX8I3LjW56NXv+k2LLoeEcVq8QIsBDHQYKpyHb0uBC/K5R
	Gr0kY8ip5G2l5SNtXdq3u/a4pZPbm5dsdYGGWhV/B+UJ1oFskfrDXND2D1iisGeuw4Anh3zoHkP
	zThA3NfaMhBo1JkIVUxV3B9eiKsXCsfxOL5JpKiALEYFysXB1do8biqJXYyYQ6nQ4YltdiTnTUc
	y7SYCYiOuRZS+cfvUtGxuh5y8zhYBwYbX7lQRyEuwgmizRZJPQL2jggg0j0vwEOEdn8g+8h+Z/z
	v4zFbL2K3Ie1ZYgoKYD5rBch+930nr5U=
X-Received: by 2002:a05:690c:397:b0:8b0:c673:993c with SMTP id 00721157ae682-8b2b66ce40fmr68322287b3.21.1793672349957;
        Mon, 02 Nov 2026 18:19:09 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b71b70fdsm62693447b3.43.2026.11.02.18.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:19:09 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v3 0/2] perf alpha: Decode ProfileMe samples
Date: Mon, 02 Nov 2026 21:19:07 -0500
Message-Id: <20261102-perf-alpha-profileme-v3-0-4bf6e1dda733@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNzQ6CMBAGX4X0bM12awh48j2Mh1K2soa/tEg0h
 He3xQsX43Gy384sIpBnCuKcLcLTzIGHPoI+ZMI2pr+T5DqyQMBcARZyJO+kacfGyNEPjlvqSBY
 Qb2VZkUYt4uvoyfFr015vXw7P6kF2Sq60aDhMg39v3Vml3Z/ErCRId8qtKnVRA6jLvTPcHu3Qi
 ZSYcSfR8EOCUVJaQgcVUI64l6zr+gG7DQA5DwEAAA==
X-Change-ID: 20261028-perf-alpha-profileme-8010299be323
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3404; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=WpIs83CyacYYndX7yUegp0rf7Gr25AUcEjh92rXYCVc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeusxhzuF7GlyqHTP1uenxwxFNBoH/jneVmC+TLHqXU
 xLJdORkx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFyjyM7wP0xyusox4S
 ebaqbUtT+UuzI54MJ258dc1/7su9qzcU/2VGNGhoPxG7M/WM5KX/7f6mlGu3bMi+Cu+LnpXY/Ob
 rmUdlD4FRsA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha kernel series "alpha/perf: add ProfileMe sampling" adds
ProfileMe sampling to the Alpha cpu PMU. Each ProfileMe sample carries
the profiled instruction's PMPC and its I_STAT and PCTR_CTL status as
PERF_SAMPLE_RAW data, which says whether the instruction retired,
whether it trapped and why, whether it was a mispredicted branch,
stalled before map, or was killed on a wrong path, and what PCTR1
counted while it was in flight:

  https://lore.kernel.org/r/20261101-alpha-profileme-v3-0-92d511b5a044@gmail.com

This series is the perf tool side. Patch 1 decodes the raw data in perf
report -D and perf script -D, as is done for AMD IBS. It copies the new
uapi header from the kernel series into tools/arch, so it should wait
until that header is merged. Patch 2 adds a script that sums the status
by symbol or by instruction, in the style of DCPI.

To try it, with the kernel series applied:

  perf record -R -e instructions:p -- ./workload
  tools/perf/python/alpha-profileme.py --pc

I tested this on an AlphaServer ES47 (EV7). Sampling a loop whose
branch tests random data reports that branch mispredicted in 21% of its
samples, and 0% with sorted data.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v3:
- Patch 1: silence -Wpacked around the uapi header, which breaks the
  build where __u64 is 4-byte aligned, such as sh4.
- Patch 2: only read raw data from cpu PMU events, as a tracepoint's
  payload can pass for ProfileMe status. Thanks to Magnus Lindholm.
- Patch 2: print a table for each thing PCTR1 can count, so that mixing
  events no longer averages unrelated values. Thanks to Magnus Lindholm.
- Link to v2: https://patch.msgid.link/20261030-perf-alpha-profileme-v2-0-9ce2f0b0e622@gmail.com

Changes in v2:
- Patch 1: copy the raw data out of the sample and convert it from
  little endian, so that it decodes on strict-alignment and big-endian
  hosts.
- Patches 1 and 2: follow the new 28-byte struct alpha_profileme_sample
  from kernel v2.
- Link to v1: https://patch.msgid.link/20261028-perf-alpha-profileme-v1-0-f46c1938d001@gmail.com

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
Cc: linux-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org

---
Matt Turner (2):
      perf alpha: Decode ProfileMe raw samples
      perf python: Add alpha-profileme.py

 tools/arch/alpha/include/uapi/asm/perf_event.h |  31 +++++
 tools/perf/check-headers.sh                    |   1 +
 tools/perf/python/alpha-profileme.py           | 172 +++++++++++++++++++++++++
 tools/perf/util/Build                          |   1 +
 tools/perf/util/alpha-sample-raw.c             | 150 +++++++++++++++++++++
 tools/perf/util/sample-raw.c                   |   2 +
 tools/perf/util/sample-raw.h                   |   2 +
 7 files changed, 359 insertions(+)
---
base-commit: 4626d370ae89b8af4d46a45372b269f926ec662d
change-id: 20261028-perf-alpha-profileme-8010299be323

Best regards,
--  
Matt Turner <mattst88@gmail.com>

