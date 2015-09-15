From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/2] alpha: fix build failure
Date: Tue, 15 Sep 2015 06:28:40 -0700
Message-ID: <55F81D08.9000808@roeck-us.net>
References: <1442231369-27118-1-git-send-email-sudipm.mukherjee@gmail.com>
 <20150914212208.GA11482@roeck-us.net> <20150915082135.GI9305@sudip-pc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=roeck-us.net; s=default;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:Subject; bh=JoFKcWllvWCqriWnqo+8anb4zGUS1bLzTWpN+qTxMC0=;
	b=4Xovljcq1sBL4R0ZbtEJlja2ggIi9LJ2+r7vGFgwvq8JR03X6aJ++gWpTWYcytBJoUYXCoESYOimS6JiDve21QdnVirijhf0/vuXAhlfrKk8vyo918J776q7K1PhFyhkZ2EqVXzdIR+6WHTKuAZAZZWeOqDKP9O8G/IFEzyKibc=;
In-Reply-To: <20150915082135.GI9305@sudip-pc>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org

On 09/15/2015 01:21 AM, Sudip Mukherjee wrote:
> On Mon, Sep 14, 2015 at 02:22:08PM -0700, Guenter Roeck wrote:
>> On Mon, Sep 14, 2015 at 05:19:27PM +0530, Sudip Mukherjee wrote:
>>> We were getting build failure on allmodconfig. Mainly two causes
>>> ioremap_uc was not defined and __delay was not exported.
>>>
>> I already submitted patches to fix those problems some 6+ weeks ago.
>> Hope you'll have more luck.
> For my allmodconfig test with next-20150915 alpha, m32r and openrisc
> failed. And ofcourse mn10300 is broken since many months now.
> Have you already done something with m32r or should I try? If both of us
> are trying the same it will be a wastage of time. So asking you.
>

I am not building m32r:allmodconfig or openrisc:allmodconfig.

You can always check http://server.roeck-us.net:8010/builders to see
what is covered by my builds and tests.

Guenter

