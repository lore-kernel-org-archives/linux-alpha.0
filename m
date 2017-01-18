From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: alpha: Checking source code positions for the setting of error
 codes
Date: Wed, 18 Jan 2017 16:41:10 +0100
Message-ID: <a8237856-6926-57d3-69ba-cff4006406b3@users.sourceforge.net>
References: <de76a580-c693-f422-ad78-d87bafd42bf3@users.sourceforge.net>
 <986573fa-e636-f864-14dc-5e65a31b454e@users.sourceforge.net>
 <20170118141103.GD1555@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20170118141103.GD1555@ZenIV.linux.org.uk>
Sender: kernel-janitors-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Viro <viro@ZenIV.linux.org.uk>, linux-alpha@vger.kernel.org
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Matt Turner <mattst88@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Richard Henderson <rth@twiddle.net>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> A local variable was set to an error code in two cases before a concrete
>> error situation was detected. Thus move the corresponding assignment into
>> an if branch to indicate a software failure there.
>>
>> This issue was detected by using the Coccinelle software.
> 
> Why the hell is that an issue?

* Can misplaced variable assignments result in unwanted run time consequences
  because of the previous approach for a control flow specification?

* How do you think about to achieve that error codes will only be set
  after a specific software failure was detected?


> It's a common enough idiom,

Are corresponding implementation details worth for another look?


> and while these functions are far from being hot paths,
> blind patches like that are very much to be discouraged.  NAK.

Thanks for your feedback.

Regards,
Markus
