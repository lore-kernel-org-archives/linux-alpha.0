Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801839D6EF
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 07:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346705; cv=pass; b=aH7Ew25ELfmvj0NwK5ndNg+nQietkR156/OCRJf8xYVmcpWl2+dR/gsnlmTe848Z+Z4MSpAUbRCPfg0VVnH4bLueEQyDd3t58f1bXh+h3Fq4jW7hOWzOUf2+7r6gahwzZW+kkauwRuuHHs33OFKUzZ0ptXvrOBASZOpN7/878bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346705; c=relaxed/simple;
	bh=dVNs/bRzNpZAT1bn/C4n3G+Cy3g9RKPzJVNPfXgMXaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDmQyNyBBWKFwajbiJyBwkOHJEFBGHDjXbIC1l1D98UwRioJW+eU1csQ9eBgihiUGLVQVA6ut6i7Ayjlek4ya0HDaf1G3ncYH9Bp6BtPExfJf5t64HVgstcdN9p9bZRCzfOD6HER+7uHbuUZAhxZMv6LTD49ke37H0EXvHc2SSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFkuruHK; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFkuruHK"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a17c04563fso1609323a12.3
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 00:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786346702; cv=none;
        d=google.com; s=arc-20260327;
        b=rccu1yr05MqBeL+rNRtLVlRcVkp8IP2Nep7h2aFszh9Rk54A3FtfmWiSDka/cs7r/W
         4KnxIoPML0K/jOr5n73izPw1zl8hIRjzbjUZMU/U0Eon1wg7kCNsqVWkTB0no9MqfkWb
         z0W8lSX3weFtHKxJYnKfFE7KcT8lsVKeleKxo+QaN+PBwXzgh4j4VbBC0oIFX8riPKoQ
         3iO7bWZK08Sahd1sxrNGNzaEfGJPz1KEn0ituDZks71ysslDDeJ8WzKF0HYn4oRYww8b
         7StEnA0T5j0uxnqTu7PYA1jRlIIkqCuL5yohCN/+rEyTMWW6fZCw1xy+fBSevpZRa5lY
         ZVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dVNs/bRzNpZAT1bn/C4n3G+Cy3g9RKPzJVNPfXgMXaY=;
        fh=stpE0zzmx1TYXrEEfCzccTn8fElhtwUjFrIEXzCNinA=;
        b=h7kePIBiXLLxY+MhYHD6i1+zPUhRK3cgaVNYPO0/ztyoJ+DIrA5FL2m3XgzjboxMqM
         +AmqxJoo+Ff4kdJzjL076FCeISvScJD1yXsUWjyN/XX4dW0HONpHnlzJ71lfOj37N7DI
         zkM0V8XkiwRv+wGOMnTNOhO2t0w3SFbO655xZItzmRx7qO8rp+cOq85Hjt8Kf31sBxvH
         pAz6nvp9v0PuW7I4UyYTmiK2IGacZkC4B7WfpbO0735MA23PEE3a1lbTZejdGRGt7BLE
         h4fQyytAWjYMTKWmo8T/aeX49vpd0OP44IjnhvVX1/tr/oTizniLQ6yO30+E6X8/u3M6
         SI/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786346702; x=1786951502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dVNs/bRzNpZAT1bn/C4n3G+Cy3g9RKPzJVNPfXgMXaY=;
        b=lFkuruHKlRPmOKaRl4COsA4iNDtmSpwvpq+usnrCyRxnWIoPuLgyIsl0RXPOFfs45E
         m91HZ8pAKwQRUeUNKmZCUdZHJLlXIHv90PPlnBfn36KqZ1WDDva0K/nNpPB7sbPqjF9Q
         0iLnP6bKqiNHcfn6XXnaal8javHnkWsJEw7J1rb3dnAJbOCGD+izjiNp4bsJfqno0YdT
         ffA+SNVztPYWhNf1yhOUyQFFwjWka6tJzxzHXn2p5DQGsU902ToXEPPsJb5YrCvvFxi8
         zbN/fne6DQnMaM3L7XlhFLNgnje1EqtrZwOMERR9fuckBqWaLabtADmhxqymabxhKG0Z
         RZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786346702; x=1786951502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVNs/bRzNpZAT1bn/C4n3G+Cy3g9RKPzJVNPfXgMXaY=;
        b=FRn1vMfEbY/9afCrgZ6qrWnAM3OLKqMkDgndzUt5d8+RdZXsVsFsQDqeKN/yEwZDaz
         wKaTICg/atOJ/6SghJ+XpnpNAryG7ZwkF0GVm0dBLIBNVcIszg3fAd1ZcerSsLO02PDF
         MnkOFHple27M8PVUAHEZhYD8+ao2AyZXJ5jdycmbSA4iSCqrMAhUEkdy1IYeFlMOph5x
         UDb5Oi4Kb5yPCePA8msspDW+C0XVx2Yj9dbryT4J57RfvPvU3W3iZKb5pYoj/GkUdGRE
         QE7SXDlB/qZCtZMaOwWebb9xjf5mDybTrRNwIYHxrrvWjNhCOqcepDMmDUtgrAEC/ieF
         OrIg==
X-Forwarded-Encrypted: i=1; AHgh+RpzU1zVdpjTTNo7GPfBCA4+mYP/WNrCWsN8RCqSH8iLTmFmX2HGrRxWupUr/IOIoffRKV26figpIxoWTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL5GEoLB/Gt911F9nBv5SfRCJhNTr6sYlJ4F3mh7lKhHIurU+K
	yrSEkkeqCAaFoGOvQwSeh0tt/3h5LyCV7/a1FuD5A88/fNd0T7j1bKNg9e7irUg/reb+4bm+O7k
	PShWMAweU2ABE9H4huI42nHdWApEUX30=
X-Gm-Gg: AR+sD11RItjyoknvAGa3uK80VTgppEg8C6tG5BWJicr52FERFPGn1glsgnJT98T9B0X
	t795fauyDg5qIBRy7svS/PSnHbZxHLzrl4yNxhIE+XIkd8vR6Hhs29fD2aFxBpYFSuc6LfZx+Mg
	CVTP73hLrgvOoZSxIBt8iedkl4cm+Jum17PDF0M11IRfklK2pEfU5/lwn2pqekOYlh+Xqe9GiMA
	HicAt50lOdi8uoqYLsWSmle3uv+ONYSDDXN6ol5o1USd4sGV4p8RaNCnsrF0Brzym4RgQlIopQa
	+v46+6xdKf/QTSbXJBGXRgjvcZtoymX4jHJwNsGZaExtbABqSBY07Ev6E91tPKqEpQ+Ds/VykM6
	EgpSli4JCyxZ/XSAWQxRfq2Mb1tOLpEE=
X-Received: by 2002:a17:907:e005:10b0:c20:af9d:4546 with SMTP id
 a640c23a62f3a-c20af9d54ccmr211434366b.17.1786346702244; Mon, 10 Aug 2026
 00:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809085208.3262799-1-linmag7@gmail.com> <CAEdQ38F_pP1a2ZC3DKSWx5mdEjdoPWc92ojXvaO61tMyBLLjRw@mail.gmail.com>
In-Reply-To: <CAEdQ38F_pP1a2ZC3DKSWx5mdEjdoPWc92ojXvaO61tMyBLLjRw@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 10 Aug 2026 09:24:51 +0200
X-Gm-Features: AUfX_mw7OEtZXjZ2umoccsAVj5usEn1x7TV_LUAQC22attn9qUmhx_gotlSJgzQ
Message-ID: <CA+=Fv5Ts4UExpR1u5-tdAJk6YLYbrcu87U_X3GzheiySRLcgRA@mail.gmail.com>
Subject: Re: [PATCH 0/6] alpha: fix stale TLB translations breaking
 copy-on-write and writeback
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 4:35=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Nice work!
>
> I think we should have a Cc: stable@vger.kernel.org on all of these commi=
ts.
>
> I'll send comments in reply to the patches individually.

Thanks!

Yes, that makes sense, I'll add the tag in my v2

Magnus
