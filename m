From: Christoph Lameter <cl@linux.com>
Subject: Re: alpha: Replace __get_cpu_var
Date: Mon, 5 May 2014 10:51:32 -0500 (CDT)
Message-ID: <alpine.DEB.2.10.1405051051190.27655@gentwo.org>
References: <alpine.DEB.2.10.1405011537360.21035@gentwo.org> <20140502081844.GA6891@omega> <alpine.DEB.2.10.1405021007150.30890@gentwo.org> <alpine.DEB.2.10.1405021010290.31444@gentwo.org> <20140504084613.GA13864@omega>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20140504084613.GA13864@omega>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1399305095;
	bh=JOLLcALDwpUO7IAUs4InAlKeC57lMPHe3+ViuxiTLFM=;
	h=Received:Received:Received:Received:Date:From:To:Subject:
	 Message-ID:Content-Type;
	b=lwGuUdivo30bSu9HBe8uOqR95wd+NCoWR0oFZS2REN+5eSHq0+ynQfcNamvO8GreS
	 7h+rThupJhBbGQ4dcx55GOQ0dyi3ezkuVTFAieeVF2kFc5utS5kd1f9eF53C3Ljuz1
	 kqAdrRyxpw6xyrrwzxcUCR+MO28DJethE6eBYXxNDsq2ff7MYEflx5rUpPqgdsy76r
	 Qdx2XyeSZhvX5tILjbEhCW7ByqDWVkqfEaTGxYwWLTC/msegaqUNei8PPCaSGqVf4+
	 g+wWUQUIqgPI95RSxyae++Gvb+EbZABz7t1vuwWtTWJG7OnI1m96Ra7vvgUaJ46PNN
	 5btwJD5SkiqEQ==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On Sun, 4 May 2014, Michael Cree wrote:

> On Fri, May 02, 2014 at 10:11:10AM -0500, Christoph Lameter wrote:
> > v2 rediffed aginst Linus tree and fixed the macro def in time.c
> >
> > Subject: alpha: Replace __get_cpu_var
>
> Yes, that compiles and performance events is still working okay with
> the built kernel.
>
> Tested-by: Michael Cree <mcree@orcon.net.nz>

Could you merge the patch through your tree?

