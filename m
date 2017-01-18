From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: alpha: Checking source code positions for the setting of error
 codes
Date: Wed, 18 Jan 2017 17:43:20 +0000
Message-ID: <20170118174320.GE1555@ZenIV.linux.org.uk>
References: <de76a580-c693-f422-ad78-d87bafd42bf3@users.sourceforge.net>
 <986573fa-e636-f864-14dc-5e65a31b454e@users.sourceforge.net>
 <20170118141103.GD1555@ZenIV.linux.org.uk>
 <a8237856-6926-57d3-69ba-cff4006406b3@users.sourceforge.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a8237856-6926-57d3-69ba-cff4006406b3@users.sourceforge.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Matt Turner <mattst88@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Richard Henderson <rth@twiddle.net>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jan 18, 2017 at 04:41:10PM +0100, SF Markus Elfring wrote:
> >> A local variable was set to an error code in two cases before a concrete
> >> error situation was detected. Thus move the corresponding assignment into
> >> an if branch to indicate a software failure there.
> >>
> >> This issue was detected by using the Coccinelle software.
> > 
> > Why the hell is that an issue?
> 
> * Can misplaced variable assignments result in unwanted run time consequences
>   because of the previous approach for a control flow specification?

More like the opposite.
	load constant to register
	test
	branch usually not taken
is considerably cheaper than
	test
	branch usually taken

Something like
	if (unlikely(foo)) {
		err = -ESOMETHING;
		goto sod_off;
	}
would be more or less on par (and quite possibly would be compiled into
the same code - depends upon the scheduling details for processor,
but speculative load of constant can be an optimization).  However, that
has an effect of splattering the source with tons of those unlikely() *and*
visually cluttering the common path.

> * How do you think about to achieve that error codes will only be set
>   after a specific software failure was detected?

Sounds like an arbitrary requirement, TBH...

Again, loading a constant into register tends to be cheap and easy to
combine with other instructions at CPU pipeline level.  If anything, this
pattern is a microoptimization, often in spots that are not on hotpaths
by any stretch of imagination.  But estimating whether a given place is
on a hot path takes a lot more delicate analysis than feasible for
cocci scripts.  And visual cluttering of the common execution path remains -
it doesn't matter for compiler, but it can matter a lot for human readers.
