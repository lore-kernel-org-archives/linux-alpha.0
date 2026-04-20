Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A2E2C326C
	for <linux-alpha@vger.kernel.org>; Mon, 20 Apr 2026 05:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776662004; cv=pass; b=dlqsd5wFtpp5oy88Dnb6zuHatq+HkdXUa/p+Yn4BBlPvRwpWRgWposQKVOGLGpHrYJw+Y55mERKzP2hulIK2qASKSrU6Cqw/wGpa6M3EzyjotZXXDRhAkLEiHoBmljyYfDJyamOcCrWf04tCbEOMr9JPxhB3zOiV4rdI8LcrkpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776662004; c=relaxed/simple;
	bh=lfk5vO9NllLo/pVyxpp8Fa5VLC89H3d8HvkuOkLm2t4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRkkOcRdhwqN2f7NqfXFQ8qGPuD5aaqqxc64fhUP9/DPwYUEpzdetNVhaR5GwSNBdDwR1c2nYmxl8Pcm1pysK89usfLOrSyT6EL0JHjvXc7pi5d2R3NGenuX3A9B2jGWY3+XtmWNUyl0SKCN5qq/ze8WkLbrPz4guFSXY3VVOaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXeOOphF; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXeOOphF"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9d6c8871c7so508300166b.1
        for <linux-alpha@vger.kernel.org>; Sun, 19 Apr 2026 22:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776662002; cv=none;
        d=google.com; s=arc-20240605;
        b=DX0hVvn9bACTHfPULx20UG4un7/QQjIg/IA9xRO7rIdUFS82KFc/QtqV0QXsQnG6N0
         Tjnwmp1o2vcRzlD00QItdsrkO56QprP1ya6DAaYw7vGOgzKbfVfltbHyL/ZzlComQmVb
         01mIOUpUGBL1mCvLG3QfXneanJheBWZUt1Qia4sX6AVAZvTZz1lty+MfG1NxxhR6of/k
         BaZ8Wxzw5XsIe++6JZYzl2whnz2P6u9tCzntCx9jKecLsByWmXlV+eAKzn35jGnCdbwa
         4DQ6mubcthXFNIZV4sVNVzecH0cHLNnz5xYOuBq2ijYw1sqO4BvvbjyrFUB8fgMsPb7r
         my/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lfk5vO9NllLo/pVyxpp8Fa5VLC89H3d8HvkuOkLm2t4=;
        fh=veQJccMlDptzM+OBUu1qOGxouoKYkfhiI0+T2cP+OGo=;
        b=dtl7RbmdZpSz3aeCPPZyFTTw0W/kya6GQBQTZMcWFi5gp/Rq7lTw3com0Qirka1/DL
         XPUiO1V/SsdXVamYBzZ6SwTl8t73TyAbwqadZi6IadIHl3M5Jm0b45vjxArjPMdD58pM
         97G72d6UXq7Ns7/c36HUG6gBDuDohp26vcPz/QAqqjG2coXcr8F/cxcMG4qGiMOv//Oy
         AGiIzyKylEqMMvIBSVYhnpXrcrKlnGklm15AlHZeXDamCQLaxbHIf6k3gx0N5DvetBec
         VtkeZOyNkADZr7KIKjLdtGb1AOTxWIEuN8CPT+1lmai0RW+/DSkQ1BeIjjK23pAzsSPf
         HYoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776662002; x=1777266802; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lfk5vO9NllLo/pVyxpp8Fa5VLC89H3d8HvkuOkLm2t4=;
        b=HXeOOphFynL5Onzgd2GXTVKzZ2s9SIG5DipcQ4+3xoAXGVh3Kzu4IR0UWnqOoQMzLz
         OX2i1ysz9SW8vwpt0yIi4F1GfIwLh3SiJiBYHgr3/ZOs4OfA65o0rtdN5KE9lURtmbLP
         tYNk5eSiI74+Xw7bsEZVqASRmvpCaOT+qO3hYHbhf3MtfmFOSWXAPDjwptq4lEOSRw7z
         sGEakri5KGueJ8Oj1wuTvxTpcu/CF2T7dvd+VlegHpoxGdiqNOVpKaLiS3lSFkDRK1i7
         jHWpRMAPaKmIUPzhevRJm6DYoCaXAP6gOY4fav7rm8328OKQ+d7yTIVV+EaiM/VAV6cZ
         tzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776662002; x=1777266802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfk5vO9NllLo/pVyxpp8Fa5VLC89H3d8HvkuOkLm2t4=;
        b=oMp1Zgs0EEkUvDk6N2xXWF2AQuLGCSWjLGdWmsOowhLw3o+5pn+hSJafFayQTb5+vL
         bkibsD+/WczJEWtwjz1F7SOzy0coPG4kZeFhH09pJGsX8p6fKtt1Q4vK8ITOj8m/DP6X
         S7ee6FcHTl6cjfIhuK8tlwwNbU5vlGXpiHxbBgDtoZL7m1IgtF+vfHDh/GTBdl1AsDsw
         5A6PBVeDmfiQkJbDj9PuQvj3GZgVPLvuM6cAkLnefPMDy5zgIn7fI3TKkP9Wgd+CPZJg
         SjeGzTxRuqw+DKYfaFEYTyetOpuioHAGQIVlg0Wsqe1LIAvMwL5RGpEYkeFNudCEcqaH
         bcwg==
X-Forwarded-Encrypted: i=1; AFNElJ9GLj4Vc7AdH4rl/GDqGeXxoUsy1pTP2ITv8C4mrB5Wd32MJbKQM7GuIojgO84IkKgI909+4+NrF/84LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzALEq3+PV/hRN6t2yFvTe9VhzzNZZkFMpUI8OyyBvlA7c8FQx5
	xlrhm5nYr00zBAM0mxVMOhAynzgHUfxg/AXqov3mrFhkIeRKxr2KZ61mUXgYKhmERhpCOKKS0bP
	v6eTu74M4zJe0RX1MdC1Qq6Di2my15mc=
X-Gm-Gg: AeBDiestUdabbCgIFcnvFXYM1DHEBmoboRh3rzBgKWKcmFxRSA6UsOp4JqZAktow1p7
	m6DsX4oNfED35yCk1RcUdc9/34ALhdHGS7ILtx/fCQXVNXoCipvdDvw4v36EQq10YFVeG0SR6jN
	MbgCK3QsZXOfLxo7KYahvRqDizwSiljPLj1aXLYuZqW6qljsLj5eCnIlD13RGUudayk1cMIyK7z
	MIUr4V+Gf0Z+WiOqWK054r8sj+sJ/beknmT/AOfZmNxYgPPuWETQvbzE3S/+44979Q1bC3l4HnT
	Hk3FqR6hsJ1xNY2Itxh5mYMqLF6Swtp7r31F33nUckzR3B7g3Ao=
X-Received: by 2002:a17:907:7f9f:b0:b96:db80:ea59 with SMTP id
 a640c23a62f3a-ba41a91e004mr579706666b.28.1776662001437; Sun, 19 Apr 2026
 22:13:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203063357.14320-1-linmag7@gmail.com> <202602041817.3967F048D@keescook>
 <CA+=Fv5S=XxDyNFdqhR3p_wEPwGEpjfE+Rqk1h1JJhactWFib_Q@mail.gmail.com>
In-Reply-To: <CA+=Fv5S=XxDyNFdqhR3p_wEPwGEpjfE+Rqk1h1JJhactWFib_Q@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 20 Apr 2026 07:13:09 +0200
X-Gm-Features: AQROBzBeXCArrE6jx0ALcUOGLkKhbjvGqyfUr2n94u-mLQvH1UXdJXQ9JFoCbsA
Message-ID: <CA+=Fv5SZK0eaT5Y_a-eTdZacFEcp36rF1YE=tyooDuVpZW=uOw@mail.gmail.com>
Subject: Re: [PATCH] selftests/seccomp: add Alpha support to seccomp_bpf
To: Kees Cook <kees@kernel.org>
Cc: luto@amacapital.net, wad@chromium.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"

Hi,

Alpha support for SECCOMP and SECCOMP_FILTER was just merged into Linus' tree.

See: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/alpha?id=55b22075f7840ef48254886758976531fe146609


Regards

Magnus
