Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF28A41A517
	for <linux-alpha@vger.kernel.org>; Fri,  4 Sep 2026 06:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502440; cv=pass; b=R6BYVaDd8BP+qBqvtcMGb7uPZdvL93zEKTZK/HLqEm8gaGsEzhdg5ZTklNOtIaN1HI35LlH/REphgiGVozTBHPZAIiHOiWza2xIeK7GSL0yw+UICScXBDokOYC8OPglJeshheezTwMeTR0jyMkwHyQFJ+psN2Kppb++j+zEIjVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502440; c=relaxed/simple;
	bh=4dOgcAQlgO1QoOYmAB+wFP5Ip8y+D8KPjRKJ5U4MjNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlpVjWwEmd0gQF+XgP9t3EkNiEvxLiG3f6LOo0uj8PfZqSBsRLAp2lGytWuTYbG0RPe3zjB7A8w8yhlJZd1xUHU7YX/cXqtJ6j31gDzn6EjfAnHx4PKJpSD9SBcRXunJKIEbpsMh6mlutLYxm/oXiFe1/M8fXDjVcqv958c+h7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jdml6mr3; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jdml6mr3"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a68ca482e2so751610a12.0
        for <linux-alpha@vger.kernel.org>; Thu, 03 Sep 2026 23:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788502436; cv=none;
        d=google.com; s=arc-20260327;
        b=rk2Y27cKSn4c0oqdcMXyJVqsCagIOYMdVychzvpo/CPn9hBcmGn72PoV1rmABOMpmp
         sIwf0nWibVibAq40SyB9HGS/MXI8W+aD3n0d3iYG74CA+Cd5hL5lYoh2UkHcc8zk3+9T
         PpHgGa3PEkXYQyK/DeRF2M14OHe+hP7TpbLDDdZBGBgjHCWiT/K2w7OhbZpLusDAeHWG
         Tc/TtlnOJQZhohWOyodCQ71uspTyB+mTqbc/CZ8/354wFAZmJ1J6bK7nDMGMrCSag4FB
         IOe5Q1bGnlBG5nyF9DrciGNNWwMZiIeEbMqvsj40j61/rVoT4337mCKtVl92OwNEMmJh
         h0Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4dOgcAQlgO1QoOYmAB+wFP5Ip8y+D8KPjRKJ5U4MjNU=;
        fh=7mP/IbwOeYCFfhDDUceH0C47baZdL7VO7ycUeK1PZIw=;
        b=LNj0wrZjrTeuk1PySU2quzpTjpSVQU0JlyjvaTU9iXrmXbiaUMIg9Cmf8rECShAPLu
         7kqI6bQ96UoYh1g5k8LvarsRjCNRRIJe5RBdaDuQMTR0Q9Hc+INDWG01+94OYZLu1biP
         YsWON5/0C5COBD6iyV7WffVPTBdLf2Ol9nwEeboVZ77jKAt7MYMuOQ4VIQNhrsgPa2wG
         n1vxWKITiRj8hAxxGlC96Wx3u6DkIHFz/17T0fZTo8F2VCah/onV82Q02fZIgrspQgz4
         /1+niEbcRvKBlyRz3N21CRzX8A0EfTr4WxY6ZziQzzsh7f+eXNmj0Epz/4tIYK1+beE/
         sWsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788502436; x=1789107236; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dOgcAQlgO1QoOYmAB+wFP5Ip8y+D8KPjRKJ5U4MjNU=;
        b=Jdml6mr3zaJdqdlBLmwY4XR3DyaMt6UVj+RrpvUccUAgAhxLkAJrowYyrxRQFhIoI4
         SFMo9P6pmG/zs5G0i4r06tFu7OzCsJNsjtIovofmLTCa1ETNmq1ySaCoppH9xw7+jRO5
         kpa+4BFPGENcquNHvcWbiFezTJ7t+UPQTVZ8szMSKH5imCpPBYDpGeJ8oC47XpX6Pc2l
         tOm73krqlGnR5/rddSkj8pDV59Ur+mb8k/X5yfB9bOLqjbCYAbPr8LlREHKCQPjWpHwI
         TaGy6n4nCeZ87ZF8OVjnT3VRS2LFuvBDh+W0zWOjb3AHCngRjwHDiGeXMuAzRIRJxfsy
         xEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788502436; x=1789107236;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4dOgcAQlgO1QoOYmAB+wFP5Ip8y+D8KPjRKJ5U4MjNU=;
        b=OU1wdJc0Rle4r/Fwy54wsifjYT1Q8phROWDkGjMNASbJ/6v9bJIkgDtfZBvqpwapbP
         TEMgoWKJxuCdsB7SYONeb/odN6QZY2l7YYr8lHVrMXegcEnDM1zOuafhGcqUFBhIo4uU
         UB80dlnFSz7KkzVm014EOyrXxF8pbDtEgBZrpkgXGN+N1ECGDlwNmjTyFTreECrPxuf5
         OBT/WjHJVU9INdcpdtDrSrRoQvEfIRPwQ8sJt9AbDsXySxprjCh8c3evwgCoPsmqfQIE
         5XFpYQ13k6OLcA8xhjWekPN+lLZuqR1ycmBmrHAogZd+4HZK9+kzT3dasFnfoTtPleRh
         lE1A==
X-Forwarded-Encrypted: i=1; AKwUvBxssk3IOgo5ccNlfIfa9+IcJBlHxl2DOgA8asFJnYrkf1u87wCnrOhdxif3Avtt1yhByvVO/Spd9J2tEQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kFhcUa+dCee+HMmdQXGoTHmpWve9E1UrBdMHyitpolaYPFKHHH
	hL0d8SyFg0qkzpYxAIomHwQQyv5tR8LHG6ChI+rO47T55R5584i46bSMNpv3k7VFc1G/k0U4ky0
	99GxquDoWy843b5RCExmL0x1OmXI2pLE=
X-Gm-Gg: AYBFou2Ytc93EeU7OppTcTGlPSlQ+5N8jogEb0h7bvvOBt9NMdLZtwnZ+qjLggTJOy5
	039/YyXwknyU87tz7W/lY5ygL7V1ThlwzbxKuHbn10OK8sUFHgAOINdlvVec3WMWeZOEqDonwRl
	7b7lHKAOsvFpAPNwpwtan6xA8NWZhFu1p9LiLuBCAB3CWzweVVSYkHD3Bw92V06CKb9FK/hxQE+
	9CQfm+ou0nZGmvdMIw5vp/5NPSeoLFh+cQOg7jKiPTLTmySWeKXGWxhgt9ffr/vkq0V9tA3YObU
	Bz7kWcu4j8lq16ddxLJQkvrUuv5eWdoevfc4wglVqWUdhm/VFKFnSOgGQ7hChF5fXeCecmtT7k+
	6s8Ew4WS4wXd+aVraOTWcawBMTuStQUc=
X-Received: by 2002:a05:6402:46d0:b0:6a5:f44e:a009 with SMTP id
 4fb4d7f45d1cf-6a7e8d5a9f1mr1690015a12.7.1788502435914; Thu, 03 Sep 2026
 23:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-fp-exceptions-v1-0-c99d75608e60@gmail.com>
 <20260803-alpha-fp-exceptions-v1-3-c99d75608e60@gmail.com> <CA+=Fv5QUxT-T0XgXccAF=1_6Dz=nCpY=NQu=ruOrYjbB+q7YCA@mail.gmail.com>
In-Reply-To: <CA+=Fv5QUxT-T0XgXccAF=1_6Dz=nCpY=NQu=ruOrYjbB+q7YCA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 4 Sep 2026 08:13:44 +0200
X-Gm-Features: AcwNN1VrnhEuSNjXaQkRHQ6SzaIw81uvdMaGdmatxDoxs1iIKPoZwAWCS6BhE2g
Message-ID: <CA+=Fv5S_ZrHedEVPR9Oet2Egg2hwy33pEqEXaQa0zGdQdNjWRg@mail.gmail.com>
Subject: Re: [PATCH 3/3] alpha: determine tininess after rounding in the FP emulation
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, stable@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, dalias@libc.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Adding Michael, Yoshinori, Rich and Adrian directly, although this
is an alpha series, patch 3/3 also touches the shared soft-fp code in
include/math-emu/ (op-common.h, soft-fp.h), which your architectures
build against too (confirmed by grepping arch/{powerpc,sh,sparc} for
includes of those headers; parisc/m68k/mips/x86 have their own
separate math-emu and aren't touched).
The new _FP_TININESS_AFTER_ROUNDING macro defaults to 0, so the
intent is no behavioural change on your side. The new guard it adds
in op-common.h is a regular runtime `if` rather than `#if` though, so
it still gets compiled against your macro instantiations even if it
should dead-code-eliminate at -O.
No action needed if it builds fine for you, just flagging since it's
tagged for stable. Let us know if it causes any problems, or feel
free to ack if you're happy with it.
I've reviewed and tested patch 3/3 on alpha already (Reviewed-by/
Tested-by posted).

Thanks,
Magnus
