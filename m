From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Build error: `.exit.text' referenced in section `.rodata'
Date: Tue, 13 May 2008 15:51:14 -0500
Message-ID: <1210711874.3077.67.camel@localhost.localdomain>
References: <20080511151902.GA733@ds20.borg.net>
	 <1210524907.3199.6.camel@localhost.localdomain>
	 <20080511192007.GB724@ds20.borg.net> <20080512115255.GA16942@ds20.borg.net>
	 <1210600904.3078.1.camel@localhost.localdomain>
	 <20080513143112.GA21274@jurassic.park.msu.ru>
	 <1210690758.3077.23.camel@localhost.localdomain>
	 <20080513200649.GA23202@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=2007; t=1210711879; bh=LdowyKFR9VHB/OCpptg0VVaohu1DK/VRtYCfvd30nI
	I=; l=1279; h=Subject:From:To:Cc:In-Reply-To:References:
	 Content-Type:Date:Message-Id:Mime-Version:
	 Content-Transfer-Encoding; b=oZiN/BrKfxkwgmAHYc1vkcoXb0ljKSr9/YrAd
	MKaCOwcHC8TmB/PercqxjF+k736tITHaV//fFG3s/wReUMQdpt8P97u/xStY+FFOBnG
	1u5YfunZLwK2uMZbl13EmObiy+/6FDf9mx2cKL/o1wmIB8FAw1JVXZ+nzxCT36Q+rpI
	=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=2007; t=1210711878; bh=LdowyKFR9VHB/OCpptg0VVaohu1DK/VRtYCfvd30nI
	I=; l=1279; h=Subject:From:To:Cc:In-Reply-To:References:
	 Content-Type:Date:Message-Id:Mime-Version:
	 Content-Transfer-Encoding; b=s1Ilb5wOQALJ3z5EjFBtkdvSoe2r/1PhcjCp9
	cnk0/n1MSQZPZBrzsNJ6cSymEKhRb30+o261BzflHUP66PdpcZLs7lfxNsr+ME6f5Bg
	gR2IVx4phOhI+xtTJFSMlauYl6qiX6Mewbb2Q1ajcArxXeuDiQRR7AUgyBMzGrrFgqk
	=
In-Reply-To: <20080513200649.GA23202@jurassic.park.msu.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: dl8bcu@dl8bcu.de, rth@twiddle.net, linux-scsi@vger.kernel.org, linux-alpha@vger.kernel.org

On Wed, 2008-05-14 at 00:06 +0400, Ivan Kokshaysky wrote:
> On Tue, May 13, 2008 at 09:59:17AM -0500, James Bottomley wrote:
> > But if that's true then the whole basis for our section based discards
> > is bogus, because the statement generating the jump table could be
> > inside the actual function body instead of being inlined, so if it's
> > failing on x86 as well, we likely need it fixed there too.
> 
> Correct.
> 
> > > It would be good, but in the meantime the 'noinline' fix seems to be
> > > a most sensible option...
> > 
> > We can certainly add it as a short term option.  However, given the push
> > in certain quarters to make even more use of sections as a means of
> > discarding code, we're going to have to ask someone to fix the compiler.
> 
> Then maybe building with -fno-jump-tables option would be better solution.
> I don't think that it will have a noticeable impact on code size or
> performance, especially on x86.
> 
> So we need something like this (assuming gcc eventually gets fixed,
> say gcc 4.5 ;)
> 
> KBUILD_CFLAGS	+= $(call cc-ifversion, -lt, 0405, \
> 			$(call cc-option, -fno-jump-tables))

This is way beyond a SCSI issue.  Time to take it to linux-arch I
think ... do you want to do the honours?

James


