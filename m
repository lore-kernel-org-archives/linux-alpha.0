Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BA632FA1B
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 02:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786329843; cv=pass; b=u5jXLnEBZYsepJf/cKlpUuet4OYGnhoYp7PC/fO26R+UT5v4c3/EBTM8f1DCRGC8F/XZr53lVLBEQBWrIspU8X2xfOceQoekQbSNrVbRFHQ+GMgdA2JMXOS/KBAel36rdzcjM5xG69EzKPXDW936mElQn1KlkEPtnhDdt4tyytE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786329843; c=relaxed/simple;
	bh=qq3sKXnEL3+vm9Wc5HX318DmcMlquy0s9Od61lv0nPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eL5bV7xI3a1ZGztcsb14yVrYXFHwmJlQLJ1phRMAeXMLDvE+kUomBik5ru0QwlG0YAiXiaWitCBxySU+TW0uciMeZXaYKZ/WD2k2Vc4nSxflWAnB4koEJm+couKAYu4jDlaKK1CMS84zhry1ZJX6NNyociCB+8pba9l3SCmQLzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDA0KAXM; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDA0KAXM"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so1455468e87.1
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 19:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786329840; cv=none;
        d=google.com; s=arc-20260327;
        b=PDm1aUXXgSla6cSVQRwpey8nu8T4b33QBuqxcF1AxNyaZPtNgNJl+8iHg7lkyAngUH
         a/OHUQPqmXT7Ggx/osG+iW/+Ef+Bl2dbs1XtIBrB0umn3VcMBYjdqKC1k3b4s3LUlmBl
         oCXy+1Zdpndwn6bohexYDIrXnjht6VF26w1o06FAw0/RWhwaNNXoh03vUMJUJOXxJg3c
         5Z2/EMZqzXCLxeh2fwzD7ury1ih6KadS5uem1lnBVnyC6EMfHOkku5ssR8h8klIJFj1t
         7aGYsshNdLFZc7oQVwRbUMgZBIsKvBIm5ecX0gjzHNvuh4I13VBgxdp1l6/JnbN+lM80
         ZuSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HqzMaCePxJKkMtUQxmZ5/nUtrERCihAAAAzJ2rGhqjQ=;
        fh=+oeXnmtQcCQtFCgymTp45WRnMa7nb3SbNHLdvpE1vkw=;
        b=rpti8ilzCf3Dxsng6AmClCO4sUZryrY0Wx34sV8jioJQwuUtidvUS0636ixlAJS6CV
         kjPfrh1Oyl7VAaPFylKECJqtUqFJCUpOkbzhiu28MjTJzVNSCWVrmnmIf6oRsa0EhBfB
         8r9+8GkDlnDSJXkQOuEH92RKhVHWuod9Igl1pByBwiGexNky8i0jQ6vCBWqauf5dx1Xv
         haPpquACcft5gmVSS8T0M3XU0FdfYGR/YuhPMFNC+WyBs4N6RzB5vAq72MFh+9RVIKa5
         7aXCI22S2VnJwqlafyrqgoub8O24NTejgjJhQ8S1O4niCwHtgamvSw62/xmfuZmo2ThG
         hKyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786329840; x=1786934640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HqzMaCePxJKkMtUQxmZ5/nUtrERCihAAAAzJ2rGhqjQ=;
        b=UDA0KAXMELOUs9yOP/8R1hdsl6YLiHYZJrUgritBmKHjYyWz5CuLgYAfawpkkjf8Zr
         CUL9haVC6nplMJh+3JEBB9y9QLventjrhlcK13dZ8bQXlXWeoxEaYwMj6HjUDGBU77cv
         uQ3YVXaKXk0oJsPIYpyffv5MPIkVgIX2qFR5MaudrYj7kYPOpKqvN/IWb36Y+AAWkQj/
         m+4awaYaIJyxPaEOOhF7pG8OhPNZWDBIpJSoJPRVpqb6+rdGEbMqzL7faSBgq994+Gs6
         fOOcBK2chxslqBRdNtoVwqXiJEGcs8JcKeFHIKItZJPt9wQBznQe2e/v008eOgr7vfpq
         105g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786329840; x=1786934640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqzMaCePxJKkMtUQxmZ5/nUtrERCihAAAAzJ2rGhqjQ=;
        b=lRG6nHqwi2/vFDcqJOqwjOiSGk7wBv5ZtPt5mPv3lnjEWtoax+0+gMEZmVN9Fhk0Hc
         1y1+LVnLk7f8H2FVD/hx8K1rbd33oU51Cbq+RmUIACJ9cyAnky2OHLRrnUwssRBiQHWa
         lDUVW110JBO41Ma3CZn6Imx/7GHTAPEvRYTDyKRn1xP8HVbf66QuOg5UcJCIZI3HQNfa
         2jQuZH2xa0N8DAzDc4ehRlzVPpDhPew/7DLH78KvpeyXv9LiBMulps6VV1itHFE02QNp
         zfOFQKVSqGQA6JR8vFIXASm+hb/SOXLUmNWhZPdtTgbPjJ0wkLbQWR/1VSsaDInTuHRf
         j0qw==
X-Forwarded-Encrypted: i=1; AHgh+RpjsT0OsZ1dpvribBIbB6Qw2lOysgOB/X5h0VrEIe9GPlP+ThBYxViFC8sVU0N0KmKlS5bXMwNiKY4IEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEcc/ElXeqPzuF5QayDVANysBbva7vMOsvyYlduU+ivNujTyGn
	sEejOlDF6Lm+2LPUZWfHaW7Bm5qSJ9KBOFYnDnC8vXJ5zWKg8U5Nb505SbRxRSPcwOGfuvv8fW0
	CASUNU0Uit2cS+QnehP6Mjb93BIQBr58=
X-Gm-Gg: AR+sD12u94zaJMeTrcPq2KHZFSjWIqBpJ+3KjVMfQRpkPfaFAZlfKkNI9ELSaxWj+k+
	svlvbOAdbLVfm+yXEaJp3+KsJnoVE1nLPsTPzzh7ReKqA9a0cplbZqcUfXclVPJPCihptywFrz6
	CHaVQJig1Bc5aFuOrfKsTAQb7WphAdpPW4ju/yDf+MaAoRcfgW2rwdj2zuEd8o+nWupIZoBTcIc
	WTGw9n8ur3L6ynHynrZR3jBirRHaCRUSXMn81VZzOcl4x2aAs48/LJhjzfm8eSQPgbaQReeg9Ub
	1amKoln1AsyGPAfht320Sbo4wsm3yMYF564UQw1SPBPAtnMrAIp1adQgeFosnKwTOgreCBbvCTO
	4/g==
X-Received: by 2002:a05:6512:688d:10b0:5b0:1ace:3bec with SMTP id
 2adb3069b0e04-5b30b7286cdmr1274771e87.10.1786329839780; Sun, 09 Aug 2026
 19:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809085208.3262799-1-linmag7@gmail.com> <20260809085208.3262799-4-linmag7@gmail.com>
In-Reply-To: <20260809085208.3262799-4-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 9 Aug 2026 22:43:46 -0400
X-Gm-Features: AUfX_mzUjecW73ez6NgTW8WYRJY3zEcf7Qz45Xnfye3QU7GuRhXo0MWIq36Pi80
Message-ID: <CAEdQ38Gb25m7nEAe40-5VnuwrTD3HAj7QsspNtY+euxWKVGZ7w@mail.gmail.com>
Subject: Re: [PATCH 3/6] alpha: fix the local TLB invalidate in flush_tlb_page()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 4:55=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> flush_tlb_page() invalidates the calling CPU itself before asking the
> others, and gates that on current->active_mm. For a non-executable vma
> that means a targeted tbi(2, addr), which acts on the context currently
> loaded, so as in the IPI handler it reaches nothing when only active_mm
> names the mm, and nothing forces the old ASN to be retired afterwards.
>
> Test current->mm instead. When no thread of the mm is current, clear
> mm->context[cpu] so a fresh ASN is taken at the next switch. That also
> covers the case where the mm is not this CPU's active_mm at all: the CPU
> may still hold translations for it, and smp_call_function() does not call
> back into the caller.
>
> Reached in practice by folio_mkclean() from the writeback flusher
> kworker, which has no mm of its own: about half the calls during
> writeback of a shared mapping, and none at all on anonymous memory.
>
> flush_tlb_mm() does not need the same active_mm to current->mm change,
> because its active_mm path loads a new context rather than issuing a
> targeted tbi(). It does have the separate caller-CPU omission when the
> target mm is not active_mm; that is fixed in the following patch.
>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> ---
>  arch/alpha/kernel/smp.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
> index 0dfe29b59039..d167b3ba1303 100644
> --- a/arch/alpha/kernel/smp.c
> +++ b/arch/alpha/kernel/smp.c
> @@ -696,7 +696,15 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned =
long addr)
>
>         preempt_disable();
>
> -       if (mm =3D=3D current->active_mm) {
> +       /*
> +        * As in ipi_flush_tlb_page(): the targeted tbi() reaches MM's
> +        * translations only when a thread of MM is current, so test
> +        * current->mm.  Otherwise - lazily borrowing MM, or not running =
it
> +        * at all - clear mm->context[cpu] so a fresh ASN is taken at the
> +        * next switch.  smp_call_function() below does not call back int=
o
> +        * this CPU, so this is the only chance to retire what it holds.
> +        */
> +       if (mm =3D=3D current->mm) {
>                 flush_tlb_current_page(mm, vma, addr);
>                 if (atomic_read(&mm->mm_users) <=3D 1) {
>                         int cpu, this_cpu =3D smp_processor_id();
> @@ -709,6 +717,8 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned l=
ong addr)
>                         preempt_enable();
>                         return;
>                 }
> +       } else {
> +               flush_tlb_other(mm);
>         }
>
>         data.vma =3D vma;
> --
> 2.53.0
>

I think we could split this patch, like how patches 2 (tests change)
and 5 (missing else) are split.

No strong preference.
