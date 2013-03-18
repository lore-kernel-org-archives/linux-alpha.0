From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] alpha: makefile: don't enforce small data model for kernel builds
Date: Mon, 18 Mar 2013 17:11:15 +1300
Message-ID: <BFB01C0A-95E5-4C2B-8AF2-A06BE1FF74E0@orcon.net.nz>
References: <1363556926-21097-1-git-send-email-will.deacon@arm.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1363556926-21097-1-git-send-email-will.deacon@arm.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Will Deacon <will.deacon@arm.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On 18/03/2013, at 10:48 AM, Will Deacon wrote:
> Due to all of the goodness being packed into today's kernels, the
> resulting image isn't as slim as it once was.
>
> In light of this, don't pass -msmall-data to the tools, which  
> results in
> link failures due to impossible relocations when compiling anything  
> but
> the most trivial configurations.

I think many of us have been using -mlarge-data when compiling with  
gcc-4.6 or later so maybe it is time to get the change upstream.

The interesting thing is that the kernel still compiles fine with  
gcc-4.5 and the relocation errors only appear if compiling with  
gcc-4.6 or later.  I had asked before on this forum what had changed  
with gcc-4.6 that results in the extra usage of the small data area  
but never got an answer.  I am still curious to know.

BTW, the phrase "to the tools" in the commit message makes me think  
immediately of the tools directory (containing perf, etc.) which is  
not what is intended.

Matt:  Are you able to collect up this and the other patches of Will  
and get them sent to Linus?

Cheers
Michael.

