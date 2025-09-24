Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E602827B34E
	for <linux-alpha@vger.kernel.org>; Wed, 24 Sep 2025 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758699143; cv=none; b=BchGMPN3lPxTufgCc1k7gl+dH0m580VUMP2zjm0qoDDfcif9RiqzkF5U/zTM5wTgmhc4kjLjcKDS8ctzTldbkOoKwb6aqSCrzew4vyY1Mrf6JuZBMM5WKJPNWL8aV/SO+71VvxBPRgYROFla4RvQ6lcvzo7tk1OUv0KHlj0frPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758699143; c=relaxed/simple;
	bh=TX6kI82yO/RlICOevJbAdNu2g5LXBtW4mVT11ZayfNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=klUJrwBtn63p7q6kmvCF0truqJCe/vdNLZJXf3dEhK1BM+A5s+I4pqkYBRMOEuxj4hqH2ibp2b+SJcqmq4HyEDxIfeJmCJqgWjNElvF0k4cUxTYJlzmmm4flryLq9eZjYb1HhD81vubnT7h/O463ekiA3CKUWQw3tIwsIEhBVts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Apr75Ugi; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Apr75Ugi"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso9381611a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 24 Sep 2025 00:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758699138; x=1759303938; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v9ogATJZj1jG8raAY2zUuQe4EmJHk/4W4xvGLcmqNCI=;
        b=Apr75Ugi6SUfNBAH+kYzUGDTjoRx4+4tdqorCAQPRdi6ZhXxBv0peiMsD+V4puAl/L
         VnxwZSNbl9FiKKvSAqE1eYwjqdZWh7FJCNF0dlJCMq2k1bWZYIlAjQgIervtcnAm3t8B
         GN105YKAWQyS6/Cr/MiE0AtzMIVY2JD6Cl6oo5pZJOVanYffCW03eXtoB23UbA49jJ7r
         M37tNlpRwrjn7OtFzfza/vp/LuwUFXCQHnS9le2rzn9s9XBPgWtVSKHOOn2Jak7mhDnY
         wGqCR0eC89eG87mkj1IyXNs4+n6M1Xm2c52C76N990iZ2sIOpbDuxtQDSZpysCj2x7fQ
         cVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758699138; x=1759303938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9ogATJZj1jG8raAY2zUuQe4EmJHk/4W4xvGLcmqNCI=;
        b=NgRs6uMNg6+WZhg58c03T57WpHQGTEzW5N7DfLCH9sB+xMeGQCUkyj3nCGuaEdeYNU
         Pokz0ckTfrucKjraZnfqmW+9qNu7GqyJKjOh00BlRKtp9ChdmInVJLrhvaktsmWD13IF
         mQAV+k+vV4FEjVLUJ1EIQf5HP5y0HwWwaNgNufgmb9Vtg7NCZp4aJZqksl4TMcbXh+h1
         VhH2QL7UeSdNKGm7ba9Khxi39hT8cgO8m7oSdNWwEwY26/Vh1GfKRIg45swjTzzVbcaB
         PTxZbBWeKyz71+8i/LOGUzb+V+FZ4aDwup7hiFJ8xEr6ccmpUmtZHYGIOoOh2LQZk7bj
         bIcg==
X-Forwarded-Encrypted: i=1; AJvYcCUibZMswgpmt9/IpN1PS0wsEHZGSs1nCYzCVJSGOUCAxYshQaQeniku2IAuAZ5mMawYuyU3II0AYbUaew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3xPM3OY9FpLREoRIDlqhvUMMrEVdG9S1N5kKenefMs1n/VW3x
	d0hg18Zbe+v5tgJ8lXQhbPR5K9UE2YJjiBIMUtrM5JrHB8mzLAHt8sn2BFJNdN4UEHd9poscsrI
	KFZc1m4FP1Nji597IQQa+u1zSFjafj7Q=
X-Gm-Gg: ASbGnculEtpkNBp0L0b5fwDUZa4WY5M7W2cS3bJW+334SOMjg2ncPThJWbTrmrEWKlQ
	FtZkgTkw3R3jcF/P9lahAo6ZYTAwufba8eS/xWj3BPi2ziJi6622188TThgLaI4l4ZTqjaaF5d4
	6rn6LIRRHE6l5/cu+3gHidOESwhkT/Rxz9Jm6R4W9pa/CqRYiaRKb5G/V2tX/mNLC2PVhs5nOyw
	bFviWWU
X-Google-Smtp-Source: AGHT+IEsD22J4a5V9bbdMWtQv1Ep8AmuRuA2KpP+ndq9VMyD7XFtjS94kSm5rlJirOSxMvazqqoNAsq4GX/ON5RyqyA=
X-Received: by 2002:a05:6402:44dc:b0:633:4726:a077 with SMTP id
 4fb4d7f45d1cf-63467796df4mr4258422a12.15.1758699137992; Wed, 24 Sep 2025
 00:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal> <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com>
In-Reply-To: <20250923235318.GD2617119@nvidia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 24 Sep 2025 09:32:06 +0200
X-Gm-Features: AS18NWBrVH-9-wBlZ7ZFV3RxYYp-7iSL9DfIPq4jDzU8rxFLx7xmKKzveUA49as
Message-ID: <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, 
	iommu@lists.linux.dev, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Wang <jasowang@redhat.com>, 
	Juergen Gross <jgross@suse.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	virtualization@lists.linux.dev, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

> Suggest testing the same branch with the alpha patch reverted just to
> rule out any issue in the core code. If it reproduces suggest to
> bisect Leon's branch.
>
I can try to revert just the patch containing the alpha-specific stuff and
see what happens and then, as  you say, maybe do a bisect from there.
First I'll just try the same kernel again a few times more just to make sure
that this is really reproducible.

/Magnus
