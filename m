From: Thomas Steudten <alpha@steudten.com>
Subject: Re: Relocation overflow vs section  kernel-2.6.1 for alpha
Date: Sun, 11 Jan 2004 12:45:17 +0100
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <4001374D.5010402@steudten.com>
References: <3FB92938.8040906@steudten.com>	<87r806d6n6.fsf@student.uni-tuebingen.de>	<3FB93EF6.807@steudten.com>	<87islid5tq.fsf@student.uni-tuebingen.de>	<20031118021922.A7816@den.park.msu.ru>	<3FBA8F20.3050701@steudten.com>	<40002F69.9020302@steudten.com> <20040110143409.0e591596.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20040110143409.0e591596.akpm@osdl.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org
Cc: Andrew Morton <akpm@osdl.org>, ink@jurassic.park.msu.ru, rth@twiddle.net

Hello

I run in this problem too on my alpha sx164 and the patch fix this, so
i can load all the modules without problems.

Please add the patch to the kernel 2.6.x alpha mainline.

Regards
Tom

On Mon, Jan 05, 2004 at 02:21:37AM +0100, M=E5ns Rullg=E5rd wrote:
 > I compiled Linux 2.6.0 for Alpha, and it mostly works, except the
 > somewhat large modules. They fail to load with the message
 > "Relocation overflow vs section 17", or some other section number.

This failure happens with GPRELHIGH relocation, which is *signed*
short, but relocation overflow check in module.c doesn't take into
account the sign extension.
Appended patch should help.

Ivan.

--- 2.6/arch/alpha/kernel/module.c Wed May 28 01:05:20 2003
+++ linux/arch/alpha/kernel/module.c Mon Aug 11 23:23:02 2003
@@ -259,7 +259,7 @@ apply_relocate_add(Elf64_Shdr *sechdrs,
*(u64 *)location =3D value;
break;
case R_ALPHA_GPRELHIGH:
- value =3D (value - gp + 0x8000) >> 16;
+ value =3D (long)(value - gp + 0x8000) >> 16;
if ((short) value !=3D value)
goto reloc_overflow;
*(u16 *)location =3D value;

-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
