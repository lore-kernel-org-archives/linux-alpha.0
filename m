Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A569741F5F5
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341718; cv=pass; b=kmfALHOylxkE+fmrJOxF8DJfwE1gkLXSaLbFD59eTEOVrK0h6CpS6BBNaPjumDhAn1frwlGqTWrfV8THycnEmBpb6HdLgnFvMrei3m2/G8Gv0JxH8XFFyX/TWs1tvFH13r7zc5IJIj+1UyDsKcezGNRsbMmuRbTEM215C8eK6Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341718; c=relaxed/simple;
	bh=v5zSRZRbdwZ7opwlCrgpYqe35WmIs4diO7N/mAvW1iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsRe3KyMyyEme5vTi5qV7QY1HB+k6uGVZPPB5QmaN4+qu75/d7+FgHchrz1OBO5fPg+aAJJ4iCJbWX2EXJ9OjK9I477BbZ7L6htCus3H6PsvsxIMdmzUTCSne+wvkbM2TSh77Yzxjbt009SgY2Ot5O1aEA4vsxek14O+1oER6gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tA3jtNX8; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tA3jtNX8"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so1491744a12.0
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 02:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788341715; cv=none;
        d=google.com; s=arc-20260327;
        b=rHj78nRRD61F9yfklchfCdxd6X/MYem0yPjT+RN4OTs40Aeziw+TlwDj0Yr3a8fBdF
         RYhOdN/gRkQ/c9giXSzft2ikXndhivVBVM73E4tbaZBqyMmJzWwwAEASLKuzS8DuXGa0
         LbpKGGznh9XAHMUdxXqk/Mt1uo5TB+GEox6nuy94T0i1QgLpHZP0xOHXWSwuVsFYs5T2
         YNVuF8UGYLIzjGKeuvGRMXVLRQ/XwEc3soqneI7CXu+EyAqTv/e5wIDg4bb+SGvqScX7
         sUhx1wKbipjOWPQzBWY+FWeR0qTgA284z90QWDJeSBfW2E4mzmLMuOE68hhOoAe+BEqU
         8xUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jnX+ks6JV1XrtihYjiUlRtYYBl1wxqA6B4mBRtQH3z4=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=Cv+9pfPvsWdqNpFKl7TftfbQiSastVL+OGn+4yJMmvL/TIOhG7s4Z32pP5uS7DOjxn
         x7OGB1nMDacJ+TivP847/Xfz5wROklrnfC1k+Ta5GrRpWJMRX0nDIYhfMhpEFOMZhPOK
         clmU4tWdnhX6V3RIJtMXhWESAdThY2qrK95POo9N+Rehz3Ra7z0hpktaZWg5kED8cXS+
         VB9+GREzBAdN9ot6ttrCIU+SGmPYHJhI2YY723XWlV+M1SJVhFqHSRgJZLMjjHwk3ILG
         yAmfnI9WHZ0vRlzPYvV0r3FYDV1mUoVvXctWdrfmw6bT37sdjxq4WYAel/WnjGIC5D1A
         Gf8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788341715; x=1788946515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jnX+ks6JV1XrtihYjiUlRtYYBl1wxqA6B4mBRtQH3z4=;
        b=tA3jtNX8gSD7orD5aTrz36YKCEv5dp3euL9HeG2ZTKztScGcLM1vAtEkBwn1oQx1mK
         ITWrhn3rfPT2FGHX6+BzDvrmZE1Yx6lq3/YQmVMFUrgh29AfeIhWYLtUeyCWYCBekyhH
         AM5WZX6kD9UwowYvPLn7cCVu31cCXzVRZ3b7jJg7PJ9kgzXhZLIuBeL0v1ct6B5XeiR0
         F0ndwqRg05BfVyR0TyBXO8O0TsBh6PAsLXMWquiV/yq6Hw0cd9y89zL7BAguSCzoFvUZ
         KN40pa1gZdqxQBcH19JpSVXv97Ywuc2ADNd6NODS5UXMD+Ut3LR9QaJ/feU7KC9SfVbs
         BPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341715; x=1788946515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnX+ks6JV1XrtihYjiUlRtYYBl1wxqA6B4mBRtQH3z4=;
        b=iPguF/t/KQxRMHtxCO2rjgR71qE8k2ZEnktyqUiPNUx2Y8aNDjHa+GE8Vbch1KdxbA
         lMacnTUWR9iNkRVnSRh2m6sR96pSXL5D+GKtFeFhxDYi5+nuIw7LNr5gNIgBebdk82vi
         VVG7CyzTs7ATq1kwzS31R3Hn9d7WKyZjvulGlLITfjHVShUYkzojtVerbYvUkW9yY/YY
         oZgHTQMG7LHj165R8bPFAN2KYc5F2Xsu94NgZupjOH1Pg5FEoBJfqW/34s7ghWRKhqT0
         Ly83zyCwaycbLZPiMX1oEsl19rOmASArJ255fy03jx4CtlPiZpXXlnuxDGnHlo+kBL7y
         8XuA==
X-Gm-Message-State: AFuF++l9UJ9qcS+DimicnykGZhcOX76JkfDMtTf1DDbxSsLILDfDFuoG
	myuLwYDFJX13AtjiNngcFBonNh+eWnK/7pIw6lUM0WZf2Tb2BhWu47zDMIquySdaYi1OEZQQdkZ
	Xpy50hfjc5FkrqvzyAA6I5xiebR3zz0M=
X-Gm-Gg: AYBFou1W09qYbl59NcKZjrQDZcPkc/H+5rUxyvix4x/AEjvUk7Rq19yI3iZPpivF3qt
	SCjlR8WbolOK2mMN/RBL7OyrAGXYvH55dsv6nDtoHWqnvWNoRNmaplHVs10OvNYf53bjVr+PW5a
	lWCqOgP0a7s2Y2aqb/lVUhiNqbjTLhDImdqpdS5nIzRU3MpEm+BqTuUdiZDBxQ6RQ75jF7+RVrf
	eBpkiB6GB+z2sWlsffqoPZ+P0JRQ/aatSksoTzwTri/ja1Vzamx62AExOvHVyprvGOQXNi01TGi
	SSi82aq4yvwff1ylPJU/fYMLGywcF3K9ISKEDdfIOdhOHd4KjnAgPtxXmG0gzccZ45bme2z2rTZ
	yjx3h5zvytxfzc9VKy8Wlbx1tE4vrXt89b8NxDjHScw==
X-Received: by 2002:a05:6402:4493:b0:6a5:ed9e:b490 with SMTP id
 4fb4d7f45d1cf-6a6827997b6mr2384818a12.14.1788341714731; Wed, 02 Sep 2026
 02:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <4524c04f1bc23f244650c7054ee449b6af054b86.1788277742.git.mattst88@gmail.com>
In-Reply-To: <4524c04f1bc23f244650c7054ee449b6af054b86.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 11:35:01 +0200
X-Gm-Features: AcwNN1WCrBpqyHs5YZzs-iDskP2UNe4cTrLl_49Ymgyr1yqF1dJ58tr_0kgjpAE
Message-ID: <CA+=Fv5ROhLgZ0DmZekFWnW=H50n++-jeH7W+dgrk7N50hKi_+w@mail.gmail.com>
Subject: Re: [PATCH 12/24] alpha: add HAVE_ARCH_THREAD_STRUCT_WHITELIST support
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha's thread_struct is empty (all per-thread state lives in
> thread_info), so the whitelist is trivially empty. This is more
> explicit than the generic fallback, which computes the full
> thread_struct size as copyable.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>


I tested this on an AlphaServer ES40 with
CONFIG_HARDENED_USERCOPY=3Dy.

The task_struct slab reports a zero-sized usercopy region, as expected
for Alpha's empty thread_struct:

  $ cat /sys/kernel/slab/task_struct/usersize
  0

The usercopy KUnit suite also passed all tests:

  # usercopy: pass:4 fail:0 skip:0 total:4
  ok 1 usercopy

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
