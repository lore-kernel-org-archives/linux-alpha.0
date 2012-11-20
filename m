From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] alpha: Remove duplicate inclusion of asm/xchg.h
Date: Tue, 20 Nov 2012 08:54:59 +0530
Message-ID: <CAK9yfHw2HQ0xTY1QXvEPwa7RqHJnnXi6E4HQzsHV-AKv=conbg@mail.gmail.com>
References: <1353323499-8638-1-git-send-email-sachin.kamat@linaro.org>
	<20121119183015.GA2325@omega>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20121119183015.GA2325@omega>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, Sachin Kamat <sachin.kamat@linaro.org>, linux-alpha@vger.kernel.org, paul.gortmaker@windriver.com, rth@twiddle.net, mattst88@gmail.com, patches@linaro.org

On 20 November 2012 00:00, Michael Cree <mcree@orcon.net.nz> wrote:
> On Mon, Nov 19, 2012 at 04:41:39PM +0530, Sachin Kamat wrote:
>> asm/xchg.h was included twice.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  arch/alpha/include/asm/cmpxchg.h |    1 -
>>  1 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
>> index 429e8cd..8df1674 100644
>> --- a/arch/alpha/include/asm/cmpxchg.h
>> +++ b/arch/alpha/include/asm/cmpxchg.h
>> @@ -40,7 +40,6 @@
>>  #undef ____cmpxchg
>>  #define ____xchg(type, args...)              __xchg ##type(args)
>>  #define ____cmpxchg(type, args...)   __cmpxchg ##type(args)
>> -#include <asm/xchg.h>
>
> asm/xchg.h is intended to be included twice.  Your patch will break
> compilation.

I did not realise it. I thought it was an unconditional include. Sorry
for the noise.

>
> Cheers
> Michael.
>



-- 
With warm regards,
Sachin
