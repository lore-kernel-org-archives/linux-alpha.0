From: "Carl C." <cc@carlc.com>
Subject: Re: Root filesystem ext3
Date: Mon, 29 Sep 2003 11:40:53 -0400
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <003801c386a0$113f3430$13942c0a@fhpmfg.com>
References: <001501c3869c$32798230$020b10ac@pitzeier.priv.at> <oprv9o2wk1luaogu@mail.NairnConsulting.ca>
Reply-To: "Carl C." <cc@carlc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

----- Original Message ----- 
From: "Richard Nairn" <Richard@nairnconsulting.ca>
To: "Oliver Pitzeier" <o.pitzeier@uptime.at>; <linux-alpha@vger.kernel.org>
Sent: Monday, September 29, 2003 11:24 AM
Subject: Re: Root filesystem ext3


> Sorry, I meant to say I had used tunefs to upgrade it. It does have a 
> journal.. I am using 2.4.9-40 for a kernel. Can that not use ext3 as a 
> root filesystem?


Your much better off to build your own kernel, and build ext3 as well as
ext2 into the kernel. This saves you any overhead of a module (hey, your
going to use it all the time!) and makes it a little faster that way. I've been
running 2.4.22 on at least a dozen of my AXP webservers and they are
rock solid (yeah Linux!).

Carl

====================
http://www.carlc.com/

      "Price, Performance, Quality. Choose any two you like."
