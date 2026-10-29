Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793288099;
	b=Dve/wEb6ggGH5c6a+48SHP7hzP1wezXEAnX7tiAqOa75BR4yvLGtYa68jMKtQ6clw9SN
	 HroiDf5A/pxseeQ3ED3qTdT4Kc5x4dFlpdMlCYmO6LySOZ0/Xh2bG+yEeDMVs8VhUvEdV
	 lHeIQdOx1yxiW3D4pZH4jkPDo4En01QyUJ50TkVb9jedyLNoFQ1TP/x+HE+8gPsFcZKSs
	 iwV82G4Y826o7QaopokYzkscXKbk1hSNjhkPQNDcwx7Y9FMM+PfcPD1Q958+gNlAogrY9
	 ccrjg0WE6uqZoqjkM2IbF74WICQpE812ut+3pNmRpw/8j0VucdPOIPQEFBWd5OKGIAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K5Rm/IwaNhYgMhwcnqL255xWGYwp8sgs8BcKPKPbzD8=;
	b=QNbKvFcHFqBp031d9WNGpg03DVR3IN5Ilvkn04WKKQ5yapSiMqc5PhKZMnSlSxecmn//
	 xnriDfkBL9flvPRt1fOfBn8z4kUW0/ZH1+M1PHVhBMJw8w7Dcxh3QlqK7sOh3kjsQ4vJy
	 uvkIumhPSlRGM13ZTZkoiIfPd4Fbev9Kh7XJAxwLaWVxpCz8GEekP6EJ335X7lzhYbdfl
	 ZmeBQwaB0KKwI77DnC0hEQ73axdM2tzf6y7kq6GFg5K1VS9X8PQJ69SYnCHazqgH1VqOK
	 6edt8ROLjZf2Ca2M+LKLghk8RpPp7TDunxFDMGZwIyRwX7AgzPLFbVG4Mbl0vdc+2kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JU48K3St;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D1C606A32C
	for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 15:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D1C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JU48K3St
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3aae7df0971so16038081fa.1
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 08:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793288098; cv=none;
        d=google.com; s=arc-20260327;
        b=jMtinVq2PLBK5C1n/SmGsXiRbR6XCb5AR8mhTjALDFb193s/un0DdyBZYxGLha3D5u
         xGyhcP9uOsxfH1IjpK62Yl6F4LaljA5WRHhKZPhSplEX/VpUeJYRPTZDfPL1ltI+Ap3W
         jRaqU9nATwGdlW79oxpBSK/T0+reuynRkgeCP8mQMhgKz0LEbz960MYoKQACzsZEw0IB
         v7RFKBev9xJT2fWSVmS2Jn05mob5nAOQ2Xkgo2yxEcs1tSLuFBFM6VL+C5biyBOVApyy
         6tghLWKNYuKF3dVf53KsfZjd2rFjuB7OZX89d21rg89KabK2EBqwWxQlS4z9JAIcumhh
         r1Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K5Rm/IwaNhYgMhwcnqL255xWGYwp8sgs8BcKPKPbzD8=;
        fh=ltFqZ4UMhxriUh4OooJMYTrBD++a8FT1JFUkL3iI0O8=;
        b=B4DUyu90eliQCQREi78mFystCEHlUAY+w93GsQ5piS9fzVht+/Jf3gatmLg7+fwN2+
         Qiex+iKO2SxbYIX++BXA0gDG5dtTs0UUlq5btuwGEsGHyGDR93GnWsahjtR2t6imKXFN
         HaGxS4/DA6gethe44AgbPf3jfdosCrntihh/a5adV8MUilgjSVPPOqXoNosK6bnvGzLQ
         UfN958sB6DR2dl+QikD+1XPQYvxygWboPHCkOnDA8pgyaeN6KY7aKint0UG2Wz4pXB0l
         EEm/cYinxa8Ds24IoLcQcCEqLg3oJjgOdwI3BfDGZbY5rJToWp8L9HKis+PHJw0bqsTA
         iveg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793288098; x=1793892898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5Rm/IwaNhYgMhwcnqL255xWGYwp8sgs8BcKPKPbzD8=;
        b=JU48K3StrPmJy+BWBXIimZZVccOgFf+hwfyzZld26az5XfF9tBNddSRRA6EbTNH/iI
         1gbEcjpkkMPDfjRZj02sayE/rDgogPl0HqX5RxpF3COYCVPkhy43++ax7kr9CZHbByT3
         /dG90Httmlbxd4g/b2oVe3D6+xBGiwLMUqyhyuPWpEoQ5MWrA2UcABudFCclnuawEyZk
         dhu2cpbb9eWELAn7JEH4LlscXqJmgRxhSQVK2TuZhaGHbfJ5Nk9UuZ75GB/iVe7JDuZW
         iHoDmjlZjcOt1gUo+onBNqR9c6cLGbeiJGrW6NvFYLzqSHKn5MvAW4M3q02ZPy6GtHkO
         6z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288098; x=1793892898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5Rm/IwaNhYgMhwcnqL255xWGYwp8sgs8BcKPKPbzD8=;
        b=gmXymyVIYnM15P8/WTf4BvRD3YzOBX+mYMFNIbn0BBpyCtANKMLNZfIphCsaOklAAY
         CcdGD/QBrBeAc2UehXztF0lllDV+9QHbjK92Y7wcUVmxor84gOayyMFPyJULmJ6ev+jF
         PG+Lya8Y2KWeK0nr9etWN91EAM61zwUJZ812ElV7JqF3FuNvcw1g06Jb2JcSkyHF1OVd
         LOLEmUpbUV3IcwE7MAhBr/Dv4sTFZ6wbImflpgfkMOSs4VJwEEYYd1cE7tkjQa5fsSW+
         VwDC0xDVkJpAAif7HbAnuc7c9tJtySdgn4kpwDQeyEOrZkKd/Z7qsSOlkQL9Ry8vl3Jp
         wt+A==
X-Forwarded-Encrypted: i=1; AKwUvBzwLoW6vDCz55qyR82a1WsH9SkV+ZD0AnHmgRiCU0NXWK+DJUuxrfd7ODKrYJ3Usc8fRahRDPdOSfr4ng==@vger.kernel.org
X-Gm-Message-State: AFq9FYKESyvsx7RALkSNuTY4Li+L7IRPT1Bayo+z4WYeb1Ce+tOtqRmq
	KH0W+IGgObAE/S/IRV796hQ6yEjYnKVNwCpAw5Np4RbGDJqfacl4RhWhUzd+K6ALkKFUlReolMc
	w+XKl9ZyIHtkO4iNAXVb6mqpzhpSzLFM=
X-Gm-Gg: AYBFou1VdaarvUrMOZokawOAgtOl3QSlcd8qCOxxRVKXszljglyfw1kyWsmihzy+GU/
	S1U1mrk1whkG2fZuznUar5MozGCXfYwhuzcL/tz6WysIjJa1AW0DwA0k6Nccsfcs0TswkzFP6wu
	Oh7vSZf4wPiPGAqoxgX3z0/QNYxQ7g4LIA8HpFGkYa4lRU4jJ6GHP/nBv17jOqcIA6yL9GsV1d2
	7MR2+1hKwZklMIpvBm7ZgI0ioT5USp1/UqDwbsFwVrV3+RSUXpnNG3M6580vohFao7dRv7nJJN2
	sFECMGqZw4VruXgjZTeklFA1PC16LOVXltLi97nKZthNfIb63sENIHpZwOBF/uJTkwEp8/jo0sX
	Z7z/mf1MobPUaZj1bZcW0qjqc/BLiRxI/QO+uq2PI6BZR7dd/ML4BPkmzQGbXZnOK/uVDtPcEs9
	FI6Ep84eFh+8UdwOEwtBZFTkSG1tM4kkU5PQx3iwCQ9qMgPFf7+UkD
X-Received: by 2002:a2e:bc01:0:b0:3ab:4107:1bef with SMTP id
 38308e7fff4ca-3ac9ce5418bmr14386351fa.1.1793288097433; Thu, 29 Oct 2026
 08:34:57 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com> <20261029091141.GG1779021@noisy.programming.kicks-ass.net>
In-Reply-To: <20261029091141.GG1779021@noisy.programming.kicks-ass.net>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 29 Oct 2026 11:34:45 -0400
X-Gm-Features: AclHuK-YqVWgs2e1oeI2-sd1y4gbLXMqMG1B76Dt72P9DpeCFgJ2eqCh-7oWuCk
Message-ID: <CAEdQ38GiZLmnjYxzN6C92uz4-MOX7KoYvTuRrZ5Zike8ssDCqQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] alpha/perf: add ProfileMe sampling
To: Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:11=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Oct 28, 2026 at 02:09:29PM -0400, Matt Turner wrote:
> > The 21264 from EV67 on, and the 21364, have a second performance counte=
r
> > mode, ProfileMe, alongside the Aggregate mode that the driver uses toda=
y.
> > An Aggregate mode sample reports the PC where the overflow interrupt wa=
s
> > taken. On an EV7 that is anywhere from 15 instructions before to 12
> > after the one that overflowed the counter, which makes perf annotate
> > output close to useless. In ProfileMe mode the CPU picks one fetched
> > instruction, follows it down the pipeline, and reports its PC along wit=
h
> > what happened to it: whether it retired, whether it trapped and why,
> > whether it was a mispredicted branch, stalled before map, or was killed
> > on a wrong path, and what PCTR1 counted while it was in flight.
>
> Isn't this the thing that ended up as AMD's IBS?

I have no idea, but it wouldn't surprise me too much :)
