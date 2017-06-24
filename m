From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH] alpha: provide ioread64 and iowrite64 implementations
Date: Sat, 24 Jun 2017 08:25:30 -0700
Message-ID: <787b4be1-ce9e-6838-27b6-0cd9f8d7805f@twiddle.net>
References: <20170624115707.30095-1-horia.geanta@nxp.com>
 <20170624151308.6348-1-rth@twiddle.net>
 <dfc70cc1-09a9-f6d0-83a8-c8ca5d7a232b@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T0dZ6zW9/SRQCk/rCIn4Vf68iB95G8lPVyGg7r94+I0=;
        b=ZL5Oe+WdD/WjfJ0qWFMJJVKAfetVlpAHfWRxu8Hqn6AMwgOsBfSH+S/MhXJRl669r5
         qrmTfA6MsXa4DkL2OpvLNEeTHEvAYzlc9ZKelGaffcoWwkNbIWmSbvwQl4XKTXR+lvU2
         YDMdR37J9gmZtkFqnIX79REblmjYu2TLn08BP3UkY4flLE8TWhk23nDSjuYdc9In2HgQ
         YzVT12Yf7bC31973q9VsdSmikNOGykW6edjXERvigppDOH/6ofzGtaGh6QPnwxQGLqG9
         2bBiYnvrqunt/KTIy/ulY8BtWiAf9PoZMiJRI5TUp3HcwIAD1UO1ezl3m/OiG2O0a0Z8
         yXeQ==
In-Reply-To: <dfc70cc1-09a9-f6d0-83a8-c8ca5d7a232b@deltatee.com>
Content-Language: en-US
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Logan Gunthorpe <logang@deltatee.com>, linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On 06/24/2017 08:19 AM, Logan Gunthorpe wrote:
> Hey,
> 
> On 24/06/17 09:13 AM, Richard Henderson wrote:
>> All Alpha hosts except for Jensen provide 64-bit I/O operations.
>>
>> Jensen is EISA only, so there ought not be any devices that even
>> attempt such operations.  But just in case, use 2 32-bit operations.
> 
> Thanks for this, Richard.
> 
> However, I was recently enlightened by the existence of the
> linux/io-64-nonatomic* headers. This is where the 2 32-bit operation
> functions belong. So you should probably remove them from this patch and
> let drivers that need them just include those headers.

This has nothing to do with drivers.

This is all about providing 64-bit operations for the 99.999% of alphas that do 
have them.


r~
