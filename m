Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFC02877E8
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 01:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596076; cv=pass; b=mSJdaRCOCwHBkpPumC5cpYPl07mLBMosUiR5bRxni8l7yldiiwQfFKtpZKp4FKoshT0Z2PvWcM9b5CVW/3K2yX+suYBQ+JnAzQMWNypzJY4RPDQejlvuSHXdMVWQmr7sXe1Ytv0e7ehDe4U31CndAu0P3EMqAiWVYr270XQyxXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596076; c=relaxed/simple;
	bh=RBZoIK02FXTZMOejEdU7KRpP3/DfoMjBE76QQq5xDqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOlUCkvTmKSBJuCf5dY9tm0J+ZlgZkf+TTvN4zi8aVDBekW0B8On8LwUJXvyXQTcpVi4rrK9DcdmvOWVw/YUwPgmIbpTpOQrkMyuFyGVXuGNpmyODDtQckBfgB3iJtpECMNPw4CC2g/HYAdVm4OtG6xw8QnCY7f9Fgwt0JeWh7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofijy4eX; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofijy4eX"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a9761758adso3745101fa.0
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 18:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596073; cv=none;
        d=google.com; s=arc-20260327;
        b=hRPQ4odqxREirKfDJhTOclzCoodkZyb9MaN1V240J+G0qKMIeHjIB72F+28ixEYCRz
         KOm0vsVX8YpupI74obYWECmHEIh+h9qkNhonH5GgokU9QeqZMzUUDntiBJGTXhffV0lc
         q/JQH4QNn2t9jKSpQVSOJq7QoeBhdrEht1vCtcIR+xO8drtJ5E1Uk8yw3sD7wOewCtlv
         DEiwylpr4IZKkrfqlWfFfXAfaiJoqTOjUIg32sen4715z3GIWcu18XqDCV5KWfODspG5
         GqGdjjQOaL3FHYzHWMJbPZblD3VuGTskoMV/sv045b04KEg3mtygLuA0dh+56yqglER6
         cumw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RBZoIK02FXTZMOejEdU7KRpP3/DfoMjBE76QQq5xDqU=;
        fh=UN2FLouDY31nPPi5PJXQVkUPSX+ASO9i5yxNYspu0I4=;
        b=dqCqywPIWShthFW/km/noLPU0910zERyHDlnmrVgSsYfCQBr8axnumu3rv2cr5JwIZ
         L5sBqotHXT3kG7M8gf8iwD0Ogr5bKIvshB/qXGUR51uSfHDYc3F8FvInyk0XpygXwgP9
         PmI2z8wZyrz0r2xbw4OBtMTn45Stk8AWV3ILVjRT7VA8bOlBsXl4WhAXHCfhCjvGc5zz
         czznbHwMpc64Hd+ME3mA1LR54qT3fe81YE47eWSuyt84Y+uYdiJ1mLTlv8ZTp6R/IV6l
         AUwUiRwhh7hPkNVn1to9a3JwFR7rLM73U6UhrwcHRBZaK0QZ4AcpTrdsIfDLjpi5wKh1
         ryow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596073; x=1792200873; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBZoIK02FXTZMOejEdU7KRpP3/DfoMjBE76QQq5xDqU=;
        b=ofijy4eXnvsOjZ/KsDrgt84cmJkc2+EpxCuvPiJXW5MVP0xaDWb9rgbFOepZoCG6DD
         SgiGHTraZIB/E5WUGhZAt1asrG0qX7AjMe3dn420t8XjKShRSS1EXNJyA/hQeCdW4I0F
         Nx6krJBrVzGfaqKdojbrUftYRW7jy361JvQcODGTDQ1FYlMfz7bqO0MiOG+gjmqP+ZSb
         I1j23wfmMgKs++DWRo0olQVzgxcmX9jYH5/y7zhl39cw1zHC/k3rfiyFWKDo2xOWFSwK
         ejErI4KJDONLwf5YUf1816IJ5q0W8LtjNuKM1UxlMwYhmj6dm1USJycoDFWiwaQR31z5
         3iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596073; x=1792200873;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RBZoIK02FXTZMOejEdU7KRpP3/DfoMjBE76QQq5xDqU=;
        b=V0ynxkG7Su4a8F4n8kLBSRZ4uOnm6z9nj/FfqLNb1A+nQ4buStJ1d1s0rJmZHCoWGA
         1rpmrZTL7dWZABVK8T+Q+9qSdjP7CwjmlfuIlhWElMcOnhOqIZqEWTcENDElYoC3RNP+
         nGCsD69ikpM5wSakpeywmuK0dI3PF8rhqhECyPSQ5tADma9JEkUGExFHlx6OmULCbfU6
         AM73W9k9QdgANNjucip2h4DwjA8dnC+2XyoC5VTIjqKjP9AxAweGbCcfcqFUv4/48cGh
         sq5PmS/GD+npACiyeIWCMeaR95uruBalyMsJ0gAFkk2u6HtDF/5/B4zUFckfVoaLMwKg
         /Ilw==
X-Forwarded-Encrypted: i=1; AKwUvBz4TE1hLR5uijut1nklHQiuELbv9vxAoeNPCiz3laMjjTV5ed39JDL4SnKLHb11lKQNJ3VahaxtZRS60Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLje3hrZpzPirrD6JDJKleLNbbHjUiYwSGxkN2SVYoqxvA8BVSe
	r0nWdCPnnxLFvN+9ocN0hb/TZ3pVL5c2T4P1G0sftsMFSvtwvRbDrH3AZa03rLMeAP0tQ8og6k7
	Lg+D5TBhSy4/Kw0IkqTtXKRkUr7kep/g=
X-Gm-Gg: AYBFou0UrM9bBJ0896zNaF0ZOH/xLXlFCB7O+kwQZMuU+S+UVQBKbGAATqJmdx1YB1t
	2QSWiy1o23t5YLXUCuY7sn3/2wnBYF5BC6FnyAEkJnu1KgeAgJcVUxBiHnNRqxzNi6J45abApBS
	ZgdmF/UC2FVkkq/ZPCfwxVuqWy8/MJ8SlgZxG8wq08u+wNDlvo+GRcNiazyuYscuyQSdvOQ0hms
	LKj543VbKtp51FpdG8H5HrZQBFMTtCUmxQkon4wGUpsk8V3Eniv3D1fEQTGEncbvqLsH7rjAb1d
	v8RYy2gmmFslq6z+g3rFjl1MoPqGRhsn9Hj4jp83QlSthuP2/jEXdxm9OrvPRT+DSGr7KIhJbbo
	smjf9WTcuyFZN0SB5EOssFKubE0p7rPj1+w0Ub4uj7/2I8zUZ+cVnagX2w372gTg8rRDjGEI3/n
	IkloKmAw==
X-Received: by 2002:a05:651c:b29:b0:3a9:83f3:ee73 with SMTP id
 38308e7fff4ca-3a9c55c7a69mr8139591fa.19.1791596072901; Fri, 09 Oct 2026
 18:34:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009212501.971158-1-linmag7@gmail.com> <20261009212501.971158-2-linmag7@gmail.com>
In-Reply-To: <20261009212501.971158-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:34:20 -0400
X-Gm-Features: AclHuK91lXz82mshEmNWJGl1kPK5uU3pgI_eu7NyeDs55T-QedcNXRAggubZysw
Message-ID: <CAEdQ38GQUKnKLiCLpceTrYNviEag57uJhoUXntmrbwYcL6J8nQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026 at 11:19 PM Magnus Lindholm <linmag7@gmail.com> wrote:
> Fixes: dd5712f3379c ("alpha: fix user-space corruption during memory compaction")
> Cc: stable@vger.kernel.org
> Reviewed-by: Matt Turner <mattst88@gmail.com>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> Message-ID: <20261008195608.965266-3-linmag7@gmail.com>

The Message-ID trailer is the v2 posting's and should be dropped.

The patch is unchanged from v2, so my Reviewed-by stands.
