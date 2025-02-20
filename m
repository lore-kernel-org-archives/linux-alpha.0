Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD90A213E6E
	for <linux-alpha@vger.kernel.org>; Thu, 20 Feb 2025 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740074392; cv=none; b=sT9U4vm90dt4REC2jg0hbTs9Z+ipWPt9gOHZmR4rGwOu9a8uvxh611oauS9GE8Kc2IrjC5NN8W4cWNXs+rl1eizkFbXxQI5IiKGoH5yERJRyRGAj4B2fJrkxoChA7zCsoSGWteZ06gSpJyFWntsN9v6j9eeUMr2iE+Qv91kX0b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740074392; c=relaxed/simple;
	bh=tYZdg7sRmlVaf134nM3KeRlxvjXKLXuRmFN9yX0E2pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9kewycaJV5LbHmXdM7LtbYBO3jXHxgx+m8o484yQqg5e+Gvpk884nvyM3LGVgbgQ6j3urb36faSS2xLo+/fWMzRFqLTCedfz84/8Y+rxlrApCdV+x73dDLzj3T51csYH6kEFlQTSz80F/Fafs3o8fzVBbhw1Mi27PxnOwKQzWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gEXAXUp7; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gEXAXUp7"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so259828566b.3
        for <linux-alpha@vger.kernel.org>; Thu, 20 Feb 2025 09:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740074389; x=1740679189; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r9T6ah5nvaQ91ZU/lmF1ivJr9nZ+XvlNxAP3jut4I4g=;
        b=gEXAXUp76L2ahUtosuuWzH56d2CqmtcpkJawJUy8OrSLmf+9/zkIeEUVTxg8I+gPGN
         pABPf/7N+v0pw4oH1LTuaYVFPxYhAAHCmIUm82X9gClNWCM6V5hOl/3bpYrEJZSo/gED
         pfyoqv2WFzgSGTMIA66PSgffWwvt3P2EVAtlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740074389; x=1740679189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9T6ah5nvaQ91ZU/lmF1ivJr9nZ+XvlNxAP3jut4I4g=;
        b=uTDtSwXMWLSNy7MT/sdMR65Jw5FlwXx5DY3QrD3DpnvboK8CsD61j3JEIl5RJkGkMM
         d0rdvcryE/5ZZ1WWO+WtFLTv4l5SmI0bpxyf4DNOqZrySgMDJhJOYByuqxq8m3iduVie
         Pg92I14zui/FLa5ch90Nmbddf7I+owZXHedBgbmh0bfZntb0ynbOEKEj89ORguKIb2EN
         pHA4414PwdXcvY4fE7VfB6ni4Nj7Gnyu0XofCrXySiFKplW3lFZ5gWc37pidw6huTP7P
         kma8WR8IAiglfMLbFQJAZQMthtdPDml00baupKjnFoOjwMbarJrud35kHnWup7hsCTGd
         p49g==
X-Forwarded-Encrypted: i=1; AJvYcCVwTn/hlBdK+0Ur0nipX/pEBWlw0FzSR2f33HVGXIYGJVwpp2yA0Pb3EfUo4XkI9iNUmakBPI6no9Gilw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW+ELM6InOk0r5+TKKVkvuVDrh6eSyB7SPLQeaExuALdIPWjsj
	5lX2Ws60zicyd8+pMeSN3wYs0x8E2nsv18FocK5KL32chNdmdhlQ1yx8Y+qj6dsPzYGOREeeN4n
	SQ3I=
X-Gm-Gg: ASbGncvn6uRYzA4IjV765t70+GRuRt3kbNXXJOEVF8CbQsDwKrkSKczPN1a4rdFg+VU
	QYpm4/nKeoyjzab+RQNQt5uIRcsV5VWZ/+RKsh7NeyKXTkCV3uHZynfUsdKGbd3Mo+QzmwhWShe
	QB5EW8AOJG3TUKKtxro1rtpXDlXz/PGuJzvAZRVBstgOubf1YVjWWWR+kdqW8X3Xi22nXJLTvER
	4snY7MKAgaeGJX+b6UKnUQ0PuJe4UNTqFIU3ELKoU2VeGBYATg8jEXFJ/gqeLOBvN6VS8AUtBjw
	9+O1K5xbxC/adFUU6grWDQf0bTwI40/yLiEWar2ahKTcuosQXRkAdWdfb2fWWiXJ7Q==
X-Google-Smtp-Source: AGHT+IHRQjYcDeTYzd5SfxGstZxGdVulyyDnrAktL/WMgL+z1gJ3DJHq+sxX7tb6Xvh8jMTfMQylwg==
X-Received: by 2002:a17:907:72d2:b0:a9e:b2da:b4a3 with SMTP id a640c23a62f3a-abc09d36101mr26445066b.42.1740074388917;
        Thu, 20 Feb 2025 09:59:48 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbbc841eb0sm542956466b.128.2025.02.20.09.59.46
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 09:59:47 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abb97e15bcbso213780466b.0
        for <linux-alpha@vger.kernel.org>; Thu, 20 Feb 2025 09:59:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnlISqJ/l4lh9iLnXyuZ94O/9edE3si91TR9sJF163IWS4tzicw1zkuWCj2yQzb+mTXgskydsn82JU3A==@vger.kernel.org
X-Received: by 2002:a17:907:7fac:b0:ab7:eeae:b23e with SMTP id
 a640c23a62f3a-abc09e53506mr27429066b.47.1740074386561; Thu, 20 Feb 2025
 09:59:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alpine.DEB.2.21.2502181912230.65342@angie.orcam.me.uk> <45155869-1490-49ab-8df1-7ad13f79c09a@linaro.org>
In-Reply-To: <45155869-1490-49ab-8df1-7ad13f79c09a@linaro.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Feb 2025 09:59:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj42Dks1vknzKKBbXUMCrs-iuLZHq=0z3P0AN9TrXNP+A@mail.gmail.com>
X-Gm-Features: AWEUYZlm3vCnMDaMdXY1w_rtbniMJDt-7-eCVXlsPvvSJMGzSgi_1TpINhz0niM
Message-ID: <CAHk-=wj42Dks1vknzKKBbXUMCrs-iuLZHq=0z3P0AN9TrXNP+A@mail.gmail.com>
Subject: Re: [PATCH] Alpha: Emulate unaligned LDx_L/STx_C for data consistency
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Ivan Kokshaysky <ink@unseen.parts>, 
	Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Magnus Lindholm <linmag7@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2025 at 09:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Crucially, when emulating non-aligned, you should not strive to make it atomic.  No other
> architecture promises atomic non-aligned stores, so why should you do that here?

I'm not disagreeing with the "it doesn't necessarily have to be
atomic", but I will point out that x86 does indeed promise atomic
non-aligned accesses.

It will actually lock both cachelines when straddling a cacheline.

It's slow, it's horrendous, and people are trying to get away from it
(google "split lock"), but it is actually architecturally supported.

                   Linus
