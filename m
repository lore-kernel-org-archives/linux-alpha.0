Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A473B52EE
	for <linux-alpha@vger.kernel.org>; Mon, 15 Jun 2026 20:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781553946; cv=pass; b=QAH5X1NUx5xrK55dUNKT68BPnvVs3ZuxfkPSHFpE7CRiK3RC7oTk4NLbGd+tLgLOfeWitk+5b72MT224UG5QGpZWPK0B4QOLdjgu6XLdGcWfzFCVqBYN6t/3OeVdtOTypCKPyRDjmVo62PTok5C4kNgcvF8Yb6EZkfCKGA508Jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781553946; c=relaxed/simple;
	bh=3V/U8KgIXhuClTDyJ1k6zrpIQe+ZvsYMWtZDcuyI4E0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1h0C7hdoUe6XuO6fVC/hRevESfdMu3M9iv5TTPbDnb14xCSz4PWwHd698BLuqNY5zLrlxLTf+JrgZtUFPk/785lbKmCTVOb73qSFbDTe65YjAfnTmBWJAiAubm1to5r11nq17K7gagp8Vx7GFR+19U1iZL4hoDS92QWSCR6cVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLPib+9t; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLPib+9t"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so6638154a12.3
        for <linux-alpha@vger.kernel.org>; Mon, 15 Jun 2026 13:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781553943; cv=none;
        d=google.com; s=arc-20240605;
        b=Zgjq2ZsoYrmXYbj2jon3A/sptuifwmFJwEDJLxPeYkRT3/iCp2ooBGqfhGunJdzBP5
         D10HXn2tJ71ICjJJU70qpmtnAqcmPuVw4h41JB9v6risOqks90qexyUqHBFOltP9VlMe
         pO2rZAgEqzsDQDHfS6iDcvGTIsdO6KF2T9BhgOV7+qEGtJk32W3Vqtk3RS3ZNOQFiX1V
         3ZgG3C7taIZ68/nhTSNvWRzZ7NLEvG4aElnUquTGk407T4AVckcTJNgqH0QcMm3ADDf7
         DbV6pZUR41R1K5w7Le15W7jMeqUr+CWjaixiJO0WkhZIyUNYEpLLEOtcYQ7/F8L9u8+4
         Cc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kv3VSLJgNyoH+NUWiTKXsR5r5F4mupN8PAxWMZPbE/8=;
        fh=/FiiqxTBjj6KgHaSL+PPIisxMiPQyd/jIjWc7ZBeeDA=;
        b=kp+o2nIrcmkxHgV36SRLPAJODes5lUpZoHEIGuhUkMlKG/DrJE+ZIznhel4s1HcX2T
         JnT85Okx0EtpbQhcIgTkNmrjIjGzwMbzVP1qJxv412in0VMkuGchN9W4jgA7knUNmg1K
         CwNYD94qjY7c6JByQU58XxIIHGdGanREddH4cVivNqX+hkYdmxJE3zQbqkLlhgLLe/EY
         DH7IrGxNOeDONx8T8ZdUmegGIfbHy3h/kGXLB40E8a8Iwk5/gMC0K0mEdTf7BYyRz6j3
         gw/FnVu0Jm4hyJRbSLnCRGoDvoTOGLwNysOiBsKeygwh91NezF1c875UBcw5Mzac/aOZ
         YYLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781553943; x=1782158743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kv3VSLJgNyoH+NUWiTKXsR5r5F4mupN8PAxWMZPbE/8=;
        b=gLPib+9tNEu3NOvFixvGG8vTXvzlN8K5remQ+rj+4QTWAc6rY7O6w6bLkyde2A2JXM
         THRRIXK6LGvHi6rZYXkRRxm+pgj7iFjz3Pb/fFbZBYXwJueVGZ8IR1NiX4bFd4H0lhT4
         QtE8iAtv/+SvRPKW3/Y5oAOh4RqIkHQ0pceHWRIi9q/zyd3aHQ/ycQHlSLtM1HMbL/Lk
         bj5A2i2Wd2/t0omVrb+i9w/T4N9Q2pvTuguWtut3wOdren0XYhytc2kWcyG1xVmhBYX/
         wYovmeGF5hyNunVEAjB8IE3Xt3rrKGn/CvR5OaluOrBMNsJzR/oUeQtnOfd0YiuYBeLB
         KqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781553943; x=1782158743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kv3VSLJgNyoH+NUWiTKXsR5r5F4mupN8PAxWMZPbE/8=;
        b=EdA4OEnru7YPRnJhAXK+0nAxiUSXy4sNwun0GUMVAMxWZcnmASZKtqGziO7UeFyXc4
         dwIM0R0pSZQtFFSorfD+2f0ie4mGEbBMr1WoINooCqvgYPVNz5308ifSp4xmzKC1Pt+M
         IwTMn2SpdnzAIoewRNahlnVF5lbDW2OAmugVR30smIJBKqXl6MIzj00YWwiiwaKUpZDE
         qd04gHHjBk6U7Z/GrgPlwOz6A5DcEzzZhaSVDcTZG55iqVrnVaZ35BOaUsk+z52weLTS
         c5JjfulpddKRfC27AdmFbOseXFStf3DlUP940IoRWd/D65fGCohJtH1M+CKkiqtTsG0c
         MK6w==
X-Forwarded-Encrypted: i=1; AFNElJ+FVH3c7FLyrTU4pING0CY4WXl3NFUaEq30s21JMQyKtwlK42RmMoN+j1cKyft8Mnn4T94fF7hLXQ9Kuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YycinUKLlYLVQA1yN/OEL2Ixx9JQ1C4yGkrHasjBWft+WlovFMY
	/cMkoFhSieDTIVsAfnKMlJS+29Yu7sj/qjRMTdxJhA5IxnRUiOkN6IAMu8YVOR1WExZY8jik+gZ
	FpG0QMiHXfHxfTs3GzETq2AgInrQa9W8=
X-Gm-Gg: Acq92OFpw/U0O7FnHUVP6UGzLRT0MncGeDV6NYBSOmaIkkG4cku9KpERF37MNRbLyjr
	Jam516HO/86tVmJ4TfGBprYXBdydUQgEBNKD+EF8ptmppe5zr1iySJmiI7RfLduoP0E4G9UBN1x
	BCrKNwR5xz/FJT4EvAM3gCNcaW960+yynM6e0RscA7/XXD2cCxWqFVE+z7H9oUTykflS7m5ckN4
	TavShstSTN10Cn2eUH3GP4zGd88daMgM3V2Mtq1R4ydKi5n9tU4/V1JsCsBcBMV4nN0THqMHjW3
	DneykW7aghU8RPpU7bV8ZDvbFssGn0pN4Ks+fdw=
X-Received: by 2002:a05:6402:a51c:10b0:68c:f3a5:4990 with SMTP id
 4fb4d7f45d1cf-693c6a93526mr3313262a12.25.1781553943083; Mon, 15 Jun 2026
 13:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612232400.585195-1-kwilczynski@kernel.org>
In-Reply-To: <20260612232400.585195-1-kwilczynski@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 15 Jun 2026 22:05:31 +0200
X-Gm-Features: AVVi8CcsKHXnY2Y_-E5yGWXaZJVn7GiYK3wlMHP7wC_FW7_gkEwKQPN8p-F0FZc
Message-ID: <CA+=Fv5Q4dG0JC0yPn9iwQJTwYMb+VwT9EANpcL28=WzGLLAz9A@mail.gmail.com>
Subject: Re: [PATCH] alpha/PCI: Fix I/O port accessor argument order in pci_legacy_write()
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jesse Barnes <jbarnes@virtuousgeek.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 1:24=E2=80=AFAM Krzysztof Wilczy=C5=84ski
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
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> ---
>  arch/alpha/kernel/pci-sysfs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.=
c
> index 3048758304b5..354ec5f10ad0 100644
> --- a/arch/alpha/kernel/pci-sysfs.c
> +++ b/arch/alpha/kernel/pci-sysfs.c
> @@ -355,17 +355,17 @@ int pci_legacy_write(struct pci_bus *bus, loff_t po=
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

Krzysztof,

Well spotted, this looks correct to me.

This must have been lingering here unnoticed for quite some time.  The
Alpha outb/outw/outl accessors take the value first and the port second,
so the current pci_legacy_write() argument order is clearly wrong.

I tested this on an AlphaStation DS10 by exercising the PCI legacy_io
sysfs path against the scratch registers of the onboard 16550A UARTs at
0x3f8/0x2f8.  With the fix applied, writes through legacy_io read back
correctly:

  ttyS0 scratch at 0x3ff: 0x5a/0xa5 write/readback passed
  ttyS1 scratch at 0x2ff: 0x5a/0xa5 write/readback passed

For comparison, attempting the same test on the unpatched kernel caused
the machine to hang, which is consistent with the reversed arguments
turning the intended UART scratch-register write into an access to an
unrelated legacy I/O port.

I will pick this up.  It might not make this merge window, but I will try
to get it queued sooner rather than later.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
