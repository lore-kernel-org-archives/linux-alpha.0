Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17F63AA4E3
	for <linux-alpha@vger.kernel.org>; Mon,  3 Aug 2026 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791766; cv=pass; b=st0hBd3zUC8neJWG3GFLiSOWpVtx1h9YrPFuw+tr1ufF+EXk9lrasQDYNBkUEE78HhltPV7X4EPQCnwf+mWtQqPCTdGswUB2f8Qph9tbWwXIK8MYZHg08q9HgkYVDlcCLnttujO3fY5fNLIH4DJ7+6UsXivFA3NrUWijg6rw4a0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791766; c=relaxed/simple;
	bh=y5qiPvD/on6DO4GW0krQNBl6dSDpG8n+mCfX4z92gGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FD/fhnJzdBJhE2NeILathcpd5aMYAf5ClWrGQXN5oLR1AoUtEBWRCJOa+N68LtjSdWaiZHckZEmeip+hUa+FPTnBEPN0G+76sZThSWjF+53pHNqWgQQBLH+fDwcRWi2XPt65H6lWm5mS5kRzUbjKaf5Jm9T84bd5iQy7vn3Q+F8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AeYwGDYy; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeYwGDYy"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0cb6e96dcso3325828a12.0
        for <linux-alpha@vger.kernel.org>; Mon, 03 Aug 2026 14:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785791763; cv=none;
        d=google.com; s=arc-20260327;
        b=Y3q7ZuXnEuP9ydGmTuaLhedpx3Fspd2lXcg1Hq8T7HdN0e8NYdFapQRi7ZgN0zt/ZM
         Y5hA3VSTJbVxp21R53Jk6fXGvRSfYqgDoUVQ2UCB/gOBvmuKSvPSzC549Qmyy8vi5BFC
         xrnlGvgVJhvrNCvPyosLqsPBdEwhsVcwNk1r0aEixQpY53B5P2IYDS0NgMs3kj0N+Uwr
         PJPJxEJJHxq6D1Nwr4j6fqPqgnPK5+NmZdj4KRYTRBhCKaaIOQsCt1cZVwKLNZcA4Rdl
         tKMOAsGcOAMYciCLwkwiQdfs0rl6YPrDw9QihQL4xOM6TLB3MWiKh8DLhI2IdxSQBoGz
         yrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ONA6u0gWcMYpm9YSgR6BXB8HOfOJ6IJqSr2+VzPiqIU=;
        fh=unMLRcJP4ulLD0SexAHMvXYhP7cKJVGtVGoZ87fWCd0=;
        b=o+4Y51pKuzIg3i/oZbOJPmQV5DLLlcZp9gyZDH2oF6GyI3/K2Zg1HiM+mEp+XVjXJl
         jdc1UkiNuaUq0cS2y1echCPxZAOVzIQ9f+U/pAsHBlj72eT70nni1w019mpA97PUavdU
         SKg6K3Z9HTJ8O+ly5jD2zFPIRAiQpotEmmC98xuuiR60mU5FtMbK3sqrB3IM+6YhTLSe
         iUZfNRr8ixJxAFFdXWSEuA/VeSp2yzSCZGRVKT6NcxxLBnalxuoxRl8lLCtx8BpeOKr6
         lftVLOFMS4nVLEyw4u0PNDjurh+uhPcRldGqDaNS05gJj87nbOQF/3nWxDDyg6RQ7qab
         vwlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785791763; x=1786396563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ONA6u0gWcMYpm9YSgR6BXB8HOfOJ6IJqSr2+VzPiqIU=;
        b=AeYwGDYy75kdO6XiGzJbb+/yIRXmyt5HRThCDbNWJSqfvSZeErFZtXK3ZqmGvRBPzQ
         41lcKutGjpG1n4IAMG9VKToAbECAI569GpeD57WT2A61l7UX/bd4eKS4CFVEHXH2dX+F
         OA8e1wuo3lhDzKwU2bdy1/joF3owlNJgGTSNuOoCjXkiw6vaVkSUyeQr84YyThHWFyxy
         75E3bdHnOL1HoF/ZXTp/EIeqf2fPHcvYR++d/0zlKmUdQp0nNlEvDiNMY2snFTjHPHLi
         e3iDReFwLZwdlVHDfSL9MLadzE3RSGZeqKcQxeZT6o+LAgqPZG2VbzSwKiBy8fzHryMM
         NGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785791763; x=1786396563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONA6u0gWcMYpm9YSgR6BXB8HOfOJ6IJqSr2+VzPiqIU=;
        b=tRVI4bIY+XeRjBhAcxJaT6oywVnh2qrwXuoaRVZZpIvfG2Jji5up4W30RiyT0W10dN
         OaBEPYsvGRY5jcSoLgnIldJTm1GpVnXZ37HSZRFNT5Bo4QZOu3ieim2/WKhxNkKkLDfM
         wlOWe58r0X0dFRn7HSxXn9JM++asfc90vf8rg4AY1bGcw6MrLZautfIZjnwShjGTDl3y
         n6fKL3w3zsR6O0k3jbXnY1G7HP31sj/AHO8K+98pvDJt2kvZMe8coW+tT3dhq0lfA6xj
         9wruM58EJm+ROn+44UTp1Rva4s2nRDT2fvs0B09iOS7WHNad8fm5ytRLmiOQav8As/Nb
         pTZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMLDe5/NyT/ZEubkOC0rFXpIHuWbYFx0HsMu5Ov+BLGkPxQ987xzi8M9eKJmOU7/6e0a9Ag2MC5EuA7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxihEfOr/lOEVJ8A+CRCKe2n146QRlLjb/fiOy1xOav4aViiKRG
	8K52SKlHZqb4KNERuuRHegHhLW3jPmwotwCOUGQg9rJ33z+X6bt++3MUPDRm3yv7If3+a9pKrxB
	C9oDMmNlNNKGT3hMYczBMYThwZ0gMuFY=
X-Gm-Gg: AR+sD12DV3n7ZzScS2/RR03C4yC8SpQuoDslLn7dYIJvnJdtKo7xKlryCjqEgembgNY
	CbDLvJCg2qfY8cBoebaMWFk+nB/N8LOeVLDz/TbW6vODXFV9IoTK+le8Hct6aC00dxV9GzwHlsu
	E6X1Vh/wBwnmyWzTs4JYfNZNoGyUhZkbHMTk0PijVzXwuUj28dcA4GUwL2ei8p/LeRP5sbcpTrg
	SZskMNbzmwXyscgCatqqFdCZR1AnDuC8t93nwUZ82wOgU1s450GYAUBehyLoosXGVdl0TO5Ovap
	GKyCSAfe/lxoRtoSIsQNnVm5GOb7+QLM9g7A5Ygvcz7HUE6SNkc/90CDRTgZZWGzlDx9BkcNpCE
	GU5QQq8zKZIXFbKvpzAGB2BAxlqiKP9o=
X-Received: by 2002:a05:6402:3241:b0:6a0:8885:e6ea with SMTP id
 4fb4d7f45d1cf-6a0a7c60fafmr7359384a12.6.1785791763033; Mon, 03 Aug 2026
 14:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com>
In-Reply-To: <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 3 Aug 2026 23:15:51 +0200
X-Gm-Features: AUfX_mynwyTXbGl2r5A9Ln_10BtSjIBSkDIfhjkE2mzRhJnUG3o0f9IhUJu7p4s
Message-ID: <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Mon, Aug 3, 2026 at 7:08=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> clang honors a local `register unsigned long x __asm__("$N")` variable
> only where it appears as an inline-asm operand; merely reading it does
> not produce the contents of that register.  So trap_init() passed an
> undefined global pointer to PAL_wrkgp, and load_PCB() stored an undefined
> stack pointer into the PCB that swpctx then loaded.  Either one wedges an
> early boot.
>
> Read the registers explicitly instead: an inline mov for $gp in
> trap_init(), and the file-scope current_stack_pointer for $sp in
> load_PCB().  A file-scope register-asm variable is the form clang does
> support.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/traps.c | 4 +++-
>  arch/alpha/mm/init.c      | 3 +--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index 7631129ac914..5b4f1ae2b74b 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -925,7 +925,9 @@ void
>  trap_init(void)
>  {
>         /* Tell PAL-code what global pointer we want in the kernel.  */
> -       register unsigned long gptr __asm__("$29");
> +       unsigned long gptr;
> +
> +       __asm__ volatile("mov $29, %0" : "=3Dr"(gptr));
>         wrkgp(gptr);
>
>         wrent(entArith, 1);
> diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
> index 9531cbc761c0..f4d65a60c869 100644
> --- a/arch/alpha/mm/init.c
> +++ b/arch/alpha/mm/init.c
> @@ -63,8 +63,7 @@ pgd_alloc(struct mm_struct *mm)
>  static inline unsigned long
>  load_PCB(struct pcb_struct *pcb)
>  {
> -       register unsigned long sp __asm__("$30");
> -       pcb->ksp =3D sp;
> +       pcb->ksp =3D (unsigned long)current_stack_pointer;
>         return __reload_thread(pcb);
>  }
>
>
> --
> 2.54.0
>

This looks good to me. The explicit $gp read and use of
current_stack_pointer avoid relying on the unsupported local
register-asm behavior.

I also built and booted the patched kernel successfully with GCC on an
AlphaStation DS10.

Reviewed-by: Magnus Lindholm linmag7@gmail.com
Tested-by: Magnus Lindholm linmag7@gmail.com

I am happy to take this through the Alpha tree.

Thanks,
Magnus
