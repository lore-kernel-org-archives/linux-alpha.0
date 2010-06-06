From: Michael Cree <mcree@orcon.net.nz>
Subject: 2.6.35-rc2 compilation error on Alpha
Date: Mon, 07 Jun 2010 10:35:48 +1200
Message-ID: <4C0C22C4.3010705@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: linux-kernel@vger.kernel.org
Cc: Borislav Petkov <borislav.petkov@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org

When compiling 2.6.35-rc2 for Alpha architecture the following compiler=
=20
error is seen:

   CC      arch/alpha/kernel/asm-offsets.s
In file included from include/linux/kernel.h:17,
                  from include/linux/sched.h:54,
                  from arch/alpha/kernel/asm-offsets.c:9:
include/linux/bitops.h: In function =91hweight_long=92:
include/linux/bitops.h:49: error: implicit declaration of function=20
=91__arch_hweight32=92

Cheers
Michael.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
