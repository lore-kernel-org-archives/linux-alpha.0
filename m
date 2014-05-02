From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: alpha: Replace __get_cpu_var
Date: Fri, 2 May 2014 20:18:44 +1200
Message-ID: <20140502081844.GA6891@omega>
References: <alpine.DEB.2.10.1405011537360.21035@gentwo.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1405011537360.21035@gentwo.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Lameter <cl@linux.com>
Cc: Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On Thu, May 01, 2014 at 03:39:28PM -0500, Christoph Lameter wrote:
> Sorry I have not compiled this code. Could you see if this works?

The patch does not apply cleanly against an up to date pull from Linus'
tree; the last hunk against /arch/alpha/kernel/perf_event.c fails.
Fixing that manually then the compilation fails in
arch/alpha/kernel/time.c with multiple errors due to the changes.

Are there other patches that should be applied first?

Cheers
Michael.
