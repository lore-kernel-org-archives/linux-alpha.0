Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031F6213E7A
	for <linux-alpha@vger.kernel.org>; Sat, 22 Nov 2025 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763819521; cv=none; b=diiuJuKlF/1U+K6wyNppFs8zIW+XkoSIBd2wQOpTxzuCFRod1gqrygX+p8eFuzNC+VynDG3/G0TXKRcP5VyAAEdm+uUaBRd4JApwNdTkuZakvROa0LpEyGk7P0y0F3i+TDZV7IgteRKQWYT4UjDQO3bxW7kVhWeW4iR44WiKAIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763819521; c=relaxed/simple;
	bh=FU95ul7WLUdfEve/z2mx9jyjSzxRVFNgLyWQZQyCPEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abMXgpZEq1X1/J/wd3D1kBYAIRhk7A9R7WvrlOOGFtQMKUynCCO2GjmN6mHw7maOW3hAKZXyq3g5o8QdCY19A764KKGiP5rb0PR0h35kbsHhT7LKublVRg6UxKM5jgGyqIvuuKjz1TVxcJm1hk0DVH4Sklg7fTfUDON4p9oWoEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBgYlREB; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBgYlREB"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78802ac22abso30701847b3.3
        for <linux-alpha@vger.kernel.org>; Sat, 22 Nov 2025 05:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763819519; x=1764424319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FU95ul7WLUdfEve/z2mx9jyjSzxRVFNgLyWQZQyCPEk=;
        b=lBgYlREB4ztYceJUPaDPPVYfcDKuZ3qhhaVtoX2b/IwezDiIuTsQ+uIbPUmgfI8+wE
         cvQk3Z1q8w1s6PCYjJPcdVw0yg9nEplA6qLumhAFyRKfndWFf6kh+HDOsZ+Nx7iKEylc
         /zkOCSu0/Q+BO9oQmFYjm/WTnVFvpmTOej1cUL0Z4U7qd4cioVL4/nEeWWEac3G2SGrJ
         SHAlV4YkdBbkIh1aHDP4gcaa2p1n8V+T/3vXQ/SZZaiO119pSitBezjxBsPhhPJ/Umei
         YBdyLfc7fmHVsh/EjBurvM2ApW6+SDEOEvpMy/PEnR7sU1VZgh9IeUEX8sfKRfEZKFMF
         mTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763819519; x=1764424319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FU95ul7WLUdfEve/z2mx9jyjSzxRVFNgLyWQZQyCPEk=;
        b=Ebo8OZYGLtzV1eLljIQxb0HajaaKdoUYO2nRgLIzzqIwhSh/W7MV4c3tlzqbMyJ7/p
         BxfLv58bnJQlqIDR2+KqdI7hPFC9hZ5/bU7iCyXRE7RudLUL4vvu2d0PH4JANvlliC97
         ZUz4U59LBJSaqqhdYlclU1Jqm7URZ6NWeZnVFySeRoneEYOLrFfdXPaFDt5RcLn5bf5X
         6y9I9PkPQjKSDaJJk1sCDElDDid9t+00VcOuAh/712vISfOrVsM/ftZUQSasQ5y0BA0n
         y3hy0tYUtxps+dIlVyb4gIKMUDZM64ISLq6tE5o0hDlrfxz3aF2nHtMQpCiQbr/368AR
         IJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOR2yc4dQjLAuuYrLxiz10oAQKJKy0YP0WFSL/FWH1dzZc6pxmcWzmyNVxMTDGwInefMEAPOEfI8EY0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6wnoe2h5ZOvYnrbYKtZTsq0c84+BsSLWNLbMhSubcNqPYZa0Q
	Uly8k+G9/S43WreccTBz2yQPql1dMIheld2kthaD70JE1STDS9sIw+AHh/M2xWAOSSpoV8aCN1v
	XqcZA4JEEWLaep1isitaalAzSUgCKuzE=
X-Gm-Gg: ASbGncu7BSQCGx9JXUaZ/lg+jaacG2Qcg1oZM6xK17lhfY4tL9Sju5LbxHyGi8fZN3K
	Bm4lUq3WJZ0JLgTaOgrgPbn2WtMRRGPet68MQfm+uvUMZ4pdLj1Vdg7NdMlkE+OZrLV52geXiGN
	FyUQWmWjBWiR6+mKfaHMnpq6jmH0aLxyo8F8R1pGORcU56w9jLycmMZu+X4wAX+HJmUcXun8AJ3
	xe7SD2mUGEm4XdfItDuEcxhlOrEK/7dvm3CU9hrA6NPk4HbsErHUyv8vdrLjFgtIISzOGLl
X-Google-Smtp-Source: AGHT+IFIkS/IF5O0/U6/cEos9k49ldqGXjodqGBC4GOKGmXA2fGkcb5b47fg048KVLB1+DwoI8UUQMs4PWgdRjnkUnU=
X-Received: by 2002:a05:690c:9b07:b0:788:1cde:cae2 with SMTP id
 00721157ae682-78a8b570246mr48883927b3.67.1763819519056; Sat, 22 Nov 2025
 05:51:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122122846.28493-1-linmag7@gmail.com> <c468dc2e6f5c4ea132f2bf25e6d6976e0c317005.camel@physik.fu-berlin.de>
In-Reply-To: <c468dc2e6f5c4ea132f2bf25e6d6976e0c317005.camel@physik.fu-berlin.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 22 Nov 2025 14:51:46 +0100
X-Gm-Features: AWmQ_bnp70ndIYjCi8iTCTH61fUlRzCCEu1aB6EMzDmt0SNEgLG9EC4VmPsuiKU
Message-ID: <CA+=Fv5R4_kAd4kxq-fR-2grY408FTC0hBkFURAZhgxAtbVrxPg@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-elektor: Allow building on SMP kernels
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, andi.shyti@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 2:29=E2=80=AFPM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Magnus,
>
> On Sat, 2025-11-22 at 13:26 +0100, Magnus Lindholm wrote:
> > It the past the i2c-elektor driver has been broken on SMP, as it seems
>
> Typo: s/It/In/ and I think there should be a full stop after "SMP".
>
> > there has since been some fixes/cleanup work to get rid of cli/sti and
>
> s/has/have/
>
> > rely on spinlocks instead (as pointed out by Wolfram Sang). Tested this
>
> The sentence just ends after "instead". I think you meant to say "instead=
,
> let's allow building the driver on SMP kernels again." or something like
> that.
>

Thanks for quick response and feedback, I'll send out a v2 right away

/Magnus
