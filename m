Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FAA3B42F1
	for <linux-alpha@vger.kernel.org>; Wed,  8 Jul 2026 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508202; cv=pass; b=kmwOofAGoYSw4/lXQE1xivqTH3VkDR/vDHGK/PAoF9iSGXdDs6lBiS1UsKkWBySCNn2wxmMsZ5WUI1vC7Jtro4z1nQZH1Q6pzRZWpYS2Mee6HraqY8IoMdGA6mNgbkZyDmXSzwnjZ8g3b+gSlLBJi6Jqk6KvwKbnfuLX0ZbIL8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508202; c=relaxed/simple;
	bh=WfD4dCVWiG8ERAjlT2lUVZEkQgo52iiyfAGVYhwTEPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRt4Blahjtw8uaBkuR72qLCNiFXQpLTNpH0npDf3c4Lly9VE2cI2F5afDNRV5Ez0/HZUithIBEE7pflDcH7tRjKHr3F4+FpbllQwkFs+kpo+GQF0nhRd15+kNasV9HMDcmVNSZBeC7SGscPdM1JL1ReCIm5CCtVb4VuQZt8mSwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irGoNKdo; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irGoNKdo"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba320so1199810a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 08 Jul 2026 03:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783508191; cv=none;
        d=google.com; s=arc-20260327;
        b=ieOdrwqkqMW2g+V72rbrkSo63vIoBQuqXNdHN5Vxi+RS+btDpdRbwm0TzBw4NrvvU+
         1KfKN+4dd1LccuhgYN4qWwq+ZzPO8gCOQ3KP1Lx4s2s2SEdYbpgH7DNBw3c5OXXKjl8i
         85ZcO4GmdnCB+63bSnRPFV4jnH8xi3IlD5F5nPs5aNUyTPtuGxlgRv1F59uiYsMEBVXH
         nq8oEE9ZNwxBXiSi0g1aB9BgvcL4+Xlg5I+BWHyTGQ3tjdUPRzidfrxvzNahla1Ar99D
         0L5jruZEfmGe+/+T53D68R50xxWQuNak+5TOkGC3pD6i4OYLodmymOsAHMuOCXX3JdND
         MOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c2fiM2VYmvB72xpzWLhl8f8r7LxlArjuugnUoazlpVE=;
        fh=Q1wt9VHp7yc8XCNnZkTFSKa7gojLVGzFaYEW3srwoOI=;
        b=IrWIL5FSyyeohmuVoQKvGAgjTHrCtQiPqq6sqNujHEm3xOSpH+9IRbRtBooyhi+pwr
         9ZUxAk7wKFgL9iyzv5a4e5ZE3oV4M+NmOiYg4XSlkc1jqUR4VRk6pXVfNtwcUPfxON4a
         myP9C2UtR34PJOPs1K1VynhNE3v6pyAaZQG3HKX82lWdFgoQm7TXLe/19ofeIR1VZjYG
         5Y8LDiF8U4oi9qICIAHQDZPQpKlMCo4wsXJGa0SPRXsM4cW4AiVc/oS6AIAYLC2O3/u5
         +WIrjsLbg25E9dr9R3hcui41UokSQSWn1vTk3chTcq+3r4GEe5yVlakeoIKaYFlJaegO
         y6RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783508191; x=1784112991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2fiM2VYmvB72xpzWLhl8f8r7LxlArjuugnUoazlpVE=;
        b=irGoNKdolUUgTf0DnlsaMqcv8EFqrqNt9G+UMU3794JepIYHPimEvdH1xV3PIdcEtC
         gQCwvRBq9PJwzARs9DoxCRJVJG3iDuQVnx+EoGl9vRNS7fcM9OX0vVKFNikxcx+5XrvE
         a5Nt09e8LJOOk/nliwuP7Es6nZ5ZRrpjVDB9R7SUfoXABmq1NRwvaVZbtctVrHLUizU/
         qdsxxkixSVjcoaszy/86kN/sFfXdm/49c/udVyh2bNaDB8je1wRETjszs3hOW8ODMv7+
         DWrync3UG+N8UGuuBD6Zor82yrI9AnhxOhaKYubosdTZCTi/2LRwX71T5YeYmpPkHsjt
         7cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783508191; x=1784112991;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2fiM2VYmvB72xpzWLhl8f8r7LxlArjuugnUoazlpVE=;
        b=oP6RvvLryeYlDhzeVmsoVNiSyqjeT1VWa4KmQoX4LhMfOYnBBD3X0gcw5pKnu9Bz30
         Y5Gb9pouCXoc3apXVFuxofF9BPMvwQgBDPsMM4rpU9NZyA/bYC70xYNTVIFuKvJuoX4G
         t0SERiJxN/R8KazMZ2KOekVhYpHmLYwIBP2ezrXXUwOQMM79UAysJSErSeu2AyofNVCD
         VvE2uyLrcN69UgjYVbLr85SKMYLn9B16V5VZqIzfV/xjBxfUnQirQEVBpuouR097xg+t
         63Q2QAXOPXn5H7ImWLFYxvxvJ7KOvUdamfNFAfzodiM1B/DCiJGicbuthuzPIbGJ3yzd
         TnEw==
X-Forwarded-Encrypted: i=1; AHgh+RqLaYBk0CPpZbo4VLbAyIVKw1LLfEC2NpekFORNbRAbgjNAFM6MKW7EVi5xhjhr/N200D1L6/QGd6wSDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyklu0oShbmJ3cTHmVNtD/uxgNqyhk8lRtxZgojQa31z/bdbnzQ
	SWnCkMXTKQE1ggXoFnmTaih4YyZOOKjC7t+g2jCo6EO34jEjxex1Yz44GbehUv6ijhHGz4aPhV/
	alHXPxH9ky48N1+ImSJZJ+qdtHXqJssk=
X-Gm-Gg: AfdE7cmLWc9dK85cTZozCNL6hX6SRbDP0bqdQpLJIAxPhE8mJtrIvgElyCa/m8ejpdg
	1eHp7DeFlmnkFgKA+48NFvkMaU18nvlllY3n9FXzSOSenjvnfkEJRIVzqf2ndk5oEcFIP9j+71U
	cEPUBKYdncVrZc3vR0HG12dujUH5YUWb9GB9CoCW5MTrVd9OwytWGUQavsA4rBWBAaXU8xqZ/At
	7+BFkWsvWVCQRWsr9hE9A64a/eeDbSqg+sgQRB5h+SeFZO0TuqZ7Gso0x8+YbN6vm3y/GqZmplN
	sRL2N5Vg/VfE/cwx6AnIaSzhv8UqyBQ=
X-Received: by 2002:a05:6402:3058:20b0:695:ded2:52d7 with SMTP id
 4fb4d7f45d1cf-69a910978edmr2584484a12.3.1783508190638; Wed, 08 Jul 2026
 03:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706175423.98305-1-kwilczynski@kernel.org>
In-Reply-To: <20260706175423.98305-1-kwilczynski@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 8 Jul 2026 12:56:19 +0200
X-Gm-Features: AVVi8CeoFjDXhiwTTyAokp7GmJLW8914hLJ0O-UdzoTFxDt0DrR1yRktWckx52o
Message-ID: <CA+=Fv5T8GUH-d0PG6fjn6ARRcenpcDmsg8uy3dJbQ2gKZ85KhQ@mail.gmail.com>
Subject: Re: [PATCH v2] alpha/PCI: Fix I/O port accessor argument order in pci_legacy_write()
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jesse Barnes <jbarnes@virtuousgeek.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 7:54=E2=80=AFPM Krzysztof Wilczy=C5=84ski
<kwilczynski@kernel.org> wrote:
>
> pci_legacy_write() in arch/alpha/kernel/pci-sysfs.c passes its arguments
> to outb(), outw() and outl() in the wrong order:
>
>   outb(port, val);
>
> The Alpha I/O accessors in arch/alpha/include/asm/io.h take the value
> first and the port second:
>
>   extern void outb(u8 b, unsigned long port);
>
> So the port number is written as data to the I/O address taken from the
> user-supplied value, and the intended write to the requested port never
> happens.
>
> The arguments have been reversed since the file was added, and the
> function returns the access size regardless, so the caller sees success
> while the requested port is left untouched.
>
> Fixes: 10a0ef39fbd1 ("PCI/alpha: pci sysfs resources")
> Tested-by: Magnus Lindholm <linmag7@gmail.com>
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> ---
> Changes in v2:
>  https://lore.kernel.org/linux-pci/20260612232400.585195-1-kwilczynski@ke=
rnel.org/
>
>  - Collected Reviewed-by and Tested-by tags from Magnus Lindholm.
>
>  arch/alpha/kernel/pci-sysfs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.=
c
> index 94dbc470cd6c..7050f0f7fe3d 100644
> --- a/arch/alpha/kernel/pci-sysfs.c
> +++ b/arch/alpha/kernel/pci-sysfs.c
> @@ -224,17 +224,17 @@ int pci_legacy_write(struct pci_bus *bus, loff_t po=
rt, u32 val, size_t size)
>
>         switch(size) {
>         case 1:
> -               outb(port, val);
> +               outb(val, port);
>                 return 1;
>         case 2:
>                 if (port & 1)
>                         return -EINVAL;
> -               outw(port, val);
> +               outw(val, port);
>                 return 2;
>         case 4:
>                 if (port & 3)
>                         return -EINVAL;
> -               outl(port, val);
> +               outl(val, port);
>                 return 4;
>         }
>         return -EINVAL;
> --
> 2.55.0
>

Thanks for doing this, this is just me acking the v2 version of this patch,
please go ahead and take this through your tree.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
