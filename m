From: Michael Cree <mcree@orcon.net.nz>
Subject: alpha: futex regression bisected
Date: Mon, 20 Feb 2012 21:20:38 +1300
Message-ID: <4F420256.2090600@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michel Lespinasse <walken@google.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>

I have noticed some user space problems (pulseaudio crashes in pthread
code, glibc/nptl test suite failures, java compiler freezes on SMP alpha
systems) that arise when using a 2.6.39 or later kernel on Alpha.
Bisecting between 2.6.38 and 2.6.39 (using glibc/nptl test suite as
criterion for good/bad kernel) eventually leads to:

8d7718aa082aaf30a0b4989e1f04858952f941bc is the first bad commit
commit 8d7718aa082aaf30a0b4989e1f04858952f941bc
Author: Michel Lespinasse <walken@google.com>
Date:   Thu Mar 10 18:50:58 2011 -0800

    futex: Sanitize futex ops argument types

    Change futex_atomic_op_inuser and futex_atomic_cmpxchg_inatomic
    prototypes to use u32 types for the futex as this is the data type the
    futex core code uses all over the place.

Looking at the commit I see there is a change of the uaddr argument in
the Alpha architecture specific code for futexes from int to u32, but I
don't see why this should cause a problem.

I am hoping someone better than I at Alpha assembly (Richard?, Ivan?)
might be able to look at the commit and propose a fix!

Cheers
Michael.
