From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH] arch/alpha: fix typo in a comment in
 arch/alpha/boot/bootpz.c
Date: Wed, 20 Jan 2021 17:37:07 +0100
Message-ID: <0df77d48-8541-32c9-d39d-3e59f89f1f86@physik.fu-berlin.de>
References: <20210120133410.2182-1-tangchunyou@163.com>
 <5e4ed85d-140c-3d85-e4f4-97b27fa37885@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <5e4ed85d-140c-3d85-e4f4-97b27fa37885@infradead.org>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Randy Dunlap <rdunlap@infradead.org>, ChunyouTang <tangchunyou@163.com>, ink@jurassic.park.msu.ru, mattst88@gmail.com, akpm@linux-foundation.org, rppt@kernel.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, zhangwen@yulong.com, tangchunyou@yulong.com

On 1/20/21 5:20 PM, Randy Dunlap wrote:
> On 1/20/21 5:34 AM, ChunyouTang wrote:
>> From: tangchunyou <tangchunyou@yulong.com>
>>
>> "kerne" -> "kernel"
>>
>> Signed-off-by: tangchunyou <tangchunyou@yulong.com>
>> ---
>>  arch/alpha/boot/bootpz.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
>> index 43af718..61b61be 100644
>> --- a/arch/alpha/boot/bootpz.c
>> +++ b/arch/alpha/boot/bootpz.c
>> @@ -200,7 +200,7 @@ extern int decompress_kernel(void* destination, void *source,
>>  	START_ADDR	KSEG address of the entry point of kernel code.
>>  
>>  	ZERO_PGE	KSEG address of page full of zeroes, but 
>> -			upon entry to kerne cvan be expected
>> +			upon entry to kernel cvan be expected
> 
> s/cvan/can/ also

Right. Reading the whole paragraph helps. It probably should be:

ZERO_PGE	KSEG address of page full of zeroes, but
		upon entry to kernel, it can be expected
		to hold the parameter list and possible
		INTRD information.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

