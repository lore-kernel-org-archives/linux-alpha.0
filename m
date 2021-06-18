From: Jens Axboe <axboe@kernel.dk>
Subject: Re: remove the legacy ide driver v2
Date: Fri, 18 Jun 2021 08:38:56 -0600
Message-ID: <57488a7b-02fa-3b3a-6719-81ab8dd64b53@kernel.dk>
References: <20210616134658.1471835-1-hch@lst.de>
 <4b003372-41d0-507a-b74b-b73aa33189f4@kernel.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T9YZ9nd9UJQBiMGTA8SwSx9fF/IkYT4ggh3TTtYGORU=;
        b=ELMedzfqm5gGYiZMpebilxyhIz30HP+7MOrFhLWMfRM7CNAGCIQMGLIobxyzi2vTvr
         aj3eqq2G0rINF61dtcVNMqxlKrb2V4BxLPEmPZiRqvpDoudbV/EgJiamQGWpXpxflQmO
         ND3tV4XYaw4ZeFHRCzpd+EOeGFKQC2rJD985zQdcFF3mqvI4ET4kgMto7ucO5bfXIzvY
         /cBGMYPqdnkSCTr4+YLVPB0A5rpI9N5gZtGLbFQa1CNCzSRtYfXQmZ4FMBc/itdFoj/X
         Z09tQjkcsSNNkxC1pLW0oyfttF9xqvdh30nPpapcASD+YC/vcdSisam+uu+KYMjXS1oZ
         jueQ==
In-Reply-To: <4b003372-41d0-507a-b74b-b73aa33189f4@kernel.dk>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org

On 6/16/21 8:52 AM, Jens Axboe wrote:
> On 6/16/21 7:46 AM, Christoph Hellwig wrote:
>> Hi all,
>>
>> we've been trying to get rid of the legacy ide driver for a while now,
>> and finally scheduled a removal for 2021, which is three month old now.
>>
>> In general distros and most defconfigs have switched to libata long ago,
>> but there are a few exceptions.  This series first switches over all
>> remaining defconfigs to use libata and then removes the legacy ide
>> driver.
>>
>> libata mostly covers all hardware supported by the legacy ide driver.
>> There are three mips drivers that are not supported, but the linux-mips
>> list could not identify any users of those.  There also are two m68k
>> drivers that do not have libata equivalents, which might or might not
>> have users, so we'll need some input and possibly help from the m68k
>> community here.
>>
>> This series is against Jens' for-5.14/libata branch.
> 
> Unless someone complains loudly, I plan on queueing this up end this
> week.

This has now been applied for 5.14, thanks.

-- 
Jens Axboe

