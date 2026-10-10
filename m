Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D462D59E8
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 01:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596574; cv=pass; b=RCKESOlBtxTkUbo2TYF/hhruS7vtPOP5LbRrvR9DmYjpEIUm4rrlk8Er6i5Rk5goC97CuHKyVV1xOxI9PCITvrTCHEnOjaEeTGWtBMjiob73ROTZms0zBDVBVTUBr+Rw4DD0XQVC5AaKWUx89VMzIvvN6qnge5YC84a3oXOC3x0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596574; c=relaxed/simple;
	bh=o+8OqkLCRVEqlAYIJtPEeGd2EGzdU7uZH+zJciEefcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aR0ozmduEahGPgu6JQyeK6UO3SaTS/FSAUi4Wx7ACi+HsOsj2ZvQW3YY9+SrN4Qo8fDDz/BRKxhwBPi5rnv/D6Q1Zp2MAi7s2wJ9U/iuEkNoscxFw62sCQQUf/515lAKZ1y3Etfo19j4JZoliQ4e66UL1R8vtsXCIG2XSP+Ts1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djP545OW; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djP545OW"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a9787a156eso3119621fa.3
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 18:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596571; cv=none;
        d=google.com; s=arc-20260327;
        b=IRp8lLQ6kgu0fB/VeCacsuBlnbtpIXEUjmxfPemmpgAc4k7UMo31Xy+P714KPhOQ0l
         6SR65g5oIvcI5rXO4SvM2PlvuJGmNaUn3aWmuBON0lG6NLryiXbfMr29Bmra4cod/Rou
         JrJVkIQ6RqlPP9s/HrlutULk/hi2znwYmflMHahUfyhLA4Wdqi3UNCtIZoS+nsa8c0i8
         ky+6eSbMpk+bezDBjUu1KqHuCfH9AGBSGKPshz2qHBOI5ngIIxPs6cR7iS/J/7x10DMg
         tWNEycv8RiZ9qPIiIHWEGnkQWvn8YGRtDmR6C2+FtjSAxQjce2YfpbW7P744AFfcWtXT
         18xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rU51iSJF6TI/pyu0D7m4lbncGYiHJsMgWbaT+n+hL+Y=;
        fh=aQQ3/W/QjU+35MS0TCcu4s6JWp742zutMO4WSX4SQYQ=;
        b=ngwGmWsz4Q3y1JRYJXDURQViO64LcfE2L+KC0dw37thJgCYyWy+kayhlf3suAjAC/X
         VSRD9BNk9/oMraPDqsT2WdkG++BjHSDsjQqEEKu+xmX0FtB3IlOcID/6vbZ5QeGDFAc4
         J2fVZJGYqlOBv9FyC9sGWjX3AU1zYVti3MgXJlyTU+t595boCL2MD8efQfCLFIT025cj
         Q/89TUnEdVQ3hgdJQujSSbWjfS3J8Rjy7e2An9Ub6E3jIGJS7x5iGNVvSovFJkqQ0GEh
         eWYbQLo9dZtrC5/bPkP86H/NxQO7IaQLgpqjvOsmBDka68/7ydX0n5LlZAJ6zohGk6NA
         FUTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596571; x=1792201371; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU51iSJF6TI/pyu0D7m4lbncGYiHJsMgWbaT+n+hL+Y=;
        b=djP545OWl4i7nLgU35Dy89RAk7/bcAyd3Q7Epu1xORO9XrpGLmUJJ1+ii9VF4y2omp
         nNJ/t0X9sByrT9wP+GWygkWr3S8qwXqGK0EyZqWjb7S2GlD1jlmOAYlxSzxgGUlpSwkN
         QH2B8muvwoybYEd5Km1r4iwOjRu2EuFLM3yT7f+QwWe1FbKe7EBGLJYt+VETNY2rebi7
         145R53Ow3Qr1pRNyhqULzd9kUqqAConh1YIFQBJU6ay9JKpal9WjQRSVO4Cf9oqcU56O
         EHb4P1o1WnaU89RDV0MWxjn+ynB7CCrIAhNZss513clAcG7fPgsjZQbQmCKB1gE7pOPS
         qW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596571; x=1792201371;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rU51iSJF6TI/pyu0D7m4lbncGYiHJsMgWbaT+n+hL+Y=;
        b=FDbXB7z9exz2hiXqYlv/YF5Xl1qcy3stNXtfFTbpGR2hZ0DT8TaCHBTFKNcJ9eKzd6
         /MVth0Hl2phDE70RGDo5enXCK4N/lTcvidvd9Rfz9HPXN9qCHRpGZEQ4iNwyxKfN13GR
         wprks6EbPkUdQnKaYgqgQdQB9dJbA7zkwL7vnaLnY4LT41XjVSjZgBzLV+2kSlzh3k8q
         q3TpvVsFxZyTEWnOu1YLYw2IhL6W1oJM+O0WjKainD/PeDGQRi2NLhoBUgGD9nCn0/al
         GpstEblh5H0t9B3s9UpzBBOmFRXspOVWHHF9cwwPOMFp3/+gTkhIzmk+Rdw01c5lAE63
         5Oxw==
X-Forwarded-Encrypted: i=1; AKwUvBw057ruWTwOu8jALaplwR4xP2L5FHw1M3KdVzMiWghMR2lUDCFusrOAGXzi7BrvUuWLb7HNvyzTy5MmBQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3Fphb9sWJNY3yC9l5qB6GMW0qi6DF2P7nkcu7IZUjax65+rqy
	hN9AjWj/PVZ6svjK1O4xnO+z4IjnFD4rACyW8AsPPscILpI1Ny089DtutU/KoggbUGcheSr8UmO
	5cRx9YpDpMs0s1cllz4zCs++1drt83a8=
X-Gm-Gg: AYBFou300rB6JbT8IHyuNr9833rDoEH16/MohxzKAzmNsVtDzwtwr+Vu7BKdUgRf9tC
	3ypHHckBRoN4uTvnHVVJ0WVkHQW/mJoiAWe+dXXLKxSIyAqjvGgfrQCP1R94DnNi674z2kHiqHN
	EeNiI0aEQ2m6krFkj2jThYbTmG4hcR0JEDZnYEb2ObBmsUdoYJVs3UBS496vpe7msOFov+pgzAI
	WDW0g2myekGg12FFRzFN7rKwYvtv75YDwYhaIFi1JZbch2nMtaBtLQrxVt6m9au4/vkCeILcM8v
	bIARv+iE3GGxXootFrUMl+KcwPp5i9c4UNEMIZxcFyvajqPC4kbfiu981Rmr9mlX+7tBKlz0FEw
	ZhL2TVrrtGpt3KHwwJPLHKdj5NGEGyVnQ5wP+IdoDYgGNvrGrTrLmVZeg8jOAEZGUuPMY2wc=
X-Received: by 2002:a2e:b019:0:b0:3a6:53b7:65f with SMTP id
 38308e7fff4ca-3a9c56e2e18mr5714141fa.24.1791596571086; Fri, 09 Oct 2026
 18:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009210449.971057-1-linmag7@gmail.com> <20261009210449.971057-2-linmag7@gmail.com>
In-Reply-To: <20261009210449.971057-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:42:36 -0400
X-Gm-Features: AclHuK9n3UVIh--yKnm4pNRVW0w9OA63SReP2p5Bgf3nbylkquF3k3WJkqHscfQ
Message-ID: <CAEdQ38EyiERiwrisqWfV+bSy26Ega2AL6HjtJESEts56sWqjqQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] alpha: load the MMU context when switch_mm()
 switches the current task
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 09, 2026 at 11:03:46PM +0200, Magnus Lindholm wrote:
> +     /*
> +      * kthread_use_mm() and sched_force_init_mm() switch current's mm
> +      * without alpha_switch_to(), which is what loads the context.
> +      */

There is a third one: do_shoot_lazy_tlb() in kernel/fork.c calls
switch_mm(mm, &init_mm, current) from an IPI. It needs
MMU_LAZY_TLB_SHOOTDOWN, which alpha does not select, and the
next == current test handles it the same way. Only the comment and the
changelog are short by one. My tags stand.
