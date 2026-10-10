Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF991A683D
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 01:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596773; cv=pass; b=qRevIuBp2JMigi1HyMrARuDqaF7Gij1fTlmepMLpVywaeWdvBQ//sVDx544ipWFJRWMQP5noA9H39ymqrte2RfFG0adSCoY4GbVyzvlTKl6iaQS1hTEgWR9ZPsuvdYKdChQEQIxNAupO8UJppybFNne0mQTEdTunERjUZ1Lpbns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596773; c=relaxed/simple;
	bh=QUBGV7gQYrT1z4A/44wQ0mosAmY32DJ6LbBMbzHaRsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sAMOu6+D1g5mAsKKY4hTcrXXAv22Zq4OdoyeO4ng9Zuj/w0cNJp3xHWS6qvw5eB1SKLYUKrFiJ6RvPQzKQpEWRXrIxH1Nuuv1wTOJT3W+h7iHX+2u7dlVqolbLbLZ8BkYSffCvfE/HWEScHDdWEnu+akycG9GqFCNvWQNt4RLdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVdCo4u8; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVdCo4u8"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcdab9a82bso285910e87.3
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 18:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596770; cv=none;
        d=google.com; s=arc-20260327;
        b=B1Y5CDFR0+4MT+UU7wk/nZRS6N0NyHCfJFxkOd0JZtkGwUKqWospf8QotWWXbtiELC
         0EQRSgLM0aEYTXlJaFxYKnHojcx4HEOerf2aWyJWu0yKf221G70Gt4a1V6gHoxmp8czj
         eVZT2iwmtjfktdJI6urSr2cVi12VX8jK89ATeLbzlRYYri2FQn29XCiHOb3uBxGTqdfA
         6Yg1kOdXzGqErVxK9bRolGEOmYyTKTvFywSStus0OVyRRdRppTwNT8QUxGm2Sv5Gwaka
         EbXrPRJOxFQ5ko+QuF+YqrCiMZIHT5uxIDbsrwu7zbJqNCdcBR6T039CLnB+a09BV9Bh
         bSDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QUBGV7gQYrT1z4A/44wQ0mosAmY32DJ6LbBMbzHaRsE=;
        fh=utFrmUNH0FA2+1zZE1j2nOCdkDkWYlA9m0OAauWNCtY=;
        b=bxprd2hH3Kiiu6mReUiRRQknYuao6/dJxcFkpC3jUEbZb2eW5DCiSA5JfKC7byUmKK
         lUankkiouEriEqg2LlfnE/X89DCs3AML1Q1xRTDJCOXrgj7MHxjWm/gs3poX78FbQx3B
         g6mZ0sc8DEuZYDMUsbnYcLTb3cRzDSd99z2iBDarF0JwC7HRrmZSnG7beNP/mD7cua23
         pDXtt96B2XTKzqCAUXuxa914L/k3Dm+/Wbzv/5MumXiCVNebIm9APpyfGypSSURo4Fj+
         OzU3+VPAQ2EMZTwxl2tYpyeLy28Tpa6cvLh5MhXaR8Bey+GAnKpcqpPKcQUKddSt9EKd
         QLvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596770; x=1792201570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QUBGV7gQYrT1z4A/44wQ0mosAmY32DJ6LbBMbzHaRsE=;
        b=VVdCo4u8lNMoN5y5hi2wgx9fzHWOiUIuM3F8czMvMT/9qzRd9p7+Vb8pXbum7o74oL
         ULo0B42crYhsCh+wK7DJRr2VnspYKCBVUBxZYdjcnpj56iZaxNezJCuw/LNw1TtOHs9W
         U8yf8/kq6/nEClkcUPva2iU2Ib0Ljgb7PUXB86856W0g39rGee3diwywCVOJk4yu4IX/
         4XkKRDWJIERvxXQhZQ2duicNl63Ukdqh1gIwIUKehjsiID7FjCc4gamRSalgX3cJWi9T
         IVGJVEhXFBIbREq7NF4bGZNpBEsUBrMyLD2/yMEFVMTR3IJC09xsnsQ+1A9FVgXylFAl
         3E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596770; x=1792201570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUBGV7gQYrT1z4A/44wQ0mosAmY32DJ6LbBMbzHaRsE=;
        b=t1zacU8Lghr1wUhkpHiHJVH9pwMx/7sR4HaZTnuhrbPDWtU7uXLOnqmG3fJBBjuEWT
         iwl+mKvKTn58v8d8RR7h0kPuMvqMgnBVoJe8Jdk7Ntvwvv1ExxrzdNyWa0h8/6eWZhdt
         VqE4vdRShdJnFhZgfABDulITfwBjvY9/Dd8oUSVNLhO/SwvBX0ng/81Z0Tya0jp1JJM5
         DkrzANaHzegMgmpuuWMOacTGDi4bMy6+kJNoAeRY+tsYwcHXFfXMh047IjYXb4Th5Na4
         ynmS/YOPLONnBQejuE602zPHsRO/K3yWJUIwKSkEY6fsJ5eEIMN3URhWZ+cj21GhQt9P
         OqDg==
X-Forwarded-Encrypted: i=1; AKwUvBxz/qN4K6nDBrKP95RCxPo48JtjpYoxkWV/AqKbordzx/gcjbERHWl4pL31xFWuq//NCO6wnw/ijmiboQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIqoLdb1gjQ9VHZG/u5c6fJn1XgYOErW+vQac7mnpCLL4XgoMG0
	cm7gY3g/Ph0LCmg4BhlfdVO+GkixYhX68j6G/WiLY2B3iyUO25nHZyrJdwWby9/bN3bCO6lTfrS
	pPdZMQ8Pa+fVoZAO281Lw1EjWxUhFivs=
X-Gm-Gg: AYBFou1QKXSHy4clmLEVt/sWh3zEYW1mvtJkUDlTuenWv051M5asTbl62daB4NnQ59V
	RQoroaoCcQExTT0PBZ2w9q4Y2clCCyjLyxEr7eBRSyWnjaz022xbBq05p7O6c97KJORxqlnvmG9
	Zzc4yNWRtLEkQwQCQB+C31J7Q1xdWXis4abqfGJjb6+djMnPAiQyjGgZA6jlfZiHPbFoyRu6e5U
	HjvAKGSqVMocjtGiALaDnJYqzsff+O7YOHTUiWwAgurBrZhKtI/gQN/VsgdlMb217+n2DT1ezjQ
	RfGx4wycXtUOvVRpcKtFZrs5vaPK/3OcxaEZzMjzIbnwLcyfZJ6txEyU0bFMHQcGPLp/cQpJs/L
	AZ38fsiebSph42JzPkSn3T2RgumlnW3xCAteaCB5M+fu64wJCTGl1fJwNTkI4Y5ncdLtBf2g5wg
	PwVS2VGh8=
X-Received: by 2002:a05:6512:3b1e:b0:5b8:bc5e:b581 with SMTP id
 2adb3069b0e04-5bcde8dbe97mr1235113e87.57.1791596770245; Fri, 09 Oct 2026
 18:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009210449.971057-1-linmag7@gmail.com> <CAEdQ38Enhs7WvUYqVRs1YFc_GHJz7zzgAuh-msgEZ4Rd6UC=Yg@mail.gmail.com>
In-Reply-To: <CAEdQ38Enhs7WvUYqVRs1YFc_GHJz7zzgAuh-msgEZ4Rd6UC=Yg@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:45:56 -0400
X-Gm-Features: AclHuK8_CHtU2t0FMjZSmjF1qQc6K5v8rQxL-MEck0HVwNu1xAD776pN5tU19So
Message-ID: <CAEdQ38FwB0Q-4RTJr6tK2c4H1Bdgeeb-qJ7k9EOA9Z6ViUBFkA@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] alpha: fix stale TLB translations breaking
 copy-on-write and writeback
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 9:42=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> On Fri, Oct 09, 2026 at 11:03:45PM +0200, Magnus Lindholm wrote:
> > Changes since v3:
>
> All three things I asked for in v3 are here. Compile-tested SMP and UP
> at each commit, nothing run on hardware yet.
>
> Patches 1 and 3-8 have a Message-ID: trailer pointing at the previous
> posting, I assume from git am -m. Please drop those when you apply.
>
> Two changelog leftovers, neither worth a v5:
>
> 3/8 still says "the prerequisite direct-switch fix". That is patch 1
> of this series now.
>
> 4/8 has a short line in the first paragraph ("This CPU may still").

I should add, the whole series is

Reviewed-by: Matt Turner <mattst88@gmail.com>
