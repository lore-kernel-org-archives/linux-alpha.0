Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210974;
	b=Ivw2Va8vK9ClRPng4NV/QBOcOLkvSsrCCcAoEhtCHP2MNfu4nzMm0z43xuZVJ99fTQJE
	 2BX/dekefgUO3YVYt1hIGnu3mwv3bZ1UCPoqnVg1MGC7Hb1uQ30AHDQV0nq7Y4fmmC9lb
	 R7lRYHb7mI4pEJTsOTSN69/YyACTfAkAMIuaFBUkOmkluSy7RbWVZT4SRuIx/6SlREsaY
	 vK4n1PfupOdA5mT2RqZyd0JsLDOsvI/SxEoQ/On+cyhUZTVHQVJg1NTQFWHpss8OCHdVk
	 15wx4mIjD6GczvVo4ynk8bWhQSCKZvAxk3JluyPefQKgFm6oNOkG8Hf9vcAHQhx1q/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=YJL/eMvAju5U7ixQRbvkgZkJlieRNao2FmhADSZyVKw=;
	b=gMPN4AcZDLjjXmGrzWOyQxCZSWfOeuZQZ/HfTT4grr1V0dx4Ad3YzysXL4wUNSTy/R9S
	 J+PP5s/3mRGOorP3XTlwRw3PeE+pPkOow9n3LDY9QNxShts+hC2I0pPBRvdpl/uif/LEm
	 Rbk6EOd20pkB/PPVZRvm0SP3VokxZEv3VxFj6v1vGb07h1O0JYnrwC3YuXk59PDNXiIRr
	 38U2yGJ31hG1Jd6AW1abVyGq5r0YHKucI5Rj2fFY73btBhVos++qB6wnL77dxRhHCSRVk
	 tk4Yecdg4/rea4e+3H6FBq8l72mnjcpdvWZjb2XuJU4ZbGbV7qAOq8HxGihkfC0Mlcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWmrBUUV;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E4F606A31F
	for <linux-alpha@vger.kernel.org>; Wed, 28 Oct 2026 18:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E4F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWmrBUUV
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1391877d50.1
        for <linux-alpha@vger.kernel.org>; Wed, 28 Oct 2026 11:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793210973; x=1793815773; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YJL/eMvAju5U7ixQRbvkgZkJlieRNao2FmhADSZyVKw=;
        b=lWmrBUUV68NI1WkJFuDUPgM1G4D0b7JFXjwfXjlIboTEV50dtXCfyMth31Y8qmhfBU
         1ufQWBaHg/u8X+gxSl5jqk7zZujWkJccK4MNty+n0F0/yFX5yBIRzMLM8vqE4V2sHEv4
         Jd7/eyluPFnzUZ35os00kRBV6a/qp6UDvpZQsoS+wI1wfsTvjmgwexiXQ6V6lMzlFYmH
         nklS2xqVgfIJEhxkTcYOeL5Y61SFnbCJEYgYUqhGTVvW8qzN5iP0sqi/SARLzdZEcgzI
         LdKeo6uDJRBfLqsLrseTkgdij2LbV1uFNKTwmj68LgQ6YbBA2Qz+tldCAbuuJtaqVqo6
         xiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210973; x=1793815773;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YJL/eMvAju5U7ixQRbvkgZkJlieRNao2FmhADSZyVKw=;
        b=ZBAFKUHI7BdgjXq92EtJzhuQ2PoYtt+8IAQU5hge9VMvDGqrB4NR58np9boJR1xwBq
         yuD0f7Gh5xJSF/OgJqP8+YNGZq23REOz3Z0V7x4REfETWI0pi8ikGoAX/69pLpEJJEDt
         sB4JLlK0HnYc+piw8Zp67nxvn88BQG3gEkP+3B+VxmwievyaP69CZiatDReb5O/6wGHy
         n8NZVjwZjpAQo6pmZXR9hm/CY1nwgQpyyTOTay4BQBHqdYYW2c5FtRtz3pTzR1g1MlT8
         Dpvz0AJvWZ0S4AB/iIuh1QYAtuBUoC0zff1hUkKZFlFD6LWYPRzkIOz25ltp4+rkNb2q
         tBcg==
X-Gm-Message-State: AFq9FYJN5hekULxLDGTuMJfzKZVjzGg7WvF/WHwUIs/loFEa/00xaDJb
	ViT/0KiqMYmczBoe+QzRBjGu8zSRS3pS8GSbEJ2mpzASkiiEdHESUkQm
X-Gm-Gg: AYBFou2KBQz3PKyT21NkSsqCxT1i26kY7UsE6wFUEvAQaJWigFtykl2TD+zwQJpCHM7
	3k3iL9OCbENkz9IDoWYavbN5QWmMFPs9jluWT+xYJRM8zo5iwwmmxv6JL1tp7EyiC9qYda0Ghrn
	fGsJdQ3v6roR/3bGqWF4EiZ/I5d+joer7XcJQ2/XedQiIqjJU2q/A4AuPWzQ31on1qabWUo1psh
	muvfs3orJ+sDNBRLejW9YsGu6l/GUUCt3lJqf2BljVnI0XYaZ1Sd3kToy5SCs5NH8hfifWIA36u
	4iq8x2mrVdraMfCiUaX5X3iDYlWOaICZ2rIwXKRJFlZYdTs+9yE7OND0fvLZGt7ygDEOtNXJ9Qv
	piYwpKsppHXiPLsqvj+kOJsc8M4RV1TbmeSwa03JDMwmFRvlvYWtCvz9tFWZo9odbJYaggIxow9
	84ku0hURkk48HsVuGBEmvCSr+so/8gdXSNAvwUZ+OUYNdy4jN8uWWQaTyv/bK94F0rW25LJIQHY
	fl4CZKQ9iw+IgIUgZF5t90SwBmQEk/1wvsZFqEXXMAK0ZF+JrIYAquLMu3dc/IOr+7g7NTHoCuR
	de6x7+qEAW9S9pndeTbITGTFy6BPtrkjLNkwunZf1b3jtNcIJju3DzX8sbJvU2zbI2u5f5dy9zN
	hjfwRwkAA3nrr32wrwBJ2xAbUvM29P70=
X-Received: by 2002:a05:690e:4889:10b0:679:42be:51a7 with SMTP id 956f58d0204a3-67a7bc54c2dmr1427111d50.18.1793210972677;
        Wed, 28 Oct 2026 11:09:32 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a10a7dcsm2188347d50.13.2026.10.28.11.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:09:31 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/5] alpha/perf: add ProfileMe sampling
Date: Wed, 28 Oct 2026 14:09:29 -0400
Message-Id: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyMT3cScgoxE3YKi/LTMnNTcVF2zVEuLREtz8+QkUxMloK6CotS0zAq
 widGxEH5xaVJWanIJyBil2loAe6dM8HMAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3015; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=knRse98Fly/S5q0VTtGdrTK6UEwrDlpYQ1dCdtEBQ3c=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIeWUWV+W3KOfH9nunmX4vK7DdsWr9DpFnfl2l51VuH2
 dd2fdsh0/GRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXfPjJ8M/WwOVLao
 NU+4a9U91aePXWr9yg33vKpJjzwLkDD2w5zZIZGZ74tho0TZuraZeWwSlxtnHS15eb+t7lF644x
 NB5eq3lcVYA
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
git took 4.45 million samples with no warnings.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Matt Turner (5):
      alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the logging options call
      alpha/perf: add sysfs format and event attributes
      alpha/perf: implement ProfileMe sampling
      alpha/perf: attach ProfileMe status as PERF_SAMPLE_RAW data
      alpha/perf: optionally randomize the ProfileMe sampling interval

 arch/alpha/include/asm/perf_event.h      |   2 +
 arch/alpha/include/asm/wrperfmon.h       |  14 ++
 arch/alpha/include/uapi/asm/perf_event.h |  27 ++++
 arch/alpha/kernel/perf_event.c           | 246 +++++++++++++++++++++++++++++--
 4 files changed, 278 insertions(+), 11 deletions(-)
---
base-commit: 330517c63aa9b48227b6ab45f01003effac77ae4
change-id: 20261024-alpha-profileme-6e98a977cb54

Best regards,
--  
Matt Turner <mattst88@gmail.com>

