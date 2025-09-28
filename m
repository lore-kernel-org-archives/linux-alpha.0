Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC432222A9
	for <linux-alpha@vger.kernel.org>; Sun, 28 Sep 2025 17:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759080958; cv=none; b=ijP/n8q0ocI+LRVmIXKJoLZRqwFCo25njBsHYTf0p6lv7SWCW3SXxGWCkRbZT/LnYwhFM9WQXekr8Y7NV/AmyPkuA3O/SEBIs4BtNYVNJE+LGbVGhs6MFDODmV5oL1lRQYrDHjqFDTD5638hw9dqnNb1P4HATXQUChkAIyGu0Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759080958; c=relaxed/simple;
	bh=1hWHgpM/rb70qd87juqmeSrMZFHqG1itquQCJwHGhEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J57KjRgLf4uxd036pYodaDoxdwcPu9Whn63uu6jqqypFDzQM+kjgue0w1SGNtSs0sfc8SU17mvOqyDYANJhiinftRtlptCv0nIPdBPK73HQdpz4ZxF0QflWskncRMQ2Z8SDx32gHhsJp2eYzON2VWwSzpi9ysN2anUfzlDwaFIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEaY1OpE; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEaY1OpE"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-63486ff378cso7507334a12.0
        for <linux-alpha@vger.kernel.org>; Sun, 28 Sep 2025 10:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759080955; x=1759685755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hWHgpM/rb70qd87juqmeSrMZFHqG1itquQCJwHGhEk=;
        b=XEaY1OpE/dFh9j4YVGsxeLW4nk+JFwe0xPU09XYNqFVJVfkz9/YKmGA98d0gTte9Bb
         djtUHhO3mEm/g+z/tflYqgw0BtjK91KiLlZFg2KuMsI98UcnbrywSUlKEf5syJmuUYwu
         xevmNeWOz9dwjA3SsPPH9s+wWJ4ed75E4NMp84AmbDD+VpQ44dOC8sckBBP56GvafQyj
         V3Ne6Kq25yZjYpNjlPaKIjx3T56b7QxQ+cNsAVlk9s60XpIcce/auME6UmP9kxJaQHmk
         Cq2SR1jCG9crhZ020EAYQ/6KssWrbr5CY8GrgyoZdKIfdJIwET9JFHbp4Aufx0EOCncF
         8iOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759080955; x=1759685755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hWHgpM/rb70qd87juqmeSrMZFHqG1itquQCJwHGhEk=;
        b=mtb8h3cXYz/K7KqQ2g32sDZCD+3y2aC+yviNowIROfdhi7T1NMlFOkuaGhcNDVv6NS
         Ljh5DrvRq/C+b1fFtJlLvh1xu8jrvfaQMOeT5ivxgjQmFRbP0gU3FBdVCdWfnY/igxn6
         mvD1j5uBfN3SlDFqnteGj3LIQ7dSf9uONmAqwqzCG6dcG36NhYakc//WwzSOqvlsu6mC
         8BZz0OV39rfOv06EAenUjkOr3ftB/dgJ+qyY4i4Onj2fdC6MSxcpwBsjHl5GntshoNc/
         hgNVVjNfry+SFIGY17arLUR1guPQdIaJNfJ8C+leU4iBkYLMX1TlN0KyRxL4fvwUNQaQ
         FM3w==
X-Forwarded-Encrypted: i=1; AJvYcCXpmlIxA5qbCCZAcF3jfX5nwcbqNAmKT/uNiKRxuSogmENVL1c0Yaesadb0MiMLuPqYGg+DB05nJjFMGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4v1klrWZ1mq32cRCWwnpTSWH+bTpLZ4X6HzNEf21qlBCOAk3
	i4ZThM2QSErrUF/4Pv+fHWk7sSx1Xoz/znhodNJftYdm0aIIsl8waXPNhwbeuKy+Txrm+3DcOwX
	7iJ/9MjhXRtwdN0RE0Hbib94yB9SK/OM=
X-Gm-Gg: ASbGncu4rrgpF1XyY0FkriuECuotDGw2QnOJnOkUEFaDZcClvMpBII4+X7spNFdovp9
	hw8ziFMI6cFY2+m0N8gSCyTi31FKIXFs8+oP4l/if18te4ThdOpTZJyui5ZWmoEw4WhJfKx6/JA
	AwS8wsX4Ap1R7L24XxvbaaD0Zb7T7w4pK4jwHY+OHgWfw7Q2eTAp2oXga9fdhyn56m0Qumvczzu
	193dbbp1trLLrs30Cs=
X-Google-Smtp-Source: AGHT+IF4LtUw7v9U/JYoQT0Wh7nzvSFhJ3UqproTerTY3SiJCa0Vl/rRvk3JMudUZqWnlv9RN4X9SRqdzNlv4OAcKN8=
X-Received: by 2002:a05:6402:352:b0:62f:453c:7235 with SMTP id
 4fb4d7f45d1cf-634ce845b9amr4127811a12.15.1759080955040; Sun, 28 Sep 2025
 10:35:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759071169.git.leon@kernel.org> <512d4c498103fcfccd8c60ce1982cd961434d30b.1759071169.git.leon@kernel.org>
In-Reply-To: <512d4c498103fcfccd8c60ce1982cd961434d30b.1759071169.git.leon@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 28 Sep 2025 19:35:43 +0200
X-Gm-Features: AS18NWBtQV3w4fhUJT0qJjc42RZ2Y4lnsCSX8_2AFcicJQutzVlCWs2uQTVZ_oE
Message-ID: <CA+=Fv5SzdR4=NXz68gRg0iXY-6Y=GRsO24UA-DF4tuyJ8r7w7Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] alpha: Convert mapping routine to rely on physical address
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
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
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 28, 2025 at 5:02=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Alpha doesn't need struct *page and can perform mapping based on
> physical addresses. So convert it to implement new .map_phys callback.
>
> As part of this change, remove useless BUG_ON() as DMA mapping layer
> ensures that right direction is provided.

After the changes in v1 this runs fine on Alpha. I've tested this on an
ES40 Alphaserver during load (build kernel and unpack tar files).
The v1 patch fixes the errors seen in the first revision of this patch.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
