Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C037732E755
	for <linux-alpha@vger.kernel.org>; Fri,  5 Dec 2025 11:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764935538; cv=none; b=t9NwdAPY8W+Zb6AbBxEcmJPuaW1wYKlod0EEo5cGIrpd0PJqBGDvbIcwVwNCWTOau/jY/6reVfsoxFnjxOz6xcha1369Z2YL0ycLRTLuBznmoDhGxzWxdBMsXH22RyDB4+0JZDAHc0/pK/qoIWBz5GjicptKFc4weWRifqrbEGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764935538; c=relaxed/simple;
	bh=vDaX7q2bhi9iOHTsXqZmYoYQt47M0BuZ+ooWJPY9D7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAfGkVg0oiOT00CXpmXNhUg/pWGe50Y37V1+CZSwkssa1aHAtQd2aZkCWESaXhzlCepYQfJb/yDBG99nBANAbDZbUboWQXETbbmnb2Z57maQ+a9WmFmLE49nEZRThLtBbnWqfrD6v6nX5HFydOI5EPQzXu2kkbREyPohY+d8aZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lK8g9/+D; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lK8g9/+D"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so443820166b.3
        for <linux-alpha@vger.kernel.org>; Fri, 05 Dec 2025 03:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764935530; x=1765540330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHQ1VGqtUGbepw6JpzvmO7MS5wbXfYjWpMY2RE5aDrA=;
        b=lK8g9/+Dgg7c2J6VV2jubA5flLmvOPK37w8ZsML1cUp5TL7XWMRbLH7LIhIVCkJxMj
         CO5T/5DDt4CMJgj7l9hymf2r0beT48hkWkdjeL4ZUBJDXwEmdXI89D5Y572IDFo1Kngo
         W2adjEnYsMEEmqZOpQJ/sc3bvd9u1AhkcFkHSDWgXN03mnBPEngtd80UIuddE6iLxCj7
         lNLBk7omB8cYUn6xggYnK+ZJus9J8YlsMM3V0qkKzuCbx2NLSaKdTNYoDpalqviNL7Gt
         CQP41jfvsCGYbz6Pu2voSMjPMJsfv2ZOk7W7X98JQSSHp/AltE+A0A/cUxVLdb3Gs9Ag
         KRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764935530; x=1765540330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EHQ1VGqtUGbepw6JpzvmO7MS5wbXfYjWpMY2RE5aDrA=;
        b=GtN8CgVH+04MBcuXTTl4yf9Y3HfYr9HrGO0G03CP43ZdyTvFMqAiksuw5ZWnS4eprH
         q7sNN6HM4uG+4XGopq06qpal123F8eOAUULiB+nFC25YpiegReimdN0zuA/gnNarpO5S
         4buqF8R7qoFYHlWGLLC39zWizGBNRf1T7W5X9fBrW8+jCwjzZ0yN5oCNRjIS6GJYAQUo
         5A7Ore54314CRcPqMgVYMtTZoojy9B+3Eh1f2ZmgVVqBv8yzdWzKq1qpHO8tGMKX5jp1
         1VJEaI/YophpeMeapL2u55yAeBKRbDxyv7+qqccf8zccFINg3YI5++6jp3r1QmgX3zW7
         WGBg==
X-Forwarded-Encrypted: i=1; AJvYcCU8drU7fWWN62Kwp2vvGrC7eEGwhuBQyWoGxCzX6zS9Ox0iUwx3O6cSDaQQVrQNUhE4fyOljgtiy379yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrZFRnVNUOyaTE6dkoZLK8efKT8aiQz37++EnBMZbC+XA6it8k
	O+3sh2Qh3b5FntTL1HX7grcR5qnJxtzYrVlAWh6/17O78+AVDBJmUbqr6ysszSt89eZKDHfdAcw
	QVLrba+fg/KS+wfFtizh2l6WqwW6Dhto=
X-Gm-Gg: ASbGnctwzOPVYulAzI/on0oXqBAKRgFSBPDz8JCvp90EHSM1bldPcrnOIehNfqdjLgd
	RtSTOvHYBS4LS6ywSXlIo2tIi6BP8ykFI2insx6zDcVCzQNn+TStk8B5BgviCBHndERFvya8AJl
	K1KQgASU1v67Q3PUiteXk1XMqt4QUO5hkl6GR6vOd6H9UlBUKUSWLldQ7Qd5xhAeASYTh95CQ7z
	pl1k8cJDDTu6tJtHgvEXMcyOewSXR/CC5DyxH9+wNNekdCvu+W582fVIcoUj0YJ7wVmoeO5
X-Google-Smtp-Source: AGHT+IEA3FETbDZ38PonR+gLMc2q1oLvIDjahLuVxCr72jwb85Z+rff3WE0fV8sQYL1w+jXFVpMppnqjyJ5BSpZxAdw=
X-Received: by 2002:a17:907:1c8e:b0:b6d:6c1a:31ae with SMTP id
 a640c23a62f3a-b79dc734577mr961106066b.49.1764935529855; Fri, 05 Dec 2025
 03:52:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6ebd3451908785cad53b50ca6bc46cfe9d6bc03c.1764922497.git.sam@gentoo.org>
In-Reply-To: <6ebd3451908785cad53b50ca6bc46cfe9d6bc03c.1764922497.git.sam@gentoo.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 5 Dec 2025 12:51:58 +0100
X-Gm-Features: AWmQ_bnz6eaQYSEuh-cRbP5Jmm-4WZGGcB9zU7098KGocQQd5AmlNV55q-qB7HA
Message-ID: <CA+=Fv5T=SgfYyiho6kY8afvrAB77nyUF3yttY14u6F0vwz62gw@mail.gmail.com>
Subject: Re: [PATCH v4] alpha: don't reference obsolete termio struct for TC* constants
To: Sam James <sam@gentoo.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 9:15=E2=80=AFAM Sam James <sam@gentoo.org> wrote:
>
> Similar in nature to ab107276607af90b13a5994997e19b7b9731e251. glibc-2.42
> drops the legacy termio struct, but the ioctls.h header still defines som=
e
> TC* constants in terms of termio (via sizeof). Hardcode the values instea=
d.
>
> This fixes building Python for example, which falls over like:
>   ./Modules/termios.c:1119:16: error: invalid application of 'sizeof' to =
incomplete type 'struct termio'
>
> Link: https://bugs.gentoo.org/961769
> Link: https://bugs.gentoo.org/962600
> Signed-off-by: Sam James <sam@gentoo.org>
> ---
> v4: Fix trailers and actually send the right constants again (rebased wro=
ng branch, sorry).
>
>  arch/alpha/include/uapi/asm/ioctls.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/alpha/include/uapi/asm/ioctls.h b/arch/alpha/include/ua=
pi/asm/ioctls.h
> index 971311605288f..a09d04b49cc65 100644
> --- a/arch/alpha/include/uapi/asm/ioctls.h
> +++ b/arch/alpha/include/uapi/asm/ioctls.h
> @@ -23,10 +23,10 @@
>  #define TCSETSW                _IOW('t', 21, struct termios)
>  #define TCSETSF                _IOW('t', 22, struct termios)
>
> -#define TCGETA         _IOR('t', 23, struct termio)
> -#define TCSETA         _IOW('t', 24, struct termio)
> -#define TCSETAW                _IOW('t', 25, struct termio)
> -#define TCSETAF                _IOW('t', 28, struct termio)
> +#define TCGETA          0x40127417
> +#define TCSETA          0x80127418
> +#define TCSETAW         0x80127419
> +#define TCSETAF         0x8012741c
>
>  #define TCSBRK         _IO('t', 29)
>  #define TCXONC         _IO('t', 30)
> --
> 2.52.0
>

Yes, this version has the correct constans, thanks!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
