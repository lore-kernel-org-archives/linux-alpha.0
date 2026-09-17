Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9044E51FCB3
	for <linux-alpha@vger.kernel.org>; Thu, 17 Sep 2026 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663665; cv=pass; b=UWzPJhJWQoOzv4E+mtAgp5xium6Abze+ykgKaMOVOSuKurRCKlP2oHLBHAwIXOOm1Ik5sufbpguecnaS9CYb16e4/f4ZzJv7BvxzmtvPhsCAPPMKsZtvQR50q6Vqz7EBpSj7I74/Tmn1svbkSeaqXly/92+e6U28ncGagzyNrmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663665; c=relaxed/simple;
	bh=OXoyJpegabl0ocESy43SWOAVnutZsDrl9ix8aJurgKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lliT5WgNpBM48+Odnzu9aqN0NH7m/5FGGaMQ+mbuAElYpbGAoq+vNUN4o4O7ZmQGxGFfHzL3hD942/SHkFcdvXtR8JpQQo0ejswtd2InLF7xuemRj0i4rgsuDx2/GQih6RBNTIKsNGDDvBRBRRFmghCNvxg5UE02KFgnJKPXa4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eATgGJvg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dKGKnJD3; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eATgGJvg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dKGKnJD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789663661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
	b=eATgGJvglDB/e/XNDRrzgW5WKOMEpiB7LymnGtDf3t8cuHmDceHF6yh3kS+B4K+hNcO7ms
	+q7mwqmlMk4xTiF2LCi9CdNZxB2HVauHdvJoBImez5qV++TOb0SpSxrRysTv9oeZ9rPF7n
	RqubMsnYYyb9IE5olgw4ULYsdRg071o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-2MtAQdPnNNGGNpM5AJOYsw-1; Thu, 17 Sep 2026 12:47:39 -0400
X-MC-Unique: 2MtAQdPnNNGGNpM5AJOYsw-1
X-Mimecast-MFC-AGG-ID: 2MtAQdPnNNGGNpM5AJOYsw_1789663658
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a615ab0c06so1289994a12.2
        for <linux-alpha@vger.kernel.org>; Thu, 17 Sep 2026 09:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789663658; cv=none;
        d=google.com; s=arc-20260327;
        b=i2C3mku/EH2ILwaq+Zablf3TKYHrAMgCCxUOBz6TSiY5cFrUnioA4SnUOzDWEpmz4x
         sU1+t4NpTBjaIBXWGyeowLie5l2Kdf6x0z9t2PZx1471BhamMhjRjWZ5Gj3UDu/ffKBQ
         cGeNlMczU3zCZq3dnDf7seDhcqFQgb0B7TDIKb9wbaMRhJIeB2WsVRNRITY7yoP5YE4p
         OI2D0whKFyAdCdch9RJESA+UTT9cNnqqDalCLgLuxQ1DMgwg7qP8VyNX5WwQwwu3uwlG
         7p5tP8O0KcB3vAEu9tpCAXqIoZEA9w3W7PL5EczDRwaeEAFnxg0OAjj6sf1mS9FS9IpU
         Bn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
        fh=DPs8jws2vnsdsQxpgXqgwEabobH01K3nUayUf4sQWlE=;
        b=hsG+wxM1TDA8RAtEJTJVQbXjX2f+a3DSYOAT5qlhhN0MnFHheGFdeWPEdMGl4OuQ/8
         NUWA04k4jKr8BTwzIRjjEcLtWDzJu4Y4be9ewj5bnvaKj41h3yBIEdJPp41iW1vmpMA/
         w3Ga4Q7rvLwY1Pua6MyvFNpz+sIyQ617c54BJE5i0UeoWuGDG3MJ8VWIQXbJt3rIvzOG
         mGATTEcelCrF0aHCAGAOIkEkMW3PFsmCC2T/YjJAh3Px3w2rnShzaZInOEZhNrl8SJDk
         n1WWe/IehaTbzD+/OPqRAPC3jdneTv5eJE6zo3MiJJZ/LUvb2s3gEqBOoAE32NVFE5PY
         64hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789663658; x=1790268458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
        b=dKGKnJD38WiZGeDo9G7w61tJE8iA6+vSv3+VhV/+0BSAMznrhvPVqnGGKYQ4PLBA6I
         0x6n1uxTHhGhrERHIq4n2fwx7oBAGeJ0UH2xKBLCAHlcgYVJbSGdqkRY1bIrFojj6Vu2
         1xzNeV3ObTyMCYkO5MWwX8CYgFeVi4bWCgXmC4n+onP+bI4+jZOOu0utxMpLFY4bJHAr
         EnjiwLBgjs87fs6PxCZOmw1IRvyMdPyrIn9tJRRP/SWbFlBMtaD4DAF8BTLubz0gyLzg
         wVbhbv7VzQr/+jzG98EbBOOsFR5Vdnw7E8gs5KXES7CruX20+ZZXuAPdluYPVbk+dg7Y
         c55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663658; x=1790268458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
        b=ik7NZVJBeNu/zetc+PoIZDEzMy8QPfxzDzi6ixzWQMdX6zMlqfe/7BHQXf5lkN+Usg
         MWwTMUFnlN2KngSuuimMimc9hBKUSG5zCQC5Y/vIvw+5VyEvpxY28RjbO9c9LZ7ku48F
         9/IfBE/zR1uQcMmDNCW/zQN+FGPH3rEr3GHEKmwrWsvJ+nWIWdubkXijLKTGGKrOEr4w
         Exwd7eYA0LnsDLEOq/RwI7j9WDDf/IThcE9P3c64BKJYtFcHV4DMP2xOjndKnPpcRrxD
         6hBydOJ9Qg5G47hd63TrvVdXxZexVGsStHmz5PpDLK9dgnG/aP59ZHxu4SFSiPsF8mDb
         kgAw==
X-Forwarded-Encrypted: i=1; AKwUvByxM2NOCoHUXmS9c7QvNDSVTbuVnZlnoOcL159FYwd/1q2WNLajnG95/v7r9WiUnAsxo+/IyGUYtYvGcw==@vger.kernel.org
X-Gm-Message-State: AFuF++lIs9Z+ZDOd1XhcYLQg5hs6YQCkVUmhWoCAJzyESuzKt1yFPBES
	idtOkEoDuZo2adDf91oDkB3YaNDtjQKbIw2Iv30VnllBfRiw1m7QN4FVwxsK9FygKWgg786azBT
	F/f4947RFIZe5tGJnpYsVUyj37x+CGcf//B/GE5eOjnq5mB+SrZ5GZF+ELpWsf4PRRVAxBhQi6q
	nx6cXRfJ45zzl4e1PYoI3CRO2LbH9ISbrzTur9+QI=
X-Gm-Gg: AYBFou1Q8LiNjqNe7n6lJi5YK2NzG2qWS6rfO6u3CV/J24/YMJdsbaRvWsoG4Jb9PNL
	wXMW93MjjYm5ifqY8tPmNnRRJmtCHYvJ3eFdotAP0ueDaxhs3inOaqXDXzwdAcEjXgqTL72cjWS
	OwRxwFcLzTjtbphJb5yrD9Nf32qD6Z2PNs/i351QE2lpsCCB+8t9MAhUDvGPpJdV+KYyDizgFt3
	1hDOHxhhqcRvaU3e15nslmd8vop+4GGvorrvHK7JPDx9W8yuBNsPwCxSLYo6RoF7X1zWLOFv6w6
	mxo=
X-Received: by 2002:a17:907:1c29:b0:c25:fdbc:52df with SMTP id a640c23a62f3a-c29e5244c19mr627704266b.10.1789663657754;
        Thu, 17 Sep 2026 09:47:37 -0700 (PDT)
X-Received: by 2002:a17:907:1c29:b0:c25:fdbc:52df with SMTP id
 a640c23a62f3a-c29e5244c19mr627698766b.10.1789663657315; Thu, 17 Sep 2026
 09:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788351089.git.rrobaina@redhat.com> <4ada9fcbb93af8d5c1c9bfe2c83d94fc10bfe327.1788351089.git.rrobaina@redhat.com>
 <CA+=Fv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BLWOvDTt92t5Eg@mail.gmail.com>
In-Reply-To: <CA+=Fv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BLWOvDTt92t5Eg@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Thu, 17 Sep 2026 13:47:26 -0300
X-Gm-Features: AcwNN1UQ-9H3EW5aAPKYI2mYiHxV9kMvBFdM8jP3WAhZbefwH7qcxYHE69PGYDs
Message-ID: <CAABTaaAUBzp1uaLve2piMhEB1R5po5n5+Sy+U0mbbe70Ak-SUw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] alpha: pass pt_regs to audit_syscall_entry()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, paul@paul-moore.com, 
	eparis@redhat.com, sgrubb@redhat.com, oleg@redhat.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 2:21=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Hi Ricardo,
>
> On Wed, Sep 2, 2026 at 4:44=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.c=
om> wrote:
> >
> > audit_syscall_entry() now takes a pointer to pt_regs and extracts
> > the syscall arguments itself via syscall_get_arguments(). Drop the
> > individual argument registers from the call and pass regs instead.
> >
> > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> > ---
> >  arch/alpha/kernel/ptrace.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
> > index fc8f6cedbb28..8a39c0473297 100644
> > --- a/arch/alpha/kernel/ptrace.c
> > +++ b/arch/alpha/kernel/ptrace.c
> > @@ -496,8 +496,7 @@ asmlinkage unsigned long syscall_trace_enter(void)
> >         }
> >
> >  #ifdef CONFIG_AUDITSYSCALL
> > -       audit_syscall_entry(syscall_get_nr(current, regs),
> > -               regs->r16, regs->r17, regs->r18, regs->r19);
> > +       audit_syscall_entry(syscall_get_nr(current, regs), regs);
> >  #endif
> >         return syscall_get_nr(current, regs);
> >  }
> > --
> > 2.55.0
> >
> This doesn't apply on top of my "alpha: enable GENERIC_ENTRY" series
>
> https://lore.kernel.org/linux-alpha/20260902184058.198679-1-linmag7@gmail=
.com/T/#t
>
> That series moves alpha's syscall entry onto the generic entry
> framework and removes syscall_trace_enter() and its direct
> audit_syscall_entry() call entirely - verified with git am against
> GENERIC_ENTRY applied, it fails at exactly this hunk.
> You don't need a replacement alpha patch, though. Once GENERIC_ENTRY
> lands, alpha's syscall entry goes through
> syscall_enter_from_user_mode_randomize_stack(), which already calls
> syscall_enter_audit() as part of the shared entry helpers
> (include/linux/entry-common.h). I applied patch 1/13 alone on top of
> GENERIC_ENTRY and confirmed alpha's entry path already routes through
> the updated __audit_syscall_entry() - no alpha-specific code needed.
> So for alpha, you can drop this patch in the next revision rather
> than rebase it.
>
> Regards
> Magnus
>

Hi Magnus,

Thanks for reviewing this patch! Ok, I'll drop this patch from the series.

Thanks!
-Ricardo

