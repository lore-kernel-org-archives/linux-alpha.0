From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and use absolute_pointer macro)
Date: Sat, 25 Sep 2021 20:31:10 +0200 (CEST)
Message-ID: <202109251831.18PIVAD8004391@valdese.nms.ulrich-teichert.org>
References: <no.id>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <no.id>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Alpha <linux-alpha@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, mattst88@gmail.com, rth@twiddle.net, ink@jurassic.park.msu.ru

Hi,

> I'll try booting from CDROM with a serial line attached at the weekend,
> perhaps that will give us a hint.

[You can call the Alpha a dead architecture and the Jensen and antiquated
machine, but there are features which modern PCs *still* don't have,
like the automatic switch over to the serial line console when no keyboard
is connected. I'm still impressed how well that works.]

Well...whatever that means, but you can call it a hint. Booting from
CD-ROM stopps with:

>>> boot dka500 -fl i
INIT-S-CPU...
AUDIT_BOOT_STARTS ... 
AUDIT_CHECKSUM_GOOD
AUDIT_LOAD_BEGINS
AUDIT_LOAD_DONE

Linux/AXP bootloader for Linux 5.15.0-rc2-00045-gcf1d2c3e7e2f-dirty
Switching to OSF PAL-code .. Ok (rev 20123)
Loading vmlinux ...Failed (200000000067a000)

?05 HLT INSTR
  PC= 00000000.20000014 PSL= 00000000.00000007

Anyone an idea what 200000000067a000 may mean in this context?

TIA,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction
