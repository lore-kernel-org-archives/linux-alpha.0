From: Jean-Marc Saffroy <junk42@free.fr>
Subject: Problems with SRM+bootp on old Alpha
Date: Sun, 8 Feb 2004 05:02:50 +0100 (CET)
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58L.0401140251490.1499@saffroy.mds>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

Hello,

I am trying to boot 2.4.22 on an old AlphaStation 400 using SRM (latest
version: 7.2-1) and bootp (the machine has neither a hard drive nor a
floppy drive). After trying to boot a Debian image which would not work,
I have decided to set up a cross gcc and build a bootp image by myself,
but it failed similarly with "machine check while in PAL mode".

This seemed to be caused by the hack in start_kernel()
(arch/alpha/boot/bootp.c) that copies the kernel to a higher address
first, then to its final destination: I suspect it does not work on my
machine, which has only 16MB of RAM, because the 4*KERNEL_SIZE offset is
about 11MB. So I hacked the hack, and changed the offset value to 0, then
to 2*KERNEL_SIZE, both values lead me now to another error : "kernel stack
not valid halt".

Is that the error the original hack was supposed to avoid?
Any idea how I could debug this?

TIA
