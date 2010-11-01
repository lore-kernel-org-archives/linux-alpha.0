From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Subject: Re: Matts tree, IRQ related warning
Date: Mon, 01 Nov 2010 12:48:34 +0100
Message-ID: <1288612114.2039.11.camel@laptop>
References: <EAE0CA1B516144649F164BBDA1D1EECD@morten>
	 <4CCE6C35.2030706@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4CCE6C35.2030706@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>
Cc: Morten Holst Larsen <mhl@mhlnet.dk>, linux-alpha@vger.kernel.org, Venkatesh Pallipadi <venki@google.com>

On Mon, 2010-11-01 at 20:28 +1300, Michael Cree wrote:
> > WARNING: at kernel/softirq.c:138 __local_bh_enable+0xac/0xc0()

That's WARN_ON(!irqs_disabled()), right?

How can that be, you're in the irq_enter path, the hardware should have
disabled IRQs already, right?


