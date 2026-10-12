Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BBD3002C8
	for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 22:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791845220; cv=pass; b=mMR1/U0E5ctkIfro1BaN8IN8IYqrsFbzQ4W7qpAWWtQwKH2Kzml01CVrACoK1kGNKWNZrIjfmq1CFSkVzauaY43WS3rEJz2qtXopyniW7ApThg8/W4NAtuXxCs14fryQ3zUdAKEIeIT6jQ67zEzeP9PEvphG0AUOs866IsA8ZqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791845220; c=relaxed/simple;
	bh=RhPTPbxOil0nNbcCTe++QZ3I591tZ3jVFSRYtTAyr8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iS/E8PFsvbC48B6VtBFTPM62vmiL/tdMfTFbGw0clQCatyPP/TUotPK4emRvVlICt4ww5zoznTfTHAQgmHJm/JH3Cfk9DIO/kQ3hfwXZCwWsFV8wY6yAnYW0jNxr4RGEXCTBvqVv+4DmsUrvTETRSjaDqHcSHf0hGZ/V31klvWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lhJ0/cwF; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lhJ0/cwF"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5337fa12431so578231cf.1
        for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 15:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791845217; cv=none;
        d=google.com; s=arc-20260327;
        b=Ci3ikG1i7QsXPcFZPmIWEVyPbeXYLPRhwbM5fL+hHF5s/dtcBoC3CtkbyxA7LAwX0y
         Isj04L914DAhsRUUlDDILCn4+FU/S4s43ylByECSHQgwOdFfsggt2AfFAS/NVOtmhoIQ
         dNND/QyQisxyJJT458wNFmY5zo48DtgAC8i5bVX7mGmmK4YlWK1pfXRUOjMms8k+pK9w
         kPGZqSpvGa23o625oBUndHM/qJzQE8peXj3JUdxwRvCtB1gIuoNmN5Fk+w1D0A0TSiv/
         TIfY3ZkrAaCYOX0slc7WpE0THwyw3zFhLxGlWTXzMsFF6oOxC/BRhnAjXmvC8Z7BPxJg
         CoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RhPTPbxOil0nNbcCTe++QZ3I591tZ3jVFSRYtTAyr8w=;
        fh=K/vNnjDAimDDIsCgGvULaPyOtqQ0swVsVrt7uo+2bm4=;
        b=lMJ5a6nAlnmUFlR3YM3VJuLSoDxUmmbpOrxHztzPte0k9VBHR4WJBRmULK6BVndvyM
         BLyikrtm08EubAbIJGDbSnvP6lmPO90T2JIWntCj4CEjbeDmC1jelk8BjMxY36qxGR/r
         8z7M4bqIHmRFYibd/dp+mYOLDw1VAzZtLGoEPYqJi0C7JHfNye+qW7wNYisAVBpapytJ
         jtkiq0GY6l17kxQr13qzMm2CjXZnYbmzJr0QXHWF57QSBZCo1YyeZSSQOzDhpU6sx3IV
         +eh/R60xblgzcIxLJcuIcpVwCT7ptRRkI138yth8jqEp8b/LPl5c+LcZmveRJnj53v28
         h6Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791845217; x=1792450017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RhPTPbxOil0nNbcCTe++QZ3I591tZ3jVFSRYtTAyr8w=;
        b=lhJ0/cwFdQWf/2bVpInNeLDhUOQEPN6t6y74mzPuTbwYM+UgFz6JtDLvGRy1rR6Jgl
         cu73rNvLL1FPRpVN16q0h7KmP9notVAbJJ2hiLzeXPiK4s9QiC1dw64NVWaDPIukNXad
         Mp7CrTjkpZnNcJ/Oefmkl43J6LpJx30Cv1w4je9ezMFE6uyBIeRNJsxlkqDmKYwk3rux
         kF9QeG5EdEjrls+fK1jM0ULhiNlIoPgJ1niF2AfPPct8HtbyXTeqZNOuemWLGKJ6Bkik
         e2VMVBBYYVmAhGBy2miI2ATfmR8VvoPoq0vWIhCPfGLQIm6pTK8+RHog+JYY82YeP0IE
         4q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791845217; x=1792450017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RhPTPbxOil0nNbcCTe++QZ3I591tZ3jVFSRYtTAyr8w=;
        b=mHQrInBFUf1DDucFGoCeJVaYGTiVmPzDss+yK3VuWDCfzuXUQftRgI8wYvhjUgIByO
         XYQ8dryme5ECTspvTNU86p3wX5wLcdw40oBCvgU11lj2w17G9RcUSUtW1DIR6RJNrYeu
         jXbJC6jLo7GzjhNx5Ko1RHcPPLeDZ1HHz1PkmtwRzxp8aoqNj43qMQ/NDCdQ+zKALSrI
         zXW5zfqa4TTSXrMcVhdmQxvXahmMHUV5FaH761s6S10KtXqWoul0eU/7N/jBlKuAk3ma
         ZDvHel8XkFAHa+o0LJEspXat9kyAOixO/kbgDju2arSrupX+/DS1OtPC6Ug6joRjucTC
         /ZwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdFBgT43B7OgKn+5aajEdYsFuh3+JxKFi+/jbrpE6rKro/UV97bJA4thcSd22/Wc+KrtAgt4H4ec7A8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJpCJBXCySD7MZnmr4z9i/BYU0yE4B37/KmFLhXTvTJCOXYep7f
	1U4O9u6VKIs+7xvqIiOBrEO7wppUMjtaqdv/kDz7i9wDp15gk4fUpEohFmTs31lPILCtsGptqfm
	x7Sj0JBV0PrVJR8WMgTxwB3ZDNCeMdktqEHHccdi7
X-Gm-Gg: AYBFou1plXUc55qwZwboTwm4viyRVE4Qj6ogZhxb5SjBulZCLe7ls/OmBacksrtaL0J
	w6UEgusxorsZp6Yh5kj2IMtsPfxrTtyMepxLpQGNxW8hpK9bprOHp1/CpTxddloSLdR3LEFrTOh
	tFpISjoyNp+MY8xJBE7RmBK143wc7zpVjRToFHni47da25XArnQiUQzLvF5XHHQLqSIK117txWE
	gNdY+KbOCrquWGYebyjTz8p5M0jU5TnXuzSpb0GMwgr7lyTBOweE81nLVtecMQy2zYkvHCK0HKn
	KsXkZtDzXOR1UHQxDxE4meeTphyVIOw0UbONp4vNaMrgeDEjaKm1de2t6ZuurtNHRg0A3i4B3+n
	ia1cwEQwznIeePdII/OSS
X-Received: by 2002:a05:622a:1ba0:b0:534:313:9b4e with SMTP id
 d75a77b69052e-535b321298dmr38673911cf.5.1791845216797; Mon, 12 Oct 2026
 15:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-tools-regs-v1-1-2a5940e22548@gmail.com>
 <CA+=Fv5SDnzQQDzyhaQ37kWJMjTOHP0NHuAS6kJHwT8_Zqyjd-w@mail.gmail.com>
 <CA+=Fv5RGr2NQs=gnErAWXfSZgMcWB1q-_-BNQ5X5DyzqkV-bmQ@mail.gmail.com>
 <CAP-5=fXFYbuV9MtJsVX5hUPKDOxcjtNTHM4-qR7Q+ncsPq59UQ@mail.gmail.com> <CA+=Fv5QHzus2HUPJNFeWMCFSrOjvr8xhkPie2CLSbdjgK=+j8g@mail.gmail.com>
In-Reply-To: <CA+=Fv5QHzus2HUPJNFeWMCFSrOjvr8xhkPie2CLSbdjgK=+j8g@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 15:46:45 -0700
X-Gm-Features: AclHuK-ozzc1SZ1dDdK3H95QIDfp6Kr1nmKiVr9Y7a1gGwdz5GDz1Mrtu83sdx8
Message-ID: <CAP-5=fUk=me0TYTyyHojzrGzW2ZF2Jyu14QezdjdN=Z=siwmrQ@mail.gmail.com>
Subject: Re: [PATCH] perf regs: Add alpha support
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 3:38=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> Hi Ian,
>
> On Mon, Oct 12, 2026 at 11:45=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> >
> > On Mon, Oct 12, 2026 at 2:41=E2=80=AFPM Magnus Lindholm <linmag7@gmail.=
com> wrote:
> > >
> > > Hi again,
> > >
> > > On Mon, Oct 12, 2026 at 7:37=E2=80=AFPM Magnus Lindholm <linmag7@gmai=
l.com> wrote:
> > > > > base-commit: bc01105ed65d15787b2eb93ac26e8624a2139e35
> > > > > change-id: 20261001-alpha-perf-tools-regs-c206a84dec7f
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > Matt Turner <mattst88@gmail.com>
> > > > >
> > > >
> > > > Thanks for doing this!
> > > >
> > > > Register selection, recording, decoding and user stack dumps tested
> > > > on my ES40. End-to-end DWARF unwinding remains unverified because t=
he
> > > > installed elfutils 0.195 lacks Alpha unwinding support.
> > > >
> > > > Tested-by: Magnus Lindholm <linmag7@gmail.com>
> > >
> > > I just pulled your elfutils patches and ran some more tests.
> > > With your elfutils patches, DWARF unwinding now works on my ES40.
> > > Both existing and fresh perf recordings recovered the expected
> > > leaf -> middle -> outer -> main call chain.
> > >
> > > As documented, samples whose CFA depends on r15 stopped at the
> > > sampled frame, since r15 is unavailable. Tested-by tag already given
> > > to this series.
> >
> > I'm finding this fantastic and exciting to follow! Being greedy, does
> > the cross-platform DWARF unwinding work? perf record on an alpha and
> > perf report on, say, an x86. It would in no way block this work, but
> > I'm keen to check Matt/I wired this up properly :-)
> >
>
> Tested recording on the ES40 and reporting on x86-64 with patched
> perf and elfutils. I hit an existing offline architecture-detection
> issue in my for-next-based perf tree: it selected x86 registers for
> the Alpha samples.
>
> After two local corrections, both perf report and perf script
> recovered identical seven-frame chains for all 391 optimized samples.
> The r15-dependent workload stopped at the leaf, just as on Alpha.
>
> Both issues predate Matt's patch in this tree. The places to look
> are machines__init() in tools/perf/util/machine.c, where the host's
> machines pointer is left unset, and thread__e_machine_endian() in
> tools/perf/util/thread.c, where the session->data check for is_live
> appears, to me, inverted?
>
> Locally, setting machines->host.machines =3D machines and changing
> is_live =3D !!session->data to is_live =3D !session->data resolved this.
> These changes still need broader review, but the Alpha cross-platform
> unwinding itself looks good.

That's great news! I think the is_live issue was addressed here:
https://lore.kernel.org/linux-perf-users/20260905-perf-alpha-annotate-v1-1-=
97380433ccb6@gmail.com/
and the machines issue maybe in:
https://lore.kernel.org/linux-perf-users/20260918062620.2145220-1-irogers@g=
oogle.com/
Both these fixes are already queued up in perf-tools-next:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/

Thanks!
Ian

> Thanks,
> Magnus
