Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4BD337B9A
	for <linux-alpha@vger.kernel.org>; Sun, 11 Jan 2026 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768131384; cv=none; b=N5zqfdTDgeRsRLlFjAhZFqD/xsoJn8pBMg6vSNArcoURn/Q0BGqT1neJ18L0VFx/UiszfRltXxUz4s4znyI1L2qh6d8BzI+eL9SoD3Yr+6Kw4/v313cZQnIsGVfcksOLeB46xy2XOkdvgwJoPOpBcC0yIVicxIhWlh+URp2CkV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768131384; c=relaxed/simple;
	bh=WA2+qR7GJIrlDkE/8m2agQnhKKxdGQn++j4tKhGUs6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQL7LlPm/HZZbOvnCoKmgvTX3/FzVF3n5IEuXyvmKMKDR8vXQSov0RuySTj1csGu+N5G/fUojd0z48j+k2qbiDuhkS27hI+iBxU1n21pAORckqi1tQiJU3MOTXgArURbISKpghzJpxr0nqk+ptdEhAJ+HTD0stCmFSo9aE1LqTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kb/1a/1L; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kb/1a/1L"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477632b0621so34434335e9.2
        for <linux-alpha@vger.kernel.org>; Sun, 11 Jan 2026 03:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768131381; x=1768736181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZI3ApSSp9u/jOiH3pWaGfMUo9z/yXLRfpgRERhRlFg=;
        b=Kb/1a/1LzI/qfxHuvCxYhsVr7yNpbkAfquqaGQlTnh+ZoIoD/51+M0yOcAgFuLNryR
         GAHajp4DHcwtHktMyoHPqyaVIBe8Kl6hZrVMgpgiVLMZ3LWQuOrbwuf7al80TrED9RNy
         dSX4BJ50Uf7hXJkz8uMMarjsSTt6qNdi18e7qebv8WT9uuUpxLqO6UhZ/9sbBWSdTkwm
         UCLLWrGUsb6f+oRFrKsu6brUOhLs3wndQTuIojwgtCZc+isR4RwxM1G5OqanvhGOyIzo
         yFkZDz/E1XShcvQalOodjqr91wOIT//4S+2FLC8I6OqJ8vndD85PA/60AcQMRuHV0bNu
         WwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768131381; x=1768736181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SZI3ApSSp9u/jOiH3pWaGfMUo9z/yXLRfpgRERhRlFg=;
        b=NSWjCsFETNYBjvlwkNak0Q7wwJR/iZLNo2vyoRcA6NvhXMi5rd7gFgtqnNZbApH63D
         0bDXp0GpR3HEI5JfDtt9sVvR9EBUNtSsUWH5atn6TPDLrXpSU91i4cpYx26FinPtgXlY
         3H1eBDZrYAqd3n+y1YzD2ETpcGYfoed3hmld52gdSsme+yKYDoWkx8skP9LOg/hUs7Fy
         DiCBVlk0q6FXFUj7Z7215OkCMveO8hvV1laGH3UUX8ik/QzjkuWZwpCof/5TScWV2/yt
         4Mmy8ej7Y5FVWgAkTazAvO8bD0gcfs5uwofLJVWhUcjSLy813w/k//XZbimMPx59bTMm
         rbiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnv4KM3RFTo8T4Rq3njDs9AH0Aix3GFcnATtgIKJt71X/zOvolf5yCaMNAySVE0r9SFS+dckX26Re+hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzloixa0T/PczJE3jTslQczmT6LeVtwGYp7we8PzZ/Esp16CW/n
	4r2l5zFU5m3BdBJbLcScmKKz9bFFSslrMN2pf5iFpn9Omi/n3oJuCejU
X-Gm-Gg: AY/fxX5nL24mK0bFYNzYJmVuHruKwyrrZ5KzgnO0Zv6dd46e0tK33dMTXUHgvjW3nQG
	15HyRv0MvwCoX60vCSXKbTntFaAc8JXKVb2rX6QX8zmvFblZ1mxINoss1RpQZDm8aEl6y1KZrLA
	I0MHR3qA2ooXzdVTSDzqgLQWIXmbGIPlOHnbRkFhI20cBjGP5Lpvc5Q3pJUfKFagxce68SXo1b1
	i59VnjE+olR92yNLwZFmJBNbJnFRk7ZNQnvah9v/SflNvT90pb4BKAO3pA9xPM49gdt8W33lX/5
	rHiJ6FRBFATwOyrYYikdhVwVrTWPADTTLUIf0kNnuK685zhnLqhacX7qwimSmVbACVJp5b/O+x4
	CPcxXX1PeUoqU4VPspH5JTfFFRE+D3xzouRVh02kKxl6L9vsEW5ygsGZngZdy+Kkz9OSd/U8PYo
	bgyswAAlg=
X-Google-Smtp-Source: AGHT+IFSg1iNVQHqnhtkbEsO4YlvooAwoO0jT3KKmSnsT9EAf57O0ht0v/OFdFfQ+b23tsFmCK60EQ==
X-Received: by 2002:a05:600c:1e24:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-47d84b18ccfmr169969785e9.11.1768131380879;
        Sun, 11 Jan 2026 03:36:20 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd0daa84sm32553508f8f.2.2026.01.11.03.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 03:36:20 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: macro@orcam.me.uk
Cc: kernel-janitors@vger.kernel.org,
	linmag7@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mattst88@gmail.com,
	patches@lists.linux.dev,
	richard.henderson@linaro.org
Subject: Re: [PATCH 1/1] alpha: trivial: remove ^L chars
Date: Sun, 11 Jan 2026 14:35:05 +0300
Message-ID: <20260111113505.2146705-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <alpine.DEB.2.21.2601061310110.45251@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2601061310110.45251@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Maciej W. Rozycki" <macro@orcam.me.uk>:
>  As a matter of interest, why would the presence of ^L characters cause 
> any issues?  That is just another instance of white space and it has been 

I have shell script, which allows me to remove given config (for example,
CONFIG_NET) from whole Linux source tree. To do this, this script parses
.c files, Kconfig files and makefiles. So, I want them to be as predictable
and easy-to-parse as possible.

P. S. I don't see your emails in my gmail inbox (not even in spam folder).

-- 
Askar Safin
