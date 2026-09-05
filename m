Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07CD440625
	for <linux-alpha@vger.kernel.org>; Sat,  5 Sep 2026 08:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788596908; cv=pass; b=jOel+WK4uFtpxuCoCjQufVHeRitx0P5WUAkY/VE3WVKp4b6+zowKIZTZMNVUk74HAEzsg7/jHLqHw5ebDia5Z5R5Z1d3G2P9BqVlIuV0day8T+QkcO35fIhY0WFr0NOrolAqOrEWqdTbzIN5+QGS9vL8dfbf0BZ0ZIVWGCufMg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788596908; c=relaxed/simple;
	bh=dEeeQ/Ld/SPbrHHzTAdy/x/ViwYuRifyJ/MhYnT2RHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lD9yv/7+0DTakgj9tf3pJVV3EmlUr0jxt9tR663xOdselTRsH2ypKQYze7duAqPGfsWAanRXguyuNAfJthoAEDwgZpTivN+/CMa2mm70DbAFaJFWMjgn06hCuzpp6KLW2WVWB0eTPHRUMofIRDIL7zywKUmSfxEsRTAOpS0N26s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qySph6hI; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qySph6hI"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a668ce86abso2858472a12.2
        for <linux-alpha@vger.kernel.org>; Sat, 05 Sep 2026 01:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788596905; cv=none;
        d=google.com; s=arc-20260327;
        b=COEfMQ3+wuuVyjcVi+yjxik48HXkoUjduBEv6SlCjYT9+3CTwI3zBaJc7lBRkA9hxI
         UKEXzl2cqgLSiDMiG6lkGlnkD2WsrdWoEqmUla6sLX/rkAeU202h5tm2fDTBK2cXcht6
         Y+gy6YrWvlrDRY2auYx8PgJcVkG5tgvdO2rcv+Bj3w+bfQonbE8LrMbrtTInd9TE7osa
         PBL9X1iB5DZN6RUBaCrmJuB1Yuw1D8RZc4uxJ1Rg9nfIPbejMwC4Wo7rhUlxC6mxORUS
         KvmFC44nq8maMaL5p9Gbuofs8rW0K/yok80uSO8l/ieLiMVGht17Ma0/ZFcl9Khuyq9L
         ZtIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJsqc6z3AKrTn+Z6km/q3e7TQ2SEpwjOBKcD5f+R56o=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=WnQPVt2s6yNC1RYaOJBkx0dO2JMi7osqxUCC0Bd1mtQZokdo5OaOME3uwhnduOlyYq
         0y/fpKml4wWND8BQnOG+AZi54BfWJ4EBXnXf8vDa9m3Fl1Jew1dv69BKWxvMI/tA1Ksx
         RQjHfOlwKv8jfAIcJDCRdQd6KpWaOPX8Q35ki8UizItykjElfY3E299cJrclbkZL09EF
         yGo2JijPzsbg6hEVAXTk2vzDpFA6dbM+AmAtgrDNzWmQTQ9jH9+pbTbht/71B88AT1as
         xCs6T2uPtur+xvHeU4ehLDIothMh1p0l6D3pgbltVqbGsQIDHHMUz5H79Psn4OMPlNsq
         3iDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788596905; x=1789201705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJsqc6z3AKrTn+Z6km/q3e7TQ2SEpwjOBKcD5f+R56o=;
        b=qySph6hIJMh1hwDCisHljm/57onXP75IoeoS/zVa/BL8FDDCIHmKl44yARfFOY4/pm
         PjvF6RHuFHy+JLhrsoNTy7Izgq6XXYoOwpIo+/gCNsMRVLrV5azjgQdlntCSASMKKzqS
         h8BD0X1MkVDzm75PdkHado3iNtmDlzP86vvLKFGVMDiB2JmQ/9xBJqhgWEhInrZgsMV2
         TEaq4uE5Iby8FKDdEYp3Bj7HPnu/r4mJhqKhOvVnzfP+ZKsI+CztKF4o7t0caTxH712K
         KoczdQHgOCyg9QkFeSVivsBnGms/tMTPPVlb899cpjx7JZJPRtnUOA9wqQBEeonyQvv9
         HweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788596905; x=1789201705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJsqc6z3AKrTn+Z6km/q3e7TQ2SEpwjOBKcD5f+R56o=;
        b=lzp/4BbvvxYNut1tL2XvaLLWVbOyxxyl4ha8bW+iqeI01mJaUJR+PFrq2acXIOPUjF
         Gold2yV7DlHoNZeLaFgLdrf7sFgczEFLqnSSNVeSTS7tKj1Oox7JpcpzvXTnnRatKo1E
         ds3UneYce9wnLtCIInDZ5HVpbfhc8p7TxociNQGSerclipLsErWGzJqsbNHPQVKYQD1f
         tAqhAathowN1PgO4fLoXzJ4kNx0VtBGrF+o9RZh7deA4aTFTbJG5NBhES3Uq7HiOO9Ac
         ouhaQZic2WV8An1srTlEm/DixT/PHHmMz4K5nK/O23lRBJWvYF8DzOchE82DJU7l8l91
         Aw9Q==
X-Gm-Message-State: AFuF++mgAZGDXg/e+FOSXBV6vbzLOpoeHV0Og12tpUnUPmdQSv1qmKQI
	kYBNZDI852fpHB8TmeOfu9WhHWDFOztzGPAzgV81PXg1vJv6zzJ+A+xS1YGx8KnuH10A8bGjVw1
	21YxPCLNZa1tquqQBKE505vICiXLfnu7oRnlx
X-Gm-Gg: AYBFou2IGiBs615BsU99lnCbEx2/QvECkcuq6exjcVfjDV7d0dTEC/pkKIcxEa4w2lO
	0201Gj1zaf6U26niIhBA7wUqxEIeVl3QsVn/hKrcL18JIQlfUmy+vQPMvgwyhw7bw15Cf0GRbF5
	AgdgQOsqwjXw+s0tVYsLOq80SlKVuLUgDqMEJSFlKQPxpkYDlaHpjhX1ryaJuk1miDvbOG9Wzpk
	A6MWQYh5vWiXhhiL1zPDoz1DVHbTGp/pUDZIKHH4+YG/0W8WU40F1waZto3CY/5niPAmU5Ssj22
	jmC6vKIuxlyTmDFBIeJBtsEBUZVOcZhlCij4uDbxLmjS3i5Q6dTPWHlQK8ZLds2xGRJdJ/Dy1Sg
	3RP2EnOawTal4IM/myEFHzqNQ5Xvsdbc=
X-Received: by 2002:a05:6402:51ca:b0:6a6:58e:f84b with SMTP id
 4fb4d7f45d1cf-6a7e8d6432dmr6902620a12.9.1788596904544; Sat, 05 Sep 2026
 01:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <3c54e7e410438437640d56501a7a46fb0443427d.1788277742.git.mattst88@gmail.com>
 <CA+=Fv5Rr-Zqs_nfssP0LsZd3x-=hCVybxXtOETDvR=1RGZTnLg@mail.gmail.com> <CAEdQ38EUiwdoxF=JvdrDEfs_mmKexCvF9Mp8KgFPpxKrxi24OQ@mail.gmail.com>
In-Reply-To: <CAEdQ38EUiwdoxF=JvdrDEfs_mmKexCvF9Mp8KgFPpxKrxi24OQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 5 Sep 2026 10:28:12 +0200
X-Gm-Features: AcwNN1VUf-bdQUHqoA0JOgHzWD7r4I4RMu_zFbUkrcsnqBxfZvADcFjdWESqYbw
Message-ID: <CA+=Fv5QBYRWZMXfQkns7knHmq_StRuCeKFh_2hvyphOv=tURDQ@mail.gmail.com>
Subject: Re: [PATCH 02/24] alpha: enter hardirq context before looking up the
 irq descriptor
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 5, 2026 at 4:43=E2=80=AFAM Matt Turner <mattst88@gmail.com> wro=
te:
>
> On Thu, Sep 3, 2026 at 6:07=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com=
> wrote:
> >
> > Hi Matt,
> >
> > On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com>=
 wrote:
> > >
> > > handle_irq() called irq_to_desc() before irq_enter(), so that lookup =
ran
> > > with the preempt count still saying task context and with RCU not yet
> > > watching.  Generic code called from an interrupt handler should see
> > > hardirq context, and irq_to_desc() is more than an array index once
> > > SPARSE_IRQ is in use.
> > >
> > > Move irq_enter() to the top of the function and add the matching
> > > irq_exit() to the invalid interrupt path.
> > >
> > > Assisted-by: Claude:claude-opus-5
> > > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > > ---
> > >  arch/alpha/kernel/irq.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git ./arch/alpha/kernel/irq.c ./arch/alpha/kernel/irq.c
> > > index 4a6a8b1d5a8b..5867a1655045 100644
> > > --- ./arch/alpha/kernel/irq.c
> > > +++ ./arch/alpha/kernel/irq.c
> > > @@ -107,18 +107,21 @@ handle_irq(int irq)
> > >          * handled by some other CPU. (or is disabled)
> > >          */
> > >         static unsigned int illegal_count=3D0;
> > > -       struct irq_desc *desc =3D irq_to_desc(irq);
> > > -
> > > +       struct irq_desc *desc;
> > > +
> > > +       irq_enter();
> > > +
> > > +       desc =3D irq_to_desc(irq);
> > >         if (!desc || ((unsigned) irq > ACTUAL_NR_IRQS &&
> > >             illegal_count < MAX_ILLEGAL_IRQS)) {
> > >                 irq_err_count++;
> > >                 illegal_count++;
> > >                 printk(KERN_CRIT "device_interrupt: invalid interrupt=
 %d\n",
> > >                        irq);
> > > +               irq_exit();
> > >                 return;
> > >         }
> > >
> > > -       irq_enter();
> > >         generic_handle_irq_desc(desc);
> > >         irq_exit();
> > >  }
> > > --
> > > 2.54.0
> > >
> >
> > Going over this code again, I noticed what may be redundant hardirq
> > accounting in the existing device-interrupt path.
> >
> > For type 3 interrupts, do_entInt() already wraps
> > alpha_mv.device_interrupt() in irq_enter()/irq_exit(). The platform
> > dispatcher then calls handle_irq(), which enters and exits hardirq
> > context again. Therefore, irq_to_desc() is already reached in hardirq
> > context before this patch. The patch moves it from nesting level one
> > to level two rather than from task context to hardirq context.
> >
> > The RTC path does not have the outer irq_enter(), so the change is
> > needed there.
> >
> > Would it be cleaner for do_entInt() to own the hardirq context for
> > both paths and remove the pair from handle_irq()? Or is there another
> > caller which requires handle_irq() to manage it itself?
> >
> > I tested the patch on a two-CPU UP2000 with lockdep, IRQ flag tracing,
> > and sparse IRQs enabled. SCSI and network interrupts operated normally,
> > I observed no lockdep or IRQ-related warnings, and debug_locks remained
> > enabled in /proc/lockdep_stats.
>
> Hi Magnus,
>
> Good question. Yes, do_entInt() should own irq_enter()/irq_exit() for
> the RTC and device-interrupt cases too, same as it already does for
> IPI, machine-check, and perf. RTC and device-interrupt are the only
> two that don't, and only because handle_irq() does it internally.
>
> There's a wrinkle. A bunch of device_interrupt() implementations call
> handle_irq() in a loop over several pending vectors: sys_takara.c,
> sys_eiger.c, sys_alcor.c, sys_dp264.c, sys_cabriolet.c,
> sys_noritake.c, sys_mikasa.c, sys_rx164.c, irq_pyxis.c, irq_i8259.c.
> Right now each of those handle_irq() calls enters and exits hardirq
> context on its own, so one hardware interrupt that demuxes to N IRQs
> does N enter/exit pairs. Moving the pair up to do_entInt() collapses
> that to one per hardware interrupt, matching how the
> IPI/machine-check/perf cases already work.
>
> I don't see anything in the per-machine device_interrupt() bodies that
> needs task context before the first handle_irq() call -- it's all
> vector decode. But I've only got one Marvel box to boot-test on, so
> I'm not comfortable folding the reshuffle into this patch without at
> least reading through the other machine types more carefully.
>
> I'll send it as a follow-up on top of the series rather than reworking
> patch 2. Easier to drop if something turns out to care. Let me know if
> you think that's wrong.
>

That sounds like a good plan, we treat that as a follow-up once this
has landed.

Regards

Magnus
