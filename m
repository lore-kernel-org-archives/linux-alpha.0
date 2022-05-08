From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] alpha: Fix comment typo
Date: Sat, 7 May 2022 22:58:06 -0700
Message-ID: <e15e9717-a9a3-426e-b395-45ba871f7ffd@infradead.org>
References: <20220508030029.123056-1-wangborong@cdjrlc.com>
 <a18ecdef2efc0a5c23a85cc2a6dc17cf6e7d94c9.camel@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=bFSxAYYpp++FHtMPzNFg1UxWCvGU+jPPSRgrVSDgdYc=; b=HO8PM132n6bOrB7zdJxcEz5dpy
        Ssh0Pr9LibvtGFxdXuxrQvXEY8Sld8NFhBecG3PXfq7jWHwRSVbOJn249nwa+C5b8RrM+461EFO4A
        ELAsZ+6ftiWZADoibbuCrYk/cufGzbaD4iGLDVDlKQGxQ4Y8zRQOyRbSmnImQQWXXjeDVeIv7xmHP
        5H6Xte/o6G5WJA8GWJeHgNWszWIRd/rHaOOyUaHees6Sp17aIuLe0NIpUEnxTzt6KchJN6qgES8M8
        W5ftfNHXxSR5C2jMCNG5OXJ+KnobPfIzIVmmvqM3HicfkqBY4NORl0BX1Mc62JwX2dfagq4vanz4f
        ctoNHQuA==;
Content-Language: en-US
In-Reply-To: <a18ecdef2efc0a5c23a85cc2a6dc17cf6e7d94c9.camel@perches.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe Perches <joe@perches.com>, Jason Wang <wangborong@cdjrlc.com>, rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org



On 5/7/22 21:30, Joe Perches wrote:
> On Sun, 2022-05-08 at 11:00 +0800, Jason Wang wrote:
>> Remove one of the repeated 'and' in comment line 150.
> []
>> diff --git a/arch/alpha/kernel/irq_i8259.c b/arch/alpha/kernel/irq_i8259.c
> []
>> @@ -147,7 +147,7 @@ isa_no_iack_sc_device_interrupt(unsigned long vector)
>>  	 */
>>  	/* 
>>  	 *  The first read of gives you *all* interrupting lines.
>> -	 *  Therefore, read the mask register and and out those lines
>> +	 *  Therefore, read the mask register and out those lines

Looks to me like:                             and mask out those lines
> 
> Not really a repeated word but
> perhaps s/and and/then and/
> 
>>  	 *  not enabled.  Note that some documentation has 21 and a1 
>>  	 *  write only.  This is not true.
>>  	 */
> 
> 

-- 
~Randy
