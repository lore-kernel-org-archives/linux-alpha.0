From: Roland McGrath <roland@redhat.com>
Subject: Re: [BISECTED] 164UX Regression, 2.6.22->2.6.23
Date: Thu, 23 Sep 2010 13:42:29 -0700 (PDT)
Message-ID: <20100923204229.1249840614@magilla.sf.frob.com>
References: <20100923003811.GA17384@Sempron.nc.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: Matt Turner's message of  Wednesday, 22 September 2010 20:38:11 -0400 <20100923003811.GA17384@Sempron.nc.rr.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Ian Las <ialas@yahoo.com>

Best would be someone who thoroughly understands that boot loader's
expectations examining the vmlinux image to see what's wrong.  I'm
not that someone, but if you send me the images made before and after
that patch, I can examine them and speculate what the problem might be.


Thanks,
Roland
