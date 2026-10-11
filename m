Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49DA45D918
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 19:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748795; cv=pass; b=KX2jtgZegRcIgOAvVGa5MGTdt92HsLlLiFF+NDEtssD3QCtD2h4yfei61HkH6E3LsSG/b29GM02K1kdDiSiHpbZojYxk+6ap2hzfm1Q0lnpJa9TUmtaQG9FGPK09E3y10obItEZe1GIkYI1ZZoxpckUvvEp6ftUPHesYtfeOpao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748795; c=relaxed/simple;
	bh=ryrryBeSzNyl4j6JyOVJUORD+i+D9ZjkVO8MaoTgdSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjhb5Audsav41Z70tDEn60bbbk+1lhV/ffcsLL8R3VZJwX/OlVxqDlSZEJcW7dwtPtpw13g2WVMAkxnoZK7WzMtoihh+CcS5XQE3pB3n8JkzD3Oh8J6ic65yytopM8im0q1laQr1Sd3ZQ+j4x/xIm25pK81JMeIvSIgdBs28Q/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rmOj3y8Z; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmOj3y8Z"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9179dd18658so19240746d6.2
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 12:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791748793; cv=none;
        d=google.com; s=arc-20260327;
        b=D+I27pucGbn7G4rhM8ZKu6YUT0MDNhw7egk8izfYNn9DuBmbqSoFK8QbW1ATGdXC12
         JZ4qXcPe07VnVFqQsyGJ2YdxdW9tZtmxL9TUb0mc5jKZnNCCH5lCCewfiZSUk/mn+1Mi
         Y7wjgKYBakiLAW9GY65FeRSMSdloCWA8pe7V8u0WJauiPUnotArprnYB+oWx37MZgrLa
         nAANRvc4iUXwcihiUlV9J1WjTH2mF77CieD7J+6gLyTQ3D6OEl2l56ueH/PX0n9QaJm3
         Ueq5p8FRMceSJDohkMOfq22UAbVDTWNaxilCGMuYEVTrW6wIbRGaQSnw8V6MbhKV2LfZ
         LD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=egVh2YESSp+Sbik/3sO3kuZxAqecrbk+CD8Ek5NtRAg=;
        fh=U5T9paBGQNY1HnWwjr+H/XVFHkAh5J35rwmcKHzewI4=;
        b=hzc49pbHbo4g6vgLmUBkUvstAVI7CGzyZc/vj8I1F1OXp85d/2i/lAEXGOqranWDmV
         6o9Vc4eo6+HtuCCaMhl+w8Eb5EhBc/EWVebjfF0Zh9eocs9Ok0eZM8m+y3R+9uh3hS6O
         96lSpSEpJxFdo6sIsY6Mhkx7rw0bwJLiUxpt8sPnhKnBaoGL/Yl8jNr4N62jF4IdL+rK
         +aV2qkerN3KP7MDcPckxw+jya/x+VOYX+16pWk6c2od57+CCeOtST+gdCnCCu77U41ob
         MwOYSaVp1ls7NxSIxkpFtjc5tuoFmavqndDpvF2cFx1w2qK/7fyhOB1hOEB3OVZVkslm
         MgVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748793; x=1792353593; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egVh2YESSp+Sbik/3sO3kuZxAqecrbk+CD8Ek5NtRAg=;
        b=rmOj3y8Zxy1iDU8YAahIh748ZavCKBZBuEUAgNvqNac1+KNiGewvM8TxnV/zVoETaB
         tsLv7UXrgMG3rgIkDUgOoWr891rn1RJf/73/K8O4MQvydBQQErs81Vq9xxjOSc5v84CB
         LQTpK4FHp21j01y5/bbq1RNghjvO3rdh7tq32aVzRVoReBQthlAuzWtXdZXU4MXQF7W6
         O6IN7zZzQK3sZPNFmTS+ayjwxdfMQ3r9O/tEjvJIMYpBbE223i1GBAMP7aUhHXWeRmT/
         cAJ4oIUt6NpTSzYwah8kIZ6ZBdXB4ZnIt5VlvCxQwliTQpcc1XuBj0yXlru2cHusHHYB
         Ut+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748793; x=1792353593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=egVh2YESSp+Sbik/3sO3kuZxAqecrbk+CD8Ek5NtRAg=;
        b=oi2hwBf/KtWBCAlRDqDgEV9xTjE29l6N/MW9R8nmX8AJDVGzCoqPqZK4fdv+p/8T4D
         Q8ChqtuVcawoUHlNAsQRDq7vs14AnrAX695/s9oFHVYYejK6AFwXkTfXBq/EvkC0VFrU
         fwML8dnwKzlKPO3U9lekOjR4JvT0r0FsWhM+2uovMPvJdPBWxwRjlIRGdkAPc1at0THg
         l9IZB70GYkO55sO4khbJ57kQfMbrBR4yeRZBWb8BCRlb4dyanSRmkRLbknC4KyNFvnA0
         7spOrSAx0R/meo3UNOFLmopzqIEHyvPO1y7gb8b9aSSqYBrAifmih7J3NwFiyfDrDWvx
         vTjQ==
X-Forwarded-Encrypted: i=1; AKwUvBycQGRnTwQt4R57bGZjx0zrBUAUGTirNSHlMC6uNbAErpGQvtaeEaV1d/2o4Ndnn+CH49nyLFZue7jecA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLN6d8CXAT0oryUQzkxWtyPVEwMrOeDyRiCPmCfaYKzykrJXrks
	JJspIFN7SyHFFM8C8he+6qSNlPjKugwrkGbc9xumQkwJ2PlLUi5+pGoBEfg71Ly4WxRwPNGeMaH
	dSHkanczJJm2SjM05zJQehjgS4t9rxcaz44lD8iw=
X-Gm-Gg: AYBFou0o5SyvUzzqk1EiGeulS9fWvdfM3W2Bk3kqGX1kvBRR/zU+iQdTRQ0wwGexo4a
	K5b1axtcL7jeG46rW9exHaWBVI+dtIrskkL+7McEIVSsv2SBnxZO6Funm6XVjnlIIzJ8J3gdb61
	zZaMnSHqxDukO158WKXxx56siNUVzQCHFPcTOn8jFm6tpfT6QdBw3ciy2MB3IljmTrgX6lIRDo/
	GvauVWoc0nznLv0EVG371okp6zl95/s+IIqsu/ervfiG0TDqL7DJDhasomZPbaiyQoddk/emDJr
	L1daUxxpDZmOKC+7gAd67/NSIcvlDl9iRD1l/QyhFxenBit1Jk2eqOl7AOeB2UoDJ0/DRu/xjin
	A5r8jNEq0uli5+5NzxhAMUFGWROw1MODqb3Audl461Vk4rD6LBtCfaxihi+cbxrVV86hAZH/2vo
	OElqzoZw==
X-Received: by 2002:a05:6214:21e6:b0:91b:88a8:2fac with SMTP id
 6a1803df08f44-91b88a83692mr594176d6.22.1791748793494; Sun, 11 Oct 2026
 12:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-4-linmag7@gmail.com>
In-Reply-To: <20261011191344.981000-4-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 15:59:39 -0400
X-Gm-Features: AclHuK8OWycGR8laOKN73W_qjDVrLxAalUKFqW7dRWpgX4ygrPZuMuZcslBJUcE
Message-ID: <CAEdQ38E5u+gP4sUuzYmQbyGv1NRf8x5CUF84AHnjo957ajCPAA@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] alpha: bound EV6 logout decoding by the processor area
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +     if (mchk_header->proc_offset != offsetof(struct el_common_EV6_mcheck,
> +                                            I_STAT) ||

This is stricter for Titan and Nautilus too, since both reach this
through ev6_machine_check() and Titan also through
privateer_process_logout_frame(). A frame that fails the check now gets
a raw dump where it used to get a decode. I think that is the right
trade, and the changelog says it is unverified there.

Reviewed-by: Matt Turner <mattst88@gmail.com>
