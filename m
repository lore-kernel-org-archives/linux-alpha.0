Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792759537;
	b=NKwvjnS0MwMYdx0yD1o4TSGFbWUoAcut52E+fw23eiD8rMz7LGytj7aBiQ23FLz+DGeZ
	 vZd7EMEncWw1iR1qJHPmohvSLhOHUrrFSkmr+wjK6FTqnRVGxzgc6pljgXAaKuaCUwMOT
	 Q0ON3Snn6bgaQ5UlyIHZOZ3+xqIkVz2NV+Ct4zlgSrJX5KpoKN88Hz4H5LVfkc6mD+IuP
	 kYVhZfXplIEBH2NJaZpGhjULrUFBc5D1AkNFSYegwNOQPllzkCTP+TXNtLPUt/hd/OBZE
	 7vNGc6I/uGFIc0FS/C+DSiPGFBJ8q9Zuay+hS4+XYIsJurBS0jB9r/G+N5qJGSIBCkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759537;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
	b=VD6O6bE9AueSN+81MerItFrLKBjJOsdOeIlPLSFx9E7B8kPnwb/rA6n+I5mf0AtNLHc7
	 p99NNfU5xzVEKX4eagZY5ws9U/BTMgTv8ON8DUyufXp2wIXzJXOJGgUHLEjJjponq+mDq
	 d/pabXrO7kxTKga3/89zTqgyYwmgy5ktEv3DMx9pCCj3sqnhWhf1fup8dARhM3NlXvL1i
	 wfE7dufaXCrNPmUeznokdluveEJ6q478l1njn/4K71jH8iuFxyKoWEPBff/odP+/diUNw
	 R5Ov0YHIL1/3dntr6SLr+SjY42lgb4KvSXdDZm+zWoRLQYH7XDsw+lSWmvF2uylBGMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fNzvV8H0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kvNnk1JJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8060606A320
	for <linux-alpha@vger.kernel.org>; Fri, 23 Oct 2026 12:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8060606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fNzvV8H0;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kvNnk1JJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792759535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
	b=fNzvV8H0a4CGSeFaVB1kItZellOilDAi0AfZDhWTfDfKWRdS69arafzqPD1tUaxoWmXYZp
	9bIYoQsPaGp97rbfOik74ZNjU6sIvqfubZN3djzdWWu1R2g413RPBcqYZ3H+uedLKmAM1Y
	WQxv+8MCTRorQqtDETgItsta0dOw1wg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-jr6wJxYrOpmmmYyr-fd8RA-1; Fri, 23 Oct 2026 08:45:33 -0400
X-MC-Unique: jr6wJxYrOpmmmYyr-fd8RA-1
X-Mimecast-MFC-AGG-ID: jr6wJxYrOpmmmYyr-fd8RA_1792759532
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c40bbd26f74so74060066b.0
        for <linux-alpha@vger.kernel.org>; Fri, 23 Oct 2026 05:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792759532; cv=none;
        d=google.com; s=arc-20260327;
        b=PZa3PDiCoRFmFSMWZg2jj9xpqCAMjEq1j04LnaBrzIQh08PgYNN0RYHBD21/CsB4XM
         GYSdql0L9XIlo4TiTb6SMZiEahuu1tFRlBkb20XkKgSdHM1FJ21tQQV/ZCosLhzfiBYr
         DAqo4JALCdXxPbY53dXlTFFTk+MJ02SmIlgB691yRGUsAnfduhJ3eKmPFCFo962EqjTk
         ZxXvuCtpkI1umxfyqyb+wTOuBXZmc4TmzWa3Cuv6/Mr4M2RoIHZSfgC7AMH5H08nszxV
         G0CgLcwPJFvLH3qGynp8OgfhCdVzDyWiSL9XUpFFWOyK6+Q9vKumlpTg0i9v7RjogXNI
         mgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        fh=/qzwQ5/Z94B3hWUB7/ibuGYPs/xhn+02zKkn0sBuYCM=;
        b=VjTtDeE9ZFQaOOQiJEmLkfFyDuMHRt+zIssxzV1h4BDly1PYvg0O00/S9lhgbfL5vi
         8UGLTG8uzNWHSGj0wLQTt4OLmiDXkMs182wN59+kf3kKlG19kueyI/9XP4vnueVbJKA1
         qwpoOYVEMSOpybCvJVCoBMQ7BPmUXh57UtcxEXTG0VPVrN2pslmb9gg7O5xVAu8lS0dM
         m84wCr+xpAHLXwEqAF68VNntsQsx1Mo1Ta6FXvJJyZ7M4/1b/rm2bVXj8qfSacSYBrSP
         HOJWh/EN8NLyXZ8SN3QqNhh+qyw4RFydR+z/mbkvuyFRxxoA1DnrT/JN6H3ytMSuceZv
         KL6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792759532; x=1793364332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        b=kvNnk1JJq5fdRFGdNebQGgC7q5Z0qxP3L9LUL3H41Yth6fk3qBq/vZiBoiFYGjpoaa
         n0dKED8PrTcleCQwOwv7EZPUJSb5pjlDuNEjMabYepgzXz7C3LDzgy4bYbztjIZyxLVm
         9Xqzkh+s/Df+49IhCw6cb1qC+ZGFZ4Nq2c4DcUiiFr5dQqfAvw2NN8GjnWhsaGKkKTYY
         KzF7Id+sGWe/yi/p3xtqj3XYUidB030oWuXhAmSpJVfUlD5svLFMDnkRZ4hFBW84cWXH
         J5am/hwQZPE6DkBBvdYxtO+xDbckJ1JouoT4CQ4/tz5aQZvy3bGe6vJgFqQzFd7jFxWj
         dG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759532; x=1793364332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        b=nw2b6PNMzlPP+kEYZgTQP8M4T8HsBiLmwoIG091NSOdCMaKxloJIGrFZNZ02Jue8Pr
         40npQ0glSWg5h8zxZ1PEVNZH/A2OyQv3TOt7lfIFQ4hFGhPeikiZcl069JC2aW/0f6b1
         9maax+E1mKl1ZV3tbxdywGNt0KFE/jwABEZ0/4NmtSa9aCTkUlKSkO7PQ4/5OCevoL/g
         k3yWUgZUQScp0IBtUhWC4xBKb75NBJxz4GCZbdyRs67gfqEOBOUAzth3uCILfm870JsA
         YNS9MBFlqsM020RKbHwzz2bcvju8p2tvkabGlxIHMZPEVaJYlbB935v2XZ7F0xR+9TAk
         GKnA==
X-Forwarded-Encrypted: i=1; AKwUvByAPlfS88linzXWnELk2oRqcmVIClBuyrrnbyZkUeUsDsh7x0MwAohtOpj5FPB20ihyN7D67hrxz5cP7Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLWqOWa9JZln+o6+gqnRwiANTuav08TD4EYWxqCVwpnpYbrKvgR
	hJnxNYbOFbIqVfBhHzUXwI/APR6hvK0KDu56xxGnAdZsGRn0WbAJIbU08wM8EDyWqbTv8+haEV1
	040dLEfFdBQeGb74lkpcWIWaemrm3QXr/iSTFF2efy9b3hVo6RdcnO3OvsNbQmBspR9nJA5hKRd
	48F8S6V90ZDuT+PFMO/Cao+v8rwoA+YrYyJwOAr2g=
X-Gm-Gg: AYBFou0kER1Q1EsFixFmoMZWTCwlrDOUUZr9r6xI0wIdSCDNHI5t6afdPRjdZ6l+9QB
	pzJvm5AS+mk5Sme0+vzeg8pHQmFQ2LCQWsTDLG9bjIxj/ajt7qo2r3hA+Y6Xe7oBG4qC8njV7ca
	on6+hzZZpxNaRAVtc0rp5Pl8ObIBIWae3ghUARGYzkA2/PnDys4va36K/KLyGYyu6Azh1u+OtDR
	OfWcRwBl9PIMj0c2jVrA+Uci+hN447CTTH5Yg6VqKHVlU9aJDHObSc7me+xf+7f3tA5xJjbflSJ
	tVs=
X-Received: by 2002:a17:907:fd8a:b0:c2e:46d0:b802 with SMTP id a640c23a62f3a-c46a92ae6c0mr328358166b.40.1792759531918;
        Fri, 23 Oct 2026 05:45:31 -0700 (PDT)
X-Received: by 2002:a17:907:fd8a:b0:c2e:46d0:b802 with SMTP id
 a640c23a62f3a-c46a92ae6c0mr328354266b.40.1792759531460; Fri, 23 Oct 2026
 05:45:31 -0700 (PDT)
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
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com> <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
In-Reply-To: <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Fri, 23 Oct 2026 09:45:20 -0300
X-Gm-Features: AclHuK-AKUESe6iHVc-VzwOYib6sgRKlK0BCnAtM6wg5S60Ozyo0oOLLHvDr8CI
Message-ID: <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
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

On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.=
com> wrote:
> > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@red=
hat.com> wrote:
>
> ...
>
> > > * As pointed out by Sashiko, when you were converting all of the
> > > arches, it looks like you missed alpha.  I took a quick look and it
> > > appears that it should be a pretty straightforward conversion like
> > > most of the others.
> >
> > I've actually dropped the alpha patch as per Magnus's request [1].
> >
> > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBK=
y4BLWOvDTt92t5Eg@mail.gmail.com/
>
> The problem is that as things stand, this patchset breaks the build on
> Alpha.  Perhaps this gets resolved during the current merge window,
> but as you know we can't break the kernel build ...
>
> https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.com

Of course, you're absolutely right that we can't break the build. I
was afraid that this dependency might cause trouble.

I noticed Magnus posted a pull request a few days ago containing the
"alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
resolved during the current merge window.

For future reference, what's the best way to handle dependencies on
other subsystem changes like this?

[1] https://lore.kernel.org/linux-alpha/ataJlL6L7TrS3gWs@z440.darklands.se/

>
> --
> paul-moore.com
>

-Ricardo

