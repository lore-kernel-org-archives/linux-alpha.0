Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BDA3B9950
	for <linux-alpha@vger.kernel.org>; Fri, 16 Oct 2026 23:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194883; cv=pass; b=kmRLLetzqAN+TTCs9B1mxnNWncF4fmdyyrjXkjJHU2HZ0sm9/JW2TRVN/NNUZNPfXRRG7sjogYoxkF7FcUV+WNgSx/cN+hmMwtS8k+mZXohBzBI3LSlG+2F+SmCLhwyMEWIrhGmaxgrsuokg3HttJ1QjFtSO6jA6nDTimbRkPWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194883; c=relaxed/simple;
	bh=Xu70sCv6gBchM8XqIWDLSGQJVvPN3Uu3ZYyJG0fpoHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBqdpHNVTHot8kI3SAF69L1/UFasrFAvsRdasIGbFMgNR72zcIgIATPmivmLQmCp+gPB9KpvZLAcjEqOv4nw76UP8/kCECmuPAQ073JolWypi7omcaFN5Wm1ueffedU1Ux9TAyvfDRdjiosxQp3LYtIvHWUbPGYlqWdth/AYcYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWhiWKXw; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWhiWKXw"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a60cb94b80so4283631fa.2
        for <linux-alpha@vger.kernel.org>; Fri, 16 Oct 2026 16:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792194880; cv=none;
        d=google.com; s=arc-20260327;
        b=evqSDpHRyyyC5yN9Ma+SFcZzCt4G8iwi9QYlzwLp9jT/D6RdSCefGNiJjMozvH5Fob
         T2eHPOxoObHvTGsKPhGBkcfgms6CcIkaCkSTLcE2I5+d6O8q7XHYRJJ0lA3OR+Ds2yW0
         WMFmR06ooHWig6en2VUqkt2P+FNfhky8Mmbn+tRg1HPUDdwZACbtMO1hkYsICIl8A+V1
         +ouKkMi6Mn2KFJAOv3Mavrz6hdwG7LVjAugSzKgt2Dmqq3P+NCA1hInqW2t5J5/LQFFO
         AhzLFfd5/A5oGK2cPkCOLR6Cyzf+KsFo560KYeAmUlly0MNKnHczQOIMIT+nc9ScLHcF
         cePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hPUuJtr2Z7cXgheskjaddEaTgz9tX41V1DHpHN9aHT0=;
        fh=Cv1wMBUpcdYGI0mg1LPp2wD/XA/FHtxtHzvn4SmZQ7E=;
        b=rX4XUM4avteZ/xK0uBaVvjjU5d0UuumJga2WoVXdqbSYA8bR3R1PGgx/rd1nhrxZN3
         oy+dmki7nIrTEB0aUNDN+ZHKudU6zWV0y0JyOkQS+5EHCBnOg6Xjd9LEsXD+5NxSDiJV
         +jMnzAw8GzvPU4j0pjlhIOUKETXrIXjlcJdXzrp7pqx1RNuH99peR0hzjEN1Yv6RlD60
         pmpyGMuV3zAg1KNYnOYWaA+NfUJifdDmZCQxQYj3TG4EB8nOkzGuZ+QC5AoQrdZRGKo8
         3RQSSqFQeCm9M6Xc57mmqULL3BA1FtN0xORDD7Ii3WQeebHejP5azA3UhV3ERoPFInyM
         l+NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792194880; x=1792799680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hPUuJtr2Z7cXgheskjaddEaTgz9tX41V1DHpHN9aHT0=;
        b=JWhiWKXwvq1E2jNbMBDl/rLpYYXleh6ovNmddqYaPDKpiGcm7RR8XC5VCMkPSiTqH4
         4Lrro/f/ArobvNZJOfiRS8sfH8dKHgmjugdph4Dtg1Z9zz0VTvxPgyRQT5wzHTEsfzdx
         5GMQORLxJw94S2ZuAj+9IXQSBvLKO3w7VuiCcL4CYFeHEGO56gr/GYRVngriTEo5EACK
         9J9iZiglBo5KflyIJcqiyC64XZc0fU7jelhfiG0SsTvV43EXXWBztos4KBfltY0GU6Ik
         tcZowYIzspmMOUcw/WXdZsTBPjFJGocX0wm8C77t0jI31Tr8oXdKpnS1aCGVxp+4lq+U
         qxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194880; x=1792799680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPUuJtr2Z7cXgheskjaddEaTgz9tX41V1DHpHN9aHT0=;
        b=GqlayJD+WGAXNY7cA17+Do92jVkBN0ppAey+o8KMaC3+MwY1JqYcUAzUkoyqY4QwW0
         9D0aVtsK7njDktkFEHEj/WWZDtI+0AOH2B8NVptFPgh06rvg62xVrc78DgB/fJZgVEU5
         G7e+u+Wyy8yVJVwTteOuKmMWfn//7+ckrfco9W9Whil0JHJHFoj6RoD5oy7eZVKQIA3/
         csgsgUsqoh2rOhrxXj8b3IMu9nfnrncu+PbZX9rzlrnTJhnLP5pu4ie9lVQxBnVd9r2n
         YVoiZ8k4FCBn0DYxIDTfgqSBVccdpUe9jQ7SZaMsAsAS515EtXXHCXFc9HmQNubXdjTM
         XwlA==
X-Gm-Message-State: AFq9FYJr8HyC070ep+B8HyG0J+csoe4IaDVAh8OR8VW8HrBBdXIQgvPU
	AcHCqeoosJItsjYGuu/56ry8RK0fAZn66VDmj7+0p2amqcwaF+/Gz5tdND6t0xxIntJDAofZTS4
	l1nfBUYKQzX6bhNc6NhyxLcLJ4xWy8VA=
X-Gm-Gg: AYBFou0slT9qp5a4Xxmn00ZOxBvpcu7K5RIMDnhVM4qdOXenGc4QJh45ciZ9c+WsHdm
	xAgQMwtEv5BBs7yp7xGGc6yJ7CMQDCY4OrakKg7F7+ryTxXwVxd9NHof7lqltpzxYPvYs72b/62
	unv9IHp9C6NSwLaTWtVtkGtbNIFEB+RsvJrG+AhfbUpCFggOjRE9YUYuXmHW3lK3jl49wbiqTHv
	eOvvJ1owJ5Q8YqrkVnyK+R0tGqnYYUnUukNlcWlm/ddVT6+jKdaAX6itPm9ckeh44tJLfdpUGlM
	3mVMe5pqzqk7GpJbzOlszHoLnyPuzIWE9/OhYSld+G0F4meXnn7LnwkTTFfmUokCa6G5ZCpFKzv
	fN4Lpz0lovQS8BxWvi5loarSb5T9IlxaGAv9bzQ==
X-Received: by 2002:a05:651c:b11:b0:3a6:622a:2cad with SMTP id
 38308e7fff4ca-3ab2928a0f6mr2581751fa.10.1792194880130; Fri, 16 Oct 2026
 16:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001165018.415526-1-mattst88@gmail.com> <alpine.DEB.2.21.2610162207360.22065@angie.orcam.me.uk>
 <CAEdQ38FOXiV+Sz8fdPswRN=m2dKkYzgF2-9OWx3WskdsmWUGtQ@mail.gmail.com> <alpine.DEB.2.21.2610162254380.22065@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2610162254380.22065@angie.orcam.me.uk>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 19:54:27 -0400
X-Gm-Features: AclHuK-x7TuHH0mEi9Pj4V7Hm4nU0EXmWkGGruSlpHEUPPLEzlbY4sMq3pYo3WA
Message-ID: <CAEdQ38FRnjHSSAWxFJqUBUL2zMRg5_GDcJJC3fx8i=K8ZWWK3Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] alpha: replace dead links in Kconfig help text
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-alpha@vger.kernel.org, Magnus Lindholm <linmag7@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 6:36=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Fri, 16 Oct 2026, Matt Turner wrote:
>
> > >  Of course nested links may or may not work, but at least references =
to
> > > some information are retained.  Or has it all been already extracted =
and
> > > written down in the wiki?
> >
> > Did you compare any of the wiki pages and the old links?
>
>  I read through the old pages and found them reasonable.  No, I didn't
> reach for the wiki, perhaps I should have.
>
> > I looked at all of these links via archive.org before sending the
> > patches and didn't see any useful information. The LX164 link just
> > contained the board specs and a link to the Technical Reference
> > Manual. The Rawhide link is an install guide for Red Hat 6.0. Similar
> > situation with the Ruffian page.
> >
> > If you see any information that's missing from the wiki that I spent a
> > huge amount of time creating, point it out and I'll add it. At this
> > point, I see no reason to keep links to 1999-era articles.
>
>  Fair enough, I take your word, this was just a question.  I guess it
> wouldn't hurt having your effort mentioned in the commit description;
> indeed I think it would help saying that the wiki has made all the old
> references obsolete.

Sorry, re-reading my message, it feels unnecessarily aggressive. Not my int=
ent.

>  And I get nervous whenever pointers to old information get removed, as i=
t
> makes it gradually more and more difficult to chase.  As recently as the
> day before yesterday I have pointed someone to an archive.org copy of a
> specification they were after and could not find for an old piece of MIPS
> hardware, that no contemporary search engine would list and I could only
> locate because 20+ years ago I recorded the full URL as I downloaded it.

Yeah, I feel that. I did everything I could to preserve history and
sources for the wiki content. I spent months waiting on GitHub support
to transfer the "alphalinux" organization that the late Peter Petrakis
set up a decade ago

https://github.com/alphalinux/

It now hosts various repositories, including the wiki content:

https://github.com/alphalinux/alphalinux.org-wiki-content

and all of the Alpha-related mailing list archives I could find:

https://github.com/alphalinux/mailing-list-archives

My intention is that even if I (and alphalinux.org) disappear, the
wiki content won't.
