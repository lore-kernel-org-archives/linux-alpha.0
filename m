From: "alpha @ steudten Engineering" <alpha@steudten.com>
Subject: Kernel panic on alpha cpu 2.6.13-2.6.15 not in 2.6.10
Date: Fri, 20 Jan 2006 13:58:43 +0100
Message-ID: <43D0DE83.6000009@steudten.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: LinuxAlpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, becker@scyld.com

Was: "Kernel crash on alpha cpu 2.6.13-2.6.15"

Part 2: The system has crashed again today with "kernel panic - not syncing: Aiee, killing interrupt handler!"
After 3 days uptime!

Is there any way with do_exit() to find out, which interrupt or kernel code this is?
Is it possible to print out a kernel stack trace in do_exit()?
The Magic Keys don't work in the normal way for the alpha.

Original Mail:

Hello

Summary:
alpha cpu 64 Bit
kernel-2.6.10: ok
kernel-2.6.13-2.6.15: problem
eth0: 3Com Corporation 3C905B Fast Etherlink XL 10/100
Kernel crash, reboot problem due to kernel-log-buffer flooted with message.
No problem on x86 with same network card.
Kernel not stable on alpha cpu!
With hardreset (power-off) everything is ok, until the next time.

Detail:
kernel-2.6.15: Kernel crashs after 5-15days, no message is logged in syslog (klogd -2 -p -c 3).
Autoreboot after crash is active and when the kernel boots again, the syslog
is flooted with the messages:
kernel: eth0: Host error, FIFO diagnostic register 0000.
kernel: eth0: PCI bus error, bus status 40000020
kernel: eth0: Host error, FIFO diagnostic register 0000.
kernel: eth0: PCI bus error, bus status 40000020
kernel: eth0: Host error, FIFO diagnostic register 0000.
kernel: eth0: PCI bus error, bus status 40000020
kernel: eth0: Host error, FIFO diagnostic register 0000.
kernel: eth0: PCI bus error, bus status 40000020
kernel: eth0: Host error, FIFO diagnostic register 0000.
[..]

About 20 lines per second! -> BTW: Why this is not catched from klogd/syslogd to one entry per second?

The text is in "drivers/net/3c59x.c line 2149 (2.6.15):
3c59x.c:2149:           printk(KERN_ERR "%s: Host error, FIFO diagnostic register %4.4x.\n",

A diff between 2.6.10 and 2.6.15 3c59x.c shows a lot of lines changed, and the i/o calls like "inw" changed to
"ioread16" aso - maybe this is a probem.

00:09.0 Ethernet controller: 3Com Corporation 3c905B 100BaseTX [Cyclone] (rev 30)
        Subsystem: 3Com Corporation 3C905B Fast Etherlink XL 10/100
        Flags: bus master, medium devsel, latency 32, IRQ 24
        I/O ports at 8c00 [size=128]
        Memory at 000000000a064000 (32-bit, non-prefetchable) [size=128]
        Expansion ROM at 000000000a020000 [disabled] [size=128K]
        Capabilities: [dc] Power Management version 1

Regards
Thomas

