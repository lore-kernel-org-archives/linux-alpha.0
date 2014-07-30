From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Bug: retry of clone() on Alpha can result in zeroed process
 thread pointer
Date: Wed, 30 Jul 2014 16:51:17 +1200
Message-ID: <20140730045117.GD2262@stolen.phys.waikato.ac.nz>
References: <20140723085244.GB4799@omega>
 <53D81EF1.5030306@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53D81EF1.5030306@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org

On Tue, Jul 29, 2014 at 12:23:45PM -1000, Richard Henderson wrote:
> I don't think this will help, but it's worth a test, prior to totally
> re-writing entry.S.  There's a chance of confusion of the value of regs->r0 if
> there is in fact no error.

No, it did not help.  The glibc nptl/tst-eintr3 test still occassionally
sefgaults and that is occurring because rduniq returned a NULL pointer.

Cheers
Michael.
