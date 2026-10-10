Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBE1231829
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 23:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791675164; cv=pass; b=ef3DaCKWPn1/V/1sfBnmkMOIK4t9f0ZpoPv6gCj2B+UcOtBMsuRzxdo6z53xHfVs5ayE9wZ1nHr4IuOO87kn6sQ38ToKfU6Ri2VEyVrACUQBirg6cZ8r0qq+NxRy70jFfi429HSpMG28uApZuF72JdkGXjnZ1crfnufNl/Fd8qU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791675164; c=relaxed/simple;
	bh=yDUlUZyOjDuadO25mlevewbZFqk4aFcZYwXrs7HXeXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NI4ho0dalVruYJBhqE6vw52d/6PoSr+PRf3/Uj7GoWMTtdLz7qtbgMhQy4fWzTXHOi21hRTWl3oB+T6NshHG0xwoIb7ETQQ4CZTWAA70Bf35RpRg24nrZfxdD6OUHsZ68Fa8KMceSigXP7OfRJ8BuTmErnmIQi4osmpPR0kNoWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nyHz0up+; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nyHz0up+"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a7858d3a20so7017261fa.0
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 16:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791675161; cv=none;
        d=google.com; s=arc-20260327;
        b=AhizWWUpDGOgpCPDC6K86RLE99aCYalje1SVcT0Jew2CRKyMOTmk9Zi8iQvCXxq72k
         h1q2PXJ7DT4sh1HSvSUki5OMpoVEtd6mYULx9WNH0ND0WYU5VdCZoh3U0CjDmEmvXX+C
         h03m8JPyYR7zZ32ABi7ZHMTYSE+Ru7hnxQEwLFN4sosT1xwXrcFtMvSQVdRC7H+CEX36
         Q5qjeJdShXLvwaOYSNKQjXE4DwGvw3WqFciU+fptep+rwa/U8DCx0LXSGHl04BiIr86f
         iYpkmDDEornzrxdghAE8dCkbMtOFIlfSDt6FAy7sFpl4JUMz9a+O0u6bnQODe6EgCnVV
         jsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yDUlUZyOjDuadO25mlevewbZFqk4aFcZYwXrs7HXeXA=;
        fh=VgybUamVPE70DdU21OsayTczQM9wWZjTDIcsEOwM7dE=;
        b=WAg5ZVNUmFDPmJDhBAMXPX26utdipaWJzJkMpX15cji5L+sBie6gNMy5/nD4KDCm0e
         QyvTMkxHukGCNn5zZgzVeGpzP+6zzweJ96p5KveRtqraM4+rcvyTlb5zxAwj9iWJIABl
         u7nVDD4StQucgnyiz9YQsVTGhXEhVPLefUi4F93/D5gGmm1yZ6VfiD1N1Grsn4bMUfEj
         QmsX3W+bydLZM3zZwFXoSVmjoRYU3T6bmQKWD3i6V9eCX4r4B77lW0/Eg97AMldgm7hw
         cjpGehkAP1fQUGFafkGCQ52ct+Eo1ArAPxJgEpEJ1+5CYmtq41jx0ri/f3v9nmnS+6PP
         tnRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791675161; x=1792279961; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDUlUZyOjDuadO25mlevewbZFqk4aFcZYwXrs7HXeXA=;
        b=nyHz0up+SSnKNt3TULfv1hrau1k+3LTxtrQbO1lvzoOVgqoy7QKpNBBUOvP+DxWOYs
         1wKRfV62LscPNTsW9858VDdRpyu4BH/+AiBcnZzmwePZqddloB9bJpILa0EDBjW6DkeZ
         w98n3jI/2QdGWubkTNdpBZnggb/pHz05xh/lWNtUs4fq+Eluhf5Na16Z1NATEDUWnsjU
         8lFGtM8t0Jk9Mhqio8+1/FRmJV0ZWwmzzKt4f6WehjYJk5ZBMx727h2fKyByW45EVeo0
         jaAi/OGllP5oHrtbFNa1xfmZB5BxgOCaqIUvSzkqve2uFS7tDq3fJ+7lfssPCVdYepMM
         6JpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791675161; x=1792279961;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yDUlUZyOjDuadO25mlevewbZFqk4aFcZYwXrs7HXeXA=;
        b=QQRRk8zK4TWpfbRQBlmTqj5nAgypDkjR61daNjwJjsTpz3z4GuTVzA77oX24A3Pof6
         4rTw6P6uVCwgd089Yq6Jrkxy65fJB6p8ng+/XxvxE15QBxXHKSdkl5en788N6NwJ2ker
         0EASh579+r0WD79odVurVqeQAgJ150ylWldDG0Ao+4q9ZhYq4nHQ0xWuOVgounnmrhDC
         WxNEVZiyrbRSw3b4ZSD9lMXIV0d9+XBXlCbRpunXEZzYMztmcXNOfu73cnyu2tglUXcx
         Cqnq8syHfwl+innXMSwYXhDJsfm5IAPVxkDavaeVp313+k+2pgtUGLtuKfKjec7l1eVd
         hwrA==
X-Forwarded-Encrypted: i=1; AKwUvBw1D2ziE7kVt8YrcWYhkusLMP3fxosTARcZMBE2bN/+UxuxXG1RVxS7zr75i1eS9XtsBF35KoCGwv7Tgg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIbM9mFFUPXvo9EcvRbCiqTxF6lLMbLjv97n1zEqzcaMgjEy1yH
	NY3gZb6vTPsb6IyCvNFE9dSFTRkzHvjQcBrpcYrdNueH5QzLTfW2KZ2iKAX8CmrH5mWFuuwmf0a
	H+XZQ+80DeyPvDD5rOr31nVD2eNLI1WI=
X-Gm-Gg: AYBFou1JdVF/HL0GdGHYRmjRwh7Pkxn26HXy959BjZjQoR4yF3DNt+p8t+Pe/BuKxGD
	AITGr4OzPu6iMC+t7vaLPxQCyQI8itYjK1Z+3t827nsAfqQQo36FKvkxC5Seufe6XP8j97W9OQB
	3feddZG/UnBRzVECMUz2ZbYPv/nk8HU4xY3BfNAtj6yHsOV9OkcIk/Z5Er3XyJF3vPTWNwGGqqh
	qgF+njI5VbNgaxdgb8ZPwyGfHQ7EezLduA6VhPIjvOjjHCavwWnblAvsHSpO6aXSz9u7CeGmHWF
	Lrp5F+ypK3ovktNJV1lZV4Y2+wqUJWqYeaOCOkjJKA83dsNRu4kCN5ExuzL6qZkIF5WRnQQOCxk
	Xs6RQbMSWFiHTz4bCvM84f5jd8UplBLtrgtzoY+Uoz/EBjniHVgcfx2mrAAAljn1GQBGRhTc=
X-Received: by 2002:a2e:bc23:0:b0:3a6:636b:63c5 with SMTP id
 38308e7fff4ca-3a9c5384f54mr12392801fa.16.1791675160999; Sat, 10 Oct 2026
 16:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010142533.974797-1-linmag7@gmail.com> <20261010142533.974797-3-linmag7@gmail.com>
In-Reply-To: <20261010142533.974797-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 10 Oct 2026 19:32:29 -0400
X-Gm-Features: AclHuK-gvxmspYL8uhJeKZU4XuFs3ltc1WsM9uJrh1XP9y6npltcI5XIXewgq5A
Message-ID: <CAEdQ38Ep+cu5ssTGtb5OQwHGRB5wz+crTfbV9GM6wVDdoZqfmQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 10, 2026 at 04:24:28PM +0200, Magnus Lindholm wrote:
> code following alpha_switch_to(). New kernel threads take the same
> path through schedule_tail().
>
> asn_lock is left set on that CPU, so the new task can run with

I missed this in v4. New kernel threads do take that path, but
context_switch() does not call switch_mm() for a task without an mm, so
they never set asn_lock in the first place. Only a new user task leaves
it set. As written, the two paragraphs read as if both do.

Changelog only, and not worth a v6. My Reviewed-by stands.
