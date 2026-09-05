Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C904D363095
	for <linux-alpha@vger.kernel.org>; Sat,  5 Sep 2026 19:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636328; cv=pass; b=TsETA4MIo/CTcfktIb9AbsGKLanTmVSay2iKcai12r+wavZYfuEHb7tHzZFZypPYLGpj4yGy8aq+YF68UTO0QVVGpuUuT5XlvRbPpvbkuQYfASAeJvXGxDVIH5Ez5EFcHw+beX+ImYismA0uoGR7SkC6pa4mupasiaRwX8cic40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636328; c=relaxed/simple;
	bh=2Tss1OLFh74zP/YO6lC1hnEpTj6L5m5wTk/nWpTbZIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZnu7vNQ4YFF3zI5b+jHYlnrNXjY/2Cl+8YJtMQqSGdMmevMYYYJhXieBi4i9k+3QEYB9juwYUjOm4DEe/q7MZQT2DicWUgVkmF66iT4SQstDZ18VOhmIzQElGASNiRo7bDI1715zyUF5n5FrSUNBovP3475M59wSP4taXMrDmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFvh5E+R; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFvh5E+R"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso3133736a12.0
        for <linux-alpha@vger.kernel.org>; Sat, 05 Sep 2026 12:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788636325; cv=none;
        d=google.com; s=arc-20260327;
        b=j0PgNhQ9ZxQR5GCojA322JqzYnreJ2fWZT+AFPN1/2tuq7ACTcJzpYRklKecNx4DtZ
         SU2xm16g3obOpYiNFb6UolJ1lBGdtBW/lReXyHIiR5VkrKE5y6mzLU/A9B98B7VuEQbd
         3FgHEatDGCkqpIltYGw8C+sNsT4qHYNOFIq3BcxK1RSK4WtpN+fI+ZgqPw2Ez/hdOGDa
         sEeRe3IYi4m2WVuV+iNKRDQm2ZW815c+cTr969cUZsjJ1Q9176cTG3PT3lifSs3OuXlJ
         CUDl0xlgAHw3x2RzawAILjnZnAhmL3wsDBt0U8LD5p0fhT+VPtAQSidtFfHVra8SxIfg
         ZGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Tss1OLFh74zP/YO6lC1hnEpTj6L5m5wTk/nWpTbZIw=;
        fh=i+vy5xoPWUwgBg0jqaI+sCi8Q3qNuBz19QgAzlpStxU=;
        b=mvbM02YRp+3+FAQ0GRjXuhxwkID8MuJIUclcpSFTTgEoCICSA2V9g0d9j7z4sxswjh
         tRtjhVgtd2HRezYKZj9+wAF0fyVLw9Y6aNAUxRS2Uzs7FANoOrZg9o6owfpDkt0b/iKP
         R9da1Eq3zH1Q9QlmKBHSIrs47PcBRbFalq+cdX03ixgOIxVgw9TcSXJ7qwja+tp6jzYK
         ZOBcDSYfNMjQR19+xfhPTN0VqWbML+ApnUmcCGWwTuYWAYe3MZjKJEbRso9gmNa5YSvr
         9ra5JoHPa5ZPpxxcZcgXWYwvyp6vmbe0YIl/iuMSvz/ksuFifHpNPJ/YjucISWWiahaf
         eAjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636325; x=1789241125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Tss1OLFh74zP/YO6lC1hnEpTj6L5m5wTk/nWpTbZIw=;
        b=mFvh5E+RfS4aNj0vy+YT58yiX5gXrqVTmIyvgCwl7s4+N8bAysfWJFRiBZchZHSZP1
         xDITBb9j3SypuZd5P0/6K4I5UmMSmoMBIQN2nBHdmVxV5V3xiJKCrfjS3oEchRJgz1XF
         w5WxNlnmLWbZGXXH5v4xtjVDWrsQwi8g0uNekvGul/R5js8SYY5tTcZ8NQC5wqgAl09u
         m/RDe731TzJzY24shmP/QfiGau42eQ1cYicgWaEg25xwFkJaD+Y1lOibwCgKY10QRrKk
         DqiY6wsiqdW0c4ykZY4pnjjC8Ad0sEsZKFiVFQb3B6NJglzTDtxQTdobzJbdWTbqxOfR
         6g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636325; x=1789241125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Tss1OLFh74zP/YO6lC1hnEpTj6L5m5wTk/nWpTbZIw=;
        b=MbzhAXUHBXGI6XzTWqPwNxhTNzyEpH+6BRh3gfQMB4Fw8DgcdTEXxkMlKoVDeEc1Dx
         tl9GIbu43KN7nrMWfz583sdEao/T6cQYbpLFQqUS1udIQe8tja8o5V8BHN9hsOLzoiEi
         ho6gePJ8nXPwxOBXQNG9dY/KA9+MkyFM70d5qAeVo6riC2mTXDCR8O/UeLjNMEw1OGjX
         zrp7Iw4XcETvahuQq0hdZFkiu70bW9mYX8W1JtSE/69n1tN2fjqcq41ygOwx6yfBPsP5
         guc8beu85JCZDxHJaqsJKxdl1+8Yh/7vArVVM5pXdHrK0ZBBBzAnIMu85AWwwrNhhqxQ
         xy2A==
X-Forwarded-Encrypted: i=1; AKwUvBxtio7QMBJpSN7I5klswKFgLCfZpv0R3cOHxQY3iWObHZe8qxNtpPdP1b8F8WXUDBAl44JvknEcy8jvWw==@vger.kernel.org
X-Gm-Message-State: AFuF++mxeX+Ei20Vp3PLha8G4RItOVs7/lp06O61oZJ4R3oHC9ARaWWp
	KJoMeIvFbJqoKCH7kVRzZr/6IwV4F0dTjpnaYitbPV+6y5eO7kIBQ3tc0jmpqJHWFuKP18SQCWn
	ci/YS6Rl+dOUi3/cflQNxeULLs4drHZg=
X-Gm-Gg: AYBFou0aN3jpNd1mSJhlnR3U9G7AkzuqNBXS+mmholPA+m7O3Pzinqeq7RL0EuVlaFs
	ZDHdRmG/lzZ0Yc9LMlz3Ics8OQIX/r9ebb4x9bz2i1GcS0XSZaug2POwpHoYNd4omfLAlfV+OkE
	D6HfBwRVWAfULXpk4iccKPLci0YzjC35sKqQyW4TsiIzlsQDOyAEu4BIGSaJefsk/ByLi4YCCg2
	9abiQBIFQTCPgKQ/qfGoATnTWZCtt8BZP+6xXfhECq1MDagDO6hjyJ8EkOLZwdr/gMJ0ut9e5GY
	Uf1L0OUtHEgMtdwGVGXW6/2iLjA4CyyO9JT6R+lJroa7C/y4wY7NXFeFdW19QfYpxSHmKvEj34y
	ZgqFS19m2dX4WUSQJ2+n9yOibMEMWROU=
X-Received: by 2002:a05:6402:42c6:b0:6a7:fb24:264e with SMTP id
 4fb4d7f45d1cf-6a7fb2427d6mr1836272a12.34.1788636324671; Sat, 05 Sep 2026
 12:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904123843.375633-1-linmag7@gmail.com> <20260905140755.GA2875205@electric-eye.fr.zoreil.com>
In-Reply-To: <20260905140755.GA2875205@electric-eye.fr.zoreil.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 5 Sep 2026 21:25:12 +0200
X-Gm-Features: AcwNN1VaRI4G-HQNxdXx9quUjsgkaAUNPekVT3Kj7muTqDDS35k5taSE0YYNcaY
Message-ID: <CA+=Fv5TyOLB-wWap6PCpMw646QnovtDV6xwqyg9ygpaBemXaPA@mail.gmail.com>
Subject: Re: [PATCH] net: tulip: use mod_timer() in t21142_lnk_change()
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Francois,

On Sat, Sep 5, 2026 at 4:08=E2=80=AFPM Francois Romieu <romieu@fr.zoreil.co=
m> wrote:

>
> The current code may avoid concurrent run (#1) of t21142_start_nway and
> t21142_media_task. It may also deadlock (#2) as you have noticed.
>
> As far as I understand the code, current users - if any - may experience
> #1 (avoid concurrent run) or #2 (deadlock) alone as well as #1 and #2
>
> Users of modified code won't experience #2 but they may fail more often
> at #1.
>
> It may deserve a minor comment explaining either the choice or why it is
> not an issue.
>

Thanks for catching that, you're right that swapping to mod_timer()
alone loses the pending-timer protection timer_delete_sync() gave for
free. I'll put out a v2 reorders to mod_timer() before
t21142_start_nway(), which
should restore it for the pending case; I don't think anything short
of cancel_work_sync() on media_work covers the already-queued case,
which the old code didn't either.

Magnus
