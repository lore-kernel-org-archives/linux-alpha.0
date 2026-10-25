Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792965669;
	b=LrYeb3xI1M/0ot8NNSyIxko6JTauH6FjgSZ5Z/VgWCeK8eeslxSrDlEedY4JKKSYA/i0
	 bQ9GI2ukLiwVR1MeX7mvRYTa8DP6yjpHrKAWGbTruOyJeTtVVOSxhKFfsLINdCsbxTnMA
	 lLth5VWzWPnxaASctJGAaXCdWrySVtQySx5mA8piJpjfAtWEktiuBN37lHQ8zFfP5bdj7
	 6wUKIk+r6lEOzDEaMYyP9XxocJ/OD8pa1hiQQfjcRqxyBC0EmEOEOXnEEz7gCUSU3J8GO
	 cDlYEFYqytW2d8ajp5N9kfJUoH7M822oZ5WiQCJ8C/+g7BzsLFGqovtcbtJL08XJvww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=wRK3/TcDhc3BJzNWaCCGklLDUjOLOOs9pg7RV2uXgno=;
	b=lA4z0ss3wm9QX8irHLywEsq65WAnlR7NKQsSccwMWbGKBLmY2Vs8tgLonQidgzltVDTT
	 jEYkcfHOutjlA94gLKH6yEcKipcVobuVwxhfsh4MpVnrejVnxPa+lIk2teyJprC0R9qm7
	 7H3xGRctWakhbhXFqBTxInSKHOdhGdEAF1H4xiazL8F4+TheaUoeqWh/RIkUao2g1BqCF
	 4w4ZIjOV6sm6QvT5/ePEYnnbSDs8cBAXJYgaXc5PrD4rWcDEeywVloxa9ROVdYSgZBzwS
	 jhZwkLB3dhs9a4vIEHewlh2F1vUSiwHuhiKnRE38oszxbOtl3uEIi6zGcuX//sGna+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lMPi2YsB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F4606A31D
	for <linux-alpha@vger.kernel.org>; Sun, 25 Oct 2026 22:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 283F4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lMPi2YsB
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b2232d8ef5so4099811a12.3
        for <linux-alpha@vger.kernel.org>; Sun, 25 Oct 2026 15:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792965667; cv=none;
        d=google.com; s=arc-20260327;
        b=lv8I2zBZjCLaXmPSpMGf5H+PzsslZGNHiiuO2XIXmpfDLkMLzE9PRRhvNO/DgS+sw1
         x1JDYgoTMcyBuCmcEisyGBKb/ZXaSHlYEHe5TKF2lM17yyJ8wDDRA4UD588xixCQrwdk
         OJSB89UtA4lsA2bJiyb7+IFnsLrTLihuaAzwkNHhHaICrykvG49gEjhi0wqrItywndlq
         1so866IX7awpL8RmMMi2lhXQ00l+vcbYpkXZv0+aIaa3em6qqnSWkycSzp9f5ntVcu9W
         whFBXOo54V9ImlyMqWRHk/pgyKpeBlJUXZtJV6L01cavH2AZv8d4PMJdLWTDD66Bf5Mm
         yq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wRK3/TcDhc3BJzNWaCCGklLDUjOLOOs9pg7RV2uXgno=;
        fh=lTFuyM0mJi/aHEGbrFdeeuBLllSbYJqE3Kknixnd20A=;
        b=Gf1qtfR8oeYE/Ca1V0DikUxM3HrFLDqOSAKPLY3UW8dhlhy6lGS813PIA6PSs/I744
         NxW0jYUFKyyWrYLd0LFLEB//zJihHfM7V/BLQNvv9uNDecg5fU0Bq1rNCNHzuIwSQdvG
         Te1eJemkHC++zy0XkUQT9WiRLpa18fRt1elosm6KWHhBzUNi51ZcyO2VVbXFBh/7FCBR
         6i6OxStaWZVx4RgiF9f8DBJEszZqo2ZU5eKxkmt8WuH1GJfNhkyNyhrguD6Hs3fyi9SL
         KR2IRxCUmOhKLgugz+P5i/3jyHN7JGMshwB9SOJnhcMYJ35Qgnw07lKuT7WbxP/FoCy6
         IGXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792965667; x=1793570467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wRK3/TcDhc3BJzNWaCCGklLDUjOLOOs9pg7RV2uXgno=;
        b=lMPi2YsBekeJjcr1zrPCiw0/Zb6iYojtKTMwEmvmluO4fM0ZTefjxk2Evk0XuU1tVJ
         HClL0q3QfTSXBqMprz+6OTSiXevQVqvi158AY9fh5JgkfLw64NSpZkJfb81CYLkygRgI
         xdNyHZDNnyu38yTmJB8PIHZN9q3s9D7mgvWvBErm+hxcr9PF4bgSBE70Kr/qIvwNtPCj
         jZot6Pm2DsYdakOHLrnJJpDjdOJO9NQagXF5JZTJDIfUDb7ZawJrLszLmVpGX0Iz4cuz
         WWPO/UX5GaYAUDzr26pQQgNBH79F2M+7txWs2UwDg+6OdQgjWuJqPKTuBv/UBVtWKzCv
         S+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792965667; x=1793570467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRK3/TcDhc3BJzNWaCCGklLDUjOLOOs9pg7RV2uXgno=;
        b=vNP92D0crSk8aoBWfIlTecvseCGOk0p6JFKOu46H37vLsVE3nQL5ItnwLAXVJf4PH4
         ZGNCd0K/yVkU3W94JPAf5X6f41OB4vrkR+3qzMFehCKvEVRaF774EQlv+F+oyPfy10ID
         1B0OXsupiN8Ei7pXXxe9PESC5N4IDAkP7s94cbMloPCBj4cyS7pnaYEUnk0bvedlD2Fr
         qYljeJi+P7C10UebKc+gLgvDaTAZ8jmS504aG2t0Dc+MSAd9+PCQRFk7hUzgu4qOhFVZ
         Qe9JxjSrekuPSyFalKN9La9ZxXqYAaVaLohb2ttHFYZk5Rr9hiVxh5GlEQACOt4jaOwZ
         egmQ==
X-Gm-Message-State: AFq9FYJP2Sb/7lSJoif9kK1yTSjSmkgkY/351aEpcAM563EoFpK/UW5W
	TPo83TDPZ9tMsp203ykBYgOHrH3Mkd23qf3H2edWW1jUTMXTfj64MoK0WTyJWPdxpCFg07JQf8u
	QVQTRXZSbX1p9uH3DQPqxLd43umsR/MVXsgHP
X-Gm-Gg: AYBFou2NTQw0mGwklJ12MCefg5JCK5RXYqVDXuMZ2SvnVaXeYgWcp212uhirg4js5Fm
	3+z8sA2sSJLfNiPyjsVT/qYdE3FyAqUglSQRtpQLDirazgLETZBQONAFt0iERcebzEmnl46mIRa
	x0gHUsDo0Oh39BnMJjPyAqnJ1sgaUUUc9DAkPMNq7JWg14FeOCficUO26e1fsXj8EKQUvoexJf1
	uswtZH6Yt73wZNAs8Ub/ban68G8E7LpX2VB40Jigu4QIQDf2xVssIUU6ig1BwJ60NddBwE+gcil
	UY26KAYfC0oVzc9c/qrsKTXSOnAtHYci6/kCzZ57AStjI1B2ePdJDn4K5DgBq/838c3Wk4w1aUT
	Fci4lvxmslvoZgcvj7GnxaAVrmoUu4ZjN5DtKbM3uJJKKi9MHVfGvNwMJfLNbnEY1jZfT4EnLLo
	5TSk/d+yp+bsi4rDSvon1Y56g=
X-Received: by 2002:a05:6402:210f:b0:6b4:5a6a:610d with SMTP id
 4fb4d7f45d1cf-6b45a6a6257mr3702301a12.13.1792965667121; Sun, 25 Oct 2026
 15:01:07 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025171857.8ed673bb5900@gmail.com>
In-Reply-To: <20261025171857.8ed673bb5900@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 25 Oct 2026 23:00:55 +0100
X-Gm-Features: AclHuK8jbRLPYVv67d0Bwa28LjuclKCYBYxZv4rudVKs9DBpwxOrvB5VFJ53O3g
Message-ID: <CA+=Fv5T8LzPKs43VPfsE5eHHsZoxubPFdrOWNFG5ne6EEWh62w@mail.gmail.com>
Subject: Re: alphalinux.org has a wiki again
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 25, 2026 at 10:19=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
>
> Hi all,
>
> alphalinux.org has a wiki again: https://alphalinux.org/
>
> The old MediaWiki install was lost in 2012 when the server died
> without a backup. The new one runs on DokuWiki, and its content is
> kept in git at https://github.com/alphalinux/alphalinux.org-wiki-content
>

Thanks so much for taking the time to do this! I can only imagine all the
work that has gone into alphalinux.org.

Magnus
