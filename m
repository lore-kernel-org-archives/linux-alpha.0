From: Michael Cree <mcree@orcon.net.nz>
Subject: Linux 2.6.39-rc2 doesn't boot on alpha.
Date: Fri, 08 Apr 2011 20:28:32 +1200
Message-ID: <4D9EC730.2090105@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

[Resent with correction to linux-alpha email list]

Linux 2.6.39-rc[12] doesn't boot at all on Alpha.  As soon as the kernel 
has loaded the system freezes.

Bisection gave the following as the first bad commit:

commit 091738a266fc74329ae186f22ff2b3f01319112d genirq: Remove real old 
transition functions

If I reverse (as far as possible) the second half of the commit (the bit 
that applies to kernel/irq/chip.c) from 2.6.39-rc2 then I get a kernel 
that starts booting but freezes when it prints "Calibrating delay loop..."

Cheers
Michael.
