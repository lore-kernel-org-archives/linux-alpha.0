From: "Oliver Pitzeier" <o.pitzeier@uptime.at>
Subject: RE: Root filesystem ext3
Date: Mon, 29 Sep 2003 17:45:43 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <001701c386a0$bffc2cd0$020b10ac@pitzeier.priv.at>
References: <003801c386a0$113f3430$13942c0a@fhpmfg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <003801c386a0$113f3430$13942c0a@fhpmfg.com>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'Carl C.'" <cc@carlc.com>, linux-alpha@vger.kernel.org

> > Sorry, I meant to say I had used tunefs to upgrade it. It 
> > does have a
> > journal.. I am using 2.4.9-40 for a kernel. Can that not 
> > use ext3 as a root filesystem?
> 
> 
> Your much better off to build your own kernel, and build ext3 
> as well as ext2 into the kernel. This saves you any overhead
> of a module (hey, your going to use it all the time!) and makes
> it a little faster that way. I've been running 2.4.22 on at least
> a dozen of my AXP webservers and they are rock solid (yeah Linux!).

And 2.6.0-test1 - -test5 is even better! :))) (i run -test6 since a few hours -
also without problems yet).

Best,
 Oliver

