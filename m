Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EC34A8A3E
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 18:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375256; cv=pass; b=P76z3156XWtd0CoO/8XknPYBwOPwlgfdBDMdR3wRtR3zpG0W+L9bV8EKa26NB7/nSswUvc7QtPF+vMVrTz+NGAdg4zInwc+Ex+loCUSf2W4W/c5jhAoQXa516kV7Po4RggfpZ35Z1NLux/mtjPlRzRt4ZmPl1sz36AUubsNQ3xY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375256; c=relaxed/simple;
	bh=cpaZKjlU7B8ILrdB4fGgnu6+0vNZxjeCWYeXvEw+9R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RsD75SjRWLUzc7CnFyK/EjcSXWaG2gcyianMqVVLJND3hk9fRoKBJzPo2Z5+hh/Bq5LDcl73TuNsVrgLYC7HIFhpQxFgImRqEMWbdWnBn5BIttapExBQViPZWniSd50LqPK7utooOhBIk7R9A5slUWuq9W3Jsg6AyR0CmL7eM0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCEar4yd; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCEar4yd"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so2493345a12.3
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 11:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788375252; cv=none;
        d=google.com; s=arc-20260327;
        b=oiFqFIvb9J+5o/5nt8SBGNicd/H/Fj3Cf/KgO6O6UFURjaa49EJ7BXay/cewhGJUeJ
         omlegSBLYk7cGVM36kHKL1tQLDOtWIi6p+lcCdKxCzLUdpks7QVB/raOPjCz+d7eJqz1
         ojH6hWNwIWeb5twda8qSMlr9QrVztvJGcxc659nOmNnmhxayBdmnK2YbQSiVuD2AfUg9
         5sl2MCErQMll2uuGzlwoU/ya/ijI6jUkqqxGnEUnV6mnidzdUmaHLcfgHvBFhgDSi8bN
         ZXlssutg2yw/6UbwejzzToabyj4BqsrlvgkTGCI8LY9y4wbq1UZvfbdJkfqUnoFUHRni
         tgjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IY8poiMupLJiaO+7G5dNdyPTPj0jxqqwAYgGEytSFFg=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=Ip8u9mARtHjMLVe212Gvs1ilkc66HZDkH0+wb+m5T0lKYAlUS9Wd3+uEb1oXFQ0p74
         WsgX+7Dk2gqwqhSUuKtwJvnLcg55B+i1iQbb3nxTJRVPafP9JmR89jg0nPF6GeCnRE/W
         mTjNdj1/EZlQTycWqIo0GF+k3djbZk8zpWnJM/ZlTvbHqwjjip10STfRpV9wcGwSeu7p
         LI5kPExw/kiXYVuW8lyb+oy/l+5iWpHSvUWKvxIDOzK51liYjZO4TBeK7v05FTvTCos2
         e2+4LzS9zquUZ224Dr34A4g8H0DwX8LQYh2otS0M2YN9IzGH5eQPLB8D+NnFfAtMFJv/
         zvbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788375252; x=1788980052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IY8poiMupLJiaO+7G5dNdyPTPj0jxqqwAYgGEytSFFg=;
        b=NCEar4yd0g9+qD77HNidjrOSE0bYsdpiTLp7xS6kBgXL0uASvAM8WmQTxhPpSWzB+W
         zt3Epuw6uBSgQw/R9z2tJaLjA6lGp26K40Pwhz8/tPc2km1vCfnMlaI6bme5ULtzn7kH
         XpBIsmq53U3dzV3OjxDPFL/wvcrg8ibWgd3Xiaq4Nqv4XixU1DlXc2eWJszXglPpJcQL
         pGbgUBBdqEkWuN5rKcuqObjNHsxlCMgCtKY4+KUMwdudLw/+inZ+riZAX3HnfCmwSWs5
         RO3pNQo0tMmuq/h8+hVmgZarwvSA2dNbo+YxMKCbzaW/os+i7RSfk31JiROpc5o4l0d7
         cFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788375252; x=1788980052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IY8poiMupLJiaO+7G5dNdyPTPj0jxqqwAYgGEytSFFg=;
        b=VQ3fKHQA7PBdYCI/eFSOzQJUSIInENShFJv3pERkVUF20oXOstP82VegbWQly/FOhW
         D5EbQqLV56t9E1TPc+G/Sc24DuCQhabS4G8G7OfnHmNp4VhOwtMlvn/ulexSDafPfMIw
         09yJ1tdtxACujM1wrGqSxfzppmBLkLLgEBDvXFr8upwTPj21+B0AqvY9HSwyxy82EPBi
         57Fi48KIMnyHAmeS0oZ42oS1y4RTlbikBln1DzXH3DZwVwwJt5DdOAr+FDXKMBCosDrt
         YUGKj36CyUM9HuBi+4pjJSbexayMJ0YeqHE5cLEOvC9AUhEzYdScpow77Js83wXLlzkn
         zLWA==
X-Gm-Message-State: AFuF++m4JM0NNyseBlx7FjyGJ7OEjuiS2d2+asAHxqciI5E0jVNAh47o
	XbMbTQeSEp9socproVTIUJi7faHy7Wt2uQPHUj/z0HeXBdepbW756XoDjycIpu+KDOGnbBbwYVS
	5pR0Frfhr+jxLRGqQj6yfKn7jFmBaIoc=
X-Gm-Gg: AYBFou2b1YETLq60+jqOsazzqXCje76ZzR6POSZ6gvmZ/wW4pafmT0bfQOH4Gnos5YR
	0liCmzz+BiAYamOpN6ShoqDBuwvpNBzkXZv4HC0Jy1m/X36KIWG8Isv2LZFAEli7V7SLGqEUoun
	UNcrLnhmLBhrNUWev+EG0BKsdvuQmSTeuTtFHOknsMbfmYwgzL/zsaUi4bytyehpTFid92GoNvG
	0AH7LXbyhi/sX7+P5ifkp2NA+tA7LrIqnQTTduhllwnOmIM38YHMbsiOEJBU+JuLtBWye+kgqGR
	y2HdHsFoUUn/NlIH6JQSRAG0f/OupghZQOZ/56/tNMyBkHkoBhauoGhZWza/Ngo92csD9BwBDSK
	wsRc7De8Z9OMp568azpYOVGqzT/YkS+g=
X-Received: by 2002:a05:6402:460c:b0:6a3:87b7:b516 with SMTP id
 4fb4d7f45d1cf-6a68313fb0cmr4668745a12.6.1788375252245; Wed, 02 Sep 2026
 11:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com>
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 20:53:58 +0200
X-Gm-Features: AcwNN1UU8QuPrPkYUGlA9muacN9VHIAgsz6786GXhDvk6mo3Pz0VToDkYHYK2tM
Message-ID: <CA+=Fv5Tze+34x+pZDeWb0kjeDsY15yd+pAh7weS3kai7mr9TXA@mail.gmail.com>
Subject: Re: [PATCH 00/24] alpha: catch up on architecture Kconfig options
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha is missing a long list of Kconfig options that other architectures
> have picked up over the years, some of them for no better reason than
> nobody having gone through the list.  I diffed the select statements in
> every other arch/*/Kconfig against arch/alpha/Kconfig and worked through
> what turned up.  This series is the result: two fixes it depends on, and
> the options that are either free or close to it.
>
> The patches are ordered from least to most contentious, so the front of
> the series can be applied on its own if the tail needs discussion.
>
> Patches 1-2 are fixes.  arch_irqs_disabled_flags() only reported
> interrupts as disabled at IPL_MAX, but PALcode enters handlers at the
> IPL of the interrupt being delivered, so a device or timer handler
> answered that interrupts were enabled.  handle_irq() also called
> irq_to_desc() before irq_enter(), running generic code with the preempt
> count still saying task context and RCU not yet watching.  Both matter on
> their own; patches 23 and 24 are what made them visible.
>
> Patches 3-11 are one-line selects with no Alpha code behind them:
> instrumentation (UBSAN, gcov, kmemleak), EDAC, and four properties Alpha
> has always had but never declared (LL/SC atomics, hardware multiply,
> __int128, the existing asm/compiler.h, and the non-overlapping user and
> kernel address spaces).
>
> Patches 12-17 add a small amount of code: an empty thread_struct
> whitelist, _PAGE_SPECIAL on a free PTE bit, the page table check helpers,
> and then the three things that follow from those - the page table helper
> self test, lockless GUP, and the early memtest.  Note that early_memtest(=
)
> is called from arch_mm_preinit() rather than paging_init(), because Alpha
> calls paging_init() from setup_arch(), before parse_early_param() has see=
n
> the memtest=3D option.
>
> Patches 18-20 change something visible.  Unhandled user faults now print
> the usual message under the debug.exception-trace sysctl.  .eh_frame is
> discarded: gcc emits it for Alpha regardless of
> -fno-asynchronous-unwind-tables, it was allocated in the loaded image, an=
d
> nothing consumes it, since the stack trace code scans for text addresses
> rather than unwinding DWARF.  That is worth about 1.1MB.  With that and
> the relocation sections placed explicitly, the kernel links with no
> orphans left, so the last of the three asks the linker to say so.
>
> Patches 21-24 are the ones I expect to draw comment.  Patch 22 adds a
> uapi header, so the perf register numbering is an ABI decision.  Patch 23
> is SPARSE_IRQ: without it Marvel carries a 12.6MB static irq_desc[] in
> .data for 32768 possible interrupts, of which a real ES47 uses 87, and
> the kernel links at a fixed address just above the console reservation
> where that 12.6MB is the difference between fitting and not.  Patch 24
> instruments the entry assembly for lockdep hardirq tracking.
>
> Tested with gcc 17 under QEMU (-M clipper -smp 2, an ALPHA_GENERIC build)
> with PROVE_LOCKING enabled: no splats, early_memtest passes all four
> patterns over the free memblock ranges with nothing reserved,
> debug_vm_pgtable validates with no warning, a vmsplice() of an anonymous
> mapping through pin_user_pages_fast() returns the right data, and an
> unhandled SIGSEGV prints the new trace line.  Patch 23 was tested on an
> AlphaServer ES47.
>
> Not included, and worth mentioning: ARCH_HAS_KCOV.  A kernel with
> KCOV_INSTRUMENT_ALL boots and runs, but CONFIG_KCOV_SELFTEST panics.  The
> self test deliberately arms kcov with no coverage area so that any
> instrumented function reached from interrupt context faults, checking
> that nothing escapes the window before the preempt count says hardirq.
> On Alpha something does.  Patch 2 fixes one such site; the panic survives
> it, so the entry paths need an audit first.
>

Thanks for taking the time to do this! This is a nice collection of patches=
.
I've started on the review and testing, I will keep at it.
As general feedback for the series, I noticed that several of the
corresponding architecture feature matrices still list Alpha as TODO.
The Alpha entries should be changed to "ok" for:

  ARCH_HAS_GCOV_PROFILE_ALL
  HAVE_DEBUG_KMEMLEAK
  ARCH_HAS_PTE_SPECIAL
  ARCH_HAS_DEBUG_VM_PGTABLE
  HAVE_PERF_REGS
  HAVE_PERF_USER_STACK_DUMP

These correspond to patches 4, 5, 13, 15, and 22.  It would probably be
best to include each documentation update in the patch which enables the
corresponding feature.

It would also be helpful if the next revision were rebased onto
v7.3-rc1 and applied cleanly on top of my Alpha GENERIC_ENTRY v5 series.
I am currently testing only the patches which applied successfully.

Alpha GENERIC_ENTRY v5 series is available here:
https://lore.kernel.org/linux-alpha/20260902184058.198679-1-linmag7@gmail.c=
om/T/#t

Regards,
Magnus
