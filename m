From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] alpha: spinlock: don't perform memory access in locked
 critical section
Date: Mon, 6 May 2013 21:26:28 +0100
Message-ID: <20130506202628.GN25399@ZenIV.linux.org.uk>
References: <1367870465-23948-1-git-send-email-will.deacon@arm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1367870465-23948-1-git-send-email-will.deacon@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will.deacon@arm.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On Mon, May 06, 2013 at 09:01:05PM +0100, Will Deacon wrote:
> The Alpha Architecture Reference Manual states that any memory access
> performed between an LD_xL and a STx_C instruction may cause the
> store-conditional to fail unconditionally and, as such, `no useful
> program should do this'.
> 
> Linux is a useful program, so fix up the Alpha spinlock implementation
> to use logical operations rather than load-address instructions for
> generating immediates.

Huh?  Relevant quote is "If any other memory access (ECB, LDx, LDQ_U,
STx_C, STQ_U, WH64x) is executed on the given processor between the
LDx_L and the STx_C, the sequence above may always fail on some
implementations; hence, no no useful programs should do this".  Where
do you see LDA in that list and why would it possibly be there?  And
no, LDx does *not* cover it - the same reference manual gives
LD{Q,L,WU,BU} as expansion for LDx, using LDAx for LD{A,AH}; it's
a separate group of instructions and it does *NOT* do any kind of
memory access.
