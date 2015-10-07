From: Chris Metcalf <cmetcalf@ezchip.com>
Subject: Re: [PATCH v2 2/3] word-at-a-time.h: support zero_bytemask() on alpha
 and tile
Date: Wed, 7 Oct 2015 09:58:23 -0400
Message-ID: <561524FF.20807@ezchip.com>
References: <1444159429-4788-1-git-send-email-cmetcalf@ezchip.com>
 <1444159429-4788-3-git-send-email-cmetcalf@ezchip.com>
 <20151007055320.GA27737@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20151007055320.GA27737@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ingo Molnar <mingo@kernel.org>
Cc: Michael Cree <mcree@orcon.net.nz>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Alexey Dobriyan <adobriyan@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 10/07/2015 01:53 AM, Ingo Molnar wrote:
> * Chris Metcalf <cmetcalf@ezchip.com> wrote:
>
>> Both alpha and tile needed implementations of zero_bytemask.
>>
>> The alpha version is untested.
>>
>> Signed-off-by: Chris Metcalf <cmetcalf@ezchip.com>
>> ---
>>   arch/alpha/include/asm/word-at-a-time.h | 2 ++
>>   arch/tile/include/asm/word-at-a-time.h  | 8 +++++++-
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/alpha/include/asm/word-at-a-time.h b/arch/alpha/include/asm/word-at-a-time.h
>> index 6b340d0f1521..902e6ab00a06 100644
>> --- a/arch/alpha/include/asm/word-at-a-time.h
>> +++ b/arch/alpha/include/asm/word-at-a-time.h
>> @@ -52,4 +52,6 @@ static inline unsigned long find_zero(unsigned long bits)
>>   #endif
>>   }
>>   
>> +#define zero_bytemask(mask) ((2ul << (find_zero(mask) * 8)) - 1)
> Small nit: please use a proper C inline function instead of CPP, as for example
> the PowerPC zero_bytemask() function is.

Indeed, I normally would do that.  But, I was trying to match the
existing style; there are nine definitions that are specified as macros
(including the one in asm-generic), and only one (powerpc 64-bit LE)
that was specified as an inline.

I did put together a v3 of the patch series that included all your
excellent suggestions, including the Reported-by, Tested-by, and
Reviewed-by tags, but then found out v2 was already pulled into
Linus's tree, so I guess that ship has sailed; oh well.

My inclination would be not to churn the tree with a patch to
convert those new zero_bytemask() macros to inlines, but I'm happy
to do so if you think it would be better.

-- 
Chris Metcalf, EZChip Semiconductor
http://www.ezchip.com

