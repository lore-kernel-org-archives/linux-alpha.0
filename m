From: Roland McGrath <roland@redhat.com>
Subject: Re: [BISECTED] 164UX Regression, 2.6.22->2.6.23
Date: Fri,  1 Oct 2010 15:37:46 -0700 (PDT)
Message-ID: <20101001223746.BCE7940038@magilla.sf.frob.com>
References: <785390.29767.qm@web29007.mail.ird.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: Ian Las's message of  Thursday, 30 September 2010 21:09:40 +0000 <785390.29767.qm@web29007.mail.ird.yahoo.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ian Las <ialas@yahoo.com>
Cc: Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

> Hi Roland,
> attached are a working vml2622.gz and a failing
> vml2623.gz images.
> As far as possible identical config has been used for compilation.

I was looking for an apples-to-apples comparison, i.e. the same exact
everything except reverting this one patch.  Two entirely different kernel
source versions is not what I meant at all.  But I'll see if I can tell
what is going on from looking at these.


Thanks,
Roland
