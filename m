Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF33478C9C
	for <linux-alpha@vger.kernel.org>; Wed, 23 Oct 2024 19:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729711693; cv=none; b=sNddNoRFBEE2nVNuDddOyN7w/K+0R5QMNtWHzOu/N8eCBNETkSBeMaD8DzPEMt8vK+Oz+dCFlxxWLBjG24UEralzi/GiPnIJWrOYVtoaXyxeaGGgAa4JnbQU8NY8h+y4vig0LzampR46fYzzOSsZIofOUpR34VruhT7SlWafSiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729711693; c=relaxed/simple;
	bh=jVfaEMDiqxEbMojHP9PBFB3cC/z3et13Xb9WEIyCI8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3DtNq6roFZ4cUNWwz2bwBcUYqGQ2+bkbs/za5sH95fNyROaNN2OsBRBmpDcqNI8/eGl0PgXv28l3C/nKuJ0PARINKxkCGh7QjaM0pnPj68iTPVnSTXNRvuIXjqr1m2mDJtic4wt3HjpuG7eIBY09tOJdXakex5hlycA027Y4vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KdQjqIAo; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KdQjqIAo"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9aa8895facso11365866b.2
        for <linux-alpha@vger.kernel.org>; Wed, 23 Oct 2024 12:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729711690; x=1730316490; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=KdQjqIAoCzz6KtXAYTxLNJaAyuBn83gMWeIcQ2lP40A3fndqE0zCR9UEzHIZeMENbU
         A8YAXNtb5DCxShZad8QbEuz9lXoV0acYApCTQDMU48ySJyX96IO+I2Q9axxHKrCYfCGq
         5FJnYDW0v1pvwRQi7rxeSfSVXunuTw+HDBHXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711690; x=1730316490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=xAsLms9KTEvyq/xtQNonqNxEkBGA9OK0mmwY4iV1vALEp4DKr1JupMm3kRRmmm1ElU
         hVynIyxOKtWap3QF8j3ZKhbPqmarqC7nFngqV7MBezeq7RIureI50mjm2lXj+DecZzU9
         K8rUi/HivKdp8113Dul9g+lbWrTFE8YTuarzBtGjrrIjdRZoHvZwYcQN1HqGa6HsfICw
         L0j3nYMbjm3Kk2tf1nxaM7b0bh5g3UxlrwJRDpaWU9Li5UifzabfAvWmO+iE0pQdNgIi
         HwA34bfBvz6BKsQcT8b3Q7FyToay6OgD133ZoMf+dnqfMWfDpAocU8ouQ/+GY46jT/wT
         9NHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsBTVhaq57ssFEHfElJzWUx8G9LWnSYK/RwgskRWb4ZfgIV8mxwMn3NYM3IyMvb6BrwyoVNcdKf1ghpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXzEZuF+GI2sCYqo8letHyVfaww5uoXdk7Vk3fXGf1LspsLKpn
	Y4wSPcWcaED4NZRYWpGn1ohuNQKzKFJlg3uaXzGFBe1BOab3M7zeK9esFSkjiOS0bS78FexJEwe
	a4RrrKg==
X-Google-Smtp-Source: AGHT+IFK6tNxqc2p6C1RM3WyT1XWguKWCKEsEwdwoBMwdjo5kIx+pfOh4NS83ixXf7tLtzSM6csRAQ==
X-Received: by 2002:a17:907:7209:b0:a9a:8a4:e090 with SMTP id a640c23a62f3a-a9abf91ed44mr330511266b.50.1729711689542;
        Wed, 23 Oct 2024 12:28:09 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91370ff9sm515636766b.113.2024.10.23.12.28.09
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 12:28:09 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c9634c9160so157838a12.2
        for <linux-alpha@vger.kernel.org>; Wed, 23 Oct 2024 12:28:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcas0tXu9Llcd1UD1AMX+0d04nLbIgl3XSfA1WBKrokJ4tfVVe/dktX4Ves4BMwi7/A6RfpbokvIPrxw==@vger.kernel.org
X-Received: by 2002:a17:907:72d5:b0:a99:f4be:7a6a with SMTP id
 a640c23a62f3a-a9abf91ed4fmr407338266b.47.1729711194415; Wed, 23 Oct 2024
 12:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io> <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org> <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
 <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
In-Reply-To: <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 12:19:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Peter Cai <peter@typeblog.net>
Cc: Tor Vic <torvic9@mailbox.org>, Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io, 
	gregkh@linuxfoundation.org, wangyuli@uniontech.com, aospan@netup.ru, 
	conor.dooley@microchip.com, ddrokosov@sberdevices.ru, 
	dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com, 
	geert@linux-m68k.org, hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org, 
	mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru, 
	ntb@lists.linux.dev, patches@lists.linux.dev, richard.henderson@linaro.org, 
	s.shtylyov@omp.ru, serjk@netup.ru, shc_work@mail.ru, 
	tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, 
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 12:15, Peter Cai <peter@typeblog.net> wrote:
>
> Again -- are you under any sort of NDA not to even refer to a list of
> these countries?

No, but I'm not a lawyer, so I'm not going to go into the details that
I - and other maintainers - were told by lawyers.

I'm also not going to start discussing legal issues with random
internet people who I seriously suspect are paid actors and/or have
been riled up by them.

              Linus
