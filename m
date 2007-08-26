From: Satyam Sharma <satyam@infradead.org>
Subject: Re: [4/4] 2.6.23-rc3: known regressions v3
Date: Sun, 26 Aug 2007 09:45:04 +0530 (IST)
Message-ID: <alpine.LFD.0.999.0708260943400.26486@enigma.security.iitk.ac.in>
References: <46CF0DEF.5040107@googlemail.com>
 <46CF17A0.2060503@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <46CF17A0.2060503@googlemail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Oliver Falk <oliver@linux-kernel.at>



On Fri, 24 Aug 2007, Michal Piotrowski wrote:
> 
> Alpha
> 
> Subject         : -Werror compilation problem - make[1]: *** [arch/alpha/kernel/sys_titan.o] Error 1
> References      : http://lkml.org/lkml/2007/8/6/137
> Last known good : ?
> Submitter       : Oliver Falk <oliver@linux-kernel.at>
> Caused-By       : ?
> Handled-By      : ?
> Status          : unknown

This was fixed by commit f6901e639800e745457b1dcd99c52647981438d7.
