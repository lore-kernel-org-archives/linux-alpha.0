From: Jay Maynard <jmaynard@conmicro.cx>
Subject: Re: 2.4 kernels broken on Takara?
Date: Sun, 8 Feb 2004 17:53:12 -0600
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040208175312.A26586@thebrain.conmicro.cx>
References: <20040208103909.C25099@thebrain.conmicro.cx> <20040208211454.GV28571@lug-owl.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040208211454.GV28571@lug-owl.de>; from jbglaw@lug-owl.de on Sun, Feb 08, 2004 at 10:14:55PM +0100
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

On Sun, Feb 08, 2004 at 10:14:55PM +0100, Jan-Benedict Glaw wrote:
> On Sun, 2004-02-08 10:39:09 -0600, Jay Maynard <jmaynard@conmicro.cx>
> wrote in message <20040208103909.C25099@thebrain.conmicro.cx>:
> > install. I've tried installing a Debian system, then a 2.4 kernel on top of
> > that - but 2.4.18 and 2.4.24 prebuilt generic kernels, as well as a 2.4.24
> > custom kernel built specifically for the Takara, all blow up with a kernel
> > paging error during startup, right after the PCI bridges are detected. The
> > 2.2.20 kernel iinstalled by Debian runs fine.
> I remember there were problems with the PCI bridging code. Maybe you'd
> try to give 2.6.x a shot...

No luck, although I got a little better look at the error messages. I've
retyped them here:

PCI: Bus 2, bridge: 0000:00:14.0
  IO window: 8000-8fff
  MEM window: 02400000-037fffff
  PREFETCH window: 02200000-022fffff
PCI: Setting latency timer of device 0000:00:13.0 to 64
Unable to handle kernel paging request at virtual address 0000000000000040
swapper(1): Oops 0
pc = [<fffffc00004eecf0>]  ra = [<fffffc00004eecc8>]  ps = 0000    Not tainted
[register dump here]
Trace:fffffc0000310124 fffffc00003151e8
Code: 261dfff1 401f0000 a4410038 2c810078 20210078 22107a7c <a0420040>
488100c4
Kernel panic: Attempted to kill init!

This is with the generic Debian 2.6.0 kernel. Now what?
