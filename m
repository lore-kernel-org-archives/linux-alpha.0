Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D124E2F12DA
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 23:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791675145; cv=pass; b=kYOKMxH6W+sQ02np3lImopG/IjcpDc6fHQUxnqHPbmjDI8GfSdxGH7697t9hA8iaSnGKEIWXgbOphJsga6T7hPCvTUkBgON/l0TTkxICatWZBPKKsk6uilpi9X2Mj2XjOgYwIZewRPnvaTljm2KILdlfrQMoWIVOAg/kmF8Uuuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791675145; c=relaxed/simple;
	bh=qflQkqQeHmD36iK16xGfjqsB6XTM4Xa1UP5Z+sLs1ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fv8r8n9jyzsQ8ORhQbt6SOpzn49q2myhvr92UHqd7eKwMjfZpY+hDVUQ2kJjqZYfV4aS6WvRJleZ/qpsR32RlOvMnP73eo1phpqDx4jYZSmWqz2YRZr0FspV1W/mhsAeCoG6hiHOmelaB5N2wU07HJxfkIzrM4V6PH/yI/DQU/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVgMzDrp; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVgMzDrp"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a98fcbfb1dso6289771fa.1
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 16:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791675142; cv=none;
        d=google.com; s=arc-20260327;
        b=nlJ1MPb841jUwf8D8t88geXoGH1XX67cPyS1avl8vCZUY2DOZcg5YQNUe5xMqOAu4v
         AIUu5/SN1wIjuSDx72jPKYvDt3mlsZX7zKP4TKkNysuYMpsveaQnRjuSNRj7/LEfHfui
         xKt2RiPTghJ5WQtZ/iAUk84hEioI4VeLWRnxuAocZGCqJPMp3edI4s97ZBn/cDM/BAGg
         Gi9nn5RKw0cv4dAz4jY6JYsW94rPYLAKyGak1ZzMmee2VWlb+/pnC3JvtHpZowLCiWKQ
         vXNv2utZsr7DY3eNxIg+59MDVlArER7eG30RD4wQJ3IJrkYVysXPl68fdqKlgitU92wT
         gIJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qflQkqQeHmD36iK16xGfjqsB6XTM4Xa1UP5Z+sLs1ts=;
        fh=yLjqhzj7I4nFyzJ3m8mBmOM0/bSkTmfPRyRNmeWHvo8=;
        b=YKNi/yIPXYI3qnzfS4WXSTXSN9EQVN0OEoEJP8BQIxrn3RNpUAi7bI+dDbEqSCYJh2
         SSGP+WiSppGeTtfRrSH3N54mWKLkBOzSi7CcA0Opnq3S4IWY7MrVEnNDL7HuaAd7sX6+
         SfHCp5XLhJVTNAuSddgSxT6iqQ8q9WarQAwH+xAx/lDoqVm4EW7cFlWhjtcAvd/RhcjW
         ftfI+mk4GISJsM9btSVqWkqKogmm5uGC0kp62wP63mir3N62toDZAHrfP9cz89hVu6Qb
         cvzkhAgWmqY7S2YFBUU6Dq4FUAY/SkbYXSJYnpZIaJ2XUwljdpMPr6KzDf0SbvHK6xYS
         8Qiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791675142; x=1792279942; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qflQkqQeHmD36iK16xGfjqsB6XTM4Xa1UP5Z+sLs1ts=;
        b=FVgMzDrpb/7b8OlWamopi1tfTxES9h3p6GIL81i3K8DEJOc99rMtRP/LO0d6gXigN0
         VE6Pw2m31J/VhNRNxvAsGqYQU84K1VO+UV1F2lQb1J+VCDMTvgva+ZA0Xl5wN3nxkySg
         AZmw7kFvwTqMuC3X2y+eow2fIs51MG/rLRJnlG4uCEZ/rFVgSdt7hP2U0Mhj0OA75anj
         uGN1u5TEgIanXfIY/ahZl0K7+AnpcMjl58fRWU1rkdGmHqRYAxa3Zve1mJU3APOYf3ix
         E2dCxZ40l/v+cZ9mcEA8jV9PT0W6oibwLWOeGIrC5ZLjA3cWjQCh/6YYdWNLCRZ+SQJb
         wASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791675142; x=1792279942;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qflQkqQeHmD36iK16xGfjqsB6XTM4Xa1UP5Z+sLs1ts=;
        b=muIDTGewGyM7nXsspzMsSs0cxkctVoSu4COAvgbpptPvM813blkFUyMmYxjoC9qIc1
         cmwh2mydS4N4ymoWoRujUqTllTX9ysALrtyS8AnlyR5VqIkxlRqkyygk1bNkFi4+cT0t
         PH2N7zR8jUTyqCJga9rP7eC528j68iEg7ChHWEK9Kmelq+p8XYsz3FmikE7+49Kp9jGx
         oVQmdy5dMl8+jTkfJsb7X4YFC0aFU/XXuZlIBka4pdxpNl0Rnsasnoorxg9VLY3mFm9U
         YXEAhBspwLVcC8H3aLssM0NtSaVuTYOjHSrDMVmwhVkLljrpFoT0nEl2C7n7LLPZpItD
         5TCg==
X-Forwarded-Encrypted: i=1; AKwUvByrDswKMmyx4kurij67jdNz0u1Yu1FBDLORDzFwaMEqqf1JeMPsSas/gnjQKtvDqTkS08UEZ+IUTkeI7A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJabcS5vGnuM2Wnyilec4qLCsx+XS68mPd8KKNbRUjMKjrTmZC1
	uaHXlTYy20CmOLsEq7XnCPVzrCXX7sV9zpYyDjOw9K3evxwTW7QKa6at01N8XjkElIiOi0ED1ee
	oXzy6sLM9ESmGIubc8aJA0+5wwQH+yDQ=
X-Gm-Gg: AYBFou1OXSRmTe1QaEtDhigqzu6oS8nLwxRRtXLmucQYaRathwjpio4tTqbO28KmLSF
	IJmxVnsUu1cSLyOIfqHrhzt6mXW4pLortkQLxXgjrHPjEL47KDzLpYTqvQmTxkrn+y3Pca/g7gr
	4UPITWH5fgOZPUx3tf8KOqNK5RW6VQ8n9LYtEm2CnOvVRSHzTrcTmDLjebeLuYtLxfer40rf49p
	GebBJSGD0uva0wjX5ZfHPYUSlxSGBD7xFdW+iV7K7YZmBqL97Ee4noyQbREM+V0HyMah4dfZ2Ah
	yBUhfYybX24U6Nehi7lmp+yiGaaZQXTEAPF9fp6LxQYLp2XhAsJScGJMqLzsHoHWuH5qX8IwITz
	VUSlS9vrSokGH22lIzJ3Mxv3kz++AhiLVYfkCZLwsFGJqi4LZbw5SITFF9ZcqNEMy82IXJxndYR
	EqyYOcTw==
X-Received: by 2002:a2e:b8cb:0:b0:3a9:c04d:40c3 with SMTP id
 38308e7fff4ca-3a9c4ebaa9amr12809291fa.1.1791675141422; Sat, 10 Oct 2026
 16:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010142533.974797-1-linmag7@gmail.com> <20261010142533.974797-2-linmag7@gmail.com>
In-Reply-To: <20261010142533.974797-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 10 Oct 2026 19:32:09 -0400
X-Gm-Features: AclHuK-Ff4Cr98p_CB6t_k-bkb71SKuGnXuo7evvdddqXdUWufYMH0X2srMk7xI
Message-ID: <CAEdQ38GtjhbEipnuTbo1EmzNNAE9=6p3T6MfTnMq-6okmE9-tQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] alpha: load the MMU context when switch_mm()
 switches the current task
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 10, 2026 at 04:24:27PM +0200, Magnus Lindholm wrote:
> do_shoot_lazy_tlb(), which switches to init_mm from an IPI. None explicitly
> loads the context, so the task can carry on running
> under whatever was loaded before while current->mm says otherwise.

Two small things if you touch this changelog again when applying,
neither worth a v6.

The second line above is short.

"while current->mm says otherwise" only describes kthread_use_mm(). The
other two callers change active_mm and leave current->mm NULL.

> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> Tested-by: Matt Turner <mattst88@gmail.com>
> Reviewed-by: Matt Turner <mattst88@gmail.com>

Your Signed-off-by is last on patches 2-8 and first here.
