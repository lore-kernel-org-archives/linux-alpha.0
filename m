Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531FF2BE7DC
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 01:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596540; cv=pass; b=geB8s7r6/Z0kwIPHGczQaEaGQ10w+d1H++QjheHhPpA4S9TAOPskBDkcHjC6oAhLHmTNcTmjhUG0P5xOADXqknJE2NkEhUjoP1zIuddJ3TYyGXvmYYfrHG4zO9ebjIC2db1rzCSb9MKCoiPTgdI7el7PZNOKdt4d1KT7Auvp9oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596540; c=relaxed/simple;
	bh=n8K/DO4hWqYm0UUT3df/CyFWPzp5h4xXqc5wMfIgNuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URQQuIaRhdw0xu3xRrSBYcSXwpsRGK/1hsXyTTbHgX0TB7eoPwwQb0OInxVDZrOa7fayCeRUwjZ/+E+3dcRMNTQYk546MaJSXz4ZzYC8+hWKWW0pd3tqzQV/iIl5Y/9P3Y8TrczWUKqaHbVbEVF/LxsuXeZU718CXnrboRZ+Tfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ptGUc8le; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ptGUc8le"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a98f260f85so2995121fa.0
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 18:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596537; cv=none;
        d=google.com; s=arc-20260327;
        b=r1Gts25MbCdrO3RLFKdjSB0tOxUGcoUDAtU77oCa90Fd7bInqw/sWmhouonE+AympM
         y74jm6lwCRUqo/mgJBehNvbzoB4EIWpEBIaSTjnJuTWocWtrthEs8tnG6NIgBuX3DZxc
         /EbTokq0f51f8o0BbK4uFakgXTvax1et1odBRQFrD8ytrchpnWwrlr6/S3+EKSsB3z54
         0MA/bvUmccIO8X2c4vz+6KNzaEo0VQkPlOXJ4vQ8g0qMvEbYzNpqk8rsQTHmHGaKDF4a
         w5RVgh9p2KFxYbn1OHkx38jFtBe4ZvJG/ZU5zyifgOtCrPEuS+lZjf0sQKBDMF8/pXCo
         95Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n8K/DO4hWqYm0UUT3df/CyFWPzp5h4xXqc5wMfIgNuo=;
        fh=XPKbl/h4uf+Yf9gvIdAHRHVl4tJr0MudzZMe5FjyzKw=;
        b=KSlk1WL3MhWFr3lRO5NVhxjJ+NeoPDmwV/r7rsmhcMkFVH+noAsyAJRkDurl+ksOSN
         pQw9h90FNYmcR5ssizaPAu+k/sQlWZC33PnCnImQSS3SG/lPN1T6DU+BMuK5SB+GAcmN
         M9gg6DUWtzo6RqlsE0SOI3y4JNbSrTQ165Tq9YLtP/Dz1Ofjv5xi5LzN1/RIzm/CAdI7
         SNb/21G4dr9Vzf4mM57YzrNADSJbVBb2xpgCO/yAECiwsj0XWHigdr+JyjPmo4swzkXU
         ScSS08RrF+v5K95x5VMOaS5czFSu22/DT1f3zudIBoGdvYG8MN0I/OxqWgK2b3thO2jy
         IC0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596537; x=1792201337; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8K/DO4hWqYm0UUT3df/CyFWPzp5h4xXqc5wMfIgNuo=;
        b=ptGUc8leSjv8NnQFTNVgVFChYnwOI7do3JYZnUs4lJS18toXvMgDY8VU9ZCdqVIKcS
         DUC4Hl3II20M7gWastdmX7mwzm2oVRZBqqyn7kyLwC9ElubiSEZuyWFVConkhmrUStzH
         Y4dgWklE6dxnds61QcASIM1q4n4eivcsLomrNCY812Xr+XXbkOCq52lPV8/SMUApIh00
         /BGFXUflK7VdKGAVmsxwiZQP0PRwXUecKxwNVaSUZHat7H+SDl4Z0WEnL+92/6TMdUrO
         MDccsYCr1vSaDiixxYxxf1WoH34KzzRuETNN93x435w1C5N6AEKP8wXGhMHRqXDZcyhZ
         XRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596537; x=1792201337;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n8K/DO4hWqYm0UUT3df/CyFWPzp5h4xXqc5wMfIgNuo=;
        b=gRihfh/uH7g8pHPETqybQFtU3GbmmPzsVP3lHi7Yhqt3oaD6RMZSJBYHw7KLoNGhex
         Ze4PBQxaNXCZ/fEaWgcvVyJ0X96PP7P7mIouhXcSYdIwsiR6pO95PIo7smOV0w5T3evP
         dUpyTNKm6a/V3S2x3kfP7FzKBZcZ3u4NdXSeW3M9LQ7hHXbeNmHIghq1QvasKCuXmYwm
         KcMfaYPqeZeRpgoKqFj9R5zQ6DU8DTwfxF135eSKBcB+cnpfUeNT90V9BDYB9T31+DSe
         DJn8o2PI7OTiKhIWycdoVXRZLeNkoDofQoitzJ/GRqUMHKUOzUnCzw0tFATSL+/OOBtw
         SGdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTJQMNeQhPkLUAI+Wc2JBD/1xJoNtuiTyfyGXiM2fCyz2yqffUYUBXK61S4pF3fFIs1pqTh2tTsi+Ivw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI7qjoVROTkGvBWc1U+eJwcFWajEpFswJAEF3upNxlo+QMSE2Cv
	WCIBCco38lMFV5xeNdw8WWKgd9BQ7z4NfYaNkhDGCeo9jT9+K+Boocf4I9osjmlHWOoSABM9Dw1
	4nROlrrPUGnQj+IOgkPb2Pf2qZfQDdKAmYJbN
X-Gm-Gg: AYBFou0TbOPd1BrLyJdj6uM9VZsnYHwombkBJxljhQlkv0eR52d9Lyu0fSnBbOW+Dvb
	N+09up+1WhY5dWjfZHTRvxACgjTFXoNZLwCGHsxrR7WdLWUMQDvm5ykFKoXQW3aggX9l6pus8qZ
	+uPGmJyBBKSjKsDHOlDcpszOegxfe27kpgBOsHLwBm2MgZswgQtdxdF5WQrshUSqFsNI6dm5jc+
	OAHW1UTxtOoV0PMz+Ovs40Zk+jXUNd+5ZVKqOj0wbYw58q6QH14qCh+u4dH3nU9xtb0cpLUYj8A
	5Yyu30Gs8APF6U8AelyNN/R1jnwrZAT2b5hQWtGBwQtPOqIdkbV1bFCXznQx6X8wyxIrJbWENJH
	XFfkIsogoqmuZSN0Gg/Zeb4J+BcDMVjNG3G/ba+vIIxb8WteFKRu+N89B1yCLt0r+G3YgwvY=
X-Received: by 2002:a2e:bc1b:0:b0:3a6:6831:6e28 with SMTP id
 38308e7fff4ca-3a9c515cebfmr8095241fa.6.1791596537022; Fri, 09 Oct 2026
 18:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009210449.971057-1-linmag7@gmail.com>
In-Reply-To: <20261009210449.971057-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:42:04 -0400
X-Gm-Features: AclHuK-lff7CrDPJJPDMcqxzamEqKaH2sh9rsprwt8zwIwnx_tibiaqOsKQY_ic
Message-ID: <CAEdQ38Enhs7WvUYqVRs1YFc_GHJz7zzgAuh-msgEZ4Rd6UC=Yg@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] alpha: fix stale TLB translations breaking
 copy-on-write and writeback
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 09, 2026 at 11:03:45PM +0200, Magnus Lindholm wrote:
> Changes since v3:

All three things I asked for in v3 are here. Compile-tested SMP and UP
at each commit, nothing run on hardware yet.

Patches 1 and 3-8 have a Message-ID: trailer pointing at the previous
posting, I assume from git am -m. Please drop those when you apply.

Two changelog leftovers, neither worth a v5:

3/8 still says "the prerequisite direct-switch fix". That is patch 1
of this series now.

4/8 has a short line in the first paragraph ("This CPU may still").
