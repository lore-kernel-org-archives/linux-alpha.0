From: Meelis Roos <mroos@linux.ee>
Subject: Re: ext4 corruption on alpha with 4.20.0-09062-gd8372ba8ce28
Date: Sun, 17 Feb 2019 00:29:40 +0200
Message-ID: <e175b885-082a-97c1-a0be-999040a06443@linux.ee>
References: <fb63a4d0-d124-21c8-7395-90b34b57c85a@linux.ee>
 <1c26eab4-3277-9066-5dce-6734ca9abb96@linux.ee>
 <076b8b72-fab0-ea98-f32f-f48949585f9d@linux.ee>
 <20190216174536.GC23000@mit.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190216174536.GC23000@mit.edu>
Content-Language: et-EE
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Theodore Y. Ts'o" <tytso@mit.edu>, linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org, Jan Kara <jack@suse.cz>

>> The result of the bisection is
>> [88dbcbb3a4847f5e6dfeae952d3105497700c128] blkdev: avoid migration stalls for blkdev pages
>>
>> Is that result relevant for the problem or should I continue bisecting between 4.20.0 and the so far first bad commit?
> 
> Can you try reverting the commit and see if it makes the problem go away?

Tried reverting it on top of 5.0.0-rc6-00153-g5ded5871030e and it seems to make the kernel work - emerge --sync succeeded.

Unfinished further bisection has also not yielded any other bad revisions so far.

-- 
Meelis Roos
