Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792514337;
	b=49aRAmA0SYKWkV6cjQ/Jbm3i1j6ipdMnBUnd7qqXpgsNq+ju8GZszRVqIxZKY6bZRVK6
	 /qGW7fbk4vAQmITWLTM227y36ATqnv0fRdDtpjSK/iKUBhVT8yfumEWqnJbJ2M97rl9lF
	 MEtM5J+BGehIRxLb1eZMeMVAUF9LYEqGFfeTSXrbKwE7bTryZ688CnQAAPHn6ABbTm0lW
	 3fEWYDrRacxPUapLvTcuP3ByaERw1KgdT6r1nBjliPE41PiOWb3gTzMhjQJCBn6BRpmTn
	 Jyu40Cz1Rgu9ye5LTVtKBt0W+Loh/vyCnpI6V3Ozqs+4c4JdcWQ1etl3U/Nc7+hjwpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
	b=iYQL6/HDe7Gl9C0PCp83tJJ4ELrG8IoDIIAzt90E2B8w6eNI03asof7EZyCgy2bWlKys
	 ftuAtRNxbYh6ZLZ3GLHAR7emUlGzMbC8Sgwi3URYmP8kMVHplZ5ltP3e9P9/K+MiKp8XZ
	 l8b4yPBziVbShuhlKgk/qQgwPytljCpuUuNfZ2l5govLDX0cJ+dRd/94rBKgA2xLWzPOc
	 djH5+EwPwzzn9NVn4pHsy9UN17pIcyeuyca/8xIKcgSCeAPP9iI0+x1Z516EOy1NDWZ23
	 zXCOgpwHNW1eBXpVCICi9HVphcaPNKSy16hqxqF9DRSYhP1hp3jwpmPTbqIPbTjM0cQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=GwYGVURA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090B760A263D
	for <linux-alpha@vger.kernel.org>; Tue, 20 Oct 2026 16:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 090B760A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=GwYGVURA
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e98798cbddso13592575ad.0
        for <linux-alpha@vger.kernel.org>; Tue, 20 Oct 2026 09:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792514336; cv=none;
        d=google.com; s=arc-20260327;
        b=VH1RBmiP9Yk/Oim3f4mI1sh0XQrS6FncKSutdKFMW1+5HalEAErcUfygl7SeCtoI3u
         GCJaLPs2RpzweDLRY8Seo/l7Y68/tjhzdnhorMf+PbMwecyBZRlJbvsv9FPBtVIKNgBz
         +7AxwC2A8QqtE6WcJUzPz3Dv6Kx4xKPQggFn9rzaCU2uEJCOqQXtK/fY/ooMNTtbkmup
         BDiMV881A6c1OReujNh1mgUaNJUSv5nKAdQJsc3bL3NXWcG39pl+DIItyiSQ5x6lki0k
         LLJmNRt73Mg/pXqYzxT6eFaL1On7sBqpRTtdjBm2qWC0AYduP4vQVMa/iPSx9HmDbeOE
         6rww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        fh=h0MaJIcUJtVqm8vdnFTt8HEKS76LjKcQvV8vG5qU+KA=;
        b=e9OEsCmpwhof/RxFt/yQg0fWjYQrrzmbnWG8CHzn+zVEi6hh/6ThFyGCK+hXQfifq6
         V6ZCGCILS/QiToRUXFXmaA3jfK2/mb5J3lmwvpgTPDT/0VGrR8p9BcsnGnbJebyztOAV
         vkZwKMirQTIH5NEJWjQSFpirihSzxgLEOPkfQFKs5Haypv9JfgNMUVMU+ASfcwizMI2Z
         Tbctgb2y8UrFvU4M2ZVM7w/ZY2z7W6O/IM6TDORk6IobO1OuxmHafNpxiQHbeoeQ4JMM
         DnirLE+koTz4/BLIVhq55Cx5ROXAET3XAdrI6OVE+GIDuSI+xoSSMcRRiKSd7cHYQibG
         rqzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792514336; x=1793119136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        b=GwYGVURAL7E3Gqp1mE6IbppA5fK/M6QVj3T4+Mu1VqNJAQWSHTCgIBs7lXAHx7VP4b
         X7Ol6JtjEVwHUVW/UUWijctAKk0S3FIF6sAkL2D0z4+yun1CiPIG05jQakKiuYArY+di
         qKUZ2JssWHS9PY4Rrbam2j+K8HSVipMYAjJhVwlz0qlw5vC30c9m2oPlM5nOac4bwKsb
         0iIOeo41vgbotndmbkqO3IW2nEL8EcaGXBwYuALkuaiWKHExqpmpd78k/kVF659++rVb
         16kcHMvBo17gh+L06xflahlYQXJ+NMSTGDwKIeHcy9Z1IKqewLhKEpxT50Ywi1EBHbtT
         Ya6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514336; x=1793119136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        b=oRr6+xKgwZBs5M3eCG499Sj32Rdz7bJotXELKaoY2u8PGC5JNQKR+dL2kV/FY0Ghup
         VCSoKEQx7pA0FQWiIwEpSn2WBokraEHKJsLrthPQJl5+TFNyF0kYWJMVs6TohIVJgN3x
         vMpKoi/FjBTCtiPx/2GgW6zigMAdhYhnkdDMlm/AwLZJl/EfUGJSNIqBSeQbh7zc8aAE
         GtVSJmP1B8Ekbip3JP/XmP1OQzSLQhWyeUA5EE9HV/tXCOv7m1nWK8qAEsK+vkZXqKER
         iXtOHA43H4DPzwns37Ho+PdTwBHluRytUfPb04A/wt35GTuHKDqG0InCCVgsUJuTGW9P
         5vWg==
X-Forwarded-Encrypted: i=1; AKwUvBxKVVUZ8MFQLOl1pMjDdyySbGHWh/6a1dbdUq+/BPSw29mk8Ce1caiIYJyUKtoe77I3gX6nYFPMr4CHJg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK3vU8S0Wf+kTIEp4+IgQFZb1O/IJNFKfyHWGE6WCAmCV+0PsLO
	1Zjd/ay5e2AWVFvcXjFBrgdhsFJ4vjUEKlDYUmC0ADG9DQiZ4BPE31R7l1fFL6H9Sos8Z/8rO1G
	m7wRkXo1xcYDb/9gPEW5lAOrAG8JrKlbFM8OhbGk6
X-Gm-Gg: AYBFou3BueYXv7rjEaa++GljSqZQXa/LUX+h3LF5AhnRcbTm5lh3wOs0BDvEQAOM0Pz
	QWKaTCXI/NnWRG3KMW4GremqTPDH6Hocr1Dnum3r6lrdUHPaKrUhgjaguoKDpQHjmTVdl2s3jy4
	ng6shYrw1590iZosotAvcIyxXnIXL/LuWoO7yZKRKpGBzl9jyvI7lm95gWWwmj9TnGWeit/2Jjd
	/pmPzOGLl+vi7rcUmVn9TVKVWWcBhOuXl7H8ZfB42DnqGZTV5wHubHVFEVsF2GkNyUmqQttgh9K
	fl943vCP09OM19zV1NwbTDg/1k3XCSdXVatBDFaHl/ZsaQaz0eIxxKUVPjUG7FoI4UcCeEuk6Wc
	khh+H/BJ1WxM=
X-Received: by 2002:a17:903:1111:b0:2e6:dcce:8227 with SMTP id
 d9443c01a7336-2e9a6c1a30dmr99034965ad.37.1792514336247; Tue, 20 Oct 2026
 09:38:56 -0700 (PDT)
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
In-Reply-To: <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 20 Oct 2026 12:38:41 -0400
X-Gm-Features: AclHuK9ZakV6IFm9eD67kaqUic0iU1MgVPLS7VN6RgjPgTRZmZP6_X_XOYOX9ZU
Message-ID: <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
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

On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
> On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redha=
t.com> wrote:

...

> > * As pointed out by Sashiko, when you were converting all of the
> > arches, it looks like you missed alpha.  I took a quick look and it
> > appears that it should be a pretty straightforward conversion like
> > most of the others.
>
> I've actually dropped the alpha patch as per Magnus's request [1].
>
> [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4=
BLWOvDTt92t5Eg@mail.gmail.com/

The problem is that as things stand, this patchset breaks the build on
Alpha.  Perhaps this gets resolved during the current merge window,
but as you know we can't break the kernel build ...

https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.com

--=20
paul-moore.com
