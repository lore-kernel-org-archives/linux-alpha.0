Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAAA377AAE
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 06:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343202; cv=pass; b=aF/SefCiAI3MnSgBcJATIX/ymib9PVztVSeGfeEuVp8EogDuzBDYmnpP8mMBZG83WqXzHchPy8R/i3AQ59Xk97wpLY4GAehmJtM6rDCK6qX5gaxtxW8auGHmQ62g+4YXKZXATfAQ5TkJQsA7Hna+kTm4oZMV01zTTbd3cUWGBjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343202; c=relaxed/simple;
	bh=sfItIp/owYAQaCJAs2rI/pxIYH3v5Gc4kLyWw4gQTWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pf/BlO6tp5ETUlhrtkH1jidtm/pgcDNHwGs5OWUflJGa30x8oEXWyX11siFxj+mjcOGVOoZ/ju2Up7e6U50RqTUAHJxSyEPeBIoRBSNp5CsjWYpmpJXBN9aDqEniiFlQm02EjzlTCT3t9MsXH5ORjU6+sw8QU+MtgHBh0eC94a8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bx6b+hIj; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bx6b+hIj"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c16794450aeso182580266b.2
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 23:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786343199; cv=none;
        d=google.com; s=arc-20260327;
        b=NgqtVsg0IPBqxnVKQefA8U/jwjRhDTXsLQUl++l7zIEXv29gbmVbAGoAI1GMBFgJAP
         fgTEzHn53C70HtGwP5VuTngQuVVGYYp53EZ41Iu7s4kQABV8z+zEqZ9X7afILHh28E5+
         ZLtXicMU4zwjC5x7hGndwLTmFDMZjUrAjNKwVGydCgD4wnHHdHKWarHjtDq/KrBwC7u0
         uu9T/DyrU1+2vRiNjqaUqdT3O9faZ5PHOiksDb45kTQH0s+Y7r16CbyOE1ajhRcv+VW8
         q1aChUbUO0qj+M9E6sSN8h7b3QbSysdgu6WXh3rX0Q+C2LaFnyWKgPqCKx+cxEwa3sko
         Xttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sfItIp/owYAQaCJAs2rI/pxIYH3v5Gc4kLyWw4gQTWw=;
        fh=BVmK1mKlXHH6vahgbDs8LZqll4SC7XgSt6trvVOoITI=;
        b=qdmkRuRyMgPOZwqDxzZvCiM1VW7jbKg+K5LOgjzGD37t2voW1kaz4ucdDCb3qDFYCi
         j/3QUzcGs4U9QUXJDAOMgafoM5VPRRjfCdAOrE+vxtydCaUS+liicOPfvf399xZvcdFL
         g3mbyjrTMMZLUWj/n8895O3p3P5oKwATuMlOIxmxncYhrvABnmtMjmMN+HbJnYW1gToM
         4BKjfF7vCB+vXjbn4ho9gsZPYiS9E07Vm0H/7MP768qXhaqmnv9lCz3035z2IpUWzGkj
         OHhoAPWVBnZ5OnoeXFyK0syOnVMlhKpvJWzeLyRYbqKo6fEOzKnNKYZSbgvFjykUqGTn
         TmeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343199; x=1786947999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sfItIp/owYAQaCJAs2rI/pxIYH3v5Gc4kLyWw4gQTWw=;
        b=bx6b+hIj4lZgV4+t+LkqNp9y6IKLNO4tJmoSIYH1hNw+n991v8pOdnbrjeqywYnxkY
         jLdcwduI5ffofzSkJ4g4yHAo4wLFbbm1FPk1+WerXT3yzAULWFKx2AnzEBH1h717DkAj
         +8CMcB0rW2l6fwoHnAtjDsiQ3xW8/aCSOLNSqIfposZE2b7E8RiXKfHVk+J/qgv5RZ6u
         iL271B/1r/OA0pj70SbBVW73jAuzn/ruYWAluIEFBeT8Una33YDYyBIDr4aP+AZBapYB
         AzoOP//CWkuvd1Hkuh4VXHaD6LMfRrLKwG55rEU1zxSySprkJBx9pLy4+D9lgDo2Ddfm
         mSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343199; x=1786947999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfItIp/owYAQaCJAs2rI/pxIYH3v5Gc4kLyWw4gQTWw=;
        b=fmRbI0G+VuNZr+2Pug68fWGQxfK6iq9ZpBx73UTZQEAQbgTa17kZpYu/zQGLhe9zXJ
         HMZUII9ny3ieuKpeJ+PURbRmSE0uD2HeWFmcOlxmp/XDJO0lwoR4r/TUKXPZNIWWTApe
         wxlba/PLqy//nQPAJD1xd+zakrzilYz2Lm9RWHET6Yz8fdzAkeUOZpkxXVWZqBIyaS3Y
         5AP1i8K9Lp1AkQNdoQWKBxKtvU2LqmuRUIKvwGO3wdz57nVdrbiVXZFzYyFW9QKhBCDH
         log1eX74vJYIrd+HKESui7vtQv33uQzIIUH18gvKxPOk5hOrQ+LY4aoqaPkb6fgBr5lK
         61sQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxNKhyihpBgKGxJWHYJMMwZTENh1T90+VmabBE67N8g+x23bh1mb8qfD4jul1IvIarlel0gMq2nB4xNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6qs7eHwLRyVciwGXrHCmj25lflFz/UgURx8unRhOEUGCv738A
	GpzZWO9F5HcGCebplIqQ7RW8505ybBHVonVJpVWU4kngHPFLl4Z4vP40DUOMqrjmUMI+gfIOENN
	G4tXonp6O0bA+upEPzmQcBf1hxSsHoc4=
X-Gm-Gg: AR+sD114f3f5KCL2o5wJ7EOSJKglhRoDhQbqIMzowdBX+1h0VdNLgvZcbHn5od451fC
	iIl65oKNUs58Aua+L4xUhxXQQHtZJycwYbOYX0rjHdHysgM0UfZ1+sRlc8xn6ASoqIGT9uI9R0r
	dl4ga3mHTm4t7Uh8iGqcuIvlSKimolQDQICvJ7ZBrGUePjqwCGAo/bLejlybr/tZ9K0qFPT1Lo3
	lsvAgE8zfF9fXwCskgzXXUKnruHNtc0USN1XrNjYTHTvRU58nwHk/n0V+8DM6BKozQg00iVfs9X
	M4y+ywiSrSLDwJR059fJYFSNok8OG5dFjKyAkdXsGy+sVPRTB0oL91zct66woAoBKmEiJ6SNiQ7
	7B1M6bwVZdL1SHgscgsKSqkBDpzKkmR8=
X-Received: by 2002:a17:907:3d55:b0:c19:80cf:4c75 with SMTP id
 a640c23a62f3a-c2039dc53d8mr1901118466b.20.1786343199218; Sun, 09 Aug 2026
 23:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809085208.3262799-1-linmag7@gmail.com> <20260809085208.3262799-4-linmag7@gmail.com>
 <CAEdQ38Gb25m7nEAe40-5VnuwrTD3HAj7QsspNtY+euxWKVGZ7w@mail.gmail.com>
In-Reply-To: <CAEdQ38Gb25m7nEAe40-5VnuwrTD3HAj7QsspNtY+euxWKVGZ7w@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 10 Aug 2026 08:26:27 +0200
X-Gm-Features: AUfX_mw0dz-rLkhNIG91uKmtMeAVjSQHSvRC-t6_mHZJcZ0cGOpM4c9nzxFGQ0E
Message-ID: <CA+=Fv5QN8jMFMVENxky7xLP37K494-+CSQguOGZxFCS6QQk4Fg@mail.gmail.com>
Subject: Re: [PATCH 3/6] alpha: fix the local TLB invalidate in flush_tlb_page()
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 4:44=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:

>
> I think we could split this patch, like how patches 2 (tests change)
> and 5 (missing else) are split.
>
> No strong preference.

Sure, that's more consistent with the rest of the series, 2 and 5/6 already
keep the two changes apart, and 3 is the only one that mixes them.
I'll split it into the current->mm test and the missing else branch for v2.

Magnus
