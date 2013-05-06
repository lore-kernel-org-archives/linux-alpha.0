From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] alpha: spinlock: don't perform memory access in locked
 critical section
Date: Mon, 6 May 2013 21:53:30 +0100
Message-ID: <20130506205329.GO25399@ZenIV.linux.org.uk>
References: <1367870465-23948-1-git-send-email-will.deacon@arm.com>
 <CAEdQ38HnWbUB=ZNCZeYz8GZH3U4bv_Uag8WL2zT0D=GMcoT+2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEdQ38HnWbUB=ZNCZeYz8GZH3U4bv_Uag8WL2zT0D=GMcoT+2A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Will Deacon <will.deacon@arm.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On Mon, May 06, 2013 at 01:19:51PM -0700, Matt Turner wrote:

> I'm not sure of the interpretation that LDA counts as a memory access.
> 
> The manual says it's Ra <- Rbv + SEXT(disp).
> 
> It's not touching memory that I can see.

More to the point, the same manual gives explicit list of instructions
that shouldn't occur between LDx_L and STx_C, and LDA does not belong to any
of those.  I suspect that Will has misparsed the notations in there - LDx is
present in the list, but it's _not_ "all instructions with mnemonics starting
with LD", just the 4 "load integer from memory" ones.  FWIW, instructions
with that encoding (x01xxx<a:5><b:5><offs:16>) are grouped so:
	LDAx - LDA, LDAH; load address
	LDx -  LDL, LDQ, LDBU, LDWU; load memory data into integer register
	LDQ_U; load unaligned
	LDx_L - LDL_L, LDQ_L; load locked
	STx_C - STL_C, STQ_C; store conditional
	STx - STL, STQ, STB, STW; store
	STQ_U; store unaligned
They all have the same encoding, naturally enough (operation/register/address
representation), but that's it...  See section 4.2 in reference manual for
details; relevant note follows discussion of LDx_L and it spells the list
out.  LDx is present, LDAx isn't (and neither is LDA by itself).
