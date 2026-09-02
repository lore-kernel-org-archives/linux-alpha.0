Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB72B33FE33
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 18:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375440; cv=pass; b=Xh60jZIGGm0Y/H1z4UKQXnj0DsxYCt19FKzxrtB8Cm7odVoC68KtCURDfmaFVZXWFjYdRL0bCkichRnkxhmxKU4wBpXB1HtDvZ8w0kd/esYTejLELwlXPodf4Oi/CU+IATdN1CwZglA8Mzo48h1eVeepaSYhlqX5zQcXllxjouc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375440; c=relaxed/simple;
	bh=kAhdATwx3WIHbGB0k07lcKXBFcbhBGOux02j6uV4eeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cm77M7Z7stCGjJ3WCvDqvEFH66cJoGjqgAQKluvUkZVtl6YigO5/WhblFGfEDDgZBCfZZCc/q0P7lP1MXBHCG6IlbmEMdhtTWPoD26J6CxEJOTFlXOQfQQI2ihqnAbqJE48YLz57tVGrN3CwOND1/iwtGXvoTEDTSiYbsjmLRK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2ZbxSCZ; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2ZbxSCZ"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so12440781fa.3
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 11:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788375436; cv=none;
        d=google.com; s=arc-20260327;
        b=ovwYEPijjhlBka4pXeMQbtzVUHmHiB+Zi2No7/ShaIuTBDFpyaeaSD7BZfY/RxHyx+
         LkFAaAgv/fa67Yd0OUzYmCRoysfEBWSMtBRvTF+4LqPJjmonGjMhkJWb2l9mB5jC1flf
         CgQp+Uue6Z25lmU3F3RwVPaNhG4x/GkEaN2UdczDxt+bEuATSt0bhy8lfVnKzExKPSUn
         SVPre1rhGdjXV2TJhDJim+vat9iRBe8sFPRt2+Qa+D8TNZRj+GF6M7jjOpj3dyRQ9r71
         dgs2xkYfU28GQe+TE0d8GBg19lZ0LY+HiB5cH+7VzYzo0TfVpbGx4rtUwFHqXpmvLbMl
         v2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=So64Ro6SpTwfGQ7jkVS9du9c9Dq+a9Y0lq1VIThiEm0=;
        fh=YoohNe5V071jto2x+teLVDcafEz22uZq2Ou4nrFt9Rw=;
        b=sVFbHRA6YFeBO268VoRiwTp1NjhW+LF6NPzk6ssXpSyfDGLK65g+xVEAAwaeoBGwOq
         i2Ygo2HrTPbOL/doeeoBz/gBLBqHpfgH6zWWCX5v5knCiQInU7NNJJFl5w4HW6HNhieC
         Oi8KdIsnHCNwVZKZFZx3UghYNF7ejgObzuQT/717BUilQDlBNaF8/GjlYa/9a/T/Y4oJ
         D+iBQuQfEh5qE63HERw2U/389t8i1dDOZ55zt1XZlWxxuUvcMUcVR12A2zPDKL36paA4
         gkR/kOAK8SjkTs6jbyx0Ny4XSkQ0i+fI+ln9I8+JmaAUqY8t5e8Rnr8b1F29ycjm/Cqc
         1oqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788375436; x=1788980236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=So64Ro6SpTwfGQ7jkVS9du9c9Dq+a9Y0lq1VIThiEm0=;
        b=W2ZbxSCZFNowL1O1sWHqd3OtI2VjYB9ruJrjdhX2XLEPFlVdoOxsvZ7Yg2nxGBtZ0n
         V3R16md3xBulofqhsidQHvvAQ/CU6z6VHNzRI9Mi4UVg7BMCxCPxuo96BMqMlOG7M2ZM
         g1hFf5byhBw08WA1BLmVOOkoCiakWlTZ2p3J9yIv/fivzv5dwVaEk2oOy/aFMsNlZ60d
         TBL+lVjSskEbr3umXcUHZVmTXmT4jLZ7VnKGsdQlAyYehcruNl17mNUszsDD5ttRcFbX
         GQLdTZSUE8Jjt3XGakY4H6Rf2kbYDkcbqb4f05mpsIQXnS3zWvfwGgC5zBo8J6bTfzTS
         6Uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788375436; x=1788980236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=So64Ro6SpTwfGQ7jkVS9du9c9Dq+a9Y0lq1VIThiEm0=;
        b=ieBQcbLUBQPAwvBQYLT1JyjD5PUndkOcv3M7BMT827f2hqzDpV1XG/sVYRcPA3PehE
         AOeQA3TqIT/uE/PSqEY71zwwCk4zEEhVIGH3/evuqjEt/PIXXBdD7jHVGgDYgxqFT+q8
         rkwHSaSKkhqUHukuqqHfMgxfxfUtdRfuvNcqLZJNOfW94ExcnATCSG2fcxy1bcp/2B3/
         RlDL8mtVkM0gc/R9MwDKa1TsQZCwmhaq4rAbnMdFtUVp4tsNv9ORm/cye2ZntKr7nKVD
         bJ4Xk87L+O1NFMo1/J11/3gl6cmKD3lPIzfAPg0T4dds7+pjmhn5Op/3BBtWSiG+Lhmj
         RxbA==
X-Gm-Message-State: AFuF++lFdAsAdJJooQ2fdpF254QNpc9dH1by60AkeGoMcezFJVMvOdvK
	HWf2MBi4iKSnqN0sjYIZkNJ7EMrbLMAg0om3pt8B9nCDE7LND/vbW6QZZD/5+3yOB+8/iPUtRy2
	bgpXZFJpwPcrtFRibihJPD7uf1HSLRPk=
X-Gm-Gg: AYBFou1cLxJdHwY/GvTpSnXRvRsqVNpjQN8bcqEwTN62K8XEzUQHddFSVxpdt0hmXj1
	NaEpfzTFOJtC87Bjp/PwCk0qDL7kH9yQ8u91079oJFdSAr4mfThfeS60K8P4FlmG8Nj7+YsdIDH
	qizAZnRbLMdZAw8qY2SXZKX+u6zDcEtpvslM9eCyrIUg56hW9F/Bqullhl91YuoC8ApWx7uPS2i
	HuzlrpiahuyckagFjOR0dPMosiyvoiz4HiZPNsnXp22LKX6Pxt4bN7/7yWZ17cvJUDZ8f0CLCcN
	4J3kc7W61yFD1XiFIcjQyW1eVqLJQqdnIBS+MH5bGU+jfxQ=
X-Received: by 2002:a05:6512:3e1a:b0:5b5:e8d5:7fff with SMTP id
 2adb3069b0e04-5b60834e1c3mr1882892e87.8.1788375436183; Wed, 02 Sep 2026
 11:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <CA+=Fv5Tze+34x+pZDeWb0kjeDsY15yd+pAh7weS3kai7mr9TXA@mail.gmail.com>
In-Reply-To: <CA+=Fv5Tze+34x+pZDeWb0kjeDsY15yd+pAh7weS3kai7mr9TXA@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 2 Sep 2026 14:57:02 -0400
X-Gm-Features: AcwNN1Wpg9XeJvBCH5t7ntVx1yYgoN82DInM_VUfflO5wpHt-MDCBRbtr8P-ECQ
Message-ID: <CAEdQ38FoUPzftf9vDcJK8L38j+cDzTyxdL+Fj-3oAQHmmOxaOA@mail.gmail.com>
Subject: Re: [PATCH 00/24] alpha: catch up on architecture Kconfig options
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 2:54=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Hi Matt,
>
> On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
> >
> > Alpha is missing a long list of Kconfig options that other architecture=
s
> > have picked up over the years, some of them for no better reason than
> > nobody having gone through the list.  I diffed the select statements in
> > every other arch/*/Kconfig against arch/alpha/Kconfig and worked throug=
h
> > what turned up.  This series is the result: two fixes it depends on, an=
d
> > the options that are either free or close to it.
> >
> > The patches are ordered from least to most contentious, so the front of
> > the series can be applied on its own if the tail needs discussion.
> >
> > Patches 1-2 are fixes.  arch_irqs_disabled_flags() only reported
> > interrupts as disabled at IPL_MAX, but PALcode enters handlers at the
> > IPL of the interrupt being delivered, so a device or timer handler
> > answered that interrupts were enabled.  handle_irq() also called
> > irq_to_desc() before irq_enter(), running generic code with the preempt
> > count still saying task context and RCU not yet watching.  Both matter =
on
> > their own; patches 23 and 24 are what made them visible.
> >
> > Patches 3-11 are one-line selects with no Alpha code behind them:
> > instrumentation (UBSAN, gcov, kmemleak), EDAC, and four properties Alph=
a
> > has always had but never declared (LL/SC atomics, hardware multiply,
> > __int128, the existing asm/compiler.h, and the non-overlapping user and
> > kernel address spaces).
> >
> > Patches 12-17 add a small amount of code: an empty thread_struct
> > whitelist, _PAGE_SPECIAL on a free PTE bit, the page table check helper=
s,
> > and then the three things that follow from those - the page table helpe=
r
> > self test, lockless GUP, and the early memtest.  Note that early_memtes=
t()
> > is called from arch_mm_preinit() rather than paging_init(), because Alp=
ha
> > calls paging_init() from setup_arch(), before parse_early_param() has s=
een
> > the memtest=3D option.
> >
> > Patches 18-20 change something visible.  Unhandled user faults now prin=
t
> > the usual message under the debug.exception-trace sysctl.  .eh_frame is
> > discarded: gcc emits it for Alpha regardless of
> > -fno-asynchronous-unwind-tables, it was allocated in the loaded image, =
and
> > nothing consumes it, since the stack trace code scans for text addresse=
s
> > rather than unwinding DWARF.  That is worth about 1.1MB.  With that and
> > the relocation sections placed explicitly, the kernel links with no
> > orphans left, so the last of the three asks the linker to say so.
> >
> > Patches 21-24 are the ones I expect to draw comment.  Patch 22 adds a
> > uapi header, so the perf register numbering is an ABI decision.  Patch =
23
> > is SPARSE_IRQ: without it Marvel carries a 12.6MB static irq_desc[] in
> > .data for 32768 possible interrupts, of which a real ES47 uses 87, and
> > the kernel links at a fixed address just above the console reservation
> > where that 12.6MB is the difference between fitting and not.  Patch 24
> > instruments the entry assembly for lockdep hardirq tracking.
> >
> > Tested with gcc 17 under QEMU (-M clipper -smp 2, an ALPHA_GENERIC buil=
d)
> > with PROVE_LOCKING enabled: no splats, early_memtest passes all four
> > patterns over the free memblock ranges with nothing reserved,
> > debug_vm_pgtable validates with no warning, a vmsplice() of an anonymou=
s
> > mapping through pin_user_pages_fast() returns the right data, and an
> > unhandled SIGSEGV prints the new trace line.  Patch 23 was tested on an
> > AlphaServer ES47.
> >
> > Not included, and worth mentioning: ARCH_HAS_KCOV.  A kernel with
> > KCOV_INSTRUMENT_ALL boots and runs, but CONFIG_KCOV_SELFTEST panics.  T=
he
> > self test deliberately arms kcov with no coverage area so that any
> > instrumented function reached from interrupt context faults, checking
> > that nothing escapes the window before the preempt count says hardirq.
> > On Alpha something does.  Patch 2 fixes one such site; the panic surviv=
es
> > it, so the entry paths need an audit first.
> >
>
> Thanks for taking the time to do this! This is a nice collection of patch=
es.
> I've started on the review and testing, I will keep at it.
> As general feedback for the series, I noticed that several of the
> corresponding architecture feature matrices still list Alpha as TODO.
> The Alpha entries should be changed to "ok" for:
>
>   ARCH_HAS_GCOV_PROFILE_ALL
>   HAVE_DEBUG_KMEMLEAK
>   ARCH_HAS_PTE_SPECIAL
>   ARCH_HAS_DEBUG_VM_PGTABLE
>   HAVE_PERF_REGS
>   HAVE_PERF_USER_STACK_DUMP
>
> These correspond to patches 4, 5, 13, 15, and 22.  It would probably be
> best to include each documentation update in the patch which enables the
> corresponding feature.

Oh, definitely. Thanks for catching that.

> It would also be helpful if the next revision were rebased onto
> v7.3-rc1 and applied cleanly on top of my Alpha GENERIC_ENTRY v5 series.
> I am currently testing only the patches which applied successfully.
>
> Alpha GENERIC_ENTRY v5 series is available here:
> https://lore.kernel.org/linux-alpha/20260902184058.198679-1-linmag7@gmail=
.com/T/#t

Perfect, I will do it!
