Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1913375D5
	for <linux-alpha@vger.kernel.org>; Sun,  6 Sep 2026 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788684856; cv=pass; b=RMYiX+xtgiUP2xedHTgYLS1RDzeQVWrdLglcn6Ma/qKBVKY8oMB/V4T5tFEQhW7LERdAQCOmEOCYtBNQtQ1GMZbxeV2mnnPFEHdw8rcHW3BX6EZwFCwe4i5oS90Dl3fuSGI/DLDE37FvD1/YELRxQ1V8DYgtFd18QC6lodBhlAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788684856; c=relaxed/simple;
	bh=FtMUsQ3c+eU5+RWwNkmgMZ0NRIy/xc4bbMVT5fiF/aA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfzMOr30GA9LlPwux6L4QaCmZ3Wr17c8kfzgXLLVd9+aQPhNxbFca6xpBXl3/+UQKWvqR70FDZumW5uJiX4QmLaR6mq+WXVJiTkgKroMy0fEKFtxYjfadK7rGByP+K1rkwGz7wxZxqs13O7LBQOQvQ3K1H2zt/db3uz68j1jlzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9TizUcl; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9TizUcl"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso3587554a12.0
        for <linux-alpha@vger.kernel.org>; Sun, 06 Sep 2026 01:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788684853; cv=none;
        d=google.com; s=arc-20260327;
        b=XE3GcoWb8gJ4iM8oHSQYcCHactgZnSelnp5UWrhdQxsJAEkbKGU0azzPVRgZVxp8gx
         9M96xLn625VOprREjtRNdDFsovOniiKP7SUHkDsafzyrvs9562CG8HcVki0TAK7ovbTi
         1nHkoUEumE7/s9uAL084Nxu6gFDlyeZ+cF3cEK1TdP0ZJkPA9TQlMZm2HPVW6i4vRd54
         6nMLOZrkmK8B+UxQtQ0XN3kmVIo5Y3z25AY50Kit6sCwXvMsXuSNhLBX83mb2kfqz1Wp
         oVC0ZBa/AVuir8dQkO22WOG8uD2NCKNoYxp4RTAD7rhoOjdzQ1ncZkb5L2qIvx6cix1J
         go6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YbwXKI+GsB7CVjJT81Ck70VdlQI8PJuud+2raignSOQ=;
        fh=De/zvw19JfJyQokh8p9A0zi0F3Ses/csm6CTJcUod0g=;
        b=KKQlUZft+rcfTWAD6mDoYOZxnrqYkrRrM6EUWjdTA/gAkV7n/RPNC8xs1s0b+cjALr
         xqDVbn8Uq1en8eqGAYIbTP+4WkPu5d413IHfHaSFr6oCanYmJBBslQFI0QNVfWnp7ZZS
         +T/aRq6DJDjr690SfFpnzGEFYgM47wggIsYFyjjCqUAJG7VfdGqyYUUS1s7OkQLjArRi
         9v8j6mb0g1PDkLPGDSQlDnf7jTw6WSPe+y2tq2Iz6BiOkMfGKXu10pCZorAGHrjTCpsy
         jQP4WYIYZVn2SiV0AVEUixubpjAcUx75bUIrjuwl5D/XwV8DjAo3gFTYrEXuetpH3tD8
         ZGhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788684853; x=1789289653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YbwXKI+GsB7CVjJT81Ck70VdlQI8PJuud+2raignSOQ=;
        b=h9TizUclhnkWlz6L9RI1PZiRuKD2A6UZqzwrBT4mzNeaT+v6QRA7r4RC6B6gZ8t3Wh
         9VtwOqfAhpgtrz49eF7x0JDQVIA7Y5yAz2EtSNgn7VXyNl7Ae5C/5760Ex+EMEVj5vKT
         wsqDQbqjCurHiHAJ52WUifBMseVPi8eagaf+HpjFBX66AzHmp+b8jM1HyG/ijV2/r10G
         G9rOc6T+vGvLQ1Y8VSnBNUwrMJL3dEo8zYURQQcp9Y4fN7DP11TopTJQh+d1vbG/1TDZ
         3efGsk2hoO7KzAgaVfJfIIUSYqhs1BRoJOXBaEJyDK1QwxjbT4SudYw4FlGDaeBtQng7
         76eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788684853; x=1789289653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbwXKI+GsB7CVjJT81Ck70VdlQI8PJuud+2raignSOQ=;
        b=UmOoVYTUtFFwRZC8Jcg1vLFzdx9QMpVKoM2sNgJzLHX/g+T69cQzd+wpfL8KVaQhWL
         sMORmGmUHPF6e9A/MqGipLyAuyXYZCcsbaWXC1mEe18gX95686fN6mWc/TQzOLC0kD3W
         dHuFGJOUIdDUuqVzoD5o5zdBWO2JceOemSO0aUmapUM32RfQ0iXx31Arveye5qYdi34Q
         SQMgRDhTZmgdwxtafp+jLAOrCWzk6bJqjXpn1vut17zCg/FQZiinZBlASzqgd3LRwt7H
         bKScIjTSKl/CKikkLgGqtfOs/OjzXcp5eY/c2MLOxyISC/owyEF/YMOeb4JJ3rhJOaJ0
         YpvA==
X-Forwarded-Encrypted: i=1; AKwUvBzntJ3ko/8VJoGNHjKoTACojftppOIfC5cSLjvgOymiVB/IBAke/NkKtjT2zxXhl2F5ToRAyb2lGqhPrA==@vger.kernel.org
X-Gm-Message-State: AFuF++kMWJpqUXJHQ18/GzBMFOR+VeyUGyh3/hnQRgUSY8jmKOgV64Qf
	5dmch28CB/zga+BdNDVL3I080Wg8t3xODfn31XApks50YIWXhDd1/ZbriS96K3RZv31kfyoCMZu
	m0l2gbevOzIDoqhZTBYutLJzj00T5e+c=
X-Gm-Gg: AYBFou3FY7eYcV5+ELRV605Ou1nUM9qvGFs/6DausCxbtFdXUkHyq5hHnyMVndL+L0X
	8xDff35zvPd2g2/lQPLL7UCdBecF5a4ZAdXpiL7cJ5BE/uEI1i0vSPaNrgmS13Ma0sjr+OeEQ6q
	yNgnS68iKsTYULgIIGQVBqxgtzEPBnxPuKCm5e+C5+/Li2Gqy5YRI2cO6iaNx0Y4EPtwwlPGki6
	pPKGAuwSSQBoAFh14ATrtP53rZe+FuloKcul9uR4Khm/0BagQEy79SGIWlJfIGG6ol40sJb1fJ7
	jfXDL+E9GN+oHzq+YtxC1aB02hdNI8y2idiqM56xEJLXNXXaEXBWPDmpdMIhBiUJZTQSi+YXqak
	V/da3lZFQkkngKoQjHgLZztK0VC7uOjseX216UBD0bg==
X-Received: by 2002:a05:6402:27ce:b0:6a6:7882:89f2 with SMTP id
 4fb4d7f45d1cf-6a7e8f9623cmr5389972a12.17.1788684852982; Sun, 06 Sep 2026
 01:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com> <20260905-arch-kconfig-options-v2-v2-1-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-1-83e8245761a2@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 6 Sep 2026 10:53:59 +0200
X-Gm-Features: AcwNN1UUMEovJX_eDQLTzWZBni3pDHzUeZjtKQmab2rob-n71CYiUsiteVtNV_I
Message-ID: <CA+=Fv5SZRccPT=1A39uqucCcCahkMCeecX_FnnCt-q39o=vx5g@mail.gmail.com>
Subject: Re: [PATCH v2 01/22] alpha: enter hardirq context before looking up
 the irq descriptor
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Kees Cook <kees@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 5, 2026 at 9:29=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
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
> diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
> index 4a6a8b1d5a8b..5867a1655045 100644
> --- a/arch/alpha/kernel/irq.c
> +++ b/arch/alpha/kernel/irq.c
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
>

Since this patch is unchanged in v2, and we agreed to handle the
hardirq-context consolidation as a follow-up, my tags from reviewing
and testing the current change are:

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus
