Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B87260569
	for <linux-alpha@vger.kernel.org>; Wed, 10 Dec 2025 22:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765406712; cv=none; b=PMSV0rpgNuA7NzGkxpYlaISGMqTBlck1rDaBYazgNY46fKjv6/0CChEseoY70d6lJBB1gi0ParD4CkIgaVtycFf3cfxFAgdKTUV9Holdayoz2wY2yhtH+lQkOv9+7bw5Vx90xtqmDhYZxeiJlN+UwizbSv844iTAAcHpthbKvdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765406712; c=relaxed/simple;
	bh=UB+NlcpxTBog40T3tp9AjfMrYEjWsCpkKyQiai1HhSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FMimX6GwQVceAkuOlHsffYzJXHYiujUveD2JF6qV4rk5ZUnONafyy/jgr37lmgqH/QT4m8WfuByLoM8iXkKoq6LJPufKmt3OPpTti8x5D0tfsGh5k/6Ni/katL7q8jHsevpsWKtGQP/s31DJaq33FvNz0AigB8nLqhHyaZNJjb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCJSE22Q; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCJSE22Q"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-595910c9178so220408e87.1
        for <linux-alpha@vger.kernel.org>; Wed, 10 Dec 2025 14:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765406709; x=1766011509; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=90egkc+4zZu0iaeeSyGKnVfxL8qQNO4KVxedAns/Yes=;
        b=JCJSE22Q5Rz7Z7ge0z3HUBpPBDyfeSATOviDx7Es7hN2HZFAtjmTegDltOlLXERYzY
         e+27jPODQqZ62YfWu8xsDnXMOKqTNns9Dt3664tXm8hUM6iFyc7zxALIeUge03JSNwBf
         /u3Mdc3xa5Qc+MxiVpORVTBsK9asvg44H7dtgx1OId6y7Gg9IqLjGWn5NeJX/tcZ3PXz
         m7clyuCnt57Mhtj/DB2sk+dwtv6CCFO24SVXPKKsYkBj8s14dY/N8DWJWqRECUQ7ElxR
         wouG1rPAtqyF7vfaswXs6yJ78EOMRRoCSgo+VB7xlLyO7JUisswEORwtEQPiZ61Jilat
         uHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765406709; x=1766011509;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90egkc+4zZu0iaeeSyGKnVfxL8qQNO4KVxedAns/Yes=;
        b=EPVe9IXMUB6yqoDmnEyk2MgGgQssaSVDib2OfXkyi1fqAgmRv+gO1kcqvMy/1V71tE
         N0OC+SpSOSUItG/zP9KNVChrKnzVn5sLsNyRVlfVSQy1NVu8Saq6n4j3rnGpxMypBP5j
         DzxjDt1EdhGdskKss+EMKWtiht/gjYVjlfKn+c34d8E5izugUijCwoLzu9Rcaq2KglQu
         gwhA7NjEM7BmHE+zlVKFE6S6iXWZwvMfrPowTXbemUpS9VElli3i+F//OkPHNCJXmlJC
         ssU9/iBxHE2b8R4FlkMcMjnspMovf2VrZqq3RUb//QPNogbbJnfjBlOHN9BjV+klz7fQ
         tDgw==
X-Forwarded-Encrypted: i=1; AJvYcCXToqYc+QoUap5CdkTP5YLrBtlOM43fgS+G89VlzEc/dcBgH9Wcnsyt0E+0is3LSjl6kzguKRR0n55+JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxElgMtM5eBG+qiF0EiVAGlLGbdcjr2wUVuQ5B71yDbdjunI0Ma
	+pntNte3xTjolMjCV9JfLPkHj8R5Tc7dSibifZhzfizaId6JrkSxmQVY
X-Gm-Gg: AY/fxX5i0IvnOeJzuJ9VyoM5dq5dlDbym4Q3RtjoyPzJRBxeMyi+zn+kfa4UzcS0Lbn
	PKLoJHu8GWBFfHtZheQ7doLT9vWk5ckOWmkyNuQN6NexweSTol2jaL8+xw/gGb3RvCWd8ZB+EYr
	LHzwrKrDLo14nuL/CaKpGUgcIVU/9zsLnEwvwY8KjYyFkBfR0zb2tL0bvrbOlQHh0S87vkHFt0a
	kCdTNvUBSVq0TfrdPs2c3fuMVn8P9PM4nR4+sIwqV/iSHDGEmtg3gVoqjNbp8o/d/qcq252gBQ3
	On8jPdW9RpPBvFYl5Tvf0lNbq7j6U3VpY1ZUwP0N8NSXT2oPiVT4W8KVUfExClmM2/V6BlMZ4zr
	iC1KK0bxuUlmuyTh/Fcf1qLKD3l1qFMjFMLLGXQ2qX3mCWt/bMfB4Nmk8HEn0DMJgUtIRQJm84F
	ZCpqrbIoyiIACiXz1uxe+lCvqz2pp2faP1thDwLq8raW3oPf/2yX5sYO2O4jXDyLwOVDY=
X-Google-Smtp-Source: AGHT+IErEdc1F5zvGH3nZWe68Ur8eJFSwxlM8nv1fwD0SmNsX6g4+IGlD2UBz0H40qFQlSmoi+FUGg==
X-Received: by 2002:a05:6512:3ba4:b0:598:f1a1:960a with SMTP id 2adb3069b0e04-598f1a19a01mr868346e87.43.1765406708338;
        Wed, 10 Dec 2025 14:45:08 -0800 (PST)
Received: from z440.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f44d02sm264633e87.38.2025.12.10.14.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 14:45:07 -0800 (PST)
Date: Wed, 10 Dec 2025 23:45:06 +0100
From: Magnus Lindholm <linmag7@gmail.com>
To: torvalds@linux-foundation.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: richard.henderson@linaro.org, mattst88@gmail.com, sam@gentoo.org,
	lindholm@kernel.org
Subject: [GIT PULL] alpha updates for v6.19
Message-ID: <aTn38tM2PIn8g3VT@z440.darklands.se>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

This pull request contains two small uapi fixes. One patch hardcodes TC* ioctl
values that previously depended on the deprecated termio struct, avoiding build
issues with newer glibc versions. The other patch switches uapi headers to use
the compiler-defined __ASSEMBLER__ macro for better consistency between
kernel and userspace.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v6.19-tag

for you to fetch changes up to 9aeed9041929812a10a6d693af050846942a1d16:

  alpha: don't reference obsolete termio struct for TC* constants (2025-12-08 23:10:54 +0100)

Thanks!

Magnus

----------------------------------------------------------------
alpha updates for v6.19

- alpha: don't reference obsolete termio struct for TC* constants
- alpha: Replace __ASSEMBLY__ with __ASSEMBLER__ in the alpha headers

----------------------------------------------------------------
Sam James (1):
      alpha: don't reference obsolete termio struct for TC* constants

Thomas Huth (1):
      alpha: Replace __ASSEMBLY__ with __ASSEMBLER__ in the alpha headers

 arch/alpha/include/asm/console.h     | 4 ++--
 arch/alpha/include/asm/page.h        | 4 ++--
 arch/alpha/include/asm/pal.h         | 4 ++--
 arch/alpha/include/asm/thread_info.h | 8 ++++----
 arch/alpha/include/uapi/asm/ioctls.h | 8 ++++----
 5 files changed, 14 insertions(+), 14 deletions(-)
