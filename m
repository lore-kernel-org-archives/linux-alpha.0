Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DB147D930
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 23:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791500995; cv=pass; b=FvlalmLZ5MVMjKjdNIhk4oj8K7rEgYtV5f1CD2yy/Gl5LZ7i/kAcaM6NxH9MT3w4bdv/DW58vbpWMBuuafCLMi9fIAf/PDPq1CpS7Bjcf6gFKxJ4IKOKfDGXrC/HhAqZVLEt8+aMtTFeA06pdHIWD7iW51s/hEJbIRm1RXv/9pU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791500995; c=relaxed/simple;
	bh=2c3IvCJlq17nHLsZnMWDAKYTuVwffS7S0es1lw68GbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMIicgWQPyXwp6mipFRy+RU35YqJGREIHUfrk3ugEAfAEGJ/slah65og87EBUFRB7d13aB8VcUjN17mXC8xtzFMo496EUX22rns1JWDRR9awDfPxXNZEQjADit/0q4F73FuCEyn9vnkf0YcJAd3harERMctgXrVVmgI2p6BIyu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcvChL7B; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcvChL7B"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6afe8d3980aso4316907a12.1
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 16:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791500992; cv=none;
        d=google.com; s=arc-20260327;
        b=lG60NFkRnIRtkJY+/ZdjGsxsHbQi9Jh6wkyJ2pvpANj/KCW/EtjV3iQzYIoBz7dKEV
         7qpXWNfEOdRdmgjwPJHzsTrTKCj/LGeLftasewnPBYqibz7Hr2gDGqpSXd99qlwsVWB+
         PGMLKsfguPU2S38b5hFbEg5WbRZhQCIDZfX2xChghG4Dy97DGxWAT1yssJC67nViElm4
         qmHRUCHbFm/3nYKp4c37oLg9jSDt8NFyGMQezzFfkkqX6M5TaDUz7y8Z2lebp2/Gldyc
         o6AGWtFjy+NhbxIh/Q3LufEgaNePpUf7HoYXZrEWCevCrVGOB92NySF0UxlIwbDLel1M
         Dtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=riNn6Uie2S9eDMsQh+vXBNmgd3xoMp+NULbpGq04Tp8=;
        fh=c+YOFanyqQTFDqk/STE1fABEJnI/CwfoykstDhvOsJY=;
        b=oNqbDWMfH8nBbvaNww1XFIo1csNt1tx3b3r/Fv1blm4cKBgu881R29M3E/CMhHsV8D
         waWtDZRVyTMQzfYyoNi1PL9+oJuylPIRmHvmrlXqf3mrdwOdULgddyFZjVxwcPW+0zS8
         4GWetrQbXSrvSbNPfj0gMW6UOAYZR2bXzOTSeDn4NarrvovqCg5fqshEBAq8sKczA7qC
         CdGIC1FYdTgqb9zEZ0oeBln2DBfY1zrHh7PRc3BwvsBKbjrqGOwqO4Sqq/3hIGpust4q
         0kIQs8QRAbKw6md5pK0vVMKwF3JUOL4RcCVKi8CW/w7WFAiEiWQe4oVUJq6GDQt+/2O4
         RnXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791500992; x=1792105792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=riNn6Uie2S9eDMsQh+vXBNmgd3xoMp+NULbpGq04Tp8=;
        b=bcvChL7BohCaukfEk25bl4uo+KaYJDJi3aif6uHQwa7M7b/QrrH359CRKZJsY9p1zR
         P+UcXOlmRBAG8sJlkuYtucEtmpYkGLIo56lXwZrF+IXSi1GF5ND3tbYCde9riHFXy0VZ
         nnOiDmCI85pLtiJMFbxAsSxv2oXEZs8Asv0lAGnxKWJ94AhhyexlbWXLiawa9ry2z5ga
         2WPfSxgZ3apGTmpSA81Uv5RGc+IxQh0mGEP1oxbRGzC7Y6rJ4Zpyv4kIG9FIAsgwYzXT
         TWl8jZoY5x94/r+ff0yWw5m18Tf/xhkeYh8t1f//BAkvlaaWnZc8nBGaZnz9evFACevd
         s4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791500992; x=1792105792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riNn6Uie2S9eDMsQh+vXBNmgd3xoMp+NULbpGq04Tp8=;
        b=C0UfuGX0xAy8NpZsY7UJLwFlyLRReh/GhiBOKjZhghvPYN3qHSgcvaj5rQHeZKpZ3x
         mDnsEGzku7WvvbOAJ74eqd2ziohjC8r9lio6eV3gKORYJIrHfTwRmVbgKMasbOYjhCHv
         iERwY9wV6ZHamOIQ1J+9iq4RG8/nd24HLX9z8xzHBZ7T/fc5VkBhCab7c2qHt8z2Dz5x
         f3XR/paL2JY1zbD4qGaKHxTRxG44ztnYOk99aLR/UyX28gdIw2Uj4CFsAGzFgSBOyZIo
         aJxEtzLJtOAO6pTEfA7QQLp3UZvkW9hMqLLOwjhWz1PbF1SeRpEbICbvrU0fLoSMalao
         E1tQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQvPgJdX2FpTsU97AObLpL41b9IiBocwI0UEdJtR6RMRtcde/MDUo186egL+sKI3y+dU2XR8Cd6Zr7+A==@vger.kernel.org
X-Gm-Message-State: AFuF++nOmsl0RMBYvb4zyrIt/zEudbTWoLpasq3rnEmNy+Cvi7a4P7X5
	cnmx8JZlvfO4pCC6PjEmLx68W6Ffmky8iJscDK+o0a5iIjuOE4Qzy0BbwUL+VIj5TEDrXzEcVhR
	iA38ENb59MDJl9Ip6+A3xD9QJaTkGAoI=
X-Gm-Gg: AYBFou37ItWoNhci+aqrB2MxB/tORbKw0Bu3TpQ7sYONh6mioY5acN6iFb4sr77o+WZ
	Qbk/ynKfb7eSFCHE+BYayHJTkpGsDYCmdO67tZgFCqSQkKsVpk0deMTD41o4UfahyUR7tZ128tC
	bWuJK26JvvCvIpt03BbVs2lNjGYSEBxNdSZsnI8F/lqghyZdgfldcqiyL37dSsUxx6OhbA80euI
	mAwvAIA+tyuUo6PbFd1IIfN+RdfgvhVMJefIXW/2kpdHWLMUTgrsKMjeOiFwFhMx6DSMjS9b6pn
	K59zCm08DiIrN1a7AShysarB5ovP2MQaMlcfDhwWJVk5NAfdatH5zLv5cNJRnESPbGA5qLV4rrs
	jkku8LZXDoe236+wyRTtH8l9HMV7Rmzg/a0ZpKwi0Z0M=
X-Received: by 2002:a17:907:a089:b0:c2d:cbc9:3529 with SMTP id
 a640c23a62f3a-c31a9ffd78amr19716366b.20.1791500991734; Thu, 08 Oct 2026
 16:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125224352.32034-1-linmag7@gmail.com> <CAEdQ38FciXzBqTpHxFYS5F5DiS5CaMe69Rh4cLVwDeCkLyebow@mail.gmail.com>
In-Reply-To: <CAEdQ38FciXzBqTpHxFYS5F5DiS5CaMe69Rh4cLVwDeCkLyebow@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 9 Oct 2026 01:09:40 +0200
X-Gm-Features: AclHuK9KBb05J6WCzSlIV2JR0bldX75v7on7Z-1oDMtAx5Kufd-i6QR9liEejKQ
Message-ID: <CA+=Fv5TxHDALWErD=vQ2CMwgNBbAv8W_7y+fnXHy6n_s9JxbZA@mail.gmail.com>
Subject: Re: [PATCH v4] alpha: machine check handler for tsunami
To: Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	hch@infradead.org, macro@orcam.me.uk, glaubitz@physik.fu-berlin.de, 
	richard.henderson@linaro.org, ink@unseen.parts
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

Thanks for the detailed review and build testing. Replies inline below.

On Thu, Oct 8, 2026 at 11:17=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Tue, Nov 25, 2025 at 11:38 PM Magnus Lindholm <linmag7@gmail.com> wrot=
e:
> > This patch implements a machine check handler with detailed information=
 on
> > error conditions in the event of a machine check exception on the Tsuna=
mi
> > platform.
>
> Sorry this sat for so long. I would like to see this go in. I went
> through it against the 21272 Hardware Reference Manual (21 October
> 1999) and the ES40 Service Guide, and build tested it on your
> for-next. Comments below, roughly in order of importance. Section
> numbers and Tables 10-x refer to the chipset manual, Tables D-x to
> the service guide.
>
> Build
> -----
>
> > +obj-$(CONFIG_ALPHA_DP264)  +=3D err_ev6.o err_tsunami.o
> > +obj-$(CONFIG_ALPHA_EIGER)  +=3D err_ev6.o err_tsunami.o
>
> CONFIG_ALPHA_SHARK also builds sys_dp264.o, so a non-generic Shark
> kernel fails to link:
>
>   sys_dp264.c:300: undefined reference to `tsunami_register_error_handler=
s'
>   sys_dp264.o:(.ref.data+0x118): undefined reference to `tsunami_machine_=
check'
>
> The commit message says CONFIG_ALPHA_TSUNAMI, and that is what the
> Makefile should use: a single
> "obj-$(CONFIG_ALPHA_TSUNAMI) +=3D err_ev6.o err_tsunami.o".
>

Thanks, I'll fix this in v5 accordingly.

> PERROR decode
> -------------
>
> > +#define TSUNAMI__PCHIP_PERROR__SADDR__S    (19)
> > +#define TSUNAMI__PCHIP_PERROR__SADDR__M    (0x7FFFFFFF80000ul)
> > +#define TSUNAMI__PCHIP_PERROR__PADDR__S (18)
> > +#define TSUNAMI__PCHIP_PERROR__PADDR__M (0x0FFFFFFFC0000ul)
> [...]
> > +           addr =3D EXTRACT(perror, TSUNAMI__PCHIP_PERROR__SADDR) >> 1=
6;
> > +   else
> > +           addr =3D EXTRACT(perror, TSUNAMI__PCHIP_PERROR__PADDR) >> 1=
6;
>
> The field positions match Table 10-42, but EXTRACT() shifts right by
> __S first and then applies __M, so __M has to be the mask of the
> field after shifting. With the masks in register position, and the
> extra ">> 16", the PCI case ends up with PCI address bits <31:20> in
> bits <13:2> of addr, so addr is never larger than 0x3ffc. Per the
> table it should be
>
>       ADDR<47:18> =3D PCI address <31:2>      -> ((perror >> 18) &
> 0x3fffffff) << 2
>       ADDR<50:19> =3D system address <34:3>   -> ((perror >> 19) &
> 0xffffffff) << 3
>
> This matters for more than the printout:
>

You're right. I'll correct both address decodes and the other PERROR
issues you listed: INV/SERR validity, ECC commands and syndrome, missing
error messages, window flags and SGE granularity.

> > +       ((((cmd & 0xE) =3D=3D 2) && (addr <=3D 0x80000)) ||
> > +        (((cmd & 0xE) =3D=3D 6) && (addr >=3D 0xA0000) && (addr < 0x10=
0000)))) {
> > +           status =3D MCHK_DISPOSITION_DISMISS;
>
> With the current decode the I/O test is always true, so every I/O
> master abort is dismissed whatever its address, and the memory test
> is never true. The "unclear if this is correct on tsunami?" comment
> above it should be resolved rather than merged. Is 0x80000 really
> the intended I/O limit? The comment text talks about 0x1000.
>

I can't justify that limit or the borrowed Titan dismissal policy. I'll
remove the rule for v5 and report these aborts.

> Other things the decode misses, all from Table 10-42 and section
> 8.8.2:
>
>  - INV<51> is not checked. When it is set, SYN, CMD and ADDR are not
>    valid and must not be used, in particular not for the dismissal
>    decision.
>  - When SERR is set the address and command are undefined (8.8.2.6).
>  - For CRE and UECC, CMD is not a PCI command: 0 is DMA read, 1 is
>    DMA RMW, 3 is SGTE read. The patch prints it through perror_cmd[],
>    so an ECC error on a DMA read is reported as "Interrupt
>    Acknowledge".
>  - There is no message for RDPE, UECC or CRE, although all three are
>    in ERRMASK, and SYN<63:56> is never printed. The ECC cases are the
>    ones the changelog gives as motivation.
>  - DAC (bit 16) and MWIN (bit 17) are only meaningful when the error
>    is not CRE or UECC, so they should be decoded in that branch only.
>  - For SGE the address is only valid to 8KB granularity (8.8.2.5).
>
> Clearing the error
> ------------------
>
> > +   pchip->perror.csr =3D 0x040;
>
> 10.2.5.6 says that once any of bits <11:0> is set the register is
> frozen and b_error stays asserted until all of bits <11:0> are clear.
> The bits are W1C, so 0x040 clears only TA. That was enough while no
> other error was enabled. With PERRMASK opened up, an NDS, PERR or ECC
> error will stay latched, hold irq<0> asserted, and turn every later
> error into LOST. Please write back the bits that were read.
>

Agreed. I'll acknowledge the observed defined PERROR W1C bits and
MISC<NXM>.

> The same applies to the Cchip: MISC<NXM> is W1C, and the interrupt is
> only cleared and NXS unlocked by writing a 1 to it (6.6.1). The
> handler never does that.
>
> The patch has a comment asking whether PALcode has already cleared
> PERROR. That needs an answer for both registers. Do you know what the
> SRM PALcode does here?
>

I haven't verified its clearing behavior for either register. I'll remove
that assumption and explicitly acknowledge any live error bits remaining.

> Enabling errors
> ---------------
>
> > +   /* Enable pchip error */
> > +   pchip->perrmask.csr =3D 0x0fff;
>
> This should be a separate patch with its own justification, because
> PERRMASK is not only a reporting mask. Per 10.2.5.7:
>

Agreed. I'll drop the PERRMASK change from v5 and leave the firmware
setting unchanged. Any follow-up enabling more errors will need hardware
testing, exclusion of reserved bit 9, and saving/restoring the old mask.

>  - RDPE, PERR and APE enable the parity checking itself; with the
>    bits clear the Pchip ignores parity.
>  - With PERR enabled, a write data parity error seen as target makes
>    the Pchip force uncorrectable ECC into memory for that data
>    (8.8.2.4). The manual says software is expected to crash the
>    system in that case.
>
> So this changes how the hardware behaves on every Tsunami and Typhoon
> machine, including ones with a card that has always driven bad
> parity. Questions:
>
>  - What does SRM leave in PERRMASK? The reset default is all
>    disabled.
>  - Should the previous value be saved and restored in
>    tsunami_kill_one_pchip() like the window registers?
>  - Bit 9 is reserved in PERROR. I would write 0xdff.
>
> On the positive side, 8.8.2.1 says configuration reads and special
> cycles do not set NDS, so PCI probing of empty slots is fine.
> Configuration writes are not exempt.
>
> Severity
> --------
>
> The manual says software is expected to crash the system on an
> uncorrectable ECC error (8.8.1.1.2) and on a target write parity
> error (8.8.2.4), because bad data has been or will be delivered. The
> new handler prints and returns for everything. I think UECC and PERR
> at least need to panic.
>

Agreed, I'll make those fatal.

> Which machine checks are handled
> --------------------------------
>
> > +   /*
> > +    * Only handle system errors here
> > +    */
> > +   switch (mchk_header->code) {
>
> The comment is followed by a switch that only picks a string.
> titan_machine_check() hands anything other than SCB_Q_SYSMCHK and
> SCB_Q_SYSERR to ev6_machine_check(). I think this should do the same,
> since:
>
>  - The "System Correctable/Uncorrectable" header is wrong for the
>    processor vectors.
>  - The old handler went through process_mcheck_info() with
>    mcheck_expected(). The NXM_MACHINE_CHECKS_ON_TSUNAMI code in
>    core_tsunami.c still sets mcheck_expected(), and nothing consumes
>    it any more.
>

I'll delegate processor vectors to EV6 and preserve expected probe
machine checks. I'll also remove the unused Titan interrupt mask, use
the summary flags to select Pchip errors, and fix the logging issues.


> > +    * 63 - CChip Error
> > +    * 62 - PChip 0 H_Error
> > +    * 61 - PChip 1 H_Error
> > +    * 60 - PChip 0 C_Error
> > +    * 59 - PChip 1 C_Error
> > +    */
> > +#define TSUNAMI_MCHECK_INTERRUPT_MASK      0xF800000000000000UL
>
> This is the Titan description. A Tsunami Pchip has a single b_error
> output. Table D-21 of the ES40 Service Guide has <63> as the Cchip
> NXM error, <62> and <61> as Pchip 0 and Pchip 1, <60:59> as "future
> designs" and <58> as OCP or RMC halt, which the mask leaves out. The
> define is also unused.
>
> Related: the logout frame's "sesf" and "dir" fields are filled in but
> never used, and both Pchip PERROR values are always parsed. The
> summary flags say which one is meaningful: bit 0 is a Pchip 0
> PERROR<9:0> error, bit 1 the same for Pchip 1, and bit 2 an ECC error
> on either. Using them to select what to decode would also cover
> single Pchip systems.
>
> > +   printk("%sSystem %s Error (Vector 0x%x) reported on CPU %d:\n",
> [...]
> > +   printk("Machine check error code is 0x%x (%s)",
> > +           mchk_header->code, reason);
> > +   status =3D clipper_process_logout_frame(mchk_header, 0);
> > +   if (status !=3D MCHK_DISPOSITION_DISMISS) {
>
> The header is printed before the disposition is known, so dismissed
> errors are no longer silent, contrary to the comment above it. The
> second printk has no log level and no newline.
>
> Clipper environmental frame
> ---------------------------
>
> I checked this against the ES40 Service Guide. The copy I have is
> EK-ES240-SV A01; the file header cites EK-ES239-SV, is that a typo?
>

Yes, that's a typo. My copy is EK-ES240-SV A01 too.

> The layout of el_CLIPPER_envdata_mcheck matches Table D-20, and the
> string tables and most of the masks match Table D-21. The problems
> are these:
>
> > +static char *CLIPPER_EnvQW6TEMP[] =3D {
> [7 strings]
> > +#define CLIPPER_ENV_TEMP_MASK      0xFFL
>
> Environ_QW_6 only defines bits <6:0>, bit 7 is unused. With 0xFF and
> a length of 8, bit 7 reads past the end of the seven entry table. The
> mask should be 0x7F.
>
> > +   /* Process erros in QW7FAN */
> > +   status |=3D clipper_process_680_reg(CLIPPER_EnvQW7FAN,
> > +                           emchk->temp_warn,
>
> This should be emchk->fan_ctrl.
>

Thanks, I'll fix these, honor the print argument, and keep supply-enable
and door-closed status out of the error disposition

> clipper_process_680_frame() and clipper_process_680_reg() ignore
> "print". The frame is processed once with print =3D=3D 0 and once with
> print =3D=3D 1, so every environmental event is printed twice.
>
> > +   /* Process enables PSU in QW3PSIR */
> > +   status |=3D clipper_process_680_reg(CLIPPER_EnvQW3PSIR, emchk->psir=
,
> > +                           CLIPPER_ENV_PSIR_ENA_MASK, 8);
>
> PSIR<2:0> are status ("Power Supply N is enabled"), not errors, and
> the same goes for the "door is closed" bits <7:5> in Environ_QW_5.
> Because these return MCHK_DISPOSITION_REPORT, every 680 event is
> reported even when no fault bit is set. Please print them as context
> only when a real fault bit is set, and keep them out of the status.
>
> > +"System Power Supply state change detected",
> > +"OCP or RMC halt detected",
>
> Table D-21 has SMIR<0> as "System Power Supply failure detected".
> SMIR<1> is listed as "Inverted OCP_RMC_Halt", as are the three reset
> bits. Have you confirmed the polarity on hardware? The patch reports
> a halt when the bit is set.
>

Plugging/unplugging PSU power on my ES40 produced the expected
power-supply indication. I'll correct the message to =E2=80=9CSystem Power =
Supply
failure detected=E2=80=9D. I haven't specifically tested the OCP/RMC halt o=
r reset
bits, so their polarity remains unverified.

> > +   /* Process erros in QW8POWER */
> > +   status |=3D clipper_process_680_reg(CLIPPER_EnvQW8POWER,
> > +                           emchk->code,
>
> The note under Table D-20 says only Environ_QW_1 to 7 are valid in
> the 680 machine check frame and QW_8 is zeroed. QW_8 is only valid in
> the console data log frame (Table D-18), where QW_1 to 7 are zeroed
> instead. So this is fine for the cdl path, but a comment saying so
> would help, and "code" is a confusing name next to
> mchk_header->code. Something like fatal_power_down would be clearer.
>
> Smaller things in the same decode:
>
>  - LM78_ISR<41:40> identify the power supply that the warnings in
>    <47:42> refer to. They are not decoded.
>  - The guide calls 680 "System Correctable Environmental", but the
>    header printed by tsunami_machine_check() says "Uncorrectable"
>    for everything that is not SCB_Q_SYSERR.
>
> The guide only covers the ES40, but the handler is installed for
> DP264, Monet, Webbrick, Shark and Eiger as well. Is the 680 layout the
> same there? If you cannot confirm that, should the decode be limited
> to Clipper? In the other direction, tsunami_register_error_handlers()
> is only called from clipper_init_pci(), so the other machines get the
> new handler without the subpacket registration.
>

Agreed; I haven't verified the other platforms' environmental layouts.
I'll limit this decode to Clipper and register console-log handling for
all Tsunami boards.

> Structure and cleanup
> ---------------------
>
>  - Please split this: (1) move the existing functions to
>    err_tsunami.c with no change, (2) fill in
>    el_TSUNAMI_sysdata_mcheck, (3) PERRMASK, (4) the new handler,
>    (5) the Clipper environmental decode.
>  - The "reason" switch is a copy of the table in
>    process_mcheck_info(), including Alcor and EISA codes that cannot
>    occur here, and it disagrees with the TSUNAMI_MCHK__* defines
>    further down (0x90 is "callsys in kernel mode" in one and
>    OS_BUGCHECK in the other). Please keep one.
>  - core_tsunami.h already has perror_m_* masks for this register. Use
>    those, or replace them, rather than adding a second set.
>  - err_tsunami.h defines static tables in a header with no include
>    guard. Move them into err_tsunami.c as
>    "static const char * const".
>  - Several of the CLIPPER_EVN_* names are typos for ENV.
>  - EL_TYPE__REGATTA__TSUNAMI_PCHIP{0,1}_EXTENDED belong in
>    asm/err_common.h next to the Titan ones.
>  - The "Changes since" block is above the "---" and would end up in
>    the git history.
>  - Typos: "macine", "marriers", "erros", "allready".
>

Will do. With PERRMASK deferred, v5 will have four patches. I'll also
address the duplicate definitions, table placement and other cleanups
you listed, and keep the revision history out of the commit messages.

> Which machines has v4 been tested on, and how did you provoke the
> system and environmental machine checks?

An AlphaServer ES40. For environmental events I plugged/unplugged PSU
power cables and opened hatches. For software-triggered tests I used a
module calling callsys() in kernel mode, this will trigger a machine check,
with modified handling to simulate errors. These tests don't establish real
ECC/parity fault recovery or SRM's clearing behavior. But it gave me a tool
to inject error codes and ensure correct parsing in the error handler.

I'll rework the patch into a series and send it out as soon as possible.

Thanks again,
Magnus
