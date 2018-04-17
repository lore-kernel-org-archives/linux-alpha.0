From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH] alpha: io: reorder barriers to guarantee writeX() and
 iowriteX() ordering #2
Date: Tue, 17 Apr 2018 14:43:01 -0400
Message-ID: <b9d845ad-62af-d300-53d9-2b62f5da6c44@codeaurora.org>
References: <1523917017-28084-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1523990588;
        bh=ah1+h6NtBWCLrwb1IF2a/fctNYQy/L9kRBLpL0y0XVQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XcoytxLzB9JnPcE/yW7RR4ymjPf4CoUsd+N01PX1n2PdTZwhenty0hns9vO/Qb8uB
         OZYiarJJYcZCdPogYgAjj5GPObJXC5z0L75mOHziV/pd3zi8ohyLsmCP5vdmDMlnfi
         +m+2YgSOofY4M2GsOFLpjXpahFNSCWZE/JOhizNg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1523990585;
        bh=ah1+h6NtBWCLrwb1IF2a/fctNYQy/L9kRBLpL0y0XVQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DuDEL/++WKQ3sIlhv0NWr2vDqLwOwSd64HJTmlqMXqOaAQUrhCWV0c+dxm+OjRhZn
         CNHrVrcXptfmaFm2fza0iHoyJPxEUPJvEgChF6kf6m/B7pfjB0pNHfc0kOUnfuKIp/
         DK+jhQVMxmejoERqOb4AP382bT3XOLcd6E/sberM=
In-Reply-To: <1523917017-28084-1-git-send-email-okaya@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, arnd@arndb.de, timur@codeaurora.org, sulrich@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Kate Stewart <kstewart@linuxfoundation.org>, linux-kernel@vger.kernel.org

On 4/16/2018 6:16 PM, Sinan Kaya wrote:
> memory-barriers.txt has been updated with the following requirement.
> 
> "When using writel(), a prior wmb() is not needed to guarantee that the
> cache coherent memory writes have completed before writing to the MMIO
> region."
> 
> Current writeX() and iowriteX() implementations on alpha are not
> satisfying this requirement as the barrier is after the register write.
> 
> Move mb() in writeX() and iowriteX() functions to guarantee that HW
> observes memory changes before performing register operations.
> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/alpha/kernel/io.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Sorry for catching this late but this also needs to go to 4.17 after
review.

I missed the writel() implementation on arch/alpha/kernel/io.c file
on my first patch.

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
