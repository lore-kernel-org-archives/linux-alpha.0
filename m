From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 06/15] alpha: don't use module_init for non-modular core
 code
Date: Fri, 29 May 2015 11:15:38 -0400
Message-ID: <5568829A.5080109@windriver.com>
References: <1432860493-23831-1-git-send-email-paul.gortmaker@windriver.com> <1432860493-23831-7-git-send-email-paul.gortmaker@windriver.com> <CAEdQ38GBZkOuDb=Qu2ddXEV9B+q0F6f=fL3pTm13-r5WA3LHsA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <CAEdQ38GBZkOuDb=Qu2ddXEV9B+q0F6f=fL3pTm13-r5WA3LHsA@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matt Turner <mattst88@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>

On 2015-05-29 01:51 AM, Matt Turner wrote:
> On Thu, May 28, 2015 at 5:48 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> The srm console is always built in.  It will never be modular,
>> so using module_init as an alias for __initcall is rather
>> misleading.
>>
>> Fix this up now, so that we can relocate module_init from
>> init.h into module.h in the future.  If we don't do this, we'd
>> have to add module.h to obviously non-modular code, and that
>> would be a worse thing.
>>
>> Direct use of __initcall is discouraged, vs prioritized ones.
>> Use of device_initcall is consistent with what __initcall
>> maps onto, and hence does not change the init order, making the
>> impact of this change zero.   Should someone with real hardware
>> for boot testing want to change it later to arch_initcall or
>> console_initcall, they can do that at a later date.
>>
>> Cc: Richard Henderson <rth@twiddle.net>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
>> Cc: Matt Turner <mattst88@gmail.com>
>> Cc: linux-alpha@vger.kernel.org
>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>> ---
>
> I included this in my pull request to Linus that went upstream
> yesterday. Thanks!

OK, thanks - I'll drop it from here if/when I rebase onto the
4.1-rc6 pending on Sunday.  If I drop it now I'll risk introducing
a bisect failure for alpha, since my current baseline of 4.1-rc5
doesn't have this now-upstream change from the old original series.

Paul.
--

>

