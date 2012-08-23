From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 01/10] alpha: Add missing RCU idle APIs on idle loop
Date: Thu, 23 Aug 2012 12:58:19 +0200
Message-ID: <20120823105816.GB18835@somewhere.redhat.com>
References: <1345652628-15060-1-git-send-email-fweisbec@gmail.com>
 <1345652628-15060-2-git-send-email-fweisbec@gmail.com>
 <5035F8A2.1070702@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=gmfEpA20nh2Xe4mkG8uZrAZZzTKWFyxieQpuBKHjmcA=;
        b=qTRTuenUDxW7IgM9Io5pjmh0c+DcD/4SjNdNFJkqMHjvo0fUi6EpVIJXYv0H6/JXvO
         AUTiR77OsHbcOyNmRJSkzL5mwAWRxFiyjYned2Zr5bQDQF79h9PWn4qQPcmOTVdjZWDl
         WBp3RE5Yd2WzyIAFdSpsqEojpl9fHqhwSavsRDCZXJeOD/ol3+qQNEcwSSSoTp1rYIcR
         Ea85MU6qby0UYJHq5B3fL7x1GVWd281JHR4fBOSzplcC6MhJd2mXbUDc0m4aCTR6hofV
         akn1wySuMqZTDiT/z5YL0cvqmETKC2xDT8Tb1Ni6B8b+sWGiyC463Cx0JcGIVGjRb4ha
         t/tQ==
Content-Disposition: inline
In-Reply-To: <5035F8A2.1070702@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: LKML <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, "3.2.x.." <stable@kernel.org>

On Thu, Aug 23, 2012 at 09:32:18PM +1200, Michael Cree wrote:
> On 23/08/12 04:23, Frederic Weisbecker wrote:
> > In the old times, the whole idle task was considered
> > as an RCU quiescent state. But as RCU became more and
> > more successful overtime, some RCU read side critical
> > section have been added even in the code of some
> > architectures idle tasks, for tracing for example.
> 
> Fantastic!  It fixes RCU CPU stalls that we were seeing on the SMP
> kernel when built for generic Alpha.
> 
> A build of glibc and running its test suite reliably triggers RCU CPU
> stalls when running a kernel built for generic Alpha.  I have just built
> glibc and ran its test suite twice with no RCU CPU stalls with this
> patch against a 3.5.2 kernel!  Nice.  Very nice.
> 
> I see the stable queue is CCed but I note the patch does not apply
> cleanly to the 3.2.y kernel.  It would be nice to have a backport of the
> patches for the 3.2 stable kernel.

Sure.

> 
> So feel free to add:
> 
> Tested-by:  Michael Cree <mcree@orcon.net.nz>

Thanks, but I need to refactor the patch, I suspect a problem with CONFIG_PREEMPT.
