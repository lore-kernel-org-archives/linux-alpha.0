From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] alpha: add support for TIF_NOTIFY_SIGNAL
Date: Sat, 12 Dec 2020 09:16:44 -0700
Message-ID: <0c2dabaa-4bc5-fda2-6317-a5c273d2caf5@kernel.dk>
References: <20201212153514.GA108207@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b0rAOZsxZdjcq1aaJb1C05KPrkqpKvcEQxgTLsgMxKU=;
        b=CrR07OntPIZTR7d4wnZ9J5UOuDZq6gLOR5OIJYSjeEuAp8KtWt3+7GsvQEeD1PLDN0
         kw5pg8sdwEcDBGENZKJbon36gZNQ/dH5oJEr1For6xRNmkF9rVDkTISTbjrxy40KkOcb
         PgjbhM2Pji+OZCFbF+DKvC+wxz+unHR68g+NYenZbtxiSGcCMing0QlnXgCCJWEoJGBz
         WyU1PI236NBc8ygH5YlefXYPdy/TNIxTaEyV086+DRKGdiW6PaDV9I0e16SWDpsX2HQm
         hlyy4lV+SE38CsrNSKtKvGpnOrRN/mU/tNWmnP7DXbUPLhni+SakkD/pagRCznZTfAvG
         Et0w==
In-Reply-To: <20201212153514.GA108207@roeck-us.net>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On 12/12/20 8:35 AM, Guenter Roeck wrote:
> On Thu, Oct 08, 2020 at 09:11:42AM -0600, Jens Axboe wrote:
>> Wire up TIF_NOTIFY_SIGNAL handling for alpha.
>>
>> Cc: linux-alpha@vger.kernel.org
>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
>> ---
> ...
>>  work_pending:
>> -	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, $2
>> +	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, | _TIF_NOTIFY_SIGNAL, $2
>                                                          ^^^^^
> 
> Does this compile anywhere ?

Fixed up, thanks.

-- 
Jens Axboe

