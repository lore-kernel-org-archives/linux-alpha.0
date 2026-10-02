Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E40446074
	for <linux-alpha@vger.kernel.org>; Fri,  2 Oct 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934885; cv=pass; b=HHN4DZJxZi7kWLi3Ct6xeo7vP0t8fH2Z9q1vb3zbOvWy4WQHXQ1jSYQsaapy3MueM0uwPoy58RmZ9cErNxNSxTCkXKwduw+LoDzUYiW46NnLl/L8MMPNF+KNqirV0NelfHONQaFaXejGzhBna+fOOn3bV6TbxxURVixfeFDuJsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934885; c=relaxed/simple;
	bh=f2OtcMkSG121r+xWzxSEOyNf/eu2v+bbmnKUkrvQFaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NllPMRK2IRE9a+4JE8Tj1+mFBCam6941xZClgL/4TZBBePnyPQO18fYHq6hbd2SMtIhC+mpiVhMkHFR057Wa/D3LcnEEz2JvdJehgFQYgsiIvGlDM/XHplq4jrEUvP7GQcM7k+lbhEDnQSio0TvCrhctPt/dMBC76ljxVmV6u7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQ6qVbpV; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQ6qVbpV"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ad795d5205so3821178a12.0
        for <linux-alpha@vger.kernel.org>; Fri, 02 Oct 2026 02:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790934881; cv=none;
        d=google.com; s=arc-20260327;
        b=EiHGMwHyZU50wDOtVr+aTecl0sON6XATmr7c5vrrFVwOxujofLIOJyvuPTaftxPoj6
         A7HOP5ZtDfgvjsSEzkmArMfWxKP7tqf/0wjNi1p5zUpfIE0k/ZDu7utBSlvnAuf1qnu/
         Sv7mvFIH+5OcR5WMMfgdfJ9ocWX/c4OEV+zE8UBghY2jNwMOT1/bB47U4UyaW3PoPyef
         5uAZxs0tT0Wh2ZppDbn9h0bPmLs7FR+0JoAA1YTGbvT24GtLPo85c7hqjP+Xhqw6hw+x
         g1/EMbWWtcRz/QCSRRL8MP77m39dTX+YyxvT7figlz9XTLopkyrEIuivKhxkkDl6vcTs
         tjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KlsrSFTDBDk2MoE4YBBuKFoUAHufH4n4L1Gcx9G5Xbk=;
        fh=ViAatGiZ05dh3a394EUid4cQpUnAI/U35CAucij+cuk=;
        b=h+Cr+p8bCDZC116HLAPMW+F7AIeKvn4f5YqorjYQ9+2kQ58nF+kSTzIjxIhZkYQVIT
         2OBpP5o+GzMeam9uAJU28ybzOuIMbgry8gXY+pRtd5LST5cSba8XZ2bvXfKDwtYKJmP9
         wYjwn26cCK/BJj3aolY/tSucMAklCY0KzHkTeLw/xutTVVIdtl9R7VUSxGb0+tJlsvvS
         YaRpCmNUk/N97wYYErwo+f5aqaQGgyqqVV5WhLaSd6Cy6GpGSDifd9HQRB3lqaw71u9B
         Mhfng0JdnfcYwpC4R/YJ38J/KnccYtlekOhQwLCat2pXg9ynIMxmBiWDli9iocMHBZIN
         HdHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790934881; x=1791539681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlsrSFTDBDk2MoE4YBBuKFoUAHufH4n4L1Gcx9G5Xbk=;
        b=EQ6qVbpV4iA7+ijviCsN9P3C5YV9aFy4mhvocCXweVzeyM6NrxF4dMu1tKg/Ev/TIL
         tuDlHGacqfUmkhDawZwhKAC/x/fg0RBNRt1V1ewo65KJ8eAAAVS7tlpTRsi/dMK98AjJ
         eKNCZxEZr0uRo37xxzuzVXRUnmmrZU2r7K6RtHZOzOU9dDjIKqC7EEtXBUqQGY/Au4J8
         Gc2vEbTq0BAbL5vUzr1KbuvWMpyZUWvctTcxb4C/LILBim4lC+JpFUJ4xWTEUhRTKLSE
         Mo5ORBfIEfm/VoKG8C9BUHZ+VZyjqsOYemctonM58fAo62iW6s6pGsrHl8JuFGnmh2+j
         lnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934881; x=1791539681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlsrSFTDBDk2MoE4YBBuKFoUAHufH4n4L1Gcx9G5Xbk=;
        b=VQRRPFsz9ft2FsYi2paU8lPn81ou6tyQ9dYLcCi/+NllXMUQnFaWUw+pU2RNJIzKKm
         /WAWiXWW/9LxQdv2r0WcOjMdAwqGBh+ipjqzoNddjscApbWprP1a2W/l7OD1nGnfR5sT
         7PhNTIjO459Xfj/2okG53ZMLhtmrnjG8l2EuT0TMjo7y0M8UuayuN1oeDOK8ewNJfFA1
         u4Y4Iy9MDpP8vNZ9LFB0xZsVlRBRS4cLerDnWwzTGOnsFEFPbWuAa/KprLJ7skrksBm9
         WaSPjEjHC8BMiOfUCNFPjhEzdR6QXNBrpmJU4Dtbmt6eYks38NAR3IrKsEmzbJAkaiwP
         Adhg==
X-Gm-Message-State: AFq9FYJWH1AaqkXCEwjVekRDC2QvzXja4huMI/yK19IKKD+VwwxdUFfB
	ziwux8My5VW48QnTazWy4E3txxQLuj0vgY4LgTVq3WpQErNVLdlxx7AiXtB7t5gitOIkp1GmRe1
	MS+rfDHQN/I6xY/wNoVJQMiCa2qlZf4w=
X-Gm-Gg: AYBFou0r4373q62P/O/uFI3at/XmBy+n9g5IiNCcTNsWBbYMPnorlncP356QmXOD6WS
	j/Jgp6NYvBlRQly6QMKWLRObphggbunPbsvIJGmsW+FWeEjaWtx8UrqVxfm2hhpriVOnA0NTGI1
	UepfafhD3MIN4WZwqdLht0UoDoWrU8ltTUZF5L0E0g9ORJLT0iPv0Z8XOtpI8cu+wInrtRxEqBG
	PoBCGe1SfKgLVGZPwH0ZdYBj/z0QBa+/AC78dA36jKG6H0QGwCAh1yLSDu5Oem8ipQjU8Vn3Bkk
	KVUBTvVXoJN3oTvBEW5XHy4HTTKnvLYvSTTg4O3HazzB0NJpkOesOV58wv/ho4JBoXjW4QX9vKm
	Sv1TtOGx6Jsa41/fgB6shMjE1EetEwvgv/GMNX7hVrb5FnjxISIHS
X-Received: by 2002:a05:6402:324d:b0:6ab:8067:6a8a with SMTP id
 4fb4d7f45d1cf-6af9e301810mr1123130a12.32.1790934880885; Fri, 02 Oct 2026
 02:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001165018.415526-1-mattst88@gmail.com> <20261001165018.415526-2-mattst88@gmail.com>
In-Reply-To: <20261001165018.415526-2-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 2 Oct 2026 11:54:28 +0200
X-Gm-Features: AclHuK-SmcDYWAEKEZpItI5qI7L_AuxI8bjB266pfVqIFnQ45vW-kHJtBgwsU-0
Message-ID: <CA+=Fv5Q=wzp5e3FxTBdVshfsVD+7hpeBSYk=bFH0Dt5wDhL7GQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] alpha: correct system descriptions in Kconfig help text
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Thu, Oct 1, 2026 at 6:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Fix the system lists in the "Alpha system type" choice and the platform
> help texts, cross-checked against the alphalinux.org wiki and the
> kernel sources:
>
>  - There is no AlphaServer GS40 or DS10E. Wildfire also shipped with
>    EV68 (21264C) CPUs.
>  - "AS" means AlphaServer elsewhere in the list, but the Alcor "AS 600,
>    AS 500" are AlphaStations, as is the Noritake "AlphaServer 600A".
>  - Takara is 21164-based, not "11164".
>  - Linux 6.10 dropped support for CPUs before EV56, which took the
>    AlphaStation 600 and Alpha XL 300 with it. Say once that EV56 or
>    later is required rather than qualifying every entry.
>  - Add systems missing from their entries: the UP1500 (Nautilus), DS15
>    and TS202c (Titan), Digital Server 3300 (Noritake), Digital Server
>    5300 and 7300 (Rawhide), and the Ruffian boards in place of
>    "Samsung APC164UX".
>  - Add Eiger, Nautilus and RX164 to the summary list and help text to
>    PC164, RX164, SX164 and Shark, which had none. Note that the Ruffian
>    and RX164 boards have no SRM console.
>
> Also drop the Jensen and EV4/EV5 references removed in 6.10, and the
> claim that SRM cannot boot from IDE, which is not true of SRM in
> general. NR_CPUS can be set to 32 on any platform, so say what the
> hardware supports instead of implying a per-platform kernel limit.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 85 ++++++++++++++++++++++++++++++----------------
>  1 file changed, 55 insertions(+), 30 deletions(-)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 7c1cc676ddfe..920dd10e7df0 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -126,28 +126,35 @@ choice
>           This is the system type of your hardware.  A "generic" kernel w=
ill
>           run on any supported Alpha system. However, if you configure a
>           kernel for your specific system, it will be faster and smaller.
> +         Only EV56 (21164A) and later CPUs are supported.
>
>           To find out what type of Alpha system you have, see the system =
and
>           motherboard lists at
>           <https://alphalinux.org/wiki/hardware:systems> and
>           <https://alphalinux.org/wiki/hardware:motherboards>. In summary=
:
>
> -         Alcor/Alpha-XLT     AS 600, AS 500, XL-300, XL-366
> -         DP264               DP264 / DS20 / ES40 / DS10 / DS10L
> +         Alcor/Alpha-XLT     AlphaStation 500, Alpha XL 366, 433
> +         DP264               DP264, UP2000(+), DS10, DS10L, DS20, DS20E,
> +                             ES40, XP900, XP1000
> +         Eiger               Eiger (OEM)
>           LX164               AlphaPC164-LX
> +         Marvel              AlphaServer ES47, ES80, GS1280
>           Miata               Personal Workstation 433/500/600 a/au
> -         Marvel              AlphaServer ES47 / ES80 / GS1280
> -         Mikasa              AS 1000
> -         Noritake            AS 1000A, AS 600A, AS 800
> +         Mikasa              AlphaServer 1000
> +         Nautilus            UP1000, UP1100, UP1500
> +         Noritake            AlphaServer 1000A, 800, AlphaStation 600A,
> +                             Digital Server 3300
>           PC164               AlphaPC164
> -         Rawhide             AS 1200, AS 4000, AS 4100
> +         Rawhide             AlphaServer 1200, 4000, 4100,
> +                             Digital Server 5300, 7300
>           Ruffian             RPX164-2, AlphaPC164-UX, AlphaPC164-BX
> +         RX164               AlphaPC164-RX
>           SX164               AlphaPC164-SX
> -         Sable               AS 2000, AS 2100
> -         Shark               DS 20L
> +         Sable               AlphaServer 2000, 2100
> +         Shark               AlphaServer DS20L, API NetWorks CS20
>           Takara              Takara (OEM)
> -         Titan               AlphaServer ES45 / DS25 / DS15
> -         Wildfire            AlphaServer GS 40/80/160/320
> +         Titan               AlphaServer DS15, DS25, ES45, TS202c
> +         Wildfire            AlphaServer GS80, GS160, GS320
>
>           If you don't know what to do, choose "generic".
>
> @@ -168,13 +175,14 @@ config ALPHA_ALCOR
>           controller (256-bit memory bus) and a PCI interface.  It also d=
oes
>           all the work required to support an external Bcache and to main=
tain
>           memory coherence when a PCI device DMAs into (or out of) memory=
.
> +         It is used by the AlphaStation 500 and the Alpha XL 366 and 433=
.
>
>  config ALPHA_DP264
>         bool "DP264"
>         help
>           Various 21264 systems with the tsunami core logic chipset.
> -         API Networks: 264DP, UP2000(+), CS20;
> -         Compaq: DS10(E,L), XP900, XP1000, DS20(E), ES40.
> +         API NetWorks: 264DP, UP2000(+);
> +         Compaq: DS10, DS10L, XP900, XP1000, DS20, DS20E, ES40.
>
>  config ALPHA_EIGER
>         bool "Eiger"
> @@ -197,8 +205,8 @@ config ALPHA_MIATA
>         bool "Miata"
>         select HAVE_EISA
>         help
> -         The Digital PersonalWorkStation (PWS 433a, 433au, 500a, 500au, =
600a,
> -         or 600au).
> +         The Digital Personal Workstation (PWS 433a, 433au, 500a, 500au,
> +         600a, or 600au).
>
>  config ALPHA_MIKASA
>         bool "Mikasa"
> @@ -208,34 +216,47 @@ config ALPHA_MIKASA
>  config ALPHA_NAUTILUS
>         bool "Nautilus"
>         help
> -         Alpha systems based on the AMD 751 & ALI 1543C chipsets.
> +         UP1000, UP1100 and UP1500 systems based on the AMD 751 or 761
> +         chipset.
>
>  config ALPHA_NORITAKE
>         bool "Noritake"
>         select HAVE_EISA
>         help
> -         AlphaServer 1000A, AlphaServer 600A, and AlphaServer 800-based
> -         systems.
> +         AlphaServer 1000A, AlphaServer 800, AlphaStation 600A and
> +         Digital Server 3300 systems.
>
>  config ALPHA_PC164
>         bool "PC164"
> +       help
> +         AlphaPC164, a 21164A-based single-board computer using the CIA
> +         chipset.
>
>  config ALPHA_RAWHIDE
>         bool "Rawhide"
>         select HAVE_EISA
>         help
> -         AlphaServer 1200, AlphaServer 4000 and AlphaServer 4100 machine=
s.
> +         AlphaServer 1200, 4000 and 4100 and Digital Server 5300 and 730=
0
> +         machines.
>
>  config ALPHA_RUFFIAN
>         bool "Ruffian"
>         help
> -         Samsung APC164UX.
> +         DeskStation RPX164-2, AlphaPC164-UX and AlphaPC164-BX boards.
> +         They have no SRM console and can only boot Linux through MILO.
>
>  config ALPHA_RX164
>         bool "RX164"
> +       help
> +         AlphaPC164-RX, a 21164PC-based single-board computer using the
> +         Polaris chipset. It has no SRM console and can only boot Linux
> +         through MILO.
>
>  config ALPHA_SX164
>         bool "SX164"
> +       help
> +         AlphaPC164-SX, a 21164PC-based single-board computer using the
> +         Pyxis chipset.
>
>  config ALPHA_SABLE
>         bool "Sable"
> @@ -245,21 +266,26 @@ config ALPHA_SABLE
>
>  config ALPHA_SHARK
>         bool "Shark"
> +       help
> +         AlphaServer DS20L and API NetWorks CS20 systems based on the
> +         Tsunami chipset.
>
>  config ALPHA_TAKARA
>         bool "Takara"
>         help
> -         Alpha 11164-based OEM single-board computer.
> +         Alpha 21164-based OEM single-board computer.
>
>  config ALPHA_TITAN
>         bool "Titan"
>         help
> -         AlphaServer ES45/DS25 SMP based on EV68 and Titan chipset.
> +         AlphaServer DS15, DS25, ES45 and TS202c based on EV68 and the
> +         Titan chipset.
>
>  config ALPHA_WILDFIRE
>         bool "Wildfire"
>         help
> -         AlphaServer GS 40/80/160/320 SMP based on the EV67 core.
> +         AlphaServer GS80, GS160 and GS320 SMP based on the EV67 or EV68
> +         core.
>
>  endchoice
>
> @@ -378,10 +404,9 @@ config ALPHA_SRM
>           loaded either from ARC or can be installed directly as a perman=
ent
>           firmware replacement from floppy (which requires changing a cer=
tain
>           jumper on the motherboard). If you want to do either of these, =
say N
> -         here. If MILO doesn't work on your system (true for Jensen
> -         motherboards), you can bypass it altogether and boot Linux dire=
ctly
> -         from an SRM console; say Y here in order to do that. Note that =
you
> -         won't be able to boot from an IDE disk using SRM.
> +         here. If MILO doesn't work on your system, you can bypass it
> +         altogether and boot Linux directly from an SRM console; say Y h=
ere
> +         in order to do that.
>
>           If unsure, say N.
>
> @@ -414,8 +439,8 @@ config NR_CPUS
>         default "32" if ALPHA_GENERIC || ALPHA_MARVEL
>         default "4" if !ALPHA_GENERIC && !ALPHA_MARVEL
>         help
> -         MARVEL support can handle a maximum of 32 CPUs, all the others
> -         with working support have a maximum of 4 CPUs.
> +         The kernel supports at most 32 CPUs. Only Marvel and Wildfire
> +         systems have more than 4.
>
>  config ARCH_SPARSEMEM_ENABLE
>         bool "Sparse Memory Support"
> @@ -439,8 +464,8 @@ config ALPHA_WTINT
>           For emulation under QEMU, definitely say Y here, as we have oth=
er
>           mechanisms for measuring time than the cycle counter.
>
> -         For EV4 (but not LCA), EV5 and EV56 systems, or for systems run=
ning
> -         MILO, sleep mode is not supported so you might as well say N he=
re.
> +         For EV56 systems, or for systems running MILO, sleep mode is no=
t
> +         supported so you might as well say N here.
>
>           For SMP systems we cannot use the cycle counter for timing anyw=
ay,
>           so you might as well say Y here.
> --
> 2.54.0
>

Thanks,

See reply to patch 1/4 for details.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
