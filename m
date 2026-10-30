Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793332702;
	b=y/Z7JSsFoNay8VrpfuyyysgrxA/7ZO1xfyIywMyogekTOOkPOxObVH8sk87H847Gv6v7
	 kFyqljOJc8/pZq4vQcgRwIS8s9gKDJzClRFlr6/3mWVdyan1Ii8SIgrVanxyDJCsLNcYf
	 JENtLVp8hg0EghTSDH2tOL6Hjv0jst0F1gx1KtdUdZchJ3741yFATIQOAm8KeTDEaGGX2
	 ViZNzOlYnKrwIirWAj5hkCTg8dAs8lcfh5WYWxWXit4YlfJWkRjXTQHi2mZ2aNtfTvxw2
	 Da914Tvxebo48KzoVHlQFA6ihe4iCr/cF/ehxytqmulpJvvDmeEieS3z0Ww49KbpBbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793332702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IZmNuI/wND30J0nkI7O6RvOq46XxnSgW4W30rCGXnNg=;
	b=0IYszgSduPfa91wlTMg7mwlBFiBMaMii9AdiAGsSgTtgcZTv20iyv0HHWNAElxWGcj92
	 NyP8EseHW3J32XmFnbKsCSTxFZFePpsYy3GvD5dWEiGVrd4Hcj6zvsp0Mx7xzJfs/DPz6
	 xYn4jLZ02r7v5ARclzcV3hBhFfPe8+WNEI3s0rwe2qdGmYBs0ia90qCbUr4QlrdacFmfH
	 /FFYVd0t6KLhjQIiF4tL7MnJO+Ze4DI4xG/e5K1Zf6E1rU1e8ZobxgOjjlX7wIjS/7ZP0
	 mieYu3I76r2iSVbZEth0aUgsScnbardeV+f0HT7sNhKsj1ccmmGuTZo7whWzGLxDGAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUpdStRz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CF9606A31D
	for <linux-alpha@vger.kernel.org>; Fri, 30 Oct 2026 03:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04CF9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUpdStRz
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bccecba199so323079e87.1
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 20:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793332700; cv=none;
        d=google.com; s=arc-20260327;
        b=D0PUc+WCaRuPSwLIgomGNydPT4noEV/veeReKcQl0aHE29oKsDYpJWpmc4q39Ox0Ar
         QIjfqGM8z4yWmP8ozlD9iCQ5MEAsgTAcHHpWYG077vDg3pVxegECKKvG4ZI5kiWvXTcg
         BS5CBGEQyuXfFSjjJ19dFGF6Se+wglKwRTxVwoWi/hal+uJSbIAxflKPOSgBCSpc8hZK
         ieektOYOTGSR8gLCJ77JDGARWIqIGJ8ArKb7jgYu7wpmKNtRUjdmKfGVoEXsHTI5rN5Q
         Gqkku0ivzN7tXhI3VOl12T2SKoaaKOXUsMMg6H27oO8KG8uvhW2LBurpgmuAhp9ZaCMZ
         aHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IZmNuI/wND30J0nkI7O6RvOq46XxnSgW4W30rCGXnNg=;
        fh=UeJyc5MU7oOYK4xo2HrolRcDwt54K1r53Q+Wqy140Qo=;
        b=o35QKjkI2FER8i06fw5GvwtA0YqFcy5RNXRkHBjMObZPIowXYQNS/FCQroZwycFVNC
         xqdtIvBDB850VNbIpYqxFvqAfp0plxQahfKnSBy36qzlJmSgFev8GfQAliDCiUY9dPzQ
         5Fr3t5wgw3MP1KEc4sLTsxo8CSL6EwhSmtuWN0AQdWluAyou7t6tMTQIuONLExbL0P8v
         jQsi0uVEWyLkSeZtd7dRQik/u32B9c5ribq7cn15ZURbvcNATT/f2lj30lMueHEXLQ8q
         KGfswseoPYDkKz5nO5fL6YkOgG0CUqSEwAVR6MaPHGUFXKTH1uY7TGYK6Q4ySBKMo9/e
         fnFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793332700; x=1793937500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IZmNuI/wND30J0nkI7O6RvOq46XxnSgW4W30rCGXnNg=;
        b=sUpdStRzH778SDNGZYJe1CEBwNtIRtYO39O6dHFQd9TZwGmLMl9XMQQDhD5mRr3mnd
         LRCTb4d9WdJYvOH8b13wGWKoRGtT6WG3kUtGUuO2eEhio5XuhgyyAIcHSEZKDtZ/8ZiP
         SJwdec05E3w2G00BIGQv1yRWbguaYFEvCQQNyuTtdWIaH+Kjd1Z65NBeI1R+kzAK+ZAD
         cl/kfVFXdq1IopfR9d2GVNwH8Qa9mfI+YRqFYn/xHeHxEAG2yeFhZNkWRVRYO07GLRWW
         fDfxplSL5x2646zj2cU3XNygzYw2ZCJpXHfySsoF0q1bHbChZPOJIUUm2DIggEZvP+cR
         VNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793332700; x=1793937500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZmNuI/wND30J0nkI7O6RvOq46XxnSgW4W30rCGXnNg=;
        b=vJMt2keind2AIOCG2R6HwKQpNfz0wZghCEn2SGtxftkCSXS/IYK5mal4hHsDuezaHw
         IN++DkjbI+6/hhrVN4Rnii+tO3r2CGOwpET0CiI7G3mw6USbmkPxaUJ80t1eY25x50sG
         fNR6WJAS6UAWiZw9bUscHqBzFcbZxHAyh2PQ3Tir/VGRr46tZvNSm5A89CMp5TEtLaPf
         2kTNttjGQ5sgKo1VR8cCzQEdAcSeYUTBZpjb2tKbPII30MFqjb8F5gqYHyJfRCn/7UIu
         tAbCxgFNp1HE9IQ2DTNwEl87YCB5WIGvtuLvTmuaNxdYg4BS6CVM/Fkk27TOCrQBuKOJ
         QeOg==
X-Forwarded-Encrypted: i=1; AKwUvBzKeCXT9odxBtnc72iG6ZPooP3z1kExxw9+8J9hJkQgHrW8WT7Wd7wWbdYTzeRQfkPGX89QkLALXmQ8zA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUKm81szkRkplTxIjpngZIHia/CJl+ueHIkBEEv/t4otIcK+qi
	lsrjV6wAUCPbSlEwQwMX1RvMFuscWpbydtZ+DPJ5/G5lguba+Kf9pLMy+QuYAJBEeAOfV9jweut
	r07TRiBp2Zs8YxrTFcow/mNW6MlYifTE=
X-Gm-Gg: AYBFou3n2R+nH9qU3ekT/vAHOfGngQECzD3uSwdNfYF+/HOMdlmFwCZM1P8f45wmTgw
	MGuveLmeSlY5RVxflDnpGBlTsxFIFGI/e0gHYnYg6wxrnmdNVvdBkc6wyZICXdJCpjqw0Yg2t2U
	Z/5tKeTbXJQJOBy03NJO4JP1sF71sfll2cLbbIjvdVAMQLpl5TfZPaElk2XnRwClI6g9DeNAt1d
	GiANIxSW2DqdKzzLIWdYfiDah7bb+FuxU8wR2erk7MGbqs1HT3F6/IJQuE3uiszn4SIiorpCJBG
	KUDaBBcUYQxsiIJ87w4Dtbev839DyZt9o7BdH6SgZu/qgnVT82m+bl6ywA+ju3lQj2IyP1nnUWA
	rRFcQg0AqKy/oktmQqb0cHOe/1nwxMaAFfZCjZVUAgyCvh4iYNxhN+W3GgbtsFM87rWiG6JGSg+
	KFmJvCxT+mPc0poqnQeJCJOJvbq7LEefZP8iIemEce1b/AWzDthJOb
X-Received: by 2002:a05:6512:1289:b0:5b6:95e:87ee with SMTP id
 2adb3069b0e04-5bfd9562acfmr282919e87.13.1793332699938; Thu, 29 Oct 2026
 20:58:19 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
 <20261028-alpha-profileme-v1-1-d44b52bf2500@gmail.com> <CA+=Fv5TsDjMcd8+ZPPAXWzw-ox5yhvYJqiCBUfj-6Jm0Lxf9aA@mail.gmail.com>
In-Reply-To: <CA+=Fv5TsDjMcd8+ZPPAXWzw-ox5yhvYJqiCBUfj-6Jm0Lxf9aA@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 29 Oct 2026 23:58:07 -0400
X-Gm-Features: AclHuK8V7EpB7wC06FUDBXo_x3T-573CFsU0sqVCv9AcRDNtqPDSxvn5PcuIGgc
Message-ID: <CAEdQ38G9id1CnZGzkgw8vHLKZM+bvJEDx7ze+6zpULGTwG=9JQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
 logging options call
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 1:38=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> The Alpha Architecture Reference Manual, Table E-18 (page E-24),
> describes bit 0 as:
>
>   "set =3D log all processes"
>   "clear =3D log only selected processes"
>
> That appears opposite to the changelog's description of zero as
> "count all processes". Is the manual incorrect for the PALcode
> implementation we use?

Yes, the manual has it backwards. I disassembled the wrperfmon handler
in the UNIX PALcode from the ES47 firmware (V7.3) and from the latest
ES40 firmware, and the code is the same in both. Function 3 clears
I_CTL[SPCE] and sets it again unless bit 0 of a1 is set:

    hw_mfpr  t3, I_CTL
    mov      1, t4            # SPCE is I_CTL bit 0
    andnot   t3, t4, t3
    cmovlbs  a1, zero, t4
    or       t3, t4, t3
    hw_mtpr  t3, I_CTL

The 21264 HRM calls SPCE "System Performance Counting Enable", so 0
counts all processes. The per-process enable is PCTX[PPCE], which
PALcode loads from the PME bit in the PCB. Linux never sets that bit,
so if 0 meant "selected processes only" we would never have counted
anything.

I'll add a paragraph about this to the commit message in v2.
