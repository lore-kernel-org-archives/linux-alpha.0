From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] alpha: makefile: don't enforce small data model for
 kernel builds
Date: Mon, 25 Mar 2013 13:37:11 +0000
Message-ID: <20130325133710.GD14280@mudshark.cambridge.arm.com>
References: <1363556926-21097-1-git-send-email-will.deacon@arm.com>
 <BFB01C0A-95E5-4C2B-8AF2-A06BE1FF74E0@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BFB01C0A-95E5-4C2B-8AF2-A06BE1FF74E0@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

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

Any news on these? I've included an updated version of the first patch, with
the Tested-by-tag and a tweaked commit message below.

Will

--->8

From 8cbd016322bb01593795ec76cbdcbb52ac010203 Mon Sep 17 00:00:00 2001
From: Will Deacon <will.deacon@arm.com>
Date: Mon, 4 Mar 2013 04:46:44 +0000
Subject: [PATCH] alpha: makefile: don't enforce small data model for kernel
 builds

Due to all of the goodness being packed into today's kernels, the
resulting image isn't as slim as it once was.

In light of this, don't pass -msmall-data to gcc, which otherwise results
in link failures due to impossible relocations when compiling anything but
the most trivial configurations.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Tested-by: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
Signed-off-by: Will Deacon <will.deacon@arm.com>
---
 arch/alpha/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 4759fe7..2cc3cc5 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -12,7 +12,7 @@ NM := $(NM) -B
 
 LDFLAGS_vmlinux	:= -static -N #-relax
 CHECKFLAGS	+= -D__alpha__ -m64
-cflags-y	:= -pipe -mno-fp-regs -ffixed-8 -msmall-data
+cflags-y	:= -pipe -mno-fp-regs -ffixed-8
 cflags-y	+= $(call cc-option, -fno-jump-tables)
 
 cpuflags-$(CONFIG_ALPHA_EV4)		:= -mcpu=ev4
-- 
1.8.0

