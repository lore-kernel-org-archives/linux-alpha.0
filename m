Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DAE2E7635
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643516; cv=pass; b=FJ17wD6BZQvOIJY1/RmHPvzgaKqQyJI7PEsA6XO6zC5j9hQ9L9SMqSTqJjkh6yGuPczIXnohq5RaI3vCM2e6wPNyBY6ojsoRltfs6fMqJmVrzC4Z7RmLxaqsQHx19ZbN8ZrNwEOewnhHFMQRtdrQm4S0BPIkCyQOf8sPDCvLDsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643516; c=relaxed/simple;
	bh=tjv1Dx9mojDRn6/Nk7ipjEmycebqON8uLlu5/gd9Yz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVpUbBktAtPn+aSPISHDfKVQAsi+Ph/jxifd+Qbr07uFMrzZRHOYNYLO3OBQ+CJqpAz0VlISSKgp1IS/vJiVC7pZKMHV0w06RGbSjbZKl1OgIaRqfgrwi9qRQSLBqQ82FtUmanuuhuxJogeVMcVreC1HzXifHxTT/uW9IcLqOXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6aqqDQU; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6aqqDQU"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2e7131b94eso54861366b.1
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 07:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791643513; cv=none;
        d=google.com; s=arc-20260327;
        b=OjE2XOSOIABjTBYGcorbJfVfaj7ofVg3UVcHUK4U3MOwLyfFvOc2ZTPx159iqPWbrX
         o3fDwPpgbRV6DXOQwsx63kXQEg+0Zdv36l6bQzBI56NOPBl553B6Idepl+/CzVK8YsRi
         j1M3EoO5U4TX9Na3fxOrOyEAS7XiYNqn+uaCQTQ4W+bdRz7U655H6gUztoUtTI5Ed2Kx
         CYoDw0/Z432FjFRUp5CyKAz2Gs/DRYYQ26W/uloUzjHrwsgoMN7JzxfwYKu+P1TOy9Mz
         2d59EWVP572XFlm02b5VzxsOG6A/CUOTiLCt2v+PMUBOkQRGjT1zUzF6+Y+NUGkU5Cob
         ZelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q2mxpDjcvQMoudiaPiTz0H/o7koOGZZNjVrfjTTYbJ4=;
        fh=YXyNZZVpAYH0whXryjaciiDALT644Eqo09wv9iWEw2Q=;
        b=JjK/BaaVzWF9OUhoJv9Tg9tn1zO81ypiA/nb/16lcCg9CjIM26nntdhwwb7pt/FwsA
         YQY0IlKLm5tkxVhf5dF9/vggrWalQKdj6LNtxCytagO69EBB7s+LrRKdpZQAYXPr+vsj
         ZG4hI8ausIUX+QvnmlcKtBPe3o2/1EzjxL5AX8+rzsWxXoqMPnTnjkqwmiCzkUIDOmrP
         i+S2DV9APhQ/Zljt5QaVo4/V7ywkuoB7cmimDaVbqxObvVSNicBwoAOvUezrBnLn5u7W
         ynLlmpySngNRAAdqPa+Wc6najIGF28jOWjEifTF91+dZq3Q57+uM7F2BACwoCPJqoGbs
         +IRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791643513; x=1792248313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q2mxpDjcvQMoudiaPiTz0H/o7koOGZZNjVrfjTTYbJ4=;
        b=Z6aqqDQUaXEU0lszHXGrPXQOlHmmHoG73b6Ia0ccEwUOTRydMyX2BDTWJovRZLFeFQ
         hgP5OqTHKQV6IuNFAKqc8B8IM/60KU5YOFWm0ioLPV9eosu2nwjyflB7tPJSLDJrv72Y
         IbSKssCT2NTKynCL5Nig2Q3nMLkEs332mS+a2RufqpYX9RaJOxsnRfK8RhyFNdhaTMT5
         2gRvzNHVqB65xNR7mtBbD2ZDjJZ7J8VU48SqfQ/UXdVuxXhhy2CU9kcaWjBVPghDUdnp
         HllYX6kRBv+xJ11de2mbsVFcH0duzXno+YjBvaFQghWQF30xaxkRV9uMwSvmBGhuCx72
         IUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643513; x=1792248313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2mxpDjcvQMoudiaPiTz0H/o7koOGZZNjVrfjTTYbJ4=;
        b=nia6mLmae43/1vYsrU9kYSEv4dDAYOm3NZ2gq2E9JcBxuCFs1J3E84ElF8TbIYOaIU
         z7sgFzZWC39vmhq5gukl5IGjxiGoyXTr1lsJ4oHnQpIS99wRznNluZ6TYH0rlSANwTmG
         31p/S1J7aknOiB0q4ws8yUCUbnd34/Y/y2p5gzPsoA11oEpMHTUpwVgdQIfro5Uz4Lwe
         tp+SoNdh0/ttr+HczHrxYW6ePDCRkJbFFNf2C6oG/EEf8P5U5Ndy4kw4L2V6J3geUeZC
         IPgsSyIIZRbz7dormpDlBoUC5XYwq+/RHeFiKXZ/49n97q6SyPVBkyZrZg1bXTIPXvKW
         nbRw==
X-Forwarded-Encrypted: i=1; AKwUvBz9E62ArRqPnvNSykwSV+ZtoONT+L5FalKh35vC11A0UzbXgscJjbFddxQObFVAkp73DFERHdYmFehYjQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL2itLS4kSxbHOUuiTn6Nk6rGMZ34BOTwA2PNATM1GjtOXF5pxi
	VhGNj1xI9hMIfWiAQyUHLbiSGDenI7NIGmHGpsU6J0zpVb9P5OjtJ7WVf5uIKh0CuP+WKJvKoOM
	WgWpv7EPr/NgZfa9o3As6PiB/y4m6mz7ZAngh
X-Gm-Gg: AYBFou3v809o7wxOUicfZj4cUDs2RuT7NzYABO/OSAVju5Zs8LUxqM+CJZreSxrFw3w
	OpISTMvdZ7RRDIOMUAUfIxmRY2EMZACjkNRHT2LTLqKOWTHc6CSs1gCblVY36uZM8ax8h852RUz
	QWAMEpcC9ULOTt6Hzn/KO6F2vp93Xru8TQwXj3zHgL8pS3Eg0/c+gHqLGGUf1NLx940qNn3B8MW
	Dub0h8mUxQ/xDdCV6rpfGES5LpTTvSObp5ZPaZlgblKuI9yu58yr3tAGxkVtjvfkhRPqLOwt9bS
	YAfdjitT7+mk/sGfjf/ZqO173DB4XxS2GNXh1NBFpC5nyCvR8pqUg4ArAi1cWFErg81HKWqnWIc
	1cdxWInH3E3fnQp6AUB5QvHHdf2fH7uuYMF+G2htXeQ==
X-Received: by 2002:a17:906:4194:20b0:c33:62c0:d8d9 with SMTP id
 a640c23a62f3a-c3362c156abmr56389366b.4.1791643513202; Sat, 10 Oct 2026
 07:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009212501.971158-1-linmag7@gmail.com> <20261009212501.971158-3-linmag7@gmail.com>
 <CAEdQ38Fdbx=pZ5=HmCU0C1=O+gAePAQEtd7w3oGSUX-gkQM4EA@mail.gmail.com>
In-Reply-To: <CAEdQ38Fdbx=pZ5=HmCU0C1=O+gAePAQEtd7w3oGSUX-gkQM4EA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 10 Oct 2026 16:45:01 +0200
X-Gm-Features: AclHuK9mqKRJdBvtEL1hfjaeZ5ZcV0DH_B5dMgMu_ql8of-_F8k9uCJs7svH7Ro
Message-ID: <CA+=Fv5RdML-Y2K7LV6X=SOV+GAbkWdTttFpzEXM-0thXCUptfw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] alpha: do not skip TLB shootdown IPIs for
 kthread-borrowed mms
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 10, 2026 at 3:35=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Fri, Oct 9, 2026 at 11:19 PM Magnus Lindholm <linmag7@gmail.com> wrote=
:
> > Change ipi_flush_tlb_mm() and ipi_flush_icache_page() to test current->=
mm,
> > like ipi_flush_tlb_page(). A CPU that only retains the mm lazily then
> > clears its own slot through flush_tlb_other(), rather than publishing a
> > new ASN on every IPI. Once these historical slots are gone, the shortcu=
t
> > is available again if mm_users remains at most one and no other CPU has
> > taken or kept a context.
>
> ipi_flush_mm_and_page() in arch/alpha/mm/tlbflush.c still tests
> current->active_mm, so a lazy CPU allocates and publishes a new ASN on
> every migration rendezvous. The next flush then finds that slot, sends
> IPIs, and the lazy CPU clears it again. Nothing breaks, but with
> compaction running the shortcut is lost after each migrated page, which
> is the case this paragraph says is gone.
>
> I think the handler can take the same test as the other three:
>
> diff --git a/arch/alpha/mm/tlbflush.c b/arch/alpha/mm/tlbflush.c
> --- a/arch/alpha/mm/tlbflush.c
> +++ b/arch/alpha/mm/tlbflush.c
> @@ -66,7 +66,7 @@ static void ipi_flush_mm_and_page(void *x)
>         struct tlb_mm_and_addr *d =3D x;
>
>         /* Part 1: mm context side (Alpha uses ASN/context as a key
> mechanism). */
> -       if (d->mm =3D=3D current->active_mm && !asn_locked())
> +       if (d->mm =3D=3D current->mm && !asn_locked())
>                 __load_new_mm_context(d->mm);
>         else
>                 flush_tlb_other(d->mm);
>

Well, spotted! thanks!

> A lazy CPU then clears its slot and still does the tbi() below. Any way
> back to the mm from there gets a new ASN: ev5_switch_mm() sees version
> 0, and kthread_use_mm() goes through the next =3D=3D current path. I have
> not tested that change.
>
> The callers have the same asymmetry. flush_tlb_mm() and
> flush_icache_user_page() test current->active_mm, so a kernel thread
> that flushes an mm it only holds lazily publishes its own slot. That
> one also takes the shortcut in that branch, so I would leave it alone,
> but the changelog could say so.
>
> > Order the slot reads after the page-table changes with smp_mb(). On the
> > publishing CPU, the store in ev5_switch_mm() precedes the scheduler's
> > post-switch barrier in finish_lock_switch().
>
> The barrier there is the mb() in alpha's arch_spin_unlock(). The
> scheduler does not promise a full barrier when it drops the rq lock, so
> this is an alpha property, and nothing at the store says it is being
> relied on. Could the changelog name it, and the store get a comment?
> Something like:
>
>                 mmc =3D __get_new_mm_context(next_mm, cpu);
> +               /*
> +                * Ordered before any use of the mm by the mb() in
> +                * arch_spin_unlock(), when finish_lock_switch() drops
> +                * the rq lock.
> +                */
>                 WRITE_ONCE(next_mm->context[cpu], mmc);
>

Agree.

> The rest looks right to me. I went through the window between
> finish_lock_switch() and check_mmu_context(): an IPI there clears the
> slot under asn_lock, a flush on another CPU can then take the shortcut,
> and check_mmu_context() sees the zero and loads a new context behind
> the new smp_mb(). The three points from my v2 review are addressed.
>
> The fork numbers in the cover letter are from before the handler
> change. It would be good to have them again for this version, along
> with an SMP run under compaction.
>
> With ipi_flush_mm_and_page() changed, or the changelog reworded to
> match what it does:
>
> Reviewed-by: Matt Turner <mattst88@gmail.com>


Thanks

Magnus
