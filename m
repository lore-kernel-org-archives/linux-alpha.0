Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FA33B71BD
	for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206806; cv=pass; b=TZLIDfMvlhsgLvvxaR5NMOUPQpOrGJosQU9nO5QqowK3QWrV14EBhqM1sVhJETscd0gGnDzm4yG3SvBkiCA4gcGC2EW7rjjPdjbaGyzSLohjONszBiLWBUDCZj5/wQHl1p9OAnUof69qFQembNeyGKgl6LV+1r1SVdOGok5GjZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206806; c=relaxed/simple;
	bh=AqcEFbz/zS+lJVauCfo1Ltgz1Ixx8sqngbRxS3SpVQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eVBhUACzLY2uijZ9t2v+AzEDifJkjriw0oTY+mkxJrdVFO4XI/bmG9Sa3AOzCEwHbUc6f2k33Gmo8mi3V6rKUrWsF6ndKLybEhrOjKaXVJrztO79gucyNIpdyftNUm/PVod7yRehXOe8t8aL+Y0m0ODh0KM21xwQrob2tCKWMp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mX7T+Mch; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mX7T+Mch"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso3303981fa.3
        for <linux-alpha@vger.kernel.org>; Fri, 16 Oct 2026 20:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792206803; cv=none;
        d=google.com; s=arc-20260327;
        b=GHfIYdf9R5mnmGP//ElUXpUrMiasySorHBMajwGs/KwqdXSrJMDXV52TMJD6E23Nmb
         vMqqhFRc62Q7RpaT2rBZ0yIB32jjpFT8Qyw+RFmIWIxeR6U+SMYR3fG76GwFvg4TYYN4
         MVvA1BBtmWWXIubJhhjYIIPjNpWrde1IO1zeO+NJqjots6ey0rFXS8odO+D1/E2eJUhy
         Uwscx+CNSu2YBjKXRgNq6pvb5Ay/VPSFJKoQHXPW57XgM98YQva2wUXs13vYwVDFQ2Gg
         85EF1bDphI3/5uZA03AlFF+eNRfQGF+Q9nj78u0NKtGX7s4ExzjRZX/aIPzt/v/s4dwK
         FePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bbhybitijkW3GHz3YceixagzL+nb9IuKCWzm9D8hv+0=;
        fh=DFshshgU/m3avlAPfUziajyTGKcQRLfCkYcfvJsmpVI=;
        b=RNV3dnBFphpbDIItxMuCVvGhi1+KZSKubLMhBbydytBlBVAakh263i99a9/kwIVIXt
         wpkrEVDtyUYWvvPKzjZ3lZrQWvGsF9JwnZVwuKMZ9ix0e08jIv+VtvsaWHKI9LZc36Il
         l7koe3rx0slKBJJ8Q8GnnmXZyEtrHUlrDZ7a/OFcWM/uK6i2736xVtTQlcpPmHkNoFXG
         95ijzqDl0Cn/+rcgTOk68+qQE76lr/+1VyJtZn1WBThunc0meK+zqFmwctZJ+g+PQ7QP
         X9Tq+cVpOKj1I2yK4GmbjT3TblD0Mpu6PVXHf+epH7hXGO/XBWRGX83hA9zbNgXaM3xF
         WCRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792206803; x=1792811603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bbhybitijkW3GHz3YceixagzL+nb9IuKCWzm9D8hv+0=;
        b=mX7T+MchxJBnNbP9stv+9j6/hs6LQP0um39ENX9iPY1q/q1r9gdYlJp/pKrCb303WW
         fzbHqQxuOPFw0q6BhzlSSzrlTk9gX3SorgKWss25W2ua12qPpVtFKa8kFCWb0V5k1eYP
         96wcNQ9VNLDzMKVJGVDCsxO8PfIEWMCOSoTEMSBr+tgyVEqu7amLyy97TTtlSodEC5KX
         Ikjx7z30ZxQXJqHW6HdauCxVbk4njzRe0gYS+tJJk1RNJsBvtRH+SAF9/8FVp87Bs6eV
         ZPP4JtEyi3rC6iXwvoj6EbEcTdgR9hNXglLS/946G4gzyyWGTL+y3ws/VheplXxkZvF0
         se+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792206803; x=1792811603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbhybitijkW3GHz3YceixagzL+nb9IuKCWzm9D8hv+0=;
        b=K7tWvy//DEmU3H65aM1sXKHGT06UxC3A4CK9hIHxGynUpJ3jsW2BveKni408rEuE1E
         /hvnyqgOnmg/JSaCJIR4knruOI678L3gwoxtWMb9YBTo6qGRMNUuUnFJUx/GRarYAcOr
         iovUJ4k3BFvd93oeQ3jM7l3Ph6iwnHtcdhf6JuS7KSc1oSyv2jXCpZU7GqLiPEsMoah8
         RZ6mYMewnlVBtbAArC4oAZ/kv2EG/4BVOKVD6Tpg7Drt8mrqpwWFp8Yo3vjIA8n32RF+
         ctcju+LOzWOReGb3H9aQoKx4sJ4ZkovMbG4DXyzKxsI3I7X9VpaPWlBVlGcasWiVb/KN
         Ln4A==
X-Forwarded-Encrypted: i=1; AKwUvBz6Mf13i8EokjfuFj6f1zF2aefa6BVOuaPutBq61HnYUmmTvwpuvs652YBnLEYINPVkwchZ51a0H9dz4g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKKrzgEk9ZMqwqBL34n1fjjFpbxx566OcYrhwP8HrZfgPRKO2+C
	xRPsYkO+pw7MoQ9vliQDd0rU/Eu6ox/dFhaxu2HapaqcJCfYvq2hGMHozKDiv+sfosyNOLrZSRP
	P8QU81nRfQe/jXZ9ntLAZHlbRsUsBL7UO8Ipl
X-Gm-Gg: AYBFou1UppwdWInbOu6ZNNGF2xzCw5sJVNuO27bcvIYto8wQE3bRqLT7sjxPR7u3vXl
	hQ6uCI39VNyvWrTOKxWchQbZCDk4bj7FV2eYhHS8vzoyJ4J4EOcv19nXjxa47t7tcj1DRamGR5Y
	yF4C+eyjWU/lu9DKVoqyr/UX8+PxaMoR4Hpb/YOqPlnmOW7yN9Gx6mqE0ikHZKwzSRxVVqAoOu7
	oC+ylJeU06jjMVCZdgotIEu0gealwbgfMlyq2XuhwwcvoDL0u69jV6ZgNa88ZAinmjchVSGIjnd
	5xWV/0iS9M12QPSVqXyy4TWDHRGzaCIMx6d0rmTDvsLmbQj6lYZaXUGDUmWPYUBAkY44+9OSo5l
	3eWLf7k6Vz/WJekUjWC/8QJ194OZQcYBbyMAgLw==
X-Received: by 2002:a05:651c:1986:b0:3a7:812b:d1c with SMTP id
 38308e7fff4ca-3ab28e5a169mr3365891fa.0.1792206802485; Fri, 16 Oct 2026
 20:13:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015102353.999695-1-linmag7@gmail.com> <20261015102353.999695-5-linmag7@gmail.com>
In-Reply-To: <20261015102353.999695-5-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 23:13:10 -0400
X-Gm-Features: AclHuK9BvYIfJv8hFIUrAGFCnqzrnZKHiW7eX8Qxk71UgmZNKGUkKFDMktSbsNs
Message-ID: <CAEdQ38Fyhhc9rgGNdX3CmW9-Mv2mG21LCcvtfzyzrcARn0SXWQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] alpha: decode and acknowledge Tsunami system
 machine checks
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 6:24=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> On system vectors 660/620, capture live PERROR and MISC before acknowledg=
ing

A few lines in the commit message are over 75 columns (this one, and
the ones starting "previously latched" and "by HRM 8.8.2.6"). checkpatch
complains about them.

[...]

> +     tsunami_ack_pchip(TSUNAMI_pchip0, state->perror[0]);
> +     /* Do not access the second Pchip on single-Pchip systems. */
> +     if (pchip1)
> +             tsunami_ack_pchip(TSUNAMI_pchip1, state->perror[1]);

Not something I'd hold the patch for, but the same 10.2.5.6 paragraph
you now cite for CPU vectors applies here to the Pchip that didn't
raise this machine check. If it latched an error that hasn't reached
DRIR yet, we can read it with INV set, print "Transaction information
unavailable", and then clear it, so its own interrupt with valid
SYN/CMD/ADDR never comes.

Acking only the Pchip(s) that SESF names would avoid that, at the cost
of the case where the frame is older than the live state. I'm fine
with either; I just want to know it was a deliberate choice. If it was,
maybe a sentence in the comment.

[...]

> +     struct tsunami_error_state live;

live is now only filled in on 660/620 and only read under the same
condition, so this is correct. Initializing it with =3D {} would keep it
that way if someone later moves the tsunami_report_live_errors() call
out of that branch.

With or without those changes:

Reviewed-by: Matt Turner <mattst88@gmail.com>

(no need to send a v9)
