From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] alpha: fix FEN fault handling
Date: Sat, 7 Jan 2023 02:46:25 +0000
Message-ID: <Y7jdARsEQXPugR0t@ZenIV>
References: <Y7jD8XDZGnQkTvMI@ZenIV>
 <84c0d4ea-09e2-4907-d03d-939d40fa3c96@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=z80V7BWLLwigfiKI4dL/5j2LGkzDiZ6a+1vY1hMchMQ=; b=aBKfPNrS2h2+fLKta3N2z73QTi
        HoKRtKUXnLHT1i7pg9kITNSh1L8Uf8rPFCejKIqouYArS7xgfWwtWAzn39WwVcs6i9qNkpDBhqPPB
        eZodBcNpeK6VmsoXLc4FhJAqNDmN5nmwmN1ejH85wweziz4Gm3sblNjp0f695D9wHDXXwM0phGkPK
        pmIfQm+5ZR4pFo18qtSMhFDCJO5uWpWXbmxrVAlS6CW4/mFI9rpceVbCO3fJ5r6X3CH3gBigtjHZ3
        tT13+vA89kDAkG+vH+NDDpmFX64nyoxjrc27hjzaeXhJMdFChS/xwe/NFQz+uPjtXxCejb0qvs/EG
        4pd+1tZg==;
Content-Disposition: inline
In-Reply-To: <84c0d4ea-09e2-4907-d03d-939d40fa3c96@twiddle.net>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 06, 2023 at 05:55:14PM -0800, Richard Henderson wrote:
> On 1/6/23 16:59, Al Viro wrote:
> > Type 3 instruction fault (FPU insn with FPU disabled) is handled
> > by quietly enabling FPU and returning.  Which is fine, except that
> > we need to do that both for fault in userland and in the kernel;
> > the latter *can* legitimately happen - all it takes is this:
> > 
> > .global _start
> > _start:
> > 	call_pal 0xae
> > 	lda $0, 0
> > 	ldq $0, 0($0)
> > 
> > - call_pal CLRFEN to clear "FPU enabled" flag and arrange for
> > a signal delivery (SIGSEGV in this case).
> > 
> > Fixed by moving the handling of type 3 into the common part of
> > do_entIF(), before we check for kernel vs. user mode.
> > 
> > Incidentally, check for kernel mode is unidiomatic; the normal
> > way to do that is !user_mode(regs).  The difference is that
> > the open-coded variant treats any of bits 63..3 of regs->ps being
> > set as "it's user mode" while the normal approach is to check just
> > the bit 3.  PS is a 4-bit register and regs->ps always will have
> > bits 63..4 clear, so the open-code variant here is actually equivalent
> > to !user_mode(regs).  Harder to follow, though...
> > 
> > Reproducer above will crash any box where CLRFEN is not ignored by
> > PAL (== any actual hardware, AFAICS; PAL used in qemu doesn't
> > bother implementing that crap).
> 
> I didn't realize I'd forgotten this in qemu.  Anyway,
> 
> Reviewed-by: Richard Henderson <rth@twiddle.net>

Not sure it's worth bothering with in palcode-clipper - for Linux it's
useless (run out of timeslice and FEN will end up set, no matter what),
nothing in NetBSD or OpenBSD trees generates that call_pal, current
FreeBSD doesn't support alpha and their last version to do so hadn't
generated that call_pal either...  What else is out there?  OSF?
