From: Jay Maynard <jmaynard@conmicro.cx>
Subject: Re: 2.4 kernels broken on Takara?
Date: Mon, 9 Feb 2004 07:57:17 -0600
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040209075717.A29384@thebrain.conmicro.cx>
References: <20040208103909.C25099@thebrain.conmicro.cx> <20040208211454.GV28571@lug-owl.de> <20040208175312.A26586@thebrain.conmicro.cx> <20040209090259.GA28571@lug-owl.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040209090259.GA28571@lug-owl.de>; from jbglaw@lug-owl.de on Mon, Feb 09, 2004 at 10:02:59AM +0100
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

On Mon, Feb 09, 2004 at 10:02:59AM +0100, Jan-Benedict Glaw wrote:
> > pc = [<fffffc00004eecf0>]  ra = [<fffffc00004eecc8>]  ps = 0000    Not tainted
           ^-- takara_swizzle + 0x74

> > Trace:fffffc0000310124 fffffc00003151e8
          ^-- init + 0x24  ^-- kernel_thread + 0x28

> Decode the oops. That'll exactly tell where it happened.

Okkay, so takara_swizzle looks like it's hiccuping. Based on this, I suspect
it's the same failure in the 2.4.x kernels I've tried...I'll verify that a
little later.

Now, for a little source code digging...
