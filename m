Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793094;
	b=atVKEwdzQyDTXjUNiw3N7oaA48Q9jJcdfvUgDf4uzol3Sihv7Ws0K2G6/emW0VbwfI/a
	 lCR+nZ0+QKqyY4nrKebsq89q3dc2kVNYIo+oYovBOE+YAalX3zwpgvFHJFSzJtRZDIXz3
	 v+5i3hpZNkXMKV39jf9IL8Izp0Kt47Z4xnY2GuEwYx4SF6IPvwa1/d6EPn+avXjGmrIkD
	 gvoKYDucglqi7Qe9pAEEj8XU7BIVIHlBjpmkA5wzUYeyCDvJMMd/VWiLLWJloOynTOSe2
	 55LbuCcNAwIwj4+EmuZYQi8biyL55RvUOn2FJ6AzwCfN+XhNISjD5b9fK6gF5xQl0Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793094;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M9toJ53ydYCoiArg5B/a0UyMg/GqRdIfCxC9+xsL628=;
	b=R/1p8i/1aJ9KzzwPX8I+EOHc8u/qy3mq3bTXVJPLOP/XLaDJV/aLXmgoiq2YtqW74nxq
	 APIqhAA7UZUMgCVD03Q+wwbfFcQtXJpnFtmjd3RnDQ14XxNXwkctntqyUJ/kD2F4lS1XK
	 sHx3wMWVODkKP7kG7fWYduiE2NU30unMpRJRweehexs/HdZyGmSGVt/HLD+h2jbGd6keb
	 tPld1cy06hnK+FzKz5sDzmv+0Eusu79LWDz+u99/pyzAjkRIR8qUBlc2T6EsnXdt3DFzx
	 WdTVkFIFBj04atpA65aa1TFs4uxsyA9ILrHYjm6Kn3ykrUGZ15lDMLI6yC1+6IkpC6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RJn7WrYk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7660C606A32D
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RJn7WrYk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B881F00A02
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793793094;
	bh=M9toJ53ydYCoiArg5B/a0UyMg/GqRdIfCxC9+xsL628=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RJn7WrYkJSDmB655Qqo7xt1psrIl4bZ6uv3p2mJ+zBmb14Es6WJLZgc2WyQVAYfJ4
	 IuRe8t4NxfWymuzqMYjzLsbUaytGneBe0daFNKPO23MNuLIKsWt1XryhrurAIaiaHo
	 2+ZzgBIbPq/IGQWTeECMpmSvIM4/uMmYqTUckbHCDBJMwOigyf4u8W6kBys2n2W1qJ
	 7vQaOzgeRBIOZm20w9G8TrDxUtE46CKIjY6CpGh7YoGTUf3eTaasRhfvt8mWFlkBj7
	 4X9tJ7cDUZqDzvf0N9ci8+ybt7LulILzFOy0BG71fggqw4D3ZMxqd3ix4JpGzWD7WB
	 v6F/byT6P3e0g==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so5901501fa.2
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 03:51:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwUB2MPrZ8GKTR4xZ7ZqsXwUChrTpx26HEyQX6KbnCFJR2LoGz3s3WK5sHPuXgEZc7/gz4JF8o2RWIzCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8JyNKMUe4WGF6cPNeeUKhpi7n6C+T5CVL9TRbTuOlCGm/aQvP/
	K5TCfNDGCpWQ2EDBiJCyqjubpuX5c9rZnRTEWMdtZIBZqJkVx0M7dGIuGGQXdCPWPxhZ7l9QIME
	fh0OALPNFSdj9whoOGEzZPPiAIkY9caM=
X-Received: by 2002:a05:6512:3088:b0:5b8:bc5e:b572 with SMTP id
 2adb3069b0e04-5bfd9592c6bmr6089229e87.42.1793793092790; Wed, 04 Nov 2026
 03:51:32 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-alpha-compile-v1-1-9e93e2260a9f@kernel.org> <CA+=Fv5T0NE3LiTEHtwORHzz=0qv4xkRxY7iReU9KQ8MQmcRPmQ@mail.gmail.com>
In-Reply-To: <CA+=Fv5T0NE3LiTEHtwORHzz=0qv4xkRxY7iReU9KQ8MQmcRPmQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 12:51:20 +0100
X-Gmail-Original-Message-ID: <CAD++jLkkFxddXs9fSfaza4Z=jxX4eeeoUVJFhfTz3JKgk+U-5w@mail.gmail.com>
X-Gm-Features: AclHuK-UKV95mm-pjvOhPR0QGfehJoBB4EfXR5WPXjohO9cZ6tYRl7EhcSPrWmQ
Message-ID: <CAD++jLkkFxddXs9fSfaza4Z=jxX4eeeoUVJFhfTz3JKgk+U-5w@mail.gmail.com>
Subject: Re: [PATCH] alpha: Use symbol assignment in SYM_END
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Magnus,

On Tue, Nov 3, 2026 at 12:06=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:

> Thanks for fixing this. I reproduced the failure with the unchanged
> BCM6846 Runner wrapper using Alpha GNU as 2.43. With your patch it
> assembled without warnings.

Do you have *another* BCM6846 runner implementation, or did
you just check out my development branch(*)?

My implementation is a bit crazy and in-progress, basically trying
to evolve the way the kernel deals with random crazy fringe
small firmware blobs.

Yours,
Linus Walleij

(*) https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator=
.git/log/?h=3Db4/genexis-xg6846b-ethernet
