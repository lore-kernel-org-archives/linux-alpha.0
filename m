From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH] alpha: use BUG_ON where possible
Date: Thu, 8 Nov 2012 22:42:42 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1211082242130.27271@pobox.suse.cz>
References: <1352406191-14303-1-git-send-email-sasha.levin@oracle.com> <1352406191-14303-2-git-send-email-sasha.levin@oracle.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1352406191-14303-2-git-send-email-sasha.levin@oracle.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sasha Levin <sasha.levin@oracle.com>
Cc: linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joe Perches <joe@perches.com>, linux-alpha@vger.kernel.org

On Thu, 8 Nov 2012, Sasha Levin wrote:

> Just use BUG_ON() instead of constructions such as:
> 
> 	if (...)
> 		BUG()
> 
> A simplified version of the semantic patch that makes this transformation
> is as follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression e;
> @@
> - if (e) BUG();
> + BUG_ON(e);

Ok, I guess I am just going to apply this one. Thanks,

-- 
Jiri Kosina
SUSE Labs
