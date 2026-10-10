Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7661D7E5C
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 23:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791675118; cv=pass; b=CrhvTu+fBWCdXT5ebzRGLihlQ2EOL/r1gyLecbJDV8CIrLKILFbUvVEcKNvcMwJWkd6+IlXzsDPjLX8WDhx65d4WeB36yZYnF/ni3ZGRX6S6y51XKv9lIIj8VfTWJMcXsdEhGGnW4rzqzTi0GLo8F1aCeZBDjqxgnSuEOyLtmUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791675118; c=relaxed/simple;
	bh=ZFpAteAUZn9IrcCuDJcGIFnH0/o0CjJTaZfJnxzPdz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Me1azLKHXww6J4jNo/U1TwE0ZQqyoydg3a2RJvULWN91BD2HjAQlKi3HsQpr6tqa1IZ5/GYZY8vozxB/aD5bQG1QzsI3ocm3mjUqFXkr7/uPyjUYC3rRDPnlFBO3c2VFPur5AiWaaA8vzBApldGZUFllSym6jRdvfitb0QE1+sQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1JN5Euv; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1JN5Euv"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso476167e87.0
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 16:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791675115; cv=none;
        d=google.com; s=arc-20260327;
        b=AsZ9HxYzOY1EK7SuFBsFvnhR9g8WMlyJayZ6PmYi4NA/bflK5WhkvlJirUWJFzHqHQ
         tKPGSAOHSt9G09/TsUQgJhlLZRH0+S5Z4LTdPdCrwv4AhC884OYPV6xKWQfcpUqRHoc5
         x/QKlZAcD+1Tfu3xwPTJBvMVwyaBCve+Xb/yGYlYM7b6o/6sk5SKpSe4hWUgyH6vUEpk
         bqy9uC2nf2suC6P83ql44yZ+rzFMv1om1I8cN1woW9SFCbDP9qmV13yhoMbaHrUebMh/
         6ooWnrjbGPZuW38B5SCQRUcsxS8h7e8iGo67UEZ87Ra8ntEPTsHgaVgM+69w8UknBKtq
         ZQsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZFpAteAUZn9IrcCuDJcGIFnH0/o0CjJTaZfJnxzPdz4=;
        fh=xMlrI+73LLsaeEsmDpYr2Feozv6G5jUnw6AZBY03Zu4=;
        b=rdvZQ9HXjpXo/URSGkCgliSxOoGStDTMGDm2YjNwuRRGslDT1mcHXGkKCxUIAk7P7X
         mMk45gqIBEzH72zkKDfUpd8p055tkQXiHCDB+eCb5DU+A21kTHn1uPysYDdZbnSfx5oV
         9zQ7b0kLnNrk9Y8LW6YM2OmEDZ4K/S/x4VOIRfCz4ChWzI0MdVbv4zEy3/LloxWXcDmy
         m4VcwICOQlYmh7i0C2uNy7kGayfO8LgrEDXcoWcQnwzhioWrPXpZGNZUPmm8iw/BSvFW
         IYuVaEnKH+OscLLozHwEEXZ4pxhoyhiJRdX2UGIYUf/s2mdpt/VzlPJLiyJuHq9HKJkN
         QewQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791675115; x=1792279915; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFpAteAUZn9IrcCuDJcGIFnH0/o0CjJTaZfJnxzPdz4=;
        b=m1JN5EuvaWvOQt092zbbaCt5FUlb52kBO5D1rWtIm9D3Bn7FdErO+HvtMZkWhDVM5X
         /+fpo5gJ986gXJY6qY7vnoRvIcbnrLcosDgHEwAG0aRk+TjaePYV0++tqxk2L26e4EO0
         CbNUfORcc+4u0ITaLLrP53Xsjvg0YJwo1w+olUjF8cAjJgVQTcz5JQart6MnQjWh7G8S
         aharZAYLssFKCgELUd3HP5FRuP56tYx/QGWyfhXPj6zY4ca8HI9QZKGQYGnZZv0Vh8mo
         sf9qmi4WczPtb9LlHjlZTt4t9mWZuDdMQgwgp5RJFSx2Hdupk2QBPBDMH5DbD/sksOlO
         Qajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791675115; x=1792279915;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZFpAteAUZn9IrcCuDJcGIFnH0/o0CjJTaZfJnxzPdz4=;
        b=f0NhjHk5MbZvzMRfl6wGjKasA5v9VK/EFLG2Vso1LZTWQmPmVYmNxfikZb7w3jeYVv
         ZdTPRBfRfl2Mf9LKUmAogijAuwHInpYrrZwSD8XPh6+GjoCvpA6nlrl8zzoy647rd4D1
         M3IdwWgHHAIMOpn8K8vbhILs79BBpj5wOV0rK0WCbXUCYQij0LlXNaht+N42Sez50CpH
         BUMTUutkIEfvPWIWAr+5W+SfQE8HYnl3mrndcm8I87gqspdp7mJDWkzCAUnbtDFT28kJ
         Q7gj9umdr0+KtH11bLb+7dHXtTYmsEfKOLsN+YBqUplclBXex/zhUrUQO4SOUcRIb5ET
         3Xyg==
X-Forwarded-Encrypted: i=1; AKwUvBwTULQIxCVfO577C9OmXW762b0shflt5YZcS1otc+Damrvj0NveyGL/KbaZOZ9lu7vqOq6RU5k1Bp7XAw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLSbYBHqfbiKF+z0XDJcRmMrwd25Q07ALG+8a+VFXa9jJQ6Qb+Q
	pF+3Iri5hFMyttKViAZj6Zp4lrbxt6lSxg4ZfvWeVwnBw+z1pjVYtC5cTMl9zC8Rz7wJ9cbsWw2
	u7dAcDNSNGql3Kvk61lPajzEsKQ31mGg=
X-Gm-Gg: AYBFou1J1y9orpG9lvouHhOh5NoWnTuuYrX4PpP+FmVFiKOfdv1FWBpwFO8GKsWYZP4
	HTed4U6kXVCNzzYpb9qmaURYMqsbuCXiEMV0UGG3PpmT2A0R88S285alTkT5wxID1Z1gYVQYm51
	LL22fJpi/IamO+JftaoeXz2mk9dAR58C31ZFOq8OV7PuIIPLig3MEBPs+B1Hf/Q97B68ym0BZxU
	hOe2muMdhWCP04e8WQiwg65+aFJXP2gT7grw6HVsRzWV5Auxy8rME1TyekCOcugYmVRHZYR6tP+
	UaYLiDMJ4SfqEBgHq9m6JB864Tkf9YN8a2FMf3aMZ+Xrfr8+LOEsFng9gHpTFh9bB8AvRS8LYrQ
	uTv/TiRZwWpp2sdprpk5PRIkky2Jfkyf7TBs+UqbAtW+qsvnCl5i5AbJRjBmMFaL2L3yoUm8=
X-Received: by 2002:a05:6512:68c:b0:5ba:3ce0:b238 with SMTP id
 2adb3069b0e04-5bcde6bdbf9mr2126458e87.14.1791675115014; Sat, 10 Oct 2026
 16:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010142533.974797-1-linmag7@gmail.com>
In-Reply-To: <20261010142533.974797-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 10 Oct 2026 19:31:42 -0400
X-Gm-Features: AclHuK8RhP007QwlNSomugXG6sApSgHBnBl8o8egWVZyxoHTrRnisSv515sGeZA
Message-ID: <CAEdQ38FaU6Wev0UCRdWqqsn_2faymQofNqsVOW2tbB=woMyc4A@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] alpha: fix stale TLB translations breaking
 copy-on-write and writeback
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 10, 2026 at 04:24:26PM +0200, Magnus Lindholm wrote:
> Changes since v4:

One thing in your tree rather than in the posting: the eight commits in
for-next (7500493539b4..29e34d2b1b87) each carry your Signed-off-by
twice, once before the Link: trailer and once after it. Worth fixing
before the pull request.
