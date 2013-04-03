From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] alpha: makefile: don't enforce small data model for
 kernel builds
Date: Wed, 3 Apr 2013 19:02:18 +0100
Message-ID: <20130403180218.GA21167@mudshark.cambridge.arm.com>
References: <1363556926-21097-1-git-send-email-will.deacon@arm.com>
 <BFB01C0A-95E5-4C2B-8AF2-A06BE1FF74E0@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BFB01C0A-95E5-4C2B-8AF2-A06BE1FF74E0@orcon.net.nz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

Hi guys,

On Mon, Mar 18, 2013 at 04:11:15AM +0000, Michael Cree wrote:
> On 18/03/2013, at 10:48 AM, Will Deacon wrote:
> > Due to all of the goodness being packed into today's kernels, the
> > resulting image isn't as slim as it once was.
> >
> > In light of this, don't pass -msmall-data to the tools, which  
> > results in
> > link failures due to impossible relocations when compiling anything  
> > but
> > the most trivial configurations.
> 
> I think many of us have been using -mlarge-data when compiling with  
> gcc-4.6 or later so maybe it is time to get the change upstream.
> 
> The interesting thing is that the kernel still compiles fine with  
> gcc-4.5 and the relocation errors only appear if compiling with  
> gcc-4.6 or later.  I had asked before on this forum what had changed  
> with gcc-4.6 that results in the extra usage of the small data area  
> but never got an answer.  I am still curious to know.
> 
> BTW, the phrase "to the tools" in the commit message makes me think  
> immediately of the tools directory (containing perf, etc.) which is  
> not what is intended.
> 
> Matt:  Are you able to collect up this and the other patches of Will  
> and get them sent to Linus?

I noticed Matt agreed to this, but I was dropped from CC:

  https://lkml.org/lkml/2013/3/25/486

Any chance you could send the patches on please?

Thanks,

Will
