From: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH] Convert alpha to use arch_gettimeoffset()
Date: Tue, 16 Jun 2009 10:45:16 -0700
Message-ID: <4A37DA2C.8020106@gmail.com>
References: <1244758210.7192.5.camel@localhost.localdomain>	 <4A31FDBE.3030506@gmail.com> <1244832112.7231.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=SOqQlT6MQ1Q5wAvf6CgSEXhg1+1Ji2StxOcFNJ4LNm0=;
        b=f4o5yXRa2keD69Ms1qaclUp7qQU1qBUlH4MtejeaiPMfWi+nC3/DvGO4WLepaDfKL8
         OTHjHUg85F9RHRgqhhl6ijY8qbOGdc1ddRs+dVSWXtvbrSOO6kIF4yavE1J9KeOK9aLQ
         WkFBIcO4HOE+uoJbdIE4FZD1si6elW//1Yclo=
In-Reply-To: <1244832112.7231.3.camel@localhost.localdomain>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: john stultz <johnstul@us.ibm.com>
Cc: ink@jurassic.park.msu.ru, lkml <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

john stultz wrote:
> On Fri, 2009-06-12 at 00:03 -0700, Richard Henderson wrote:
>   
>> john stultz wrote:
>>     
>>> I suspect the alpha arch could even be further improved to provide and
>>> rpcc() based clocksource, but not having the hardware, I don't feel
>>> comfortable attempting the more complicated conversion (but I'd be glad
>>> to help if anyone else is interested).
>>>       
>> Unfortunately this isn't possible.  The rpcc value is only 32-bits wide,
>> and so rolls over in approx 3 to 4 seconds.  Thus all the contortions to
>> try and use the truncated value for sub 1 second adjustments.
>>     
>
> That's actually ok. The ACPI PM clocksource on x86 is only 24 bits wide
> and wraps every 5 seconds. The generic timekeeping code handles the
> wrapping and accumulation for you.
>   
Interesting.
> Might you create a patch that does this conversion and apply it on top
> of mine? 
Unfortunately I don't have working hardware anymore.  Perhaps Ivan will 
be able to help here.


r~
