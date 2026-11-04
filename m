Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799782;
	b=Ku6ufr5kq+LUh91zdWgQlSdSZ3f0zqS0JlwRsj76j9nMiH0PeWs2uYy/8CSD2nKjOEhw
	 /+E5AbaCzbZg67/oY6WNaEXdy2JbfRO116UA0eq0eJ8H2+b7aEtSeZ8rDoh2QXmXXDgpZ
	 MnFyrL+FwPCcsSx8djyfluh074L7RoteA2zhEYn8m8WGStDfXmZfFnWQ7mEaf0NXmkeYx
	 kTfUw3GuEeZ1Y8gG2xFvInVTocsuKj3IR37TLHi4OT5BcKM2YSqf3gUFqNU6dhf+usv+b
	 9vmyvEnIKw8HUs08YUnuHT+5xn1a08UnPxK+tACL5a34dE4KHElOsq21+B+ZBbDy6Sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799782;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
	b=aSI55Bn98tu5wVfP0grknh186FF5k+HEfS2T/YPAKhQZJcdyyz0jZOjGf3R28OmC8qQ/
	 krDDJdGFHjKZ29Qji6MBWAzwS+zwtRx8ModBVHHJW74AiaptGVkFqvECXezg8dC+tJzRK
	 TS3v3eQfNLBAsOws0WpnnoFt1vBQY/IdDai5cmBjTk0dtFKTank9XjwznWF6Cyohu+oeH
	 om+VgihBaGIRcDarbpjGYmO6fZJi4klUt6CN6CogmPd87LhS/ZjCmJwFEidjEhT1GqhwF
	 jyPOqlx8Y+l+Ar10wirVaNDyNSZPajgaY+gwj3jrZAKk50065NZRp6BSoclsXOk0oNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=apDpBAmV;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Mouu1XSq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8190A606A32D
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 13:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8190A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=apDpBAmV;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Mouu1XSq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793799780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
	b=apDpBAmVyHsE8c3Flsxy9Ca82GUT6I+55gzpzWCTdUXVsJI9n3ccEwuf4/Obnn4yWBkAem
	HqBD5dLRmJdJxj8R2GQC20jDlFRwYnvfSKyGcVECq60ENLzqVljorLRXl3T1yOpIX/xvrC
	d+bSQqkg0EFxXymI/5arWzTYgt9yAJo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-Twq9pKSINT63WQEDTqvrRg-1; Wed, 04 Nov 2026 08:42:59 -0500
X-MC-Unique: Twq9pKSINT63WQEDTqvrRg-1
X-Mimecast-MFC-AGG-ID: Twq9pKSINT63WQEDTqvrRg_1793799778
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c42394d1e41so85417066b.3
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 05:42:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799778; cv=none;
        d=google.com; s=arc-20260327;
        b=COPM4dh9+C9wny/gJG1P4MFlgCFD62qk5gyv9gPUGXHZU3aI3ApUBIOLb4pYVO1fgZ
         FUXL/s/Gg1TwM/ESZ2/8Yc2i4oBGLr/vwf45QiZPaka9OEnPISpgBI1we3BtN7EoL3Y9
         8Hl8Fi8WqtWla7fj8ZsRQDNFwXoMk7AUu/Ji9XdsA77BAHief+ibQDzwp4Z684N22AdR
         RgMTjgg9U13uK4kN48M52pAkjNMZ1UD1LjVQ6NFejmqsk0nB5dvtVoiBHaPBmlQx8dfw
         tV9JNjtpV99XMsiD10+p3QGI3EqtJik0eIUaezbUV5BHynne/aW/NSu29Ju3xQGrfevE
         Eg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
        fh=dythMW19Cq+1nPwiNyUL5TCtOqlfavz99EBd+e9F8fY=;
        b=ktuFVJt443oRcA8Qzv4IHVsJjisnA9eulQNHOzdWrNrtzZy+5XC1vPQCN0C3AyGXKw
         fazYbW1wSKlPhREs2w3p/V7Swz7gKeDA/U+rHbRsS7WelIsgRaThL2BPNPW1sTTWnJoP
         GmP9v0v69vH39NtWqbVh6EarapiP6subnFit68U76Dz0pVxfGosqxJxXYMgfM/YwCMuB
         rj5TDwcvM5zQ3GgKcFu25AWEDOHMsT+5g0eYk1Hid7Jv+y+RQpt6/qKYI13PQnH+JxDE
         8VRbG3V/EeJ0SRIMu1/l5/TJOZSFVf8QvJQtu1rzqqHQIwEsEVIISJTvl4q9VIgf1lhn
         K9EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793799778; x=1794404578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
        b=Mouu1XSquusTnpfBvStFzeTN87Vx2zKs0FoEY5SevuYiOSnWt13aiH+f4QP1nefFjN
         bwfvfwVDenTxSc8Ohnkem1H17b4LundNCijbYaIAUcQNAY3l9xb5ksqEC4f6Z0cL5fRA
         xNQeCDtNJvCH87SLQgARz7InVVv6L0tlELNSUxXik0wyk4894QFXRxG6ccRAtEW0LHKe
         THJnGdreJEIFTFpGet+lyfmvPE85xw5pgU74TXo42+1aVRehgiL3n4FUvqXowAs6156M
         o0mbE4QPzv8Fl1z8PH+X5bYTvPRcqdU8Fdi8z+HRncDyBsgEgiGZAnMawcFzMWiu0GGR
         D9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799778; x=1794404578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
        b=Qesbqe7tLMGXELxTfm2VJtDul7soPSYTqhgdcEjxI9Ez+eV8X+61TzuOizfyds0/v/
         BHdHc3MeHcGaR6vJIWD17k5JnEaTV2/3QGalsfis6ZtsdEL3YJLxmR+/jHsb7xWu8vc3
         veBt4i3JP2rlGBaWNyPDCCGLUlieL1MunLdYY/RsFBgfVNBYqs6nAdvJ2Hu3goGMmqMD
         i7fIIH8QKnbp8WSEtKIyGNoJuh6HAHVxjiyebYk5mhZPK/TX4GlYGvcceTPRw/WfAEV0
         XY9c4xndO4LEZoWmUZOcIYdU5XKgAMGOyN5Sd27MCoqDDhesXrLVuEl/e9nYN3q1Vsnu
         QMwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOrRBPd70RmXSrh2ld6ZWixQrntQDQIv3UNsY9Lh88GbbExbjG2SnYxGIPrph2RiXIxkTqczI+SQaN4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/MspGNXIxcT4A0yef2lLYXfToietCvMq2++cCBJ37xWwSA3bfD
	D4zMxjRxQ6k4XUwNapisu1IpqUJnPoigu6QB0MHj2vBF/STb0/TvMMwoBGoZ6/0TfZunCqm/bqp
	uOa2qoMsVO/DTPSk2pd1dAjQuXXvC0nf81E2AjZXvln017mOvcJeZRArHFQkxWGrbCgWhH2joIX
	fNVneDswZzjMX+H0yjftRyOMo5xP7h/lu6xqWXFl0=
X-Gm-Gg: AYBFou2zqyJlM7EI4k3DCWKw3RQftyjOIhWqZC0CFO4VF/VK50HxhfuJNPVtKk86Ujs
	WgMrYx43T7cLtZFS7i97iOycpMwi3Fw4eGxiaWC3UZ5vu0qyPnGgNdBuYJERerUthX7ohCyI3oV
	kyywPDMP8US787iVQDMgaBmRBXf82TYwtyi+CGTSHlTg9XwxE2gfnZBMdVzEl79Umaw/j5KQxNJ
	BL8jIK2PbZlwcmzrfWPH8sE8y3lBmSpV0Ljs543xJEIHA==
X-Received: by 2002:a17:907:1ca4:b0:c24:adf4:5c73 with SMTP id a640c23a62f3a-c4ca795d0cemr1327721766b.1.1793799778118;
        Wed, 04 Nov 2026 05:42:58 -0800 (PST)
X-Received: by 2002:a17:907:1ca4:b0:c24:adf4:5c73 with SMTP id
 a640c23a62f3a-c4ca795d0cemr1327717466b.1.1793799777447; Wed, 04 Nov 2026
 05:42:57 -0800 (PST)
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
 <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
 <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com> <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
In-Reply-To: <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Wed, 4 Nov 2026 10:42:46 -0300
X-Gm-Features: AclHuK9fArBl2NqgMDWGc__kMOSMhBxMeP1FQYdilvQJHUxXbryD-TLWb0XsxW4
Message-ID: <CAABTaaAYn1oBwHSkoGm0a98c9YUZKf6ie=yUOtR4FQuSjrusjg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Paul Moore <paul@paul-moore.com>
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

On Tue, Nov 3, 2026 at 9:41=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Fri, Oct 23, 2026 at 8:45=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.=
com> wrote:
> > On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com=
> wrote:
> > > On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@red=
hat.com> wrote:
> > > > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.=
com> wrote:
> > > > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina=
@redhat.com> wrote:
> > >
> > > ...
> > >
> > > > > * As pointed out by Sashiko, when you were converting all of the
> > > > > arches, it looks like you missed alpha.  I took a quick look and =
it
> > > > > appears that it should be a pretty straightforward conversion lik=
e
> > > > > most of the others.
> > > >
> > > > I've actually dropped the alpha patch as per Magnus's request [1].
> > > >
> > > > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_p=
hdBKy4BLWOvDTt92t5Eg@mail.gmail.com/
> > >
> > > The problem is that as things stand, this patchset breaks the build o=
n
> > > Alpha.  Perhaps this gets resolved during the current merge window,
> > > but as you know we can't break the kernel build ...
> > >
> > > https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel=
.com
> >
> > Of course, you're absolutely right that we can't break the build. I
> > was afraid that this dependency might cause trouble.
> >
> > I noticed Magnus posted a pull request a few days ago containing the
> > "alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
> > resolved during the current merge window.
>
> ... and it has, or at least it appears to me to be resolved.  I
> rebased the audit/dev-staging branch against v7.4-rc1 and Alpha does
> indeed appear to be using the generic syscall entry/exit code in v7.4.
> I think we should be all set here wrt Alpha, thanks.

I'm happy to hear it.

>
> > For future reference, what's the best way to handle dependencies on
> > other subsystem changes like this?
>
> Generally speaking communication and coordination :)  Talk with the
> subsystem devs/maintainers to understand what they are doing, let them
> know what you want to do, and find the best way to order things so
> that it all lands in Linus' tree without making a mess.  In this
> particular case, with the syscall arg audit patchset not being ready
> (missing maintainer ACKs) and the Alpha changes going into v7.4 it
> turns out to be quite easy, which is an important lesson: sometimes it
> is better to defer a new feature for a release just to ease the
> coordination burden, enable better testing, etc.
>
> --
> paul-moore.com
>

Thanks, Paul!

