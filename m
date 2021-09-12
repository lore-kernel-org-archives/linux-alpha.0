From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/4] net: i825xx: Use absolute_pointer for memcpy on fixed
 memory location
Date: Sun, 12 Sep 2021 09:16:07 -0700
Message-ID: <0d118e7b-e3cf-67df-00dc-f85b40ada682@roeck-us.net>
References: <20210912160149.2227137-1-linux@roeck-us.net>
 <20210912160149.2227137-3-linux@roeck-us.net>
 <20210912181148.60f147c8@wim.jer>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=962m9V5kVB1K2ya/iSo41D4jBqvuxZ4BddEpQ3+kojg=;
        b=qM8u+hcIWzR8wMKQYhJCILmC9ZSlNy0NiWb4OY9hgIPBCZHgvM5qkKfgYvGPan/dWy
         i5x/cft2ji93PA3JkhyD3LSkkMTIFc1uT4DGD0JuOsR6E7i+5w/QvbVTzSvWiBYtyvcb
         ZwYQUAi0m60L2obsafgIs5DFtPB2dd11dxVqbdEuSt/wuCLZHR0w3rdAEg1ctjNwuBpV
         FygbmW10nIEchgjXTB7XhMDbK3jxBDIHD8N01nOt0gxXTRXQC0Bkc0ayrYtjpe7vo5Lt
         +tN2mV7Mu8coJuhIwpThaEPRcsMbFlXaxkMDf6YDj+oodAYc/UODDI+YBc3E3yvWM4cI
         srpQ==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <20210912181148.60f147c8@wim.jer>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeroen Roovers <jer@xs4all.nl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-sparse@vger.kernel.org

On 9/12/21 9:11 AM, Jeroen Roovers wrote:
> On Sun, 12 Sep 2021 09:01:47 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> gcc 11.x reports the following compiler warning/error.
>>
>> drivers/net/ethernet/i825xx/82596.c: In function 'i82596_probe':
>>      ./arch/m68k/include/asm/string.h:72:25: error:
>>              '__builtin_memcpy' reading 6 bytes from a region of size 0
>>                      [-Werror=stringop-overread]
>>
>> Use absolute_address() to work around the problem.
> 
> => absolute_pointer()
> 

Oopsie. Thanks!

Guenter

>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   drivers/net/ethernet/i825xx/82596.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/i825xx/82596.c
>> b/drivers/net/ethernet/i825xx/82596.c index
>> b8a40146b895..b482f6f633bd 100644 ---
>> a/drivers/net/ethernet/i825xx/82596.c +++
>> b/drivers/net/ethernet/i825xx/82596.c @@ -1144,7 +1144,7 @@ static
>> struct net_device * __init i82596_probe(void) err = -ENODEV;
>>   			goto out;
>>   		}
>> -		memcpy(eth_addr, (void *) 0xfffc1f2c,
>> ETH_ALEN);	/* YUCK! Get addr from NOVRAM */
>> +		memcpy(eth_addr, absolute_pointer(0xfffc1f2c),
>> ETH_ALEN); /* YUCK! Get addr from NOVRAM */ dev->base_addr =
>> MVME_I596_BASE; dev->irq = (unsigned) MVME16x_IRQ_I596;
>>   		goto found;
> 
> 
> Regards,
>        jer
> 

