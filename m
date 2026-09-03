Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003F537DEAA
	for <linux-alpha@vger.kernel.org>; Thu,  3 Sep 2026 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470794; cv=pass; b=SOuy/ayPyKDxJcqK8KNneFJBbZlxc4CPpaKClLvXDIsTaRC3sxR+GEj7sGc2SXO/m8l/fYV04yVAOTBl9VbKPt47lsccAU+Cd8/pcwwuebxS2oqBABXzitvHiaL5xtrmE6sp/urjxVrTFSc26w3oH5NFtuO1ZsyCtIv6K1sLo3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470794; c=relaxed/simple;
	bh=unUAuMwyR9D1haWKkId+4CIztodX4xmcY9SrOCNP38A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DL5Hf0ZofbxM9b/KKP/faquLPp7CTX8f64NAqFKYuVAbh9/z9FTTYWG7wjdqQh5QKupD6qHIBer5YLd7P+20uIGkSqGXB4pfSZYJXYmEVDfJhgF+vpSBLlyxU1hz73wBo7+6z9IMwVqfqKmJp/Dg8K3ZD33ThBP/HMEncEvBom4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnCg5u/Z; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnCg5u/Z"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so409053a12.0
        for <linux-alpha@vger.kernel.org>; Thu, 03 Sep 2026 14:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788470791; cv=none;
        d=google.com; s=arc-20260327;
        b=TD7T6KhnEfG7B60Gsls3tuHoBfnCMik38CL+yc/JBklXYZjvXaT3Lo+DupKjwSye2S
         N9GjsYksSu5ZFSQYBK9RCfAR+rGwmY4ZTHIGOQYBZ+vdjRQcDy7QzcNBQ/7MJpV3ABSG
         XQ1uhjOh6Qmhwf5mfd7+NThgjhUigyHGGiqmYO4QMS8bWDnHtJAyAB91ZF4nU/IQK+F1
         096s9gXbg25Fnxb+G6ei0q2g/+HUnTaOPIN/HwsbQ992DFuU9GLl+p8u0OBriFZLTwil
         arcPzUKnq1apqFFw+tFQ4p6fL4d+Z0n1yWG/2b1yVqnG1xyvwDAuXpAwPIxVxKtzWGSG
         7l7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i8S5ooVnhB3GMHix7Xt1yk3iIO8ygQJRzi4O8FDpif8=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=lx5DyhMGOeeh6z7hOh20RC5CyB75TKEjUPOSjEoR0rIoYLpQsSYMjJAsa7v9fKgZMy
         5gPfdslNQc0U1EHHjbo3dk0fy9PnD02qc8W32k+CtdtfmTf4bUkHmpFl/f9EwIA6REu9
         +dgDHSinDixY0ccJHUz/ap4AiXKJfsoeRDNPvwyiAzCu5c40EIN1jSsMKRZOwIJcY6YF
         LJI5iHMmGE8rTcSPPfdm2cBg4VWV9IQTFQ4dIaSYA09I/531B3KY9cOCx+VBTi4/BGJ/
         MlKPAINyMtEgjFULFC0ZKOp1QJkFvHEDzdlalcSeRveU9KAgcIhbA1jxuadWwrVcjgUd
         S8FA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788470791; x=1789075591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i8S5ooVnhB3GMHix7Xt1yk3iIO8ygQJRzi4O8FDpif8=;
        b=BnCg5u/ZOTCbuAkqRURzuJ8iSedhuWRNnfmlUQYE9X9A7UXJN8eXFtE1uch49/Xtt1
         lCPqDp4JqMLOJDfkH2R4XZ8CNfBu4VCNGmcDIJuol3eiCOv5H6dggKh5YnReiLx+D6YZ
         zPg/Noxht9EyrqP7Cn/GKmuyJqKTvYR6UlWvzXge6i8mnmQm8TP2V38XD1CqpPkTBDOo
         5jfwFQpNXS0mZGKrIj313ZNmuEbDXnI9c/usklz23XAQkWlE20aeTvorxH94rp7J4QMc
         5Huj/V3lyLyIFhf3zCA1nOmkhA6AlXBR3vxfEMsJ0av4alH1v1b53T3cga0wS5IReA0g
         T3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788470791; x=1789075591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8S5ooVnhB3GMHix7Xt1yk3iIO8ygQJRzi4O8FDpif8=;
        b=GS9LMUV3BDkQxSOu1NYEBG0f6HYGgxgEAvctXPfhOZdw3400qpe3szfrv6Zf7Pp/DG
         k+ihlmyH4vaAojt8VNgjIgxPJ8zjPzT7JiosUTpqMRZ6lbrrH4EeLNT/GAMrVQTZ9wdM
         tgakoXkyt00dPbV4cO4on20x/M1ANh1nCJ25fGhXFAKJk7VilffuUMHeYdSrNcE1lr/2
         VJ5nj/CHD4/bt6+C/hrnKyK6mVOO6+d+/IYjJP2kBQAroLQJFswsohSq5lbsMrDZvKTg
         D1xklfc/O4dCvRlesVq3vJOEDYrO2KwDRE9ONc0TXqJNj5dql5eNV93SbELLTe4vcdkm
         2dtQ==
X-Gm-Message-State: AFuF++l+3GzQJTXxKNskylKJe2XFS6vYhlx8IIrgO3c/aIsRIAHcBrDw
	mEDbUnIn9Bi2gsI+2eXxE/uHM8QJ2dSNAfz63eJplxUDNRKuob8Yi6rIUY8v9tnaiDR57I38TZW
	UJZOeEBMF6pKw7+63tu95QFz1z8klAMY=
X-Gm-Gg: AYBFou0W8zTRM0sVCa7/zLfEddhNiZFDkOdKmNn2I8ZLsiyo4oz5uU82OaKpaprHIgr
	5qYsntUb4lpmbsageFR/OGibesaN9Q8lHJW3rzsb2sTIu5sFq4eNeL0y6v/slj1XrbKOve1/Jtm
	t5jhwUAJIgazY91syBM62MC02NVJ0NBy3EoGBwAeeM8rgg6m/eh1UxETew2qk7hhekr2mxvHNDh
	T9q2b+xCj5p2fzqJJ+JH/WA3Gk4JlrquahguwZVr8WxnTkBAs9meLAzMyRPoRmo+lr362y3z97/
	hzgNQAbNLmq+UME1/tvfqN2MqkumurygWpWk2LdVFWsxJrBp/3GV+Om4YR9r5a1ICzmBeGSiBjt
	wk+hEEassI4le4Waf8lH4qzXJ34McVmwyCiScVj3UYQ==
X-Received: by 2002:a05:6402:2549:b0:6a6:1c30:bc4c with SMTP id
 4fb4d7f45d1cf-6a7e8d25de8mr442689a12.5.1788470790663; Thu, 03 Sep 2026
 14:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <def73d988ac3cee7f6454637902a296648c25d0b.1788277742.git.mattst88@gmail.com>
In-Reply-To: <def73d988ac3cee7f6454637902a296648c25d0b.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 3 Sep 2026 23:26:17 +0200
X-Gm-Features: AcwNN1WrLaaTmggLPXFT6Qwv6G9ImfH2P137GVtKWBCi3FUkfl9jBwEDIvceqDU
Message-ID: <CA+=Fv5Tjts1TYzErVRkMSOk_MjShAMefB6MPejsmbRnHJn7TAg@mail.gmail.com>
Subject: Re: [PATCH 23/24] alpha: select SPARSE_IRQ
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:52=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> NR_IRQS on Alpha is sized for the largest configuration each platform
> supports, and for Marvel that is 32 PIDs, or 32784 interrupts.  Without
> SPARSE_IRQ that becomes a static irq_desc[] array of 12.6 MB in .data,
> carried by every Marvel and every generic kernel regardless of how many
> interrupts the machine actually has.  A real ES47 uses 87 of them.
>
> That is not just wasted memory, it constrains where the kernel can be
> loaded.  The image links at a fixed 0xfffffc0001010000, just above the
> console's low memory reservation, and with memory striping enabled the
> console leaves only about 16 MB of usable low memory before the rest is
> relocated to an interleaved aperture.  A 12.6 MB array of mostly unused
> interrupt descriptors is the difference between fitting and not.
>
> Alpha already goes through irq_to_desc() rather than indexing irq_desc[]
> directly, so nothing stands in the way.  The platforms do wire up their
> interrupts by number, though, which needs the descriptors to exist by
> then, so provide arch_probe_nr_irqs() returning the machine vector's
> count instead of taking the NR_IRQS_LEGACY default.  Without it every
> interrupt above 15 would have no descriptor and the handler setup would
> be silently dropped.
>
> Tested on an ES47 (Marvel, 2 EV7z): boots with all device interrupts
> working, and .data drops by 12.6 MB, from 15.7 MB to 3.1 MB.
> ---
>  arch/alpha/Kconfig            |  1 +
>  arch/alpha/kernel/irq_alpha.c | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>

This patch appears to be missing your Signed-off-by tag.

Tested on a two-CPU UP2000 with CONFIG_SPARSE_IRQ=3Dy. The kernel booted
successfully and created IRQ descriptors 0 through 63. SCSI devices on
IRQs 19 and 27 and Ethernet on IRQ 43 operated normally, with their
interrupt counts increasing. I observed no IRQ setup failures or other
IRQ-related warnings.

Regards

Magnus
