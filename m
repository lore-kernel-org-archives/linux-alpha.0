Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C8451B190
	for <linux-alpha@vger.kernel.org>; Thu, 17 Sep 2026 16:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663592; cv=pass; b=BeO6SEvV0etfO6HwEOb5XJ+rGlPR0BeCw2U/Ac5Tre5Lq8qOWhUjMEina6Ez6xpOxYrm9o8vWwgTKAVyJPVSjLhSqy5RGjFcILZ0leOnciiSAnvftgdlnTB7CdFxwvSTATzW+tHFFozegycR/5o/FnOD9/qfKdtQ/BYe0cam8og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663592; c=relaxed/simple;
	bh=eYYWM3K0Z9Uro9HwA9hQ8je2naly/JqA+zNhzp9DrpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0wivZxCsFWMjXWgdO+SdNV4cO4ckHm4UTO0B2sjEZ7IAxLLcsP2IoEBoTC523fKi0rI2ZP4vrw/G7k2Ys+vWlXOtsGMBZP1jL8b4RKCc/UU+7JCNmHfpaSXtWzZ7lsNvH7Vy2vOt1dKx2tmVu5jd6Y6pF7FoRKnfnDjJWwv6no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZTTX6g4m; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H200DWtJ; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZTTX6g4m";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H200DWtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789663588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
	b=ZTTX6g4mYj0vlRM1lqShOllZvQyzIx2owUz//QT3uX3LDPwvQ13gLfFul3EjOEEnhQRL8+
	IgQ/7XdL20/z2P4kFnyzkp7ERWfZuLKKKkUCSaqJIXTrE/hkbCg/FbDPz+nqS3uMZjRKFl
	rRIN2A0cBVjwRsvMvG/YvP3IE3QaPqs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-DMTNH9RJNhuVoT7MulianA-1; Thu, 17 Sep 2026 12:46:26 -0400
X-MC-Unique: DMTNH9RJNhuVoT7MulianA-1
X-Mimecast-MFC-AGG-ID: DMTNH9RJNhuVoT7MulianA_1789663586
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c2945f5e851so95783166b.1
        for <linux-alpha@vger.kernel.org>; Thu, 17 Sep 2026 09:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789663585; cv=none;
        d=google.com; s=arc-20260327;
        b=gi6W8dhFgeAQD7Qz5HgxvIWisgobEOBoTV09wRIctW6MKqz+g8324ssJGDWvy5PEpG
         yxr9qOteusIdkwMS8t9n1wh68LrOmMQGZsTo2mQ7hxUwHWsIpCQ4lWUdVQI11a5JM0m+
         Wzw8peRRiuVln0NRVrkmKCBIFQb76vr3l7P8UOGZkQt3sU7YIyq39a4FHdxBeN9C+430
         pwt81PXX8lGX4lTlsu/x3JPlvoMt0OzGSRCep413wtOPid/vf5MZbQ+tfBefd4hjdG2I
         Bs9Nyqhsegv0+9B0cHcLPgr3qXiDYytc6FGbH3ZodObZuitpOq4FRmGMM2MwOd9+TuQL
         H6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
        fh=p60cxQ+Wy92xt1TgPxslCYnGZD+5e7UCuwi5owsunFE=;
        b=dwVb1UryxSAVZdTswQlBAIo+vLKGxrCK2sKegyFKsnOqiznIXt0itcC2kKa966r0gt
         8rZZ7KTh1e7Jxg93q5e8ibLdBDKRIRHyD7FiWPm9XcL45/c8NakQfxcmICb4Cwi1GXZc
         /jp+JnpUNrYPo6vjl99C9KCjLpxSTFeLsnhRyXlgoCM4QqrzhDsolQbRHaV10M6vcKGe
         KCxmwqeaO7EWoB8K/sN+NH9lkwp/20WQ+jX6X9iZ6OuwAtA58xh/jxhrvqdfBUjPmSjY
         SM5GpclZ4h5hFUwQN/DFy0yifcWeK3O2OamrPucbWKLF+rOppKvh8lrGW1BlqLW4X0T8
         1wIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789663585; x=1790268385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
        b=H200DWtJICF9QH6JHKN/nmm5tV86eiUouPYi7aafDRycxl6U169OnOUHb3rKCENsez
         +0RXYTDalsgbqK5ghOadRO1Q8ILIs3srTU1f8QjOTFAsX6a0xyq2jTukvLaLDFgK2T3X
         nqWiLKjVhJUi1FY9XS2W+MFSI/Yfh90CWlNqT5+QBG5KUeK+wYo2J2lpSvjs9TNMBe+y
         xQ+ptvfiXIvmOWzzcDpd4BoaAXwTWRZRRuQ6ZGdvEVm7fpOJRHQ6Y+CSZnj1bU6AMMRf
         3uQUC6XuxCuwpCc07yBmfv3xF+IN8gmARl5UVfqxlHr6om+vwq01CYDReMmqjLfntZU/
         SgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663585; x=1790268385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
        b=RAuHMzhwvTWHbquEd5FilvEggRNNYqynb7ZOrbvbYE7yPPBpavriJz7TJ8T2pCQGUq
         MsXK938KMqjxUn/2u7H2Svb5ZvAwp7bumCm/aDiWdY7IJY/BsYZ7RArDkgkqEuEd4jYw
         I4l9S8E1YsP7gPFg6J+ayo1SJTgKphKl+WEyA1WvkYIohZtv59hmtnZYwVs09wxxH9in
         IusMD+oEUzFUbdTqJmsbBpIFiJBHNnumEylA7NmcoiheGrh4sL7vWI+gzAcybJQlXfc1
         lFHNpX2u8NoE7Xh5cO82QlQadzEuBXTCG6kzAJiDd3ZgLecn4aisRO1w0E8u7CpkTEPK
         SNQg==
X-Forwarded-Encrypted: i=1; AKwUvBwkf7QumnrfDi0blxaZ5fSR99DNjGaPsPabHbOsNFn6tB7QfhfYIJnih8V4N61XsqmQDKKVq0iR5T4HUQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mWx0EGRN1PoznJuWONcJvTmCSJ4Zcxgg3rAYordxTZPQRAxYig
	2rNRCOJQCo2cEjYg7tjf+Av9n51WUVf9bLmLZJigayusfxMACv5FFwwRoPHjTGWni6oLttjOlvD
	LfDR9irzt1K0TBMOG3n4qWNsYV06Qthmk06fvr5i1J7oTDhpTaY9tS37skqpzKjAxyb+Dx8zJoh
	Q/CCM2zUDxUTYs3DMEpJaglBIVnhxjlmMw5bgyw9g=
X-Gm-Gg: AYBFou2Nd97zHxv5TITwFlS0zdjI0zYYkeUX4S4lwUqiFpBGcm/R0Ood3wQPKcsV1Ys
	UzDsWbZiOkLy07gvaHZ6yZjfv+jNXwiqrsDRXx1s2D1WEImxO3JqOqlBd1pJ9UY3ByO1HbIKCWe
	r6MWwgkk+QziSSdXNLo4OC3WDTUQ8sAippJD6neHxNNfwjscyNJyt67e5yA8YBoydzMvqVQ337e
	tscu8d9OlcZ/K9cgYD5A3shqp4H7BhdFrx4OCkjnQRd4sse9GtofAKynlM1mOvFpBrvBmgHJXiO
	DJI=
X-Received: by 2002:a17:906:4fc5:b0:c26:19de:9ad2 with SMTP id a640c23a62f3a-c29e53184f0mr504525866b.42.1789663585467;
        Thu, 17 Sep 2026 09:46:25 -0700 (PDT)
X-Received: by 2002:a17:906:4fc5:b0:c26:19de:9ad2 with SMTP id
 a640c23a62f3a-c29e53184f0mr504523266b.42.1789663585091; Thu, 17 Sep 2026
 09:46:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788351089.git.rrobaina@redhat.com> <b4ab47d2551d090520b4fa81a884b5988b9655c7.1788351089.git.rrobaina@redhat.com>
 <apkuNj1paR_GO3x9@willie-the-truck>
In-Reply-To: <apkuNj1paR_GO3x9@willie-the-truck>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Thu, 17 Sep 2026 13:46:11 -0300
X-Gm-Features: AcwNN1UTQywdGW9xqj12KwNHAYLGfDNNso402GZvP3WcYYwXGdDJ7Oiz7qML_cg
Message-ID: <CAABTaaCoNztwDUA-HPp4LaikxL4dxk-1bvCCpoZEGD4rnds1oA@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] arm64: pass pt_regs to audit_syscall_entry()
To: Will Deacon <will@kernel.org>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, paul@paul-moore.com, 
	eparis@redhat.com, sgrubb@redhat.com, oleg@redhat.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, guoren@kernel.org, 
	monstr@monstr.eu, tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:22=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Sep 02, 2026 at 11:43:37AM -0300, Ricardo Robaina wrote:
> > audit_syscall_entry() now takes a pointer to pt_regs and extracts
> > the syscall arguments itself via syscall_get_arguments(). Drop the
> > individual argument registers from the call and pass regs instead.
> >
> > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> > ---
> >  arch/arm64/kernel/ptrace.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> > index f743cbec1c3a..65532b2a8cd4 100644
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -2476,8 +2476,7 @@ int syscall_trace_enter(struct pt_regs *regs)
> >       if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
> >               trace_sys_enter(regs, regs->syscallno);
> >
> > -     audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1]=
,
> > -                         regs->regs[2], regs->regs[3]);
> > +     audit_syscall_entry(regs->syscallno, regs);
>
> Acked-by: Will Deacon <will@kernel.org>
>
> Thanks for doing this.
>
> Will
>

Thanks, Will!

-Ricardo

