Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794678404;
	b=WIEi6fwmoT7EUICvyZ1H++f+HpYqc5FMQIjrFqkaY7q6cE9lGX6dVU7KTz3EUMqHEsss
	 ppTAMPpAx6+VlrElpMhtjVty5HNZgxuAGLQdULgsgKnX3oz/VP4D8e6rkw3LPrvZQ65QD
	 feo6fAOwLOzn19V0StxqvTXiIz6+Kdejk//b0Pl9imlihRoZyWcjfLlMZVecpHum7ZszR
	 8C0Lpuyk8F02r9hXyLaf6TMhFymN9IS5hjCs80EFlds02T3Ci78f/sQcOJoeRV1XeuHBA
	 XOO/RVpypn/5gM8t7EiVfX5JhIEn7+xIiwQgzhOIAt0ZXPPI7BoHuR1diDP7p1qdCpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pYqZh4XlswEo3j+2ZthYHRt3Pfc8EeD6RAuf8AYBUIc=;
	b=bUuh1em0O/RlATIRVeuZtlWuUBnU7Als2GHHIlOD27AVVzRwQTQcCEDPFI7+Jb1SlpDR
	 RBKNb/J5xcYnjFDJwXu7bsQAoQmvTFPviIQqc3S33YVHdh3A091BPfJKTCJrgfOv2xzF+
	 yNcLmYFdKkp/OotBwtrLNBZ02fFo9MOtbFoLBtaDK687VGO1qL1qApp23ynzRVbDihzzF
	 D8wETImh1bP440T+JMmFuBVL5IennK/g7wM/6dCEcDJI3ZISIcCyZCpjRCIBTooVSD6aY
	 vpEk7zVdVKvaK/kMgLGaYZuG3ZDHS/tCKZ/D22laQJw8VRDb7AVKeZVXr0COmiXAV8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8AESTwR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C874606A329
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 17:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C874606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8AESTwR
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so3752282a12.0
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:46:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794678403; cv=none;
        d=google.com; s=arc-20260327;
        b=NaXcqnpF5QcZbHUR8SEuF34gRwj+5NOQ2WzRhCDEMSV/uWpiiBj+UJcCaDI8RZzEGN
         rdmEFC0U2wi/wVNH+bENFVcrbx+G2JftdnCs7irIRbCsGL803ZeNN2rHj/fK/M4F1Djp
         qi5f4j38LilW4JDiEmrnakt7wpuswETe5S3OeZZvcYo1NbcmTmIG2sb7r/8E51D1D4Xq
         uUGtCsvGWNKQaj5YvzObF6APNXTxPbohUd/pnZakfdpEmFE/9Vd8GkxNG0yth3M9amt/
         I3kDRF8CSbvNoz0vP2GqKUQ9kYo4e6yIOmoExxSqXAE+3rB9X7Hy9pKJI0jk3VVpg5Je
         OY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pYqZh4XlswEo3j+2ZthYHRt3Pfc8EeD6RAuf8AYBUIc=;
        fh=/+MCB+EmLSFuqmscT2EFpl2cGxdNmgEt6ujvDJAZmCU=;
        b=V3GYstYat9bjASEm+fwtcFQpq+H+Cod3OkytvCMtAPb/hok34Nfu8ppFcg0NIHSF6c
         DI8orIBfuNx0FWgN8VjoQTnhjLbJgD9HRxGjuhunmwzThyFa58nw1p/bfzbQEaVdHu1f
         ein6OHEIg3bjmxU1ZGWZC5bzfgnkSk69hog8IhJ3h/CniPGer2cOhooN5bZTY8mGuIz5
         KDwvq5kFQ8xUF0LwAYcsYzYdBod9bwK+10CADKSe4kxqdQuYDl7F4JG7ZtziPpvt1mZ/
         ncpIB5NbTaikAAKYzDEvwhxGrtGajmlhthurnZdMYFFerpL9MuGqZUwH1usiG09NkFgG
         j8iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678403; x=1795283203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pYqZh4XlswEo3j+2ZthYHRt3Pfc8EeD6RAuf8AYBUIc=;
        b=T8AESTwRSBK4+s5Y1XiUDYreObOu9Sg26aZfY0inbg0QZTuP1DIYuqbw9iSECjZK0Q
         t4PO4P66xOEyHQBO6S8KvBCAbny/2vO/bjQc8W1zBgkUD0Gi8CsBuLheNZKVBkriXp5V
         awxQ3k/2MLtrmFc/un7VHYTL7u090Ze77kdGK0peZap+aQgFPG4cvQaWv9iycB6naqRU
         VNZmD7nQMw5i4FJUBVAHJtYXP1TL+cWGOr8+9sIhGx6WtQoqH5RSAh6ByXqJ/9cPBSb7
         ydhBXwt+MgLQqzK80C6iSLUsz4cQCJ6DfjiBAC2iR8Fe+77Ze+21NO1MiRSC/VtzVUAQ
         odNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678403; x=1795283203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYqZh4XlswEo3j+2ZthYHRt3Pfc8EeD6RAuf8AYBUIc=;
        b=wpDS+c3CGCYJgmREzF8yoZpC+A+oR/kInLbj3tKkL9RXjA4VDk3EtVd/36TZndhPat
         vRiaupd/dbnmbTH8d8D75nnrGX0kNMTaA/uFlb/le8kXmEn1nMLzv/3VuVcFfNBxSu9d
         0VpxgRwb0DVmrGTr9e02V50voklSFjNEsHlwgZTgTiluIE9cLlAadONOE6LXRnsMmc8I
         FdA+DDsZ0hFINxVv/vUPeGVDTnag+LZ/qkzZ8lYed0phIXGQ2InIT2Jsqd6LKi5Tp37O
         6TwKB/ZpZwEJm2nopwKnkxwEvgvAscaR9C/ETw2OJ7yFu3BcTZLptqUTGWx7uDympzn1
         NDBw==
X-Forwarded-Encrypted: i=1; AL+hErE1MhsJxFAE0eSJ9Owz7hDwMh1Ci+v4qWVDDsS5s5QeTaYGINYDJk4cgccj0dtVYLvS2lALglxsbW+QCw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+6uQX/qmA3kEecs1JfVkKO30lP47dWpNFGF7tz4hM55HYh+Pn8
	rTrkcD2ONgCk4SL/ZT9uoFwsWUUQJNvZN0BBok62oawXPVqwKOhpzxuutVpdtQRlgif41JWhc5s
	rDdGxNjFpihub9MFJn/+GpjJOvpBVkEI=
X-Gm-Gg: AYBFou1Gd1s4WALFpsGQwuwzTQn+o+pyKbLiIh9IN03Xi9cI6k0MZ+HokyIpdSWDt6W
	zz+O9+JT11mLXFYVifJLgb0Cqf/QFx4yUUKFe7vFO2ChFnp8F6sEYDPS9Ti8+vcGcGsvPRAQkB0
	njrKpGhODI0g3at9J7ifMV176Uce1Vu7tzNvkurlJ23a3yxzK6a6NdwkkiW0b90t9JyMa9DDYIE
	LpsK/E0WANYvWTsx3KXYG8iOmWbe8/sobd5c7+9Sri1yB7QnifBBtYF/i1Au3unHfO/5HguqL1k
	U751TZwreCL21qnx8pR+rn+YHBBvrhPOx/7Pxe/VMv0uir5Gq4W4nXI+DblZqdgL+cSJ7lSyMgb
	SPP2qWrtnGY2fClZfeP3ngLJM1Ly6+xt0Iqti+xBBOHLUczku+v8SXdFI6f0HFdSMOyDEvJveZ0
	7ad3GZzoYN3Dk+vulJFWZvCrs=
X-Received: by 2002:a05:6402:42c6:b0:6b5:76be:be54 with SMTP id
 4fb4d7f45d1cf-6b7c0c6fac2mr5086521a12.35.1794678402519; Sat, 14 Nov 2026
 09:46:42 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114094826.1282965-1-linmag7@gmail.com> <20261114094826.1282965-2-linmag7@gmail.com>
 <CAEdQ38FMuOzdFkU4RQFhZJkSiczzVLu-eBiZmjwpiUUahDvjCQ@mail.gmail.com>
In-Reply-To: <CAEdQ38FMuOzdFkU4RQFhZJkSiczzVLu-eBiZmjwpiUUahDvjCQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 14 Nov 2026 18:46:30 +0100
X-Gm-Features: AclHuK_W6ympXicZilhjs-sdGjEUv0-83IxfodgP5fKhvBWmh_RZR9-nRq4qQUw
Message-ID: <CA+=Fv5QzBe_+k9C6ThbVV+Ou4My6Kr9qjFMsf2c+Bkex5_D+3g@mail.gmail.com>
Subject: Re: [PATCH v3] alpha: Add support for HAVE_ARCH_JUMP_LABEL
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Nov 14, 2026 at 5:54=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Sat, Nov 14, 2026 at 4:48=E2=80=AFAM Magnus Lindholm <linmag7@gmail.co=
m> wrote:
> > diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
> > index 850f1265cc55..4088cd56866e 100644
> > --- a/arch/alpha/kernel/Makefile
> > +++ b/arch/alpha/kernel/Makefile
> > @@ -92,3 +92,5 @@ obj-$(CONFIG_ALPHA_TITAN)   +=3D err_ev6.o err_titan.=
o
> >  obj-$(CONFIG_ALPHA_TSUNAMI)  +=3D err_ev6.o err_tsunami.o
> >
> >  endif # GENERIC
> > +
> > +obj-$(CONFIG_JUMP_LABEL) +=3D jump_label.o
>
> Nit: this would read better up with the other unconditional obj-
> lines near the top of the file rather than trailing the GENERIC
> block.
>
> > +#include <linux/jump_label.h>
> > +#include <linux/kernel.h>
> > +#include <asm/cacheflush.h>
>
> Nit: checkpatch --strict suggests <linux/cacheflush.h> here.
>
> > +     if (WARN_ON_ONCE(disp < -(1L << 20) || disp > ((1L << 20) - 1)))
> > +             return false;
>
> Thanks. The target is always within the same function and Alpha gcc
> doesn't do hot/cold partitioning, so I don't expect this to fire, but
> it's a cheap safety net.
>
> > +static inline void alpha_patch_text(u32 *site, u32 insn)
> > +{
> > +     WRITE_ONCE(*site, insn);
> > +     /*
> > +      * Alpha needs an I-cache sync after patching executable text.
> > +      */
> > +     flush_icache_range((unsigned long)site, (unsigned long)site + siz=
eof(*site));
> > +}
>
> On SMP this is smp_imb(), so every key flip IPIs all CPUs once per
> site. That's correct, and fine as a starting point; batching via
> arch_jump_label_transform_queue()/_apply() would be the natural
> follow-up you mention in the cover letter.
>
> I applied this on 0b4cadbe7c39 and cross-built an SMP defconfig with
> JUMP_LABEL and STATIC_KEYS_SELFTEST at W=3D1 with no new warnings. The
> patch sites in vmlinux are the expected 0x47ff041f nops with nearby
> targets.
>
> The diffstat in the cover letter is stale (63/146 vs. 65/148 in the
> patch), but that doesn't matter for applying.
>
> None of the above needs a respin from my side.
>
> Reviewed-by: Matt Turner <mattst88@gmail.com>

Thanks for reviewing and build-testing this. I'll fix the Makefile
placement and cacheflush include when applying it, and refresh the
cover-letter diffstat. Batching can remain a follow-up.

The boot selftest and 30 module load/unload cycles also passed on
my three-CPU ES40, including cross-module static keys.

Thanks,
Magnus
