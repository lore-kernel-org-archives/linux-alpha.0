From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH 4/4] alpha: Move two assignments for the variable "res"
 in srm_env_proc_write()
Date: Wed, 18 Jan 2017 14:11:03 +0000
Message-ID: <20170118141103.GD1555@ZenIV.linux.org.uk>
References: <de76a580-c693-f422-ad78-d87bafd42bf3@users.sourceforge.net>
 <986573fa-e636-f864-14dc-5e65a31b454e@users.sourceforge.net>
Mime-Version: 1.0
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <986573fa-e636-f864-14dc-5e65a31b454e@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Matt Turner <mattst88@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Richard Henderson <rth@twiddle.net>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jan 18, 2017 at 12:50:17PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Jan 2017 12:08:44 +0100
> 
> A local variable was set to an error code in two cases before a concrete
> error situation was detected. Thus move the corresponding assignment into
> an if branch to indicate a software failure there.
> 
> This issue was detected by using the Coccinelle software.

Why the hell is that an issue?  It's a common enough idiom, and while these
functions are far from being hot paths, blind patches like that are very
much to be discouraged.  NAK.
