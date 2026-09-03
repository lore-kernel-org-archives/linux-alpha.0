Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001D13C7DEB
	for <linux-alpha@vger.kernel.org>; Thu,  3 Sep 2026 22:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788473251; cv=pass; b=HwIiN2HEcLG7VQNIh2TDDUVbrkxFkXrmTGYdy2Mj+xbpCymfjP5unbr7xlLq0jrvuxJANvu0pFfnuOZbNVS2e2ouwhTkNTDx2noqxrjmNT3aWQaFyTYKOgoFTQLv+DNgLps40wTG2/orEsta5K76NDhRO8d9/lSRcuSox3isIJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788473251; c=relaxed/simple;
	bh=LiLYBE1PYGUlNN4KNgnkrklkSF2SW4ookbN2idghnLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dszE9DuBCege989+bFxspdKlP0UeGFfwmhtJTnZ9tzoNuLxTlWdb9b92fHbuPQawnr2qvweL2dNbWFQ4nnCTEWzav6huj9sYiX0VurCduk8HoQ5O5Br0r/3RegFlU0wow3QMjbrrNRuUNX6/CLSLOgVhR1ZcZ6e1GD6ZcXQUXtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c98fek23; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c98fek23"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a600a1caf8so405458a12.2
        for <linux-alpha@vger.kernel.org>; Thu, 03 Sep 2026 15:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788473248; cv=none;
        d=google.com; s=arc-20260327;
        b=UcwuuNglnSLmHgn+Swxak2ghzZBmCKm82wQoNoooOfhuHRJRDJnnUqSfGBsk7ot+SM
         3UksbuVX5PdK5y2AeGoKYeBw30bRmZyXtKrB4YypublXvQyyqSaNddZOBn5PU+/5Ts7W
         7Pue6KfoqKUoSzRWG3+U5eRTI+QdVsO655yD7vWHbosjtIpYSluasnHaWSzKjPXrdR+d
         SIdAty7yZQ6XDzxmNP9I31QYw5WBvBjexMcjPs0RrLfuo1E+eQ3btUdjn1hJ7so4HTVP
         SArtzgdOqZTzwNOt/bvhsupUcCble7kxoKW3AbqnEmA/uq3I6S+z8BSWrgffFLgnDOfG
         31zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNOnUP8DP8sduXUGrn2sIbhDUJ8SR/EkVRSFhfIKvhM=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=NCZjZamnb57/Ke8Y7soOwbOkA85TM0eEMhJYQbQnDYsEPBUAt5I0V06HCIYT153pYq
         +xqh5hlQiF3mnes0szFMFLHjEF80uEKoe614zCCVCD1H7hP9vzLbknFhHfwe27vtLlXn
         TKBT/SieP/kOXnKYZPU4SHvHKZnXzTAYaE126Fusz/vyMNkwphJbEmw4LDHSq2l50DR7
         EgIiJCZsgpXlA124ib7W5Mhn9MLCWMvwFsgk+kXW1frhA0hKbg7t+8sX4Mp8X2ukEvCD
         J5KwgAy2WpmH4h0xogzgOFORREcZAWt1XpQZsuEU3VuBP9pb4SfuR3CDBI5v9Yl2bS5n
         1sew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788473248; x=1789078048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNOnUP8DP8sduXUGrn2sIbhDUJ8SR/EkVRSFhfIKvhM=;
        b=c98fek23aH1r0iVSV7szZjSuYS6yaA9mSy9VsFT3Ey6/AMUiVaKq4+p6SbB6XBeK18
         qf73zgKV9ymNHQo4/YQ6HuStsQEbWYmTcl82xs/I3KZeqWBsH7U27yyejtAjyjsTPX5C
         IcDbILfOQMlae9au5loSbmy+H9zzEqUnc2R0MF0dv6QtdwDdpTM7fHP0byDrDITm0vo7
         flBRx7P4lricscl82LmiJ+jx7Rk7iCDvQNTXFdM2yMH+eS3sYNelwz0Tvvt5L5MyIMOq
         GIssZRlcAkP2XetbEwpFNDZsIhrsjjjU9ceN82G1pZ+tkRsDsQ1Svu7JXLz5ElDOlINM
         MfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788473248; x=1789078048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNOnUP8DP8sduXUGrn2sIbhDUJ8SR/EkVRSFhfIKvhM=;
        b=XCmtN+J2tP07oJW7A2rnsyv88KMRApXbuA9mx+w/gDLgD/vHj1OiaQNnMwERSInJf6
         jnX7wsXGmlgnXMkKnkTpB4rGVplelbcFEkaSdzn7h+KiQDyyWrS3Nk9xgfmhY2j5R6QG
         v9Nyu/QCg2z6hVqdOjwhUNifIBGeHy2ud6jmVJB+6uU95lStHsQbWDsno9WkLyNw8b05
         5lueQr/NTmcIPUqRqKOWICq6rUGIpCzdJZli94pWCeO8PUVWffR5k3KYozCCkm7S3mWo
         3ty8gZezR8D7AjNjRJF7nmaRj0KmiMU4mN4CXEtBq0DJcsIgFUB9mY1EDb8eZ4Vu5vJ4
         9PAQ==
X-Gm-Message-State: AFuF++lvuocaAzJv8lXQ/6VGtxL8UKSmTLZozwSO+kEtXZyc9ma2BQRB
	G3OQNmXMBrubUzxwbpWW1Qe+eM44+xWDzc2xo5/q86es6SwZoxhLclVk4hUnXguecUJADGvCmGl
	id1GJ2g4wlI0Add/TO+ws6PfhKlMSfcF03Iku
X-Gm-Gg: AYBFou0tn+8Qo3S+SJLL3j5914eArUzwtYImCVWOXwydhtD3D60slO4vXGVdmWn1Clp
	+Dt1faHXrlairTNEtPerlKfB4ier94+qLIuejPbfjhjBYgkkAAVFsRAoGUPC3QZfPFdaVJNc+WC
	Qrt92vzN2p5e8v+Dgmw8cU7bwTUcPdj6FOqSKY3k2Hk3dLF7QkPoOGOQTSJNMlE+VyFkCmYrkOX
	I5F+zCsoKiKspuDlynJZRKKP+PaFfegGxNL682UKMjqas52uqCw6m1F/NyDzyrDebPMMLY0RzRI
	KB472FEAF5vCWXmnwKpF6JWUo/2oCrwuaggmjxU5QZ2PLRoOiEwUyzLfrM1MqOUHGmPEM29CHnM
	P9cKmX8Lq8b59LtLrrJj7kBn5s1DQRW4=
X-Received: by 2002:a05:6402:434a:b0:6a6:32f6:c with SMTP id
 4fb4d7f45d1cf-6a7e8e9db23mr603446a12.18.1788473247803; Thu, 03 Sep 2026
 15:07:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <3c54e7e410438437640d56501a7a46fb0443427d.1788277742.git.mattst88@gmail.com>
In-Reply-To: <3c54e7e410438437640d56501a7a46fb0443427d.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 4 Sep 2026 00:07:12 +0200
X-Gm-Features: AcwNN1WMq5mdDlXQs8EsasWZKrYa3OFQJ6aOJB_7FN9FlqYZuSSL9vPQwudNh4U
Message-ID: <CA+=Fv5Rr-Zqs_nfssP0LsZd3x-=hCVybxXtOETDvR=1RGZTnLg@mail.gmail.com>
Subject: Re: [PATCH 02/24] alpha: enter hardirq context before looking up the
 irq descriptor
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> handle_irq() called irq_to_desc() before irq_enter(), so that lookup ran
> with the preempt count still saying task context and with RCU not yet
> watching.  Generic code called from an interrupt handler should see
> hardirq context, and irq_to_desc() is more than an array index once
> SPARSE_IRQ is in use.
>
> Move irq_enter() to the top of the function and add the matching
> irq_exit() to the invalid interrupt path.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/irq.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git ./arch/alpha/kernel/irq.c ./arch/alpha/kernel/irq.c
> index 4a6a8b1d5a8b..5867a1655045 100644
> --- ./arch/alpha/kernel/irq.c
> +++ ./arch/alpha/kernel/irq.c
> @@ -107,18 +107,21 @@ handle_irq(int irq)
>          * handled by some other CPU. (or is disabled)
>          */
>         static unsigned int illegal_count=3D0;
> -       struct irq_desc *desc =3D irq_to_desc(irq);
> -
> +       struct irq_desc *desc;
> +
> +       irq_enter();
> +
> +       desc =3D irq_to_desc(irq);
>         if (!desc || ((unsigned) irq > ACTUAL_NR_IRQS &&
>             illegal_count < MAX_ILLEGAL_IRQS)) {
>                 irq_err_count++;
>                 illegal_count++;
>                 printk(KERN_CRIT "device_interrupt: invalid interrupt %d\=
n",
>                        irq);
> +               irq_exit();
>                 return;
>         }
>
> -       irq_enter();
>         generic_handle_irq_desc(desc);
>         irq_exit();
>  }
> --
> 2.54.0
>

Going over this code again, I noticed what may be redundant hardirq
accounting in the existing device-interrupt path.

For type 3 interrupts, do_entInt() already wraps
alpha_mv.device_interrupt() in irq_enter()/irq_exit(). The platform
dispatcher then calls handle_irq(), which enters and exits hardirq
context again. Therefore, irq_to_desc() is already reached in hardirq
context before this patch. The patch moves it from nesting level one
to level two rather than from task context to hardirq context.

The RTC path does not have the outer irq_enter(), so the change is
needed there.

Would it be cleaner for do_entInt() to own the hardirq context for
both paths and remove the pair from handle_irq()? Or is there another
caller which requires handle_irq() to manage it itself?

I tested the patch on a two-CPU UP2000 with lockdep, IRQ flag tracing,
and sparse IRQs enabled. SCSI and network interrupts operated normally,
I observed no lockdep or IRQ-related warnings, and debug_locks remained
enabled in /proc/lockdep_stats.


Regards
Magnus
