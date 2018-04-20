From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH] alpha: io: reorder barriers to guarantee writeX() and
 iowriteX() ordering #2
Date: Fri, 20 Apr 2018 12:20:11 -0400
Message-ID: <2fd54f7c-ff73-5935-a253-c924f4373cc6@codeaurora.org>
References: <1523917017-28084-1-git-send-email-okaya@codeaurora.org>
 <b9d845ad-62af-d300-53d9-2b62f5da6c44@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1524241230;
        bh=nWY4YCdP3dN+k6mxAQqY0vSarayH/fDIEIjwv26RPMg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=W8GuY07mn7TEIdgEIhTWrlfCQpNeM15GU9brnOG2BV/EiyODb8uxcImTOk06R/Zdx
         q/HC9LbVcF8NBhUsqQt7l6WZQcwR6nw7NlzvHZi8uvMCbZdVteEB9WgkoHuvX9BPy7
         X2WYz5NK3nG0pjSZBfslPwyPw2KYp/9DDPILFrRE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1524241223;
        bh=nWY4YCdP3dN+k6mxAQqY0vSarayH/fDIEIjwv26RPMg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=l4DV6guHx+f0kxQn5kZ/qcuVCuZFqd29KJ4g1DSE0fXfaJSz4ecJDjDkuMaMSNF0y
         UnHuKd3xtSjWcYE9dDXjSqGHc/aod69/GWdVf2isXF1vS6GO4faoIb/sb74sPGgMCC
         uzPnihH+fFrEjv2aVoXfqEeghP/QDa9HGG4k9Ic4=
In-Reply-To: <b9d845ad-62af-d300-53d9-2b62f5da6c44@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, arnd@arndb.de, timur@codeaurora.org, sulrich@codeaurora.org, Matt Turner <mattst88@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Kate Stewart <kstewart@linuxfoundation.org>, linux-kernel@vger.kernel.org

Hi Matt,

On 4/17/2018 2:43 PM, Sinan Kaya wrote:
> On 4/16/2018 6:16 PM, Sinan Kaya wrote:
>> memory-barriers.txt has been updated with the following requirement.
>>
>> "When using writel(), a prior wmb() is not needed to guarantee that the
>> cache coherent memory writes have completed before writing to the MMIO
>> region."
>>
>> Current writeX() and iowriteX() implementations on alpha are not
>> satisfying this requirement as the barrier is after the register write.
>>
>> Move mb() in writeX() and iowriteX() functions to guarantee that HW
>> observes memory changes before performing register operations.
>>
>> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
>> Reported-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  arch/alpha/kernel/io.c | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> Sorry for catching this late but this also needs to go to 4.17 after
> review.
> 
> I missed the writel() implementation on arch/alpha/kernel/io.c file
> on my first patch.
> 

Can you also queue this for 4.17?

There are already drivers checked into 4.17 that dropped the unnecessary
barriers. 

I really hate to see Alpha broken because of this.

Sinan

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
