From: Christoph Lameter <clameter@sgi.com>
Subject: Re: [1/4] 2.6.23-rc4: known regressions
Date: Wed, 29 Aug 2007 17:39:27 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0708291736010.4526@schroedinger.engr.sgi.com>
References: <46D5902C.1040905@googlemail.com> <46D5B544.4030708@l4x.org>
 <20070829234734.GA26410@stusta.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20070829234734.GA26410@stusta.de>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@kernel.org>
Cc: Jan Dittmer <jdi@l4x.org>, Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

On Thu, 30 Aug 2007, Adrian Bunk wrote:

> Christoph, is your fix in -mm suitable for 2.6.23, or how else should 
> this regression be fixed for 2.6.23?

Looks like this is just alpha and a certain particular compiler version? 
You may get away with adding

void __kmalloc_size_too_large(void)
{
	BUG();
}

somewhere if you use the particular compiler version causing trouble. 
The compiler will then generate some useless code wasting processor 
cycles due to not folding constants but it should(tm) work.
