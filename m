Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F36138E
	for <linux-alpha@vger.kernel.org>; Wed,  3 Jul 2024 00:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719967873; cv=none; b=SXsNdl5ry72EKpX1ro8YgXK+JrDG3E+gppypFGIyx2MH7ZBJXoRQxos7fCrAA6MJmv9YWurWe+Mg+WcTQ6Fzz4IuETTgsnXW+JIjhFIsK4zedSqpQsLsvifX52BcnSX2+zCNtCJTe2EyHGHSjt/eWSLbyiLTLepXeqkSO6Zo7Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719967873; c=relaxed/simple;
	bh=Pay9Jch50YYBUEq5gYVHpCB8quq1U7sQk0+t7t8j9kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S10tPyO7k1lAhKs/zTbseIX70nCVu/TH+l36qT0E4iQT+//QCWaDsVMOD4F0A4ps2U0iXn1zlyZIU6FQDQNfgNDIqo3STeigSDjg8T77rovXY2PKWlt1ZM2XV+MIbSIot9T7sfvMOVWCSc/gk5wRhPrtv16CqvIYllwcDog1chA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WE9dapOq; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WE9dapOq"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cdf2c7454so10429290e87.1
        for <linux-alpha@vger.kernel.org>; Tue, 02 Jul 2024 17:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719967869; x=1720572669; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J71lS0vEj7xidELl6507Qotv5/zDiOIZkTdz6g4J3Pk=;
        b=WE9dapOqxOqtWrY4fSBCvmZVKLSTB8FkjyNzvSmi8IJTjFkE2QlzRTp0EbHDdM0QmU
         TXDhJJIj3c/Ydz3zKkGB/GXLTHnigpZIKYRWaRzRciryA8dg5GWhNTG/6tZIgrhGeoCA
         QLr+znW51czxL19Ki+w5jWHIzzLqZJUsPVdp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719967869; x=1720572669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J71lS0vEj7xidELl6507Qotv5/zDiOIZkTdz6g4J3Pk=;
        b=doY0zwYUlJpfH+ID98vEyKX2dp4AVck0vjQXsyAalrzIGgG/QkFTDhjKrNMj53Psfd
         qFnAIPK2H5pvLA0QXffDkWcmjS4ZI8ckxnI10P5NLbTzg9rOmfF6Fisz1K5fr7unJmp7
         VI3NB9z5QDRRPaNmikdba5LjH2dSwJWMHRhrlZHTwC0BrH3UpjTXIsGAeDZbg01DgmGf
         N9arIkhVHX/5jPyvtb5dVxuyOrcH0GvoHXWtkwfNfN2vc2sIQJWSU3Xgx4WiQEG2ypch
         3BaV9rIcOtiZNjile4670i2qL1EjPKQT/D1RN4RA9bAkJVMbLDL16U17MROWYUdKFYh9
         LgGw==
X-Forwarded-Encrypted: i=1; AJvYcCUwZ7XjUQePrxDg1w287tsEvT6wGi2tKcrdp74c0E8ElNfA3/yH/TQVN855M+WG0CJ1sNCGggFD0ZnPqnThpuHnbYBjUWtaEYZdz9E=
X-Gm-Message-State: AOJu0YwYMxpKY3ldSMjmATpo0azc6GLEVoLbOcOlkuOtNh+ITncesXYC
	HUaXhtZY8fkkyyC4Lg66QySnHeDh29v6HQMNa7o0hcu+fb9XUAKcC7EJlbLDaqtTaF21gud2NR8
	1HrwIzA==
X-Google-Smtp-Source: AGHT+IHxwnK6BFPNK1RPRxbv0moKzgCYujYLsG33rRwwGOLREUarsVMdhmHZK9T0Y+Cget9PZCfOoQ==
X-Received: by 2002:a05:6512:3d1e:b0:52c:9ae0:beed with SMTP id 2adb3069b0e04-52e82705d17mr9596061e87.52.1719967869509;
        Tue, 02 Jul 2024 17:51:09 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab2e9f0sm1960831e87.220.2024.07.02.17.51.08
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 17:51:09 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52e9380add2so1431821e87.3
        for <linux-alpha@vger.kernel.org>; Tue, 02 Jul 2024 17:51:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBpHCSljWmrVdPU1HYtPiwzGzMxMFzfa+gVZri53DDo9kFp2GPNPA7zJP2iI9uauuU72JN8706VWg88lT3FE5jPo+kGbiDGcOAehM=
X-Received: by 2002:a05:6512:114b:b0:52c:8075:4f3 with SMTP id
 2adb3069b0e04-52e82687e84mr9050700e87.36.1719967868527; Tue, 02 Jul 2024
 17:51:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503081125.67990-1-arnd@kernel.org> <272a909522f2790a30b9a8be73ab7145bf06d486.camel@physik.fu-berlin.de>
 <alpine.DEB.2.21.2405280041550.23854@angie.orcam.me.uk> <aa397ad5-a08a-48a1-a9c0-75cfd5f6a3a5@paulmck-laptop>
 <alpine.DEB.2.21.2405291432450.23854@angie.orcam.me.uk> <4bb50dc0-244a-4781-85ad-9ebc5e59c99a@app.fastmail.com>
 <CAHk-=wimJ2hQhKSq7+4O1EHtkg7eFBwY+fygxD+6sjWqgyDMTQ@mail.gmail.com>
 <alpine.DEB.2.21.2406302009480.43454@angie.orcam.me.uk> <CAHk-=wihNu+_bGwD8F107ds7Lv1Z6ODTwvYYvXeW3im1=4R65w@mail.gmail.com>
 <alpine.DEB.2.21.2407020219040.38148@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2407020219040.38148@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Jul 2024 17:50:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgncrjmWSETfPt+j6DY-MLH0=Lrd8kJHR6Tz1iJ6i39VA@mail.gmail.com>
Message-ID: <CAHk-=wgncrjmWSETfPt+j6DY-MLH0=Lrd8kJHR6Tz1iJ6i39VA@mail.gmail.com>
Subject: Re: [PATCH 00/14] alpha: cleanups for 6.10
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Arnd Bergmann <arnd@kernel.org>, 
	linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	Michael Cree <mcree@orcon.net.nz>, Frank Scheiner <frank.scheiner@web.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jul 2024 at 17:12, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Mon, 1 Jul 2024, Linus Torvalds wrote:
> >
> > But honestly, that's basically saying "in a different universe, alpha
> > is not a mis-design".
>
>  Precisely my point!  We got so used to think in multiples of 8 bits that
> other approaches seem ridiculous.

But Maciej - alpha *was* designed for bytes. It wasn't a Cray 1. It
wasn't a PDP-10. It was designed by the time people knew that bytes
were the dominant thing, and that bytes were important and the main
use case.

But it was designed BADLY. The architecture sucked.

Give it up. If alpha had been designed in the 60s or 70s when the
whole issue of bytes were was debatable, it would have been
incredible.

But no. It was designed for byte accesses, and it FAILED AT THEM.

              Linus
