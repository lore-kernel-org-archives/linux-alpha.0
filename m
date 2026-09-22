Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B79C43C7B6
	for <linux-alpha@vger.kernel.org>; Tue, 22 Sep 2026 22:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115606; cv=pass; b=FpSpXBRaRP4+z/PMia4b6TR+aUxuM/+fu5v2hWlbqRa4lVP/oEWXZWLh7mMnJv642lJk+eGkaylnapqDKaIKaWZc3cHJw7EPtaaA6CIy0jVCOlP6mXiBbRoW2ARU+gPATVCZGHxJ68geduhuk7sIh+luIG+c6W/xgGSCFKUiEhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115606; c=relaxed/simple;
	bh=KkqEb6ybD3AaC9Ly6mYqFSucxX9tzapFNCsN2xv2QLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtwMFjCRf5SKbV1u3YgfTVOQkA8neOi8hIKXIAEd/b1a8A2mvMNg5J5B/Vl+C1odX4V4VqlKtaYY9uLtpOWbmYjasF4mfKZnkdD7p6tSlPS5VRNRBoD5YpUyFzLyBp3U7UF6RCjifL7BznPCwHC3KhumXiTpbltJj+xVb8czeyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KX8NhMw+; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KX8NhMw+"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so543667a12.3
        for <linux-alpha@vger.kernel.org>; Tue, 22 Sep 2026 15:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790115595; cv=none;
        d=google.com; s=arc-20260327;
        b=gqikpIH/7Guqgb3b6mUAcDN/zUJukBK5DSOKTpHATMFEkfggegpwXDOsrJgPVXefZP
         yMLbZMgCjVvq3Gnfxf/w0IV/EPjY/Gs3nwE/YQP/vJrvGzAjrs4R/ppkjpyiBetL8rfw
         jbp5Vln6aowmDtn4wIAomcUglGyljpDLXSrhXNZuhboEQDjj5T/3n/v8Sn6lbH6u0Eqr
         i8x5cD/NofmRCIJkt6HKWZ4do4uXF7tO+1CILYQN8/LmRO8AfAVyx0UQveOAVEiMGavP
         901/yg5u/lo0T3v3fELb3b8Wp+cVm5TuhW/Et/+lnutXyvnfX5fQD6WYXJqX4+moPDep
         2KzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ehdbOw/fRZu7I97PDHsXDuIQydQkUoH2K7S88BxSoTU=;
        fh=lTFuyM0mJi/aHEGbrFdeeuBLllSbYJqE3Kknixnd20A=;
        b=LqKkeotqfK/tJJU0auekEpytTomxetSol0u/vMUl4add9aKslhVME0u5uN4iiDBdVV
         UuMCKmTflsdMrwpKbAVFjr2NZ1gSqn33fjvlokXTqGtjdX3K97SQdE6jxGPVB7mWYD35
         4TjdjMmFgzzzw4UTkog0qwHWqkILidLHvSKxrnK4hInkMxmn1/qPdRZZ6eCNVT3POCNL
         bS6EQ2SGYMmFgp0YTJSMLxlSpo7blGrED+gn5WZ/xDchLEIu77SwCmX5T+af5A/+nZj7
         GnR4uEyE3d6xnQb1PDfFafyr6dOByTrKV6h0sSUME7SnjKB97mNNDUFw8BxzHI1ub/bG
         o/aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790115595; x=1790720395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ehdbOw/fRZu7I97PDHsXDuIQydQkUoH2K7S88BxSoTU=;
        b=KX8NhMw+j61ntZAnL8VrRxavr5ndvq1FsPztqu7du41hV2+QxhRfMBIIxQU5pA5ZDT
         jdE4u6zqheTFiXzXZF2oxEzOb/HZhoLdgWgHYk7iIn4B+XclRwgeh93QrAjnwpdK2EEF
         7fqZlv9xMnQ8nJP9aL65dR9URSZxdGmwA7lwDsWKhz4UCoWNxbNdFxRQmDf5uxliVtnT
         IlDKNRnh4lOafoPqEGTHb/tUNMHrlJzKuxLt0xArJguyJPlBUHhfhpyOwgdNL0c7evdV
         gtluowOQYvtXYMEYKq2zY2tzNbq4tmQXIJJ01X/hzD2aPaM1R4eFItNfyX3EBLYmIKOO
         d5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115595; x=1790720395;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehdbOw/fRZu7I97PDHsXDuIQydQkUoH2K7S88BxSoTU=;
        b=NlKCJzZ7s5LIde8bk/HXtytGWjmi7f+sB6phwc+dq1QC62XPqCrYhFwcuQt9YmKhIJ
         K2nRkWU7NEM7FE0+V3V47aXwr62nVoXwJCyQareTkjfE7ZC5sFyd012VCXQqr/prmyP9
         evxe1SvbWpU9hsFWkDH2Ci+J6HSoGET4WlyJXcH+tf8z6iooEjs/7tElyW3QNWG10nHr
         cwGeaOzkivCSin6ZTEUZTvgcr0bHokzrQIjc1+iAkHCgwvRNcTHeeqKN0+1fTyhV9Mbx
         NSU5isICTzqfFtRFfDs4+hSTa1naeUibKOmvnKTy4AIrAQ9frHEz9XtHG9BGxkkpDGg4
         9fHQ==
X-Gm-Message-State: AFuF++lhToKwZViAudYIxgTl08iDxoT5jfbXLDGozk+i7gBUFvKTqSl7
	RaR8k7T/sb25xD4uoNPwGWZgsEUdIXTWhW5hkbYVO2apOyfchsq2kDxmFzqRBq9kw0tSc7Mh3Ir
	13Vg2f1HdZXZPpH5XKetX2f5HAfljoTxQYmOLkQg=
X-Gm-Gg: AYBFou1HP7JnputErM+jmdmPUIYwMx499r/DbBgx/Bt2X+94KEO6Pu0+rVZ1CwkGcy7
	q//XgMBkwve0EUeJs/RebWe0zxYGEHe5MPc7fMpFfiJefWcuCUDWys8axiHPssNdo+ejRPjaNtB
	i0h2whEV4uFA8jPoDRHhB5j8qEWKorMWNl7VGW28NBCXjg5muqizukettJrhjD7kwYqz70zLj8G
	PA+4VNKkEOr4aMf/6ISjx1r6KA/JtVbOH14fMEOWSk+i7CcqhREimDNKwPMDxGcYAJcBYTDK236
	IhTPVuyzQJ+BPQua9KKgPyxxgo79/mXKYvHO142uIl7DCvHo2RkcjpTMLYs7aVlvDO2RYRdTNQN
	IERYF3vguTozraoiXjoUntSYJ0o8/85Pzg2viJ+6S
X-Received: by 2002:a17:907:8993:b0:c26:1648:a06c with SMTP id
 a640c23a62f3a-c2aadfb0281mr47230466b.39.1790115594818; Tue, 22 Sep 2026
 15:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810193902.3286353-1-linmag7@gmail.com> <20260922175631.1022886-1-mattst88@gmail.com>
In-Reply-To: <20260922175631.1022886-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 23 Sep 2026 00:19:43 +0200
X-Gm-Features: AclHuK_SB6sQsXOZzcOPBd5xkxITs3biUCFC_65cah8YinuYNrWthiKKKFNatjk
Message-ID: <CA+=Fv5Q7hqAh3uw2w606zcieEp438Hie97YOzqLLqNyav06BLw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] alpha: fix stale TLB translations breaking
 copy-on-write and writeback
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 22, 2026 at 7:56=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Mon, Aug 10, 2026 at 09:34:51PM +0200, Magnus Lindholm wrote:
> >   mkclean4.c covers patches 3 and 5 (needs root), and fails on both SMP=
 and
> >   UP. A single thread writes a small MAP_SHARED file while background
> >   writeback cleans it, and the file is then compared against the mappin=
g;
> >   every round loses data.
>
> I wrote something along those lines and could not get it to fail on EV7,
> on v7.3-rc1 without the series, with and without CONFIG_COMPACTION, on
> both an SMP-enabled and a CONFIG_SMP=3Dn kernel. Only one CPU was online
> throughout, so none of this exercises the multi-CPU paths. Writeback was
> running underneath: 850 to 1700 pages written back per run.
>
> The path is reached, though. With counters in flush_tlb_page() on the
> unpatched kernel:
>
>     ftp: cur=3D77824 lazy=3D324 other=3D466
>     ftp lazy: loaded asn=3D0 mm asn=3D79 pid=3D12 comm=3Dkworker/u4:0
>     ftp lazy: loaded asn=3D0 mm asn=3D138 pid=3D12 comm=3Dkworker/u4:0
>
> so the flusher does issue the targeted tbi() with ASN 0 loaded against an
> mm whose ASN is 79, a few hundred times per run, exactly as you describe.
> The writer keeps faulting afterwards and the page keeps being redirtied,
> so nothing is lost.
>
> The reading that fits is that the EV7 PALcode invalidates by VA without
> matching the ASN, which would make this unobservable here and observable
> on your EV68. If you have a way to distinguish that from the console I am
> happy to run it. Either way the test is wrong by the architecture, so the
> patches stand on their own.
>
> One thing that confused me for a while, and may be worth a line in the
> changelog: since dd5712f3379c ("alpha: fix user-space corruption during
> memory compaction") alpha overrides ptep_clear_flush() to call
> migrate_flush_tlb_page(), and that override is inside #ifdef
> CONFIG_COMPACTION in asm/pgtable.h. With COMPACTION=3Dy, folio_mkclean()
> never reaches flush_tlb_page() at all, so mkclean4 should pass there
> whether or not this series is applied. I take it your failing runs are th=
e
> COMPACTION=3Dn ones.

You have found something I owed the list a correction about, and this is
the explanation for it. I could not reproduce my own mkclean4 numbers when
I re-ran them - 0 failures in 103 rounds on unpatched kernels and I had
not worked out what differed. It was the config. My records say the box
had CONFIG_COMPACTION not set and CONFIG_MIGRATION absent on the day the
reproducer was written and the numbers taken, and every kernel I built
afterwards has COMPACTION=3Dy. So yes: the failing runs are the COMPACTION=
=3Dn
ones, and the re-runs that passed were COMPACTION=3Dy, where as you say the
test cannot reach flush_tlb_page() at all.

> That also raises the question of why the correct
> flushing in ptep_clear_flush() is conditional on COMPACTION in the first
> place, but that is not this series.

Agreed,  CONFIG_MIGRATION is the correct gate here, I should probably
send out a separate fix for that (fixing my own code there).

>
> On patch 1: alpha selects ARCH_NO_PREEMPT, so unless something drags in
> PREEMPT_COUNT (DEBUG_ATOMIC_SLEEP, say) preemptible() is 0 and the hook
> always runs, including after kthread_use_mm(). The changelog says the hoo=
k
> does nothing there and that the later patches rely on asn_lock staying
> set, which is then only true for PREEMPT_COUNT=3Dy builds. Since patches =
2
> and 3 lean on that window, it would help to say so.
>

Right, and the consequence is sharper than the changelog being incomplete.
In an ordinary alpha build the hook runs after kthread_use_mm() and clears
asn_lock there, so patch 2's mm =3D=3D current->mm && !asn_locked() test is=
 true
for a borrowed mm and the targeted tbi() goes out against the context that
is actually loaded, which is not the borrowed one. The claim that the
shootdown handlers can rely on asn_locked() across that window only holds
for PREEMPT_COUNT=3Dy builds, and I will drop it.

It is not a regression, the pre-patch active_mm test behaves the same way
for a borrowed mm, and patch 2 still fixes the lazy-TLB case it is aimed at=
.
What actually closes the kthread window is loading the context on the direc=
t
switch, which is patch 3 of the follow-up series. v3's changelog will say
that instead.

> On the changes since v1: dropping the check_mmu_context() call from
> switch_to() means the bookkeeping now runs after finish_lock_switch() has
> re-enabled interrupts, rather than with them still off. I convinced mysel=
f
> that window is harmless, since the CPU is in kernel code throughout and
> the case that matters sets need_new_asn, but "no functional change from
> v1" undersells it.
>

Fair, and I will say what moved. My reading of why the window is safe
matches yours: PAL_swpctx has already installed the new context, so an IPI
arriving there sees !asn_locked() only after the store and takes the direct
flush against the right context, and need_new_asn is only ever set while
asn_lock is 1.

> For what it is worth on EV7 with one CPU, with the series applied: no
> regressions in a gdb breakpoint exerciser, a fork/COW check, or the
> writeback test above, on either kernel.

Thanks! that covers patch 7's path, which I had only exercised for
regressions myself. I'll put together a v3 asap.

Magnus
