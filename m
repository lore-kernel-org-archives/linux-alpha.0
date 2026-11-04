Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793752864;
	b=JQjwi5JaleAFkr6i5DvoHJWGQYts9WrF+WfV4kHhfRTpwKLxgG+0U/MDahdtOP3DM+xx
	 580BWWZTZ3/W3XsGRluiDXNZqDGkpxAeiGtLVIQ0YjnFMtpO3yEoQ1vbyFsrNpVCHFj+I
	 4Elobzmi3MAlpGBdY9EHKplSQgAxhTKzHb6Y6fN5BYUntsVc7/Lc42vxvaK3wGDJrdH/V
	 7SUqrNgU7Mn5hvnCdwYKjp2l/jDPhHLAD1VBkMdYnnKP+4FSt1W4eUWcUrWicick1Zszg
	 8NdPV/p1c3ydZBIoFE2Mk8ISnutmfDyiCjqnGqP1RB18WO4H33C9j9LJKPoadKvFnTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
	b=Va2eZYcmQH6OP3pSMpRmY2XflQXOcDB9TOfdTcJX21qdXQwpOpZe3NwauXV44h8IB4dm
	 xXCLsN5eKoUFIMfGaianGrL8LekIvlntYd8ZUYMPJCQ+r2bAQAwegZgARvGaxeDjPd68D
	 7nXHIv93XuzsQnF5PcAW+HjRe2LdLUXEeyzp5EX5LwJcnYA832iji82tmmJxWuqyZ5nUX
	 DItekhogCdrlqrlRdA9zO9MCXGQ9RWOLCfKww2XRV8fWbKU1c7bQ4Hs9FahKkpSiz7Tkh
	 NgzS7UfraEsXIZJ9J8VCVpe7f+cnTEUkLZNnG0xzG99JIryVdjXHM4V2bbtOLY06BFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A8606A328
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 00:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7A8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a070781f63so95405b3a.1
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 16:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793752863; cv=none;
        d=google.com; s=arc-20260327;
        b=XK1TDZA/+JR+vINnovfap8FfNC+wCIzn49obR99LL653k4eWTLAufMpd7FvVyBVwDg
         5FhncTP2GbSq4aCpWmkdDVPC+jatQz2qdehY2LVyxUvhvCJZcBdlWgaJagGTIA7wXzoX
         UJ38NDotDtvKzw8S1kLWiZVH8CictkFQ1O42JVpjfVIb/3D3eWoqnUAnzTkFraX0BjAO
         gcvCbdEpjqYUrY1M2Zn/lisroNo9bdmZ3Ak5mi0LMkz/m4akyaTYkh4ef6Q8PZkc+eef
         QobjcJf/b+v6XSwVwgkG+UiszT0S9wosm4hNka9oyqJpoAuWfjY7eLV7s6oD366f9Mo0
         7EJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        fh=MxRF3QfGj+rCNHj4hh64M6Ia+AQyG3tmmdQpHajYojU=;
        b=XqtjedsBOWtt/5dzak8LdSzjADMw7WQKHMRQMjOeQfn02y0AansBhNkAW1UQf55V3/
         m7kjlvE5QHMhTLrKkkiVIQeielzOy4ImLGT2DOR/TtXnHmczxwXncLfnZOdimUrS61Cm
         uZImaN2/h1RBFfXMPnHj6q5m8umI+wGb9tkFV8IzcLO782Z349PaXgRXVeYUjZop6YD0
         VSnkzI8b90o6ZK3t+X+SdWwupHnEJgtIwDTdsDpOFYr7WoLfX2RicqaJfTc5Lpgu+rmP
         QBgO8Qh6n5SKlBLyfcFZoqzSAx3Qk6dXtKes05hEQNKDpidAizGHCSCPih1W21zmYA9I
         et6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793752863; x=1794357663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        b=PTPniKxw8lSLWSxMbmhmXVodXffwfFqC3M3cDEPYPvY1SsBjNOjXXv95CLFg3rVQFu
         x1tdyRAr0bqYQ6HVqsjHpfPPU10/1FhE3kd/CHXKlKRa2s8Jf9/RWGaRvSd9s3tWp3+h
         Tji6Btj/3XlTUrwGPe+aphN7moDM3Ujmyews2MtwEsOdhWo9d1B27IQnIAXxeCj/AgoF
         TwCZd9YYNW98ENSoBC4GvFAhash4XN0WeHulLfX/snYculqtKEVgWcaAWPf68LjYBfvq
         i5NzGzwAog4kKLckyYK3n2IY4tOHLEWiT5cJSG6dbW9SW1FZ4MjXmEMstZ0yw7BaSVW5
         5qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752863; x=1794357663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        b=tajf+tH/0bQwITONwh5nyWe9r3o72a269h2Os9amA0UZz2o7QwTqEXNt3wVZ00Sj5C
         BTIWNYotJv6nW3tCQLWknb1sE27mV2men18/aU0dPgFH4cGAYoTj0S+CTAgnXD+EB24H
         +feM+gkefgIwStKH+BgrZmR7TSRXdZ8bNNrRXIBX86qwMaxg3gUpCxwClgjFVyS8mskA
         7yAN7kE9G4Nx4pSXe9/HrabPsEviprPRPs3rafekXkNgpoGUshxImXOtHntj+S6bobpj
         sOeRrJWyTjxzN+bjNP/PTG36qHjxnnaMwIrFKnpn8wmmG0fUBuVIDgq6y1Aiud4nZ373
         5G6w==
X-Forwarded-Encrypted: i=1; AKwUvBwhTmnIyPaOj5GMum13AjbPHtk4VSQXkcMiM78+O/3mHqhlfF3fKKwy4/ReYomC+YfdJw6S5H5hC4/wew==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zjjwi1WlATT9txfB5WW3iH6n4WBvuM8kbmaWcT23EN0CTb5TR
	n5TQBnhCxdibMAyPP1uzeY6hV7jHKgNDJynEa3m53Pbo412LJFhjQCHsmal8DNUwmt8M2KuJXPN
	+wp3nOarlqPK+J2DxoL71qJF1t63JLPJz2qxdFshV
X-Gm-Gg: AYBFou0LlxLN0GV2qrmWaYxVKbTkKE4moVfLxZNUD1UTfGoUxllSAArQQWVnWDOk0a3
	SUgEF7TbU94kXJCjNx4Nd2ksWqbxsaoqEgAELw5UZ1Kas1gbAVy0RewgtJud3n+NEQZSkQgY0Vp
	RvVaftj9aSpPn9NU84/LkNlrFFzE3Vw67c8FjWJmCqMjg56lx5E8pEph2eH35tA7Wy4qewfHcLn
	UJ6dTLG6q32sCIHmDbd28c/h+UDK6cSjm3ZfBtCWpLGFRUgiviyfwNq+MTfUha5EKz4G2+8EDLu
	3oVz73PGZY/4SbN+4ayc/igJobkLLsjeVXP9SvotM9WUBUo9FmNtlQIj83Jmo/GdAiXGYZlVgN6
	mZULec7MSy0yvmRUPmZWl7CDJVy/XHdBOTEEBNw1ZQxECVZeM3eXEG6mH6LIUr9DeOLAi
X-Received: by 2002:a05:6a00:2d96:b0:88d:4b30:1c11 with SMTP id
 d2e1a72fcca58-8a9ba703bc9mr11394030b3a.6.1793752863107; Tue, 03 Nov 2026
 16:41:03 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com> <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
 <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com> <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
In-Reply-To: <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Nov 2026 19:40:51 -0500
X-Gm-Features: AclHuK_mzIhdjHPxjnkTYRthyfMgrzjS55JZuNf6mZPYYsQQvO81kKGlvJUv8_0
Message-ID: <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, eparis@redhat.com, 
	sgrubb@redhat.com, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
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

On Fri, Oct 23, 2026 at 8:45=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
> On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redha=
t.com> wrote:
> > > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.co=
m> wrote:
> > > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@r=
edhat.com> wrote:
> >
> > ...
> >
> > > > * As pointed out by Sashiko, when you were converting all of the
> > > > arches, it looks like you missed alpha.  I took a quick look and it
> > > > appears that it should be a pretty straightforward conversion like
> > > > most of the others.
> > >
> > > I've actually dropped the alpha patch as per Magnus's request [1].
> > >
> > > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phd=
BKy4BLWOvDTt92t5Eg@mail.gmail.com/
> >
> > The problem is that as things stand, this patchset breaks the build on
> > Alpha.  Perhaps this gets resolved during the current merge window,
> > but as you know we can't break the kernel build ...
> >
> > https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.c=
om
>
> Of course, you're absolutely right that we can't break the build. I
> was afraid that this dependency might cause trouble.
>
> I noticed Magnus posted a pull request a few days ago containing the
> "alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
> resolved during the current merge window.

... and it has, or at least it appears to me to be resolved.  I
rebased the audit/dev-staging branch against v7.4-rc1 and Alpha does
indeed appear to be using the generic syscall entry/exit code in v7.4.
I think we should be all set here wrt Alpha, thanks.

> For future reference, what's the best way to handle dependencies on
> other subsystem changes like this?

Generally speaking communication and coordination :)  Talk with the
subsystem devs/maintainers to understand what they are doing, let them
know what you want to do, and find the best way to order things so
that it all lands in Linus' tree without making a mess.  In this
particular case, with the syscall arg audit patchset not being ready
(missing maintainer ACKs) and the Alpha changes going into v7.4 it
turns out to be quite easy, which is an important lesson: sometimes it
is better to defer a new feature for a release just to ease the
coordination burden, enable better testing, etc.

--=20
paul-moore.com
