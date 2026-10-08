Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC52141A8F
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 21:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494244; cv=pass; b=n48K98VzZ7xo5SkvNrnE3vAQTsS3njP6g8GoadvqJOMTsnSFrDbyOaNuXpvE2Ecq48QUD8e6UQa1Nl7koDhjpKi+in62N7Y/XISt07qcdTIkkF8NPqMi44M6G/tefSAR0kNni6/2Dt8F960h2Q8Y/N9RyC8u53r9zqB0CgFlGUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494244; c=relaxed/simple;
	bh=meN0Ll6LUzDbkPO67/mJkijRkV0KVpj0ph/a6EON/QE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gc/2cWYAGhpBZqa+PrFgVGX+1UX6xTdd53BTE1MDBi7npo0dl8KQiDGObNb//nY1llxvzuo/bs+JGS2tUlR2hZ6JFnpE7u2ASWh4DmaQIniMHckPvhsXxuymSftscQEgAdkS1/AjzOljQu3FdoSub1I1AvmCjm7nPGOkpXV2+hM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLMiYyMM; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLMiYyMM"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcb2ecebb4so3180543e87.2
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 14:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494241; cv=none;
        d=google.com; s=arc-20260327;
        b=abnIH1pS7h548UktTAhCHPZzdfalFCmlbgWUSvjAsofZlf/ikp/OlCPWxECLrHYfKJ
         xy9kOeyAl2WaQH5R3/YYT3ob+7o11JQ9XvI+qHOL43zC01tscXGFAv0Tf7Efewjju4NY
         qMaruwzevozLU+7xt9YCHt/1bn/rB8S4x8/zwGOGnWd4LAnL9Xd/MU8v31rfl5WfEci2
         nkEfbBSYEJU4HXxkfDJwnqn/b+y3RVpW3SoLFemwBYGehHHTX5egFHqCpGVM2JXd2c6E
         6KErCjVhgjNUdNOWzKN56KRa6HG8iFkwPdBu+HiGnz7CSGRFGBiXCpboO3sdbicCcSiy
         EpGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2FzXQmYZVAwCNX837xb6ZTBU+i6noRkiGOVGBEr1k6A=;
        fh=3uWxnkPp7cpxBlj9bR65PFvaOkI/tOhBas6sCQNF7XI=;
        b=pWQYVdtB2dxpew64Z6MBCdlHiqR8uY4WKtB1H/aSZ0wAV69pJhKCiUDDiJJRgi1++k
         9v6kt2VMtpDFGQ1oDyarQBgZc1dIwfaIAJBoWxaOaDcrXghwkM0AHqFH9eI2WxJ7VRPh
         Sc+g0s/k6idtv/VyLwDLwb9gr60hHua4xgu1rpdGemH0yJV/rrFIWdLmykCJ0BYU4tDq
         MthUOhQpU11YdStX8HCTfeMhVbrtFhnhN+ikfu92Faq/2ddRP5Pg1DSvLveE3mxbm+x/
         +jxgs5RzcCvHm5VpCinL55TGnNwkaSf6yt6Nmq/OXpyw5oRwQBdtWOdK5+DflR9WA7Xg
         ybwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494241; x=1792099041; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2FzXQmYZVAwCNX837xb6ZTBU+i6noRkiGOVGBEr1k6A=;
        b=WLMiYyMM5ft0DqDt2lUCu7V1asOQi/U+qFN+AemxwBjTpPodenYM37sSbYD9vIPaoB
         z5uAdJKGZXId+j994GrhnnoJX5Z+GWVE5kaLHRMp7kUz1UV6b9YjKGozOprXPFvWqbAd
         VU5kk7pyGFrT+qLExGoQGYn3blsM1FOuVbT9U7dLA3KuHaJImmtnzAhuCNZZgp+gmb1b
         JwG70fOzL6WCGWYmdm0RMropnZBJsSR4Ngs8KYcZ40IodZuIs06ZDZqG8Kem2D3CPQVm
         uuHJRCa6Kq3wvo38YjJz2SdlBf15wcAzSGSAm/43lIFMFm48tYSMl7NClwlIcBOcjn7n
         qDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494241; x=1792099041;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2FzXQmYZVAwCNX837xb6ZTBU+i6noRkiGOVGBEr1k6A=;
        b=Q5I57Gx0w87p+jkETEywpoMKIP7SA+AhbRgrhCIp4YCnGfJ2/9XHW/0vqFSpiVYLT7
         wPXtFxNSDcsnt1xYoc43CcF0kyxCuzdnL0jekZdpPfe40GRTtvlPm4nAQKFEhQ8uAGiT
         fx+5RZbCaQGup+cBHk89DdvgxRGnc0BAmVyW71kvN80UGaqnespd7534R/0YCmSMaVSB
         FtDxbJQMVAs+SzXysAnnfvvvrqT2YOpD0VxexizlRTXEN6NGOnJWxi+czBwDdOZMutqb
         q2QcHr3DeaI20R3DX12gfeJqVfBOmP5p9TmtIXdqOU583nW7e/UpxPPoogqcrYrY6l3M
         FqAg==
X-Forwarded-Encrypted: i=1; AKwUvBz35MZHi0urGntAdYalpQBHKudutZIKtF2LmR8+gOiddCrujWHDmngxUkgp3yv/E+FAW6z65E9xG55B1Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLpgOaN0V4xCLRDZaW3IsejP8s3dHL7fP1pnsP/f9amWDdo1dMk
	vkskwq3iYrWapU5qVdJjyldyjFwTgZgajezyVVHMN4qOUum3M24Iuk6R0D1sJIzKvzkUK+sB2r6
	kIDAyhlRrUIYvZk0a80pGj5PvS6LgV8g=
X-Gm-Gg: AYBFou2EkCILL71nQszk662Nhdrr/ra/mXE7vidLL98KlK2GlTd4AKm+un34pFQdYe4
	Wf1sMPTrCFVrwRpNFb2DcFhKiQmfXLrWuFAtpmQ1JDA/x71C5ABvb9tlpGIeN/35NpFOab14omC
	iE6coMbWQ+Vyi4BUMeb4OcRqrVH7EizU29RFWbrCB7XVRSUBNdYetkNEsxlvOXIk40x9CbSKaBU
	msMnU4W0VDDHwWkTepiKo+2ng2O/Equ8k/F41c8IQGWUWByCJNHuExHEpnGLcSR6Qiz2eRIZC2s
	LVg5Zv05KpJCI15ZGfgedxTgCp+vDu9kJVM/OSPZdNYyxzBZOvNC47X4qmGANt6cZQqT+B4h9C8
	Z4obkndUDpl+Kdw==
X-Received: by 2002:a05:651c:a104:20b0:3a9:9b0b:e0e4 with SMTP id
 38308e7fff4ca-3a9c2a55a1fmr806871fa.15.1791494240482; Thu, 08 Oct 2026
 14:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125224352.32034-1-linmag7@gmail.com>
In-Reply-To: <20251125224352.32034-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:17:08 -0400
X-Gm-Features: AclHuK_3NR7u2TBoZF4JS4BgnPEGqMgw73IA_3xwxC4Z7JwDuQqB9CYxYCGMj2M
Message-ID: <CAEdQ38FciXzBqTpHxFYS5F5DiS5CaMe69Rh4cLVwDeCkLyebow@mail.gmail.com>
Subject: Re: [PATCH v4] alpha: machine check handler for tsunami
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	hch@infradead.org, macro@orcam.me.uk, glaubitz@physik.fu-berlin.de, 
	richard.henderson@linaro.org, ink@unseen.parts
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 25, 2025 at 11:38 PM Magnus Lindholm <linmag7@gmail.com> wrote:
> This patch implements a machine check handler with detailed information on
> error conditions in the event of a machine check exception on the Tsunami
> platform.

Sorry this sat for so long. I would like to see this go in. I went
through it against the 21272 Hardware Reference Manual (21 October
1999) and the ES40 Service Guide, and build tested it on your
for-next. Comments below, roughly in order of importance. Section
numbers and Tables 10-x refer to the chipset manual, Tables D-x to
the service guide.

Build
-----

> +obj-$(CONFIG_ALPHA_DP264)  += err_ev6.o err_tsunami.o
> +obj-$(CONFIG_ALPHA_EIGER)  += err_ev6.o err_tsunami.o

CONFIG_ALPHA_SHARK also builds sys_dp264.o, so a non-generic Shark
kernel fails to link:

  sys_dp264.c:300: undefined reference to `tsunami_register_error_handlers'
  sys_dp264.o:(.ref.data+0x118): undefined reference to `tsunami_machine_check'

The commit message says CONFIG_ALPHA_TSUNAMI, and that is what the
Makefile should use: a single
"obj-$(CONFIG_ALPHA_TSUNAMI) += err_ev6.o err_tsunami.o".

PERROR decode
-------------

> +#define TSUNAMI__PCHIP_PERROR__SADDR__S    (19)
> +#define TSUNAMI__PCHIP_PERROR__SADDR__M    (0x7FFFFFFF80000ul)
> +#define TSUNAMI__PCHIP_PERROR__PADDR__S (18)
> +#define TSUNAMI__PCHIP_PERROR__PADDR__M (0x0FFFFFFFC0000ul)
[...]
> +           addr = EXTRACT(perror, TSUNAMI__PCHIP_PERROR__SADDR) >> 16;
> +   else
> +           addr = EXTRACT(perror, TSUNAMI__PCHIP_PERROR__PADDR) >> 16;

The field positions match Table 10-42, but EXTRACT() shifts right by
__S first and then applies __M, so __M has to be the mask of the
field after shifting. With the masks in register position, and the
extra ">> 16", the PCI case ends up with PCI address bits <31:20> in
bits <13:2> of addr, so addr is never larger than 0x3ffc. Per the
table it should be

      ADDR<47:18> = PCI address <31:2>      -> ((perror >> 18) &
0x3fffffff) << 2
      ADDR<50:19> = system address <34:3>   -> ((perror >> 19) &
0xffffffff) << 3

This matters for more than the printout:

> +       ((((cmd & 0xE) == 2) && (addr <= 0x80000)) ||
> +        (((cmd & 0xE) == 6) && (addr >= 0xA0000) && (addr < 0x100000)))) {
> +           status = MCHK_DISPOSITION_DISMISS;

With the current decode the I/O test is always true, so every I/O
master abort is dismissed whatever its address, and the memory test
is never true. The "unclear if this is correct on tsunami?" comment
above it should be resolved rather than merged. Is 0x80000 really
the intended I/O limit? The comment text talks about 0x1000.

Other things the decode misses, all from Table 10-42 and section
8.8.2:

 - INV<51> is not checked. When it is set, SYN, CMD and ADDR are not
   valid and must not be used, in particular not for the dismissal
   decision.
 - When SERR is set the address and command are undefined (8.8.2.6).
 - For CRE and UECC, CMD is not a PCI command: 0 is DMA read, 1 is
   DMA RMW, 3 is SGTE read. The patch prints it through perror_cmd[],
   so an ECC error on a DMA read is reported as "Interrupt
   Acknowledge".
 - There is no message for RDPE, UECC or CRE, although all three are
   in ERRMASK, and SYN<63:56> is never printed. The ECC cases are the
   ones the changelog gives as motivation.
 - DAC (bit 16) and MWIN (bit 17) are only meaningful when the error
   is not CRE or UECC, so they should be decoded in that branch only.
 - For SGE the address is only valid to 8KB granularity (8.8.2.5).

Clearing the error
------------------

> +   pchip->perror.csr = 0x040;

10.2.5.6 says that once any of bits <11:0> is set the register is
frozen and b_error stays asserted until all of bits <11:0> are clear.
The bits are W1C, so 0x040 clears only TA. That was enough while no
other error was enabled. With PERRMASK opened up, an NDS, PERR or ECC
error will stay latched, hold irq<0> asserted, and turn every later
error into LOST. Please write back the bits that were read.

The same applies to the Cchip: MISC<NXM> is W1C, and the interrupt is
only cleared and NXS unlocked by writing a 1 to it (6.6.1). The
handler never does that.

The patch has a comment asking whether PALcode has already cleared
PERROR. That needs an answer for both registers. Do you know what the
SRM PALcode does here?

Enabling errors
---------------

> +   /* Enable pchip error */
> +   pchip->perrmask.csr = 0x0fff;

This should be a separate patch with its own justification, because
PERRMASK is not only a reporting mask. Per 10.2.5.7:

 - RDPE, PERR and APE enable the parity checking itself; with the
   bits clear the Pchip ignores parity.
 - With PERR enabled, a write data parity error seen as target makes
   the Pchip force uncorrectable ECC into memory for that data
   (8.8.2.4). The manual says software is expected to crash the
   system in that case.

So this changes how the hardware behaves on every Tsunami and Typhoon
machine, including ones with a card that has always driven bad
parity. Questions:

 - What does SRM leave in PERRMASK? The reset default is all
   disabled.
 - Should the previous value be saved and restored in
   tsunami_kill_one_pchip() like the window registers?
 - Bit 9 is reserved in PERROR. I would write 0xdff.

On the positive side, 8.8.2.1 says configuration reads and special
cycles do not set NDS, so PCI probing of empty slots is fine.
Configuration writes are not exempt.

Severity
--------

The manual says software is expected to crash the system on an
uncorrectable ECC error (8.8.1.1.2) and on a target write parity
error (8.8.2.4), because bad data has been or will be delivered. The
new handler prints and returns for everything. I think UECC and PERR
at least need to panic.

Which machine checks are handled
--------------------------------

> +   /*
> +    * Only handle system errors here
> +    */
> +   switch (mchk_header->code) {

The comment is followed by a switch that only picks a string.
titan_machine_check() hands anything other than SCB_Q_SYSMCHK and
SCB_Q_SYSERR to ev6_machine_check(). I think this should do the same,
since:

 - The "System Correctable/Uncorrectable" header is wrong for the
   processor vectors.
 - The old handler went through process_mcheck_info() with
   mcheck_expected(). The NXM_MACHINE_CHECKS_ON_TSUNAMI code in
   core_tsunami.c still sets mcheck_expected(), and nothing consumes
   it any more.

> +    * 63 - CChip Error
> +    * 62 - PChip 0 H_Error
> +    * 61 - PChip 1 H_Error
> +    * 60 - PChip 0 C_Error
> +    * 59 - PChip 1 C_Error
> +    */
> +#define TSUNAMI_MCHECK_INTERRUPT_MASK      0xF800000000000000UL

This is the Titan description. A Tsunami Pchip has a single b_error
output. Table D-21 of the ES40 Service Guide has <63> as the Cchip
NXM error, <62> and <61> as Pchip 0 and Pchip 1, <60:59> as "future
designs" and <58> as OCP or RMC halt, which the mask leaves out. The
define is also unused.

Related: the logout frame's "sesf" and "dir" fields are filled in but
never used, and both Pchip PERROR values are always parsed. The
summary flags say which one is meaningful: bit 0 is a Pchip 0
PERROR<9:0> error, bit 1 the same for Pchip 1, and bit 2 an ECC error
on either. Using them to select what to decode would also cover
single Pchip systems.

> +   printk("%sSystem %s Error (Vector 0x%x) reported on CPU %d:\n",
[...]
> +   printk("Machine check error code is 0x%x (%s)",
> +           mchk_header->code, reason);
> +   status = clipper_process_logout_frame(mchk_header, 0);
> +   if (status != MCHK_DISPOSITION_DISMISS) {

The header is printed before the disposition is known, so dismissed
errors are no longer silent, contrary to the comment above it. The
second printk has no log level and no newline.

Clipper environmental frame
---------------------------

I checked this against the ES40 Service Guide. The copy I have is
EK-ES240-SV A01; the file header cites EK-ES239-SV, is that a typo?

The layout of el_CLIPPER_envdata_mcheck matches Table D-20, and the
string tables and most of the masks match Table D-21. The problems
are these:

> +static char *CLIPPER_EnvQW6TEMP[] = {
[7 strings]
> +#define CLIPPER_ENV_TEMP_MASK      0xFFL

Environ_QW_6 only defines bits <6:0>, bit 7 is unused. With 0xFF and
a length of 8, bit 7 reads past the end of the seven entry table. The
mask should be 0x7F.

> +   /* Process erros in QW7FAN */
> +   status |= clipper_process_680_reg(CLIPPER_EnvQW7FAN,
> +                           emchk->temp_warn,

This should be emchk->fan_ctrl.

clipper_process_680_frame() and clipper_process_680_reg() ignore
"print". The frame is processed once with print == 0 and once with
print == 1, so every environmental event is printed twice.

> +   /* Process enables PSU in QW3PSIR */
> +   status |= clipper_process_680_reg(CLIPPER_EnvQW3PSIR, emchk->psir,
> +                           CLIPPER_ENV_PSIR_ENA_MASK, 8);

PSIR<2:0> are status ("Power Supply N is enabled"), not errors, and
the same goes for the "door is closed" bits <7:5> in Environ_QW_5.
Because these return MCHK_DISPOSITION_REPORT, every 680 event is
reported even when no fault bit is set. Please print them as context
only when a real fault bit is set, and keep them out of the status.

> +"System Power Supply state change detected",
> +"OCP or RMC halt detected",

Table D-21 has SMIR<0> as "System Power Supply failure detected".
SMIR<1> is listed as "Inverted OCP_RMC_Halt", as are the three reset
bits. Have you confirmed the polarity on hardware? The patch reports
a halt when the bit is set.

> +   /* Process erros in QW8POWER */
> +   status |= clipper_process_680_reg(CLIPPER_EnvQW8POWER,
> +                           emchk->code,

The note under Table D-20 says only Environ_QW_1 to 7 are valid in
the 680 machine check frame and QW_8 is zeroed. QW_8 is only valid in
the console data log frame (Table D-18), where QW_1 to 7 are zeroed
instead. So this is fine for the cdl path, but a comment saying so
would help, and "code" is a confusing name next to
mchk_header->code. Something like fatal_power_down would be clearer.

Smaller things in the same decode:

 - LM78_ISR<41:40> identify the power supply that the warnings in
   <47:42> refer to. They are not decoded.
 - The guide calls 680 "System Correctable Environmental", but the
   header printed by tsunami_machine_check() says "Uncorrectable"
   for everything that is not SCB_Q_SYSERR.

The guide only covers the ES40, but the handler is installed for
DP264, Monet, Webbrick, Shark and Eiger as well. Is the 680 layout the
same there? If you cannot confirm that, should the decode be limited
to Clipper? In the other direction, tsunami_register_error_handlers()
is only called from clipper_init_pci(), so the other machines get the
new handler without the subpacket registration.

Structure and cleanup
---------------------

 - Please split this: (1) move the existing functions to
   err_tsunami.c with no change, (2) fill in
   el_TSUNAMI_sysdata_mcheck, (3) PERRMASK, (4) the new handler,
   (5) the Clipper environmental decode.
 - The "reason" switch is a copy of the table in
   process_mcheck_info(), including Alcor and EISA codes that cannot
   occur here, and it disagrees with the TSUNAMI_MCHK__* defines
   further down (0x90 is "callsys in kernel mode" in one and
   OS_BUGCHECK in the other). Please keep one.
 - core_tsunami.h already has perror_m_* masks for this register. Use
   those, or replace them, rather than adding a second set.
 - err_tsunami.h defines static tables in a header with no include
   guard. Move them into err_tsunami.c as
   "static const char * const".
 - Several of the CLIPPER_EVN_* names are typos for ENV.
 - EL_TYPE__REGATTA__TSUNAMI_PCHIP{0,1}_EXTENDED belong in
   asm/err_common.h next to the Titan ones.
 - The "Changes since" block is above the "---" and would end up in
   the git history.
 - Typos: "macine", "marriers", "erros", "allready".

Which machines has v4 been tested on, and how did you provoke the
system and environmental machine checks?
