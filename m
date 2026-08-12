Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961673B7B7D
	for <linux-alpha@vger.kernel.org>; Wed, 12 Aug 2026 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523298; cv=pass; b=I49gQ7G6dc7NWG1aJd5hNeXPIBddGjD7TJrswhJShEyqfCazTl8ks2p4ZVqJ5n8iPvdyQHGA8VUB+af2Aq+1CV9b1x7k9Os0aoF4LHV9PJE6HAbJcpHCmL125Ly0hLW8H10nnfPPCPQjg0YwSTVsOqQYUFwhJYBW7Zd/1wEvjOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523298; c=relaxed/simple;
	bh=KAD9ksCybhc8clv14bTiCcv/CYLxdm47VVR2R99SEPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ejhIi9j4A2BAmRaZJ1botOBr6x8+LyRad6yafYWxf8PCccdA4WiHZ3KKtkZ8iGY0noBVPl1A8XrIEAkr/+vk0nKISqoP0u+ZCk7s/47yp/bl3f4j1Pble8VofxEiqDekokR3f0MpBe7fwbWKQ7dZwNM66arxnn31aiSQxeSl6M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBnxSdrC; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBnxSdrC"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2055573c8cso104793566b.3
        for <linux-alpha@vger.kernel.org>; Wed, 12 Aug 2026 01:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786523295; cv=none;
        d=google.com; s=arc-20260327;
        b=SAyeT5P2p1DQsh2jTbJjdG1fTGqnO7xoSEbaLXJ2PiQN0415gz9Q8qBmgfTaCtWZQW
         B5U6AKMXDJ4psqeG3CVHLdqCsx7ST55jgIVHrFLSmVAt7LP+pO5OXPZkPnb37044PqLj
         TZ777Bn+qobNX5eYQbsisb5CbkDMSXg6UKiHSdP2+aRgoLXTu11FCNGsz96F5ZWXoik4
         rs5ChxuGeGr8JKwNgXAl70GVZvvkCWWJCPaWgiCxiOfAAE+n/hIHpDm9cu1BGzTwsszy
         iGh2tdL86PoumAD7UDEGINt45HY3e3lBbe5MPWJ9hWVIgCbWSFHPnmHnh3oeCXpHRETA
         oM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gePGGlYpZfXvdIs3VK1gl2M+9nY8+WmTeiFl+AMl4iU=;
        fh=wu2aepp8jBJVHKUyqFA0SwvuB8itUrZE7X1N0UW3B8g=;
        b=qAvU50+skHPoGSagvVRPX8JLdQ8MOgueqCx9JKfrRTMo7ZFyyTf/leOcxFbq9umI4l
         k3Y7zc0InmdFgb7B3ECYPIZSqpxVUyqBnUwXbozxJq7aUDE9aEUfWoVE/Ew5nY37aZC6
         SVzn5aLl3U/PUZWE02xVTM+MLPRfT5MxbaEw5tvlEdAF5h7AL1CBA2tfyIykRuTzQlY/
         rqqmGAGTdbhHjF/lv0ITnPArOOgFKdtu6fVfDn7OznEz+bYZH4EsNWOgsXz5P7F/ve1W
         k21iXBhd/dHcjmsL3mh4ZU6UZTjEBNMl68vfijcvfIgI6ZGH0KIBIoi5vOM1ufXPGyl2
         rpzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786523295; x=1787128095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gePGGlYpZfXvdIs3VK1gl2M+9nY8+WmTeiFl+AMl4iU=;
        b=GBnxSdrCTF03cZvOFp8hjvpQTlgLfM6tG8TmBZe+AqQ93/g1w/EUz6Pu7Nz+hyGK2V
         LiBmkYl5O3+SthEY1hQ3yqeIy1im2cCIQfvi3FjdukEOpaCGdCFlFlml3uRyoMU2ChGM
         fuybpe1dAu7grq6quQ+/qrx67wv9N9hCFes7aBh8JgsWSTJk3eLCpEYBInfXDmCwz7NB
         GfRTUBp2aDZW7z8DYtcxxHkWEomn9CQrG8F2rFgAX1o4PrFLndj3q/pFCUMEdAWvAER/
         WDC43LbWXBVZGF1zRCbgkeyAVZB5ptFZWnzpiyklde8tFFn699u45x+qZwhOysv8xLvY
         yaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523295; x=1787128095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gePGGlYpZfXvdIs3VK1gl2M+9nY8+WmTeiFl+AMl4iU=;
        b=QiJrvrk84+rDxJRV680Q+qvwqbhnxdoFqspsV8PGfvVQf3PBkt1aHW4oyN7XGLXL/G
         aJ2TlvkjaNESJeinRA9+ANUynjuPQ14lf7jnFojL3VmIRK2vGLtBcoz2oCISdDQF9L11
         W1UmubDYFOV0PkWLu+v4tEuRfsrBEmcAqCvpxPQU9Wkr5cBfJdQ4JfTidTdUYoXYUJul
         UVtfFDe1jHraMnnc6LFH2gW0HKblC8nQ4nLHjHExyZx1pSUj8iCjJNmGCDxxBu+FR0CF
         Yn4WEBrFEQ0niYgx1ZSTSGcX4ocY0DM1yXXaieGesmKO5jDaF++OMN/5vwbj3O1ml2Jj
         9gyg==
X-Forwarded-Encrypted: i=1; AHgh+Rqh1FzsrtAbgFBvZGJInJMC4uXTf7K6yY6Q+h8HpL8p85yF2kdeCtPXzkCexGxSZqWzZW2+TA4p+rOm4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJSAnEn3mmAqhjKvAasKq01hz4j7bo74ZqZ7vxoOc+mzlAAI3N
	ohnkZ4mL1HcYDXfmgSOfAtXrtdCf4YkuMAcEmoDKM43j/lRAEQUn6tJLNlAD/AMclXAVjfv8tdJ
	dRQ9+xhZ+8uJo2+kJ+U82eJUXU67DHqE=
X-Gm-Gg: AR+sD11zAEwHcTRy0mimqE2iUTk2ixKbhz23P1yO4qyb16NPHDQQl1g10IN16Q1jekt
	7ELhHw0aoMupxzBeqnFCnzTa70suT4C6az33nVh2O13o3/a3zpt7yG8sgYkUG0BlbV27raLixzs
	76MaYyQu93z8MiEwSsfxEmN1APUKevnGNhINOER+rf9HmIUt9nEplvoMF43/sYSslaYkO0YCqp8
	DSeiuabjZDS/zPwD096dBcDuFIDxrvS+Iv8Lu9B7iZrUSrV7sVsZPgeeIssHQ1YILv7nUq70NzR
	APMEv+dEFR1Ivtnl4Yb6ZZrqERsSCF8jEKJSNgkVb1MNHO54xNtoMlARtjNNpQsZ5NaHNRY6o++
	0cn/yV545ELuTzhr08q1KkHA43R5aPA==
X-Received: by 2002:a17:907:7251:b0:c20:eea4:267c with SMTP id
 a640c23a62f3a-c20f305ee93mr132768966b.30.1786523294569; Wed, 12 Aug 2026
 01:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com> <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
 <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk> <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
 <alpine.DEB.2.21.2608112254100.48788@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2608112254100.48788@angie.orcam.me.uk>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 12 Aug 2026 10:28:03 +0200
X-Gm-Features: AUfX_mxFGFTXsloghSaGbl7nrZA4hTgYyp3DHtv9-CHPmf-xGOOB1T8KYXQqRBU
Message-ID: <CA+=Fv5TKNW776xCe6XJ6LsvnsYF1r+QxUrsnG2Z2o5JRJP4NsQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Magnus Lindholm <lindholm@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 11:56=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.=
uk> wrote:
>
>  FAOD it's also the space in `"=3Dr" (gptr)'.
>
>   Maciej

Done!

Magnus
