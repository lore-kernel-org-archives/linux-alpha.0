From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH] arch/alpha: fix typo in a comment in
 arch/alpha/boot/bootpz.c
Date: Thu, 21 Jan 2021 09:00:14 +0100
Message-ID: <42a71690-28a9-6bf8-e413-2fd1e03f7f7c@physik.fu-berlin.de>
References: <20210120133410.2182-1-tangchunyou@163.com>
 <5e4ed85d-140c-3d85-e4f4-97b27fa37885@infradead.org>
 <0df77d48-8541-32c9-d39d-3e59f89f1f86@physik.fu-berlin.de>
 <20210121102042.00005504@163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210121102042.00005504@163.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chunyou Tang <tangchunyou@163.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, ink@jurassic.park.msu.ru, mattst88@gmail.com, akpm@linux-foundation.org, rppt@kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, zhangwen@yulong.com, tangchunyou@yulong.com

Hi Chunyou!

On 1/21/21 3:20 AM, Chunyou Tang wrote:
>> Right. Reading the whole paragraph helps. It probably should be:
>>
>> ZERO_PGE	KSEG address of page full of zeroes, but
>> 		upon entry to kernel, it can be expected
>> 		to hold the parameter list and possible
>> 		INTRD information.
>>
>> Adrian
>>
> 
> ok, I change it as :
> ZERO_PGE	KSEG address of page full of zeroes, but
> 		upon entry to kernel, it can be expected
> 		to hold the parameter list and possible
> 		INTRD information.
> then I commit it.

Great, thank you.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

