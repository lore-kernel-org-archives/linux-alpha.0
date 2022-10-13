From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] alpha: Use generic <asm-generic/io.h> #forregzbot
Date: Thu, 13 Oct 2022 14:36:47 +0200
Message-ID: <3c7c22f1-2e9d-8bdc-33b7-eb8dcb8a3593@leemhuis.info>
References: <20220818092059.103884-1-linus.walleij@linaro.org>
 <20221002224521.GA968453@roeck-us.net>
 <fd905ca5-fe0d-4cfb-a0d0-aea8af539cc7@app.fastmail.com>
 <57200020-c460-74ec-c786-9a2c16f4870e@roeck-us.net>
 <2e110666-7519-4693-8a89-240cbb118c7e@app.fastmail.com>
 <20221012140519.GA2405113@roeck-us.net>
 <e99d33ff-4bfe-4727-a5ca-f4987b871ccd@app.fastmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
Content-Language: en-US, de-DE
In-Reply-To: <e99d33ff-4bfe-4727-a5ca-f4987b871ccd@app.fastmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: regressions@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, kernel test robot <lkp@intel.com>, Linux-Arch <linux-arch@vger.kernel.org>

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 12.10.22 17:32, Arnd Bergmann wrote:
> On Wed, Oct 12, 2022, at 4:05 PM, Guenter Roeck wrote:
>> On Tue, Oct 04, 2022 at 10:28:24PM +0200, Arnd Bergmann wrote:
>> Unfortunately that did not completely fix the problem, or maybe the fix got
>> lost. In mainline, when building alpha:allnoconfig:
>>
>> arch/alpha/kernel/core_marvel.c:807:1: error: expected '=', ',', ';', 
>> 'asm' or '__attribute__' before 'marvel_ioread8'
>>   807 | marvel_ioread8(const void __iomem *xaddr)
>>
>> The code is:
>>
>> unsigned u8
>> marvel_ioread8(const void __iomem *xaddr)
>>
>> The compiler doesn't like "unsigned u8".
> 
> Right, I fixed up a different bug and introduced this wrong type.
> I didn't catch my mistake until after the pull request was
> merged, but fixed it in
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/commit/?id=2e21c1575208
> 
> which should be in linux-next. I was giving it a little more
> time to be see if there are any other regressions I caused.

In that case:

#regzbot fixed-by: 2e21c157520

Ciao, Thorsten
