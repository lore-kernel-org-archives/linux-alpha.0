Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E4117C61
	for <linux-alpha@vger.kernel.org>; Sat, 15 Feb 2025 03:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739591788; cv=none; b=igHKcy/9dMsokQE/ry1cqDxTbz1ymfhztxdjs5VgP6EpRDf4845pv1kwKxf+h8xKlgOzt828xaLpcdJ9KtHOrpQDyyenW7uw+idukp3/pO9FVKZQ6k9ia2L5SrJ1OEqxc/5icWakYmmWMnxXLOrbbW77Ms3EfUBSlWaSgEJMIns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739591788; c=relaxed/simple;
	bh=yJp7BPNfQIazGdC1yOWpiBzIVSEmoSrRGANHi7CZX8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcCTI73olKByIyX3/CNi3uYlfjfcVEKTVW16Ww+XlL2clmX03Sfd8rmHpYrlPJ3kjtqEkxT0KnvhRIoWYFPjD4+Wz/dE2XXDxsRIR9VmQtn0oEhIQF13ynBMl7uF9e5oie5PAizslQdkKfK21jnE01SF1+I4H4phCS3IuSsjCso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=h0tZvMlP; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="h0tZvMlP"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e033c2f106so938515a12.3
        for <linux-alpha@vger.kernel.org>; Fri, 14 Feb 2025 19:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739591785; x=1740196585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GANQm4Z6h2KgQfFF68pKPk2LmN7J9Jka5tbFJd26Nuo=;
        b=h0tZvMlPiJBbnXb270gw0oiC2so7kZZ49ODttRxXFPTDcOIE5El6jqpSUs4MMYl0ye
         Xh+7mhZb9ZzVcQGyvyzksuqC2cllgDmmJwMU2QLoccLYqoK3CF+29CRI2l0oUPA00M+x
         0reMdSTV+hwPJ1+QgGP1meqTSGpEdXO5lTP+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739591785; x=1740196585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GANQm4Z6h2KgQfFF68pKPk2LmN7J9Jka5tbFJd26Nuo=;
        b=KuYR0tyA4SGJiJA5h+8eBRSBS98LaECyPD4feAVgNqdBItqLhoMH8LIYcEDayAAL04
         04SJV3wYGbzy5IPKefQue36pP8rMx/wKVl1xL5ak6QgOixjKy18wnDMOw3lKOeXpGKC5
         cHiM9JFfRYUx9+XXam0rgCpAGZ2aNHc1IMzqH4+rPFR/n//NW8TXqziJ3u/C4bxuMctZ
         NwrmXVarY6T1deZRfhL8I/jhZRxxjTljquyOP2IvuM8HNzhBFt+AFbYkhPVwWQnyMmR+
         CV5xwL2Zci/kiv7cJmRCv9UI4sxRg1KinblNWgIzyxKxaoSnBGxbBnHzts6uKT44EMNP
         LN5A==
X-Forwarded-Encrypted: i=1; AJvYcCVsF4Kb/YLUjSThT5n+rLdg1wxBIW6E04LKNtr4WpB4V80szl93JkdXmYy112vIiMbvblek0wBMTmQUEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuaE1T0dspyS4HTUaAFz6SAb/v2dm0HNenCdPc3s4+8h6DOuhn
	yueBQP4vhLDUPov7/UrpSaITvTqLnbhWn18E2LnMmktxA0t8lf4epfzo5Mnqt82Zo58odqAfq6y
	/ryM=
X-Gm-Gg: ASbGncuyxe1lqhN3lP3/67tWMiPaS/OhpBtKVUTXnjsD4ESQFgIKTmeTRfHogIYE2r0
	99HHGGR2bQ+gOj29WEJ8F2K7OTReqK+dtCV4lqG3YEFpPYyuq2FWtqz9YFMmBcwbVEsj1498t3y
	zpt8o18O7O3klMV0PI/aJhUFo0sBKTFreLE1DGjXsKerp9+xddKx1WS/xphPVNdzFcisXkhdBIZ
	GD5Bap7UqDFxxLSO7xkYZQoswQyk61AcyMtBbKIHOo0Qb2+0okUyIPPgqax65L8asnkpapVdzaQ
	buGOVhfkAPMqI6anXBPaFc6rzlIpEhc7OSBBNM8lv1Y+tCECamx3F5zOrGMhWNvg1w==
X-Google-Smtp-Source: AGHT+IFQAVYfzI+S7sTa833GMQ3m5xwb7h4b+M1OSncBg2vrs+fGlswyGwq01Yuub0/72oXanG5SnA==
X-Received: by 2002:a05:6402:518e:b0:5df:25e8:26d2 with SMTP id 4fb4d7f45d1cf-5e035ffa1a2mr3891628a12.5.1739591784859;
        Fri, 14 Feb 2025 19:56:24 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53232275sm456138066b.31.2025.02.14.19.56.22
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 19:56:23 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dcdb56c9d3so3958445a12.0
        for <linux-alpha@vger.kernel.org>; Fri, 14 Feb 2025 19:56:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmKHtcmo2NH3bgdCP0IVd56trcpiOqo4rbNKPpjY/YayitXfQG6jmHHHD+shaEa1dsiUMMdNctgavW2g==@vger.kernel.org
X-Received: by 2002:a05:6402:2114:b0:5dc:71f6:9725 with SMTP id
 4fb4d7f45d1cf-5e036172eadmr3577540a12.27.1739591781841; Fri, 14 Feb 2025
 19:56:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <w3rw6n4cbgmlcylf5gbzzocqhyxjoyjy3qiedb7fzvd7jdwgap@44d323cbjljd>
 <CAEdQ38F6ts1qXj2xb+PN=O_byGwZAp1mvF8aRdTEq2zrzLBFSA@mail.gmail.com>
 <173956921724.2112695.11506562234571397782.pr-tracker-bot@kernel.org> <CAEdQ38E7nHFf96BWDEB_15jiRLepg=_dmaoFvO1JgiL6GxPpUQ@mail.gmail.com>
In-Reply-To: <CAEdQ38E7nHFf96BWDEB_15jiRLepg=_dmaoFvO1JgiL6GxPpUQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 Feb 2025 19:56:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg0Gdt61Wgnoho=7q17A_5TX-WUPWE__R90J19_d-DMxA@mail.gmail.com>
X-Gm-Features: AWEUYZlsqUSGTvKb4WLhxKD3VxwMq6I4z3ImsxBGnmXD3LnHBV1CDJ43qzxVFug
Message-ID: <CAHk-=wg0Gdt61Wgnoho=7q17A_5TX-WUPWE__R90J19_d-DMxA@mail.gmail.com>
Subject: Re: Re: [PULL] alpha.git
To: Matt Turner <mattst88@gmail.com>
Cc: pr-tracker-bot@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"

On Fri, 14 Feb 2025 at 18:30, Matt Turner <mattst88@gmail.com> wrote:
>
> On Fri, Feb 14, 2025 at 4:39=E2=80=AFPM <pr-tracker-bot@kernel.org> wrote=
:
> >
> > The pull request you sent on Fri, 14 Feb 2025 16:36:43 -0500:
> >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git re=
fs/heads/master
> >
> > has been merged into torvalds/linux.git:
> > https://git.kernel.org/torvalds/c/3447d220155bd9f4b5435ea6e9d58b536c7e9=
4dd
> >
> > Thank you!
>
> This doesn't look right, and I don't see the commits from the
> alpha-fixes-v6.14-rc2 tag in master.
>
> Did I screw something up in my pull request?

See what pr-tracker-bot is saying: I'm not sure *why*, but
pr-tracker-bot clearly says that it thought you asked me to pull
"refs/heads/master"

And that master is some really old state from 2017, so it's very much
in my tree, and pr-tracker-bot thus thinks it has been merged.

[ Time passes ]

Oh, I have a clue: pr-tracker-bot also says

  "The pull request you sent on Fri, 14 Feb 2025 16:36:43 -0500"

but that's not the date of your pull request, it's actually the date
of your message to Stephen.

So I think pr-tracker-bot triggered on the subject line of that email
having that "[PULL]" on it too, and then when it tried to parse the
pull request, it didn't find a branch at all, and picked the master
branch as the default.

Anyway, I hadn't pulled your real pull request yet, but I bet that
when I do and push it out, you'll get another notification from the
bot. This time for the real thing.

           Linus
