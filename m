Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794676573;
	b=US0m/52l8AiAovmeBi6aHkzznGf0KKPiMYr+8MRH8k/VA1cz+8amUqvoLvS2JFt9qzKC
	 IF2kYn0koax5uCiHkGR1NiOeG50Nu5qpSgkhjHHmMy0/jbrmF8gH/id61zQFW3qKA3ntx
	 WpDg6lDww1alDb2HyJj0TP62IZtUF3KwsXwlmk04rVbpQ69QN+MX3E7BOC7okmbmSsD7h
	 ULzpWKOMsYLCQMLZDAcBjOh79PaNWRFcVdxDyKJYtf3fIgYIJhcNx64vKoeAAxDO6zC72
	 lKs+7vN2n7lHi27ILLTdAOgxcph2ro+4JLMAeKF65OhSkKsTGljlMr2M+1TykH/qFKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=31xlbb6hx1eX0rC5HvEAM3/FqjUjtY0Jax6WCFj+W3o=;
	b=cQi7uyZUjreQzZBQK/kQpDSzP23RzKjbc/BLtj2gg5a2gcTF3yVe+WxSgtKGhPiUV83i
	 UHJ5SubfRqKAGCAEGS7RRAa/XwKUtAwWQdx0IXECo+5s/RgLY2RtMKMyeSLiAii5MsreY
	 R3F33YkJ58QJprW16lEevg6na2M2cmnaKkEbV0Vgswu2NZcrEYf2YqI8V2oa3l5zJxzay
	 RJi/ECsmVeC29QtnSnNduG3K8xowvsiN1Z4qNv4mvpTr3Pnpdru1xL8MEKnyGwCpHNr9j
	 jxdp1CCxE10hU0PuNoXgfdW8NSt7xSETj/Ce/Ae361GFdVuCE75sHSSWJG2ndkEkrsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uu995ZBS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CE1606A33B
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 17:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88CE1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uu995ZBS
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adef977ad9so20635821fa.1
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:16:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794676572; cv=none;
        d=google.com; s=arc-20260327;
        b=sG+07An2onhDRfTOSDmlTcys2ltIrhbd63kZ+Qi4V+PnfBxVO3N1mWOXBZ5MpEhn3m
         WsnqqmOAhgZ3e1zxsPUk5cJmBb0UoO15u6VjPCj0DHEFQ1RH2NLAtjx3N1hZvIE2AEg9
         8xcScAebZRDy7BAgIo8E5RUOfI/A5Qg+abz6f2Xgknu5D7RYwNKP3MP0holt9mJi0mX4
         9oimc8mh2FWQ/zbPYOsWKnn6dPpN4Lak4ucuqEe7iVkTZuX/8AtcdKIvCVzhlxeMtimd
         m1dLHnhi7PlsfmTGvbd6YbHPhCJVfFhAyKmZBys/7kt6EX8ZMYn+DfI88QyJ4A8wJSAU
         myVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31xlbb6hx1eX0rC5HvEAM3/FqjUjtY0Jax6WCFj+W3o=;
        fh=IcElk1ltpsGMzOCSJtrx2wcxEgBzCMDFFkwprH+IIlE=;
        b=eenyRy1eCE2jg200PSiTzGxzRvc5ucd021Al3pw5RrUc4+RIbKoq66uYLEkzTR9Kpl
         CfyWrfBJ1GOo293c6Cco6dEnPvA6s/mxEJQmqIBbSMKbuUJ/9h7v/92GGiY3ZxUhTsLC
         S+70A6BUoZSlDvXk/f46a9FXjIOjv/HyDD8DoVE1zrAMDCslRlW1gIHgXjnqTMB6Lt5Y
         wrpDwbllfMArfTmti5PN5YS6cwjaMmHnDU+inl24DfCc/AacMAuCXRU1WyiWOqevBs2V
         ZTjtHERlhuuo9ivv7Xvu2QxyOPjW9vhinLKJj4tb7QjXMfY9Hk85NWemjcj1SdNfggUu
         R8sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676572; x=1795281372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=31xlbb6hx1eX0rC5HvEAM3/FqjUjtY0Jax6WCFj+W3o=;
        b=Uu995ZBSYhVk/ut3/p1P+Cl0wRRbF8bK59Cz7xgSi5+2v6nWcu2ZhiE3nyXDOvQ1Qy
         dNrB221bQZ5ANxofHUgDBI7tcl36ZS4Ycj1ds6hMib8DlL6G2xJZ1+5e0C0mK4oDhr0y
         SDAGKDs1KLAntHl25lmgVL2N+UowpjXw6x4Tu95iRo0EIhfzZGgQgDgOam6qdXIitoXn
         HUzbEEdNlfeN+JlcUhajAIuEpmKFyw6viWoXYWk+q4VUWtur7u1uQH64iix5MP9vjIy4
         LkrSrNqAoT8yJXXhbxsnC4uYKSabcLnzuinvhK59LWcNOsyLEPFJFFhkVtg2SIh6DgUT
         wtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676572; x=1795281372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31xlbb6hx1eX0rC5HvEAM3/FqjUjtY0Jax6WCFj+W3o=;
        b=d1q3JEanJjyMJUkq8rjDQ7MrgjTFAfmYykt7VzYb/M+xUAj/c8KnAAnFfrigaz3jFf
         mGq7PM2X3Ue5j0DM/iNX/iSvoKPpW40t0Ww2aGvXfm1NFlulA7gPkMVWuLoEjaQ0Igqe
         SPP1c/1YV2Ken+cGS3rdiLqefeY3gmVFx2CWzeq+900kSYLoVIwDDLysBxqMmMRlN5si
         THYJX4RCXJ86AGoypuZ3kadNp7tazXoB4Ott6p5yYm+Wg/gjOdCu8NaeDvorzs1jkNqc
         s9EF6CRjBTPKZEgzuNFNhLPF4AilpGiJTCdbJ5MONqrR3gBj+TogzNdEMYbCEoXh1zAc
         LD2A==
X-Forwarded-Encrypted: i=1; AL+hErGZAboSim3kvbooIpLlhYKQjTUZahoy0SwxYTmBB7iPpD+oSkvS/tbZ2NjxwV98xoeeMrKlZOyqPbHcLw==@vger.kernel.org
X-Gm-Message-State: APuU4Z94sxsliHPMvuMFJ7dWZ186uVg5Y7zQjFy7ieDipvtb7A0AYJQf
	Msp6x8cqdiSPnXQFqVyW5mUDW7eQSnNStTRZJ4mmaotKhW6F0guJqkqSYBlTEduhZ0TXtzqoASM
	k5mXa7V6CuD+6wOe9HjBPDqcDPk9WoE45NJB9njytZA==
X-Gm-Gg: AYBFou0FwsM/7BrPfhUvHfQKvXEZ/+Jpdm2ijFpr14PaVnitRYhaTm1yHvoKtgPmQ9W
	EsZEP7zuLVVvieIJorvEYSIUvfQhCHmWLQGqnbRFC/JGKN51/yHecvQs444O7Sw/digk/0zMu+Y
	2sI7IwmL+jflof/AjQ+jT+dvPNhhOY2hrHYNKTtaQGRZJlTuLom5Jg1T7sBlQpC7b/gFq8JTdjo
	Za2C5Imlg9YcJpH+177FMSxfe/8WQ+cy4dgYz9CyF4GcxGegGl5YDixUOWBDgELOa2SnfUYCKwe
	oI8iEqJ1+1eSWx1Ar7SHNaFy+XRzHbPzfMXnTayxxaz70lIc/krxC9JuT+8LLEn4wRZf615S5GR
	IYHbjf3tghVqzr0qe+WwFB7BmtaBKe/DU4CNIkE3PkHAgGzsjqe2vlDazk8yCxnR1BGXbjsLLzM
	bHVRzvbRiVOy/zf1w3ja8heZnB1C3P4OTSDEncfQ==
X-Received: by 2002:a2e:bea8:0:b0:3ac:fe79:5a6f with SMTP id
 38308e7fff4ca-3ae2b42eeadmr21400341fa.3.1794676571309; Sat, 14 Nov 2026
 09:16:11 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114095335.1283016-1-linmag7@gmail.com> <20261114095335.1283016-2-linmag7@gmail.com>
In-Reply-To: <20261114095335.1283016-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:15:57 -0500
X-Gm-Features: AclHuK8pfoOdDB1dTXpJvk9VU3VN7aUD2aIn22xx6EnrehJ7wih6FztmrukmuUg
Message-ID: <CAEdQ38HoFs7Mf65EcOSwLOYsXcD1KrTFkq05gnU_GmXGpYVZ+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] alpha: parse early parameters before reserving
 contiguous memory
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 4:53=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
> index 9fda01b73b18..c7b7ebcc47b6 100644
> --- a/arch/alpha/kernel/setup.c
> +++ b/arch/alpha/kernel/setup.c
> @@ -579,6 +579,9 @@ setup_arch(char **cmdline_p)
>       if (alpha_mv.init_arch)
>               alpha_mv.init_arch();
>
> +     /* Parse early options before reserving memory for DMA CMA. */
> +     parse_early_param();
> +

Once your jump label series lands, this will run before start_kernel()
calls jump_label_init(), and any early_param handler that flips a static
key will trip the "used before call to jump_label_init" warning.
threadirqs and randomize_kstack_offset=3D both do that. We don't select
IRQ_FORCED_THREADING or HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET today, so
nothing breaks yet, but arm64 and riscv both call jump_label_init()
right before parse_early_param() in setup_arch() for this reason. It
returns early if called again, so it's safe to add here. Whichever of
the two series goes in second should probably do that.

Reviewed-by: Matt Turner <mattst88@gmail.com>
