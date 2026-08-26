Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6181397923
	for <linux-alpha@vger.kernel.org>; Wed, 26 Aug 2026 18:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787768671; cv=pass; b=ibdrMO93AkCmI2ExZGOepvcd2iMwSVgtV7JmZK9yDB0gRgj3nY21ndoleQITWbABa+TayrlXBlpUaFSgFoRXw8g/2IM0LUOtq6ab81X1p7fHXm+moUHm/sDU7r6BMXG3fWvoCAmtJOgAichkNO4AdG9PQK8lWbFpfMAbZSXhMgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787768671; c=relaxed/simple;
	bh=/hkdG+AxpPNgaRw43nyMN4hk3txaTAaG2qfvZJhgjY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuIyt4XkcOYDIGXESThs6xQWZnX3vOARR4vHCF4mP6BM/e5AznPnGdC6X6e/T7ohJUrU5W3gGO0SsOMFWqsZ0SIcy+IsuAjyTmCg61MSHXTjD7j1C28Rahif+3KJ0E4enHL+C730tSsAofPUex3+ya3vs0DubSCD5235ldRQx4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q85El9jf; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q85El9jf"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so2136371a12.0
        for <linux-alpha@vger.kernel.org>; Wed, 26 Aug 2026 11:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787768658; cv=none;
        d=google.com; s=arc-20260327;
        b=CBJorFKCLPSmTUSNQxm2clj9sfTCxWx2dPAUL/ZZjP637aLTivYZ5LmFQPgekBvqS/
         as3CDosQzyqiRTYen6Aso26xR61bYeMPaaO0xUTUGS/wqbic5SGLub0I5r+n9B9VafJF
         7QztpyyF6zMFP3e6QFREbHo0vUBNjt0dASeuI43Ov7ycjyEpARmr5sflJcicqy9mizuM
         XgCEIDU0v+1p2LF8nggrvu2lsjxSx12XfDhJeaBTnm5Jww99CsNF8gEU1gJr/+5JaCDN
         0e8XGgPZYE8UWwHNCXJFbvS5sQTonEH7yMwJtHIHLGc2nNbiqJ8mVK/MyEyFNN05klTQ
         DQcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vTKYEO3+t9EiBIVa1nORleSR1iayevsfGTi00Br03V8=;
        fh=X/Eeb9X6df3dsj+Be7eZuGW6RrOCK1ISSRfo1Yceclk=;
        b=bZHV0usyGjt5eGAk3eFqtVBnGroIiwRK1GBIAukYBm7+mu8tBsWoiUFHCu4nrXApwS
         gB1eUs3haYyR8DEgjZAIASvZKEEpPIbFIChN4ftrtBlb8rNNqdhJhTHl8JalMXyKtGOq
         0tcpsadjhDJMB9H55aYGCXdG5gSyepmKnYIYzYqF7lhp15Uz3cDOzqqE40PSVCn1v/gE
         pxudNCK0vi8Ymj/XVE3E/9qQ5+0zchLZy4xzk+aeax0iRBHPhRCR7E0VzDOQME44g3VU
         PwEFJE5NtZsLz4XfaNXVk8eK5CFAENJLPHWrThgquj+To2wVscXSnbLKVAYebQ+syHYu
         sCZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787768658; x=1788373458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vTKYEO3+t9EiBIVa1nORleSR1iayevsfGTi00Br03V8=;
        b=Q85El9jfcs3J1yJeSYsVNnX03sC6wOWllcmDsBkg7oea7khHsgxqGueM6dd0xheRJl
         muMpIcO8QuGZcuu/+Tgq46Tgr5boJm4T/X8Y6xTgWVC2SVGhoAMtU1SpgyzpK5AgOTpy
         OGgQSH+cVMT+EflKbyWJPOSeSZAhNPNUleGOBx8+VQ34mP9MGQrBvEoF5Lu8Ovcn4eAv
         zOUqLHlf5Hhs/Qv06azAmhrTDd9qr3Sjh1GyP7co7JZWp3V4xlHng3o0rujXB1ZLqKpd
         VgeEl6WbbBvjKx/rqNzo6j8+BQG6lWSpKx5CDNc1T6F+fFDFPhKb2xt+tW074b7x30Zi
         O5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787768658; x=1788373458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTKYEO3+t9EiBIVa1nORleSR1iayevsfGTi00Br03V8=;
        b=kWPqGIDKBfYKy5CUu307hsd4OOn7dhLjMu6NlYhRSzDGw8GQx6SgNdAJdy/bTXYPcw
         obDe1FrPvI9rNFPPR5Oeik/3nSw10baUTDjhyAx/3zWe+eTGMVlrGyG7UeB+U+PCeuza
         lMWFldcfyaQeSY78NGbyc5lD1DeoCpRRaSaM3kanHNZlXJBN6RLXmPxVSu3sdh+VsezC
         hqzbn/oxRCoMtOc65KaVDI512tEbPuAl3MFVYdCIwRcmy2voq7DJ98EotexyinFcfD9V
         5oYIzOtDhdD2WsZmmV4OL8IntcOdF7m5KnHBGoMDtEziaBgcwAVx3pL/2KFb6MoVy8+z
         6E9A==
X-Forwarded-Encrypted: i=1; AHgh+RrsypQA1dR0fZYvy/2mVpyZw9DiYE2Uv3S2JV57d/tO2/OFKINCiRcOo9TAeOet3tEbMakLmZCpZUwc8g==@vger.kernel.org
X-Gm-Message-State: AFuF++kuR8feLqKisqjJxmKb8W2Pe8gq8hAx/2b27mZsAqYvfxTdo0OG
	da8DwFk65lxCKSl9e4FFOlU89gbTAi7ZBTjgb1up7aWFhik7MHFLSrsHQk2W79bB4sBEYKacoWE
	gJ6q0dOSeXv9GPwtB+9qmiFPbTwp4hXpfTJXB
X-Gm-Gg: AR+sD123VuJkDvMHkhHpcjs1JATF30GBjf5lre9N/WIBCcoWdZkwXfI02nvMbDXyotT
	GIGHhZ8jrSVXCbg2syPRkFGOg87iZJLsIQPb7mAWnvFIo5ufZxe6uXdV6tVw0QjheE5Kdh9lT9J
	6eiA1ZFpTZA96TRkrKGOXdP7zYh1W710KLzf3HCnU5Qw7shmv6Dyz6fBkzwpzlZm/p+PR5mlWxp
	PXY0rSSliKvs8CW9wg2Swq+Gf+cO+wozoWafXlQBWEBMG2onfJjpQSj2sc4gYt7AIrXRYBLM504
	nftxk74Llg0ITkymX8rakDdXR8h7R+sxd/0Kgp86hxF968ZiWNEgHyZaf5EPacyQpkdDmx21+gA
	5cTCFIicmtxeXg/o3vOZu3Vm9PfxcMEs=
X-Received: by 2002:a05:6402:1cc7:b0:6a0:ffb0:273b with SMTP id
 4fb4d7f45d1cf-6a5df320af2mr13171809a12.0.1787768657868; Wed, 26 Aug 2026
 11:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824181126.3559638-1-linmag7@gmail.com> <20260824181126.3559638-3-linmag7@gmail.com>
 <ao78x7nKbm7fcdzk@minute>
In-Reply-To: <ao78x7nKbm7fcdzk@minute>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 26 Aug 2026 20:24:05 +0200
X-Gm-Features: AcwNN1VnjhOH9dJ3c8ruU3KupD9XzqJrq-dWWRWQVF7X93Vv2Q-_zF-DN80HcTA
Message-ID: <CA+=Fv5RmcTGFgmCwTVvSWq2-2RcVDWi+CRJfysCoKA1RRdiomw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] alpha: disable DAC for 32-bit PCI cards on Tsunami/Typhoon
To: Ivan Kokshaysky <ink@unseen.parts>
Cc: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	Maciej Rozycki <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ivan

On Wed, Aug 26, 2026 at 4:48=E2=80=AFPM Ivan Kokshaysky <ink@unseen.parts> =
wrote:

>
> I don't think it is. You only need SRM-compatible device to boot
> the kernel, and then you are free to use any sort of PCI mass storage
> controllers supported by Linux. Personally I'm using CF card in IDE mode
> as a boot device and PCI SATA controller for everything else for some
> 20 years. My controller is a cheap 32-bit one because UP1500 PCI is
> 32-bit only, but there are much more advanced 3ware 64-bit PCI-X SATA
> cards still available at very affordable prices. We don't want to limit
> them to 32-bit DMA addresing.
>
> > The only driver currently known to hit this is qla1280 with an
> > ISP1040 card and a 64-bit DMA mask, which is a common and
> > SRM-supported configuration on Alpha.
>
> So it's just one unfortunate core-logic/controller combination
> and should be handled as such. Obvious place to check for this is
> alpha_pci_suppurted() (which ought to be named alpha_pci_dma_supported,
> BTW). If we simply reject 64-bit mask, the qla1280 driver falls back
> to DMA_BIT_MASK(32) - see qla1280_probe_one() function in
> drivers/scsi/qla1280.c.

You're right about the SRM argument. A controller used after Linux has
booted does not need to be supported by SRM, so SRM support isn't a good
reason by itself to accept restricting otherwise usable PCI devices.

I checked your 3ware example as well. The 9550SX does request a 64-bit
DMA mask in the Linux driver, but the card also has 64-bit memory BARs,
so the BAR-based test in my patch would actually leave it untouched.
Still, I agree with the more general point that PCI bus width and BAR
width are separate properties, so using the BAR layout as a proxy can
potentially constrain a 64-bit PCI device with only 32-bit BARs.

Given that the ISP1040/Tsunami combination is the only one I have
actually demonstrated to be broken, I also agree that handling that
combination directly is the safer fix. qla1280 already has exactly the
fallback we need: reject its 64-bit DMA mask request and it retries with
a 32-bit mask.

There is one distinction I'd like to make, though. While the ISP1040 is
the only device with which I have been able to reproduce the corruption,
I'm not convinced that the underlying problem is specific to the QLogic
controller.

There is also a reason this may have remained largely unnoticed. On
Tsunami the normal direct DMA window maps the first 2 GiB of physical
memory into the 32-bit PCI address space. Consequently, on a machine
with no more than 2 GiB of RAM, limiting a device to DMA_BIT_MASK(32)
does not reduce the RAM it can reach, and mappings of normal RAM do not
need the monster window.

> The patch below is compile-tested only.
>
> Ivan.
>
> diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.=
c
> index 955b6ca61627..d60c4c2aa8bb 100644
> --- a/arch/alpha/kernel/pci_iommu.c
> +++ b/arch/alpha/kernel/pci_iommu.c
> @@ -6,6 +6,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mm.h>
>  #include <linux/pci.h>
> +#include <linux/pci_ids.h>
>  #include <linux/gfp.h>
>  #include <linux/memblock.h>
>  #include <linux/export.h>
> @@ -786,6 +787,16 @@ static int alpha_pci_supported(struct device *dev, u=
64 mask)
>         struct pci_controller *hose;
>         struct pci_iommu_arena *arena;
>
> +       /* The tsunami monster window doesn't cope well with QLogic ISP10=
40
> +          chipset's bus master DAC. Reject the 64-bit DMA mask request
> +          for such a card, so that the qla1280 driver falls back to
> +          32-bit DMA mask. */
> +       if (pdev && mask =3D=3D DMA_BIT_MASK(64) &&
> +           hwrpb->sys_type =3D=3D ST_DEC_TSUNAMI &&
> +           pdev->vendor =3D=3D PCI_VENDOR_ID_QLOGIC &&
> +           pdev->device =3D=3D PCI_DEVICE_ID_QLOGIC_ISP1020)
> +               return 0;
> +
>         /* If there exists a direct map, and the mask fits either
>            the entire direct mapped space or the total system memory as
>            shifted by the map base */


I'll take your patch for a spin and report back, thanks a lot for taking th=
e
time to do this.

Regards

Magnus
