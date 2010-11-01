From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Matts tree, IRQ related warning
Date: Mon, 01 Nov 2010 20:28:53 +1300
Message-ID: <4CCE6C35.2030706@orcon.net.nz>
References: <EAE0CA1B516144649F164BBDA1D1EECD@morten>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <EAE0CA1B516144649F164BBDA1D1EECD@morten>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Morten Holst Larsen <mhl@mhlnet.dk>
Cc: linux-alpha@vger.kernel.org, Venkatesh Pallipadi <venki@google.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>

On 01/11/10 18:58, Morten Holst Larsen wrote:
> When I build and run a kernel for my DS15 from Matts tree, I get a warning.
> Regardless of the warning everything seems to work ok.
>
> /Morten
>
> Linux version 2.6.36+ (root@ds15) (gcc version 4.2.4 (Debian 4.2.4-6))
> #4 Sun Oct 31 12:12:07 CET 2010
> Booting on Titan variation DEFAULT using machine vector TITAN from SRM
> Major Options: EV67 MAGIC_SYSRQ
> ** SNIP **
> Trying to install interrupt handler for IRQ8
> ------------[ cut here ]------------
> WARNING: at kernel/softirq.c:138 __local_bh_enable+0xac/0xc0()
> Modules linked in:
> fffffc0001677d60 fffffc000167ceb8 fffffc000103506c 0000000000000200
> 0000000000000008 fffffc0001677e00 0000000001234567 0000000000000000
> fffffc00010354e8 fffffc000169aed0 fffffc00010154a8 fffffc000169aed0
> fffffc00010158a4 fffffc0001686a20 0000000000000000 fffffc0001677e18
> fffffc0001010d70 fffffc0001668e0c fffffc000166ad78 fffffc0001695260
> 0000000000000007 0000000000000000 0000000000000440 0000000000000200
> Trace:
> [<fffffc000103506c>] __local_bh_enable+0xac/0xc0
> [<fffffc00010354e8>] irq_enter+0x68/0x80
> [<fffffc00010154a8>] handle_irq+0x58/0x110
> [<fffffc00010158a4>] do_entInt+0xc4/0x1d0
> [<fffffc0001010d70>] ret_from_sys_call+0x0/0x10
> [<fffffc000106d860>] irq_to_desc+0x0/0x30
> [<fffffc000101001c>] _stext+0x1c/0x20
> ---[ end trace 4eaa2a86a8e2da22 ]---

Yes, I have seen that warning too.  It's now present in Linus' tree.  I 
see that commit 75e1056f5 did some work in this area and I am 
speculating that it (or follow on commits) might be the cause.  CCed to 
the authors of the commit to bring it to their attention.

Cheers
Michael.
