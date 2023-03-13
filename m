From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH v4] alpha: Clean-up the panic notifier code
Date: Mon, 13 Mar 2023 16:39:55 -0400
Message-ID: <CAEdQ38HS=V9QJsdSoccos02HGn4=QKobkci=BTP9tc3=RyzUFQ@mail.gmail.com>
References: <20230220212245.153554-1-gpiccoli@igalia.com> <ba225af5-3729-32a4-318a-c1c4b8e8b37a@igalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678740006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZaCV0WUtBPAAadzUTN1+MYnU8j2LSiKAw9rROH/ouw=;
        b=JtofO/o3gg0239JS75f2bHGUOx1O8xSzUbXwHyM7gEMl2D9ouJPoN7pkWICQjgIsfS
         /sU0y2PVmDml/f89PZu0LDpGvuh11lH4itW1jbqx0Lj9YJrCi+ti1j5t5b1J98G9M3et
         4CwuuASQK/mhg/ASaJ19PxRvsyFEmbfhQhAycjYkwKT5SNNkYa81U+cQo10onwGGadMr
         ejs4VvRTPoax5lWdECcehOP1UpCWUCuUnK0k4ShB5wMYQbzA1rKoyzAVwAP2tr82V2FA
         Foi0LwqnkGmOu1Be+shGE56Q2AB9GineC2g0BBDdQ1QUzEGXjMfbGnWZkPG44FNHirNY
         V7xQ==
In-Reply-To: <ba225af5-3729-32a4-318a-c1c4b8e8b37a@igalia.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, Petr Mladek <pmladek@suse.com>

On Mon, Mar 13, 2023 at 4:18=E2=80=AFPM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> On 20/02/2023 18:22, Guilherme G. Piccoli wrote:
> > The alpha panic notifier has some code issues, not following
> > the conventions of other notifiers. Also, it might halt the
> > machine but still it is set to run as early as possible, which
> > doesn't seem to be a good idea.
> >
> > So, let's clean the code and set the notifier to run as the
> > latest, following the same approach other architectures are
> > doing - also, remove the unnecessary include of a header already
> > included indirectly.
> >
> > Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> > Cc: Matt Turner <mattst88@gmail.com>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> >
> > ---
> >
> >
> > V4:
> > - Rebased (and build-tested) against v6.2.
> >
> > V3:
> > - No changes.
> >
> > V2:
> > - Fixed rth email address;
> > - Added Petr's review tag - thanks!
> >
>
> Hi folks, just a gentle ping.
> Lemme know if there's anything I could do in order to get this move forwa=
rd.
>
> Thanks in advance,
>
>
> Guilherme

My apologies. I meant to include this in my last pull request.

I'll take it through my tree.

Thanks,
Matt
