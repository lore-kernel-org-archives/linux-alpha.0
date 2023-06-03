From: Frank Scheiner <frank.scheiner@web.de>
Subject: Re: [PATCH] module: fix module load for ia64
Date: Sat, 3 Jun 2023 15:30:13 +0200
Message-ID: <5f4a62ad-fc8f-8738-40aa-f97b01898ac5@web.de>
References: <20230528230041.2592309-1-song@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1685799015; x=1686403815; i=frank.scheiner@web.de;
 bh=phjA+nmNE3l71re7CtGjToIKaQ5hp2OqTxz/uBCnkWg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=VDws9qe+V2odFUEUykDljSRyPZLunNG+Tk8iz+hUSUyYimvXH3NLoSLTElPOH8JTzA2GD7m
 99LcslxTV4UsrEJXfm9ZTdnJaT0RnFoGtmMdPIyGEMAdCx5R7WQC8Kq3OMkcqAVCBqciywoVC
 MFnarAiuEnMtzNACKiNfjSi5CisPtJCy21FmwxsEekzNNGoTQMoSUO1ohQkx4TeLMqbTI+JhZ
 3BxEoiHboo5RDbj6Qzaa44nSF6AbNp1b+qujvv+tDo4o7tGlYSWpOj2u0G+VrvrKMSJmdmJwf
 Nur8o7DPYdd1aRUt6dCjmEzsazydfOsDalxXoIhlbsarPaAJKNww==
Content-Language: en-US
In-Reply-To: <20230528230041.2592309-1-song@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Song Liu <song@kernel.org>, linux-modules@vger.kernel.org, linux-ia64@vger.kernel.org, linux-alpha@vger.kernel.org
Cc: debian-ia64@lists.debian.org, mcgrof@kernel.org, glaubitz@physik.fu-berlin.de, Linus Torvalds <torvalds@linux-foundation.org>, "debian-alpha@lists.debian.org" <debian-alpha@lists.debian.org>

On 29.05.23 01:00, Song Liu wrote:
> Frank reported boot regression in ia64 as:
>
> ELILO v3.16 for EFI/IA-64
> ..
> Uncompressing Linux... done
> Loading file AC100221.initrd.img...done
> [    0.000000] Linux version 6.4.0-rc3 (root@x4270) (ia64-linux-gcc
> (GCC) 12.2.0, GNU ld (GNU Binutils) 2.39) #1 SMP Thu May 25 15:52:20
> CEST 2023
> [    0.000000] efi: EFI v1.1 by HP
> [    0.000000] efi: SALsystab=3D0x3ee7a000 ACPI 2.0=3D0x3fe2a000
> ESI=3D0x3ee7b000 SMBIOS=3D0x3ee7c000 HCDP=3D0x3fe28000
> [    0.000000] PCDP: v3 at 0x3fe28000
> [    0.000000] earlycon: uart8250 at MMIO 0x00000000f4050000 (options
> '9600n8')
> [    0.000000] printk: bootconsole [uart8250] enabled
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x000000003FE2A000 000028 (v02 HP    )
> [    0.000000] ACPI: XSDT 0x000000003FE2A02C 0000CC (v01 HP     rx2620
> 00000000 HP   00000000)
> [...]
> [    3.793350] Run /init as init process
> Loading, please wait...
> Starting systemd-udevd version 252.6-1
> [    3.951100] ------------[ cut here ]------------
> [    3.951100] WARNING: CPU: 6 PID: 140 at kernel/module/main.c:1547
> __layout_sections+0x370/0x3c0
> [    3.949512] Unable to handle kernel paging request at virtual address
> 1000000000000000
> [    3.951100] Modules linked in:
> [    3.951100] CPU: 6 PID: 140 Comm: (udev-worker) Not tainted 6.4.0-rc3=
 #1
> [    3.956161] (udev-worker)[142]: Oops 11003706212352 [1]
> [    3.951774] Hardware name: hp server rx2620                   , BIOS
> 04.29
> 11/30/2007
> [    3.951774]
> [    3.951774] Call Trace:
> [    3.958339] Unable to handle kernel paging request at virtual address
> 1000000000000000
> [    3.956161] Modules linked in:
> [    3.951774]  [<a0000001000156d0>] show_stack.part.0+0x30/0x60
> [    3.951774]                                 sp=3De000000183a67b20
> bsp=3De000000183a61628
> [    3.956161]
> [    3.956161]
>
> which bisect to module_memory change [1].
>
> Debug showed that ia64 uses some special sections:
>
> __layout_sections: section .got (sh_flags 10000002) matched to MOD_INVAL=
ID
> __layout_sections: section .sdata (sh_flags 10000003) matched to MOD_INV=
ALID
> __layout_sections: section .sbss (sh_flags 10000003) matched to MOD_INVA=
LID
>
> All these sections are loaded to module core memory before [1].
>
> Fix ia64 boot by loading these sections to MOD_DATA (core rw data).
>
> [1] commit ac3b43283923 ("module: replace module_layout with module_memo=
ry")
>
> Fixes: ac3b43283923 ("module: replace module_layout with module_memory")
> Reported-by: Frank Scheiner <frank.scheiner@web.de>
> Closes: https://lists.debian.org/debian-ia64/2023/05/msg00010.html
> Closes: https://marc.info/?l=3Dlinux-ia64&m=3D168509859125505
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>   kernel/module/main.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index b4c7e925fdb0..9da4b551321e 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1521,14 +1521,14 @@ static void __layout_sections(struct module *mod=
, struct load_info *info, bool i
>   		MOD_RODATA,
>   		MOD_RO_AFTER_INIT,
>   		MOD_DATA,
> -		MOD_INVALID,	/* This is needed to match the masks array */
> +		MOD_DATA,
>   	};
>   	static const int init_m_to_mem_type[] =3D {
>   		MOD_INIT_TEXT,
>   		MOD_INIT_RODATA,
>   		MOD_INVALID,
>   		MOD_INIT_DATA,
> -		MOD_INVALID,	/* This is needed to match the masks array */
> +		MOD_INIT_DATA,
>   	};
>
>   	for (m =3D 0; m < ARRAY_SIZE(masks); ++m) {

Just want to add another observation (though not strictly ia64 but I
wanted to keep the context):

Testing showed that this patch also fixes module loading for alpha
(tested on an AlphaServer DS25 w/v6.4-rc4 w/ and w/o the patch applied).

Cheers,
Frank
