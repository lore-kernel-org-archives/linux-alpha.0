From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2] asm-generic: Fix unistd_32.h generation format
Date: Wed, 12 Feb 2020 10:42:23 +0100
Message-ID: <d93646fa-c844-693c-07a7-7075d0fcf2c9@xilinx.com>
References: <dcdd615f77dacf8a98e18950b66fb5a675277f38.1581498987.git.michal.simek@xilinx.com>
 <CAMo8BfLYM-_SbqmMUCVjwqL7MpA2W7toTg_F6HTY4Sg5QxGzfw@mail.gmail.com>
 <CAMuHMdUZ_e9JsF0fuLxBwdoy7YVLarH6E98z5nKUZ2CccSkV-Q@mail.gmail.com>
 <6128aa3a-a99c-2ab0-82d1-d5c419e4f5b9@xilinx.com>
 <CAMuHMdX3O6aL_yGSfqrbdfPf-HHqqdkMwPHS=Y0WxMRTYOtJ4w@mail.gmail.com>
 <1d006656-bd48-0b8e-b893-cddaa5f8f8bc@xilinx.com>
 <CAMuHMdXaOD5kL+Cg0L=YeX_DqdVgUJXEA8LF-NiHbmkMuXKTaA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKUXspPdjAX7v9aJ53TWNH183wbUCNUcLzxYPre6KuA=;
 b=Vs7ZVFiplcPxx98nWzuAafX27TkAlo7P+8ZIapCvibgO4aVvMGPJVGn3Msi/HhiZLgzocgjjpq95EUfy11rYM+SrdmNw9b/605IW9Dzz9Gq9lH4qzVoM/R3Vwtftae8Kbm8FxCZEQQ8avr8TGwuK7k6lCi0aQ4mCmxaMdFiOG9o=
In-Reply-To: <CAMuHMdXaOD5kL+Cg0L=YeX_DqdVgUJXEA8LF-NiHbmkMuXKTaA@mail.gmail.com>
Content-Language: en-US
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <michal.simek@xilinx.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, git@xilinx.com, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Stefan Asserhall <stefan.asserhall@xilinx.com>, Chris Zankel <chris@zankel.net>, "David S. Miller" <davem@davemloft.net>, Fenghua Yu <fenghua.yu@intel.com>, Helge Deller <deller@gmx.de>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Matt Turner <mattst88@gmail.com>, Rich Felker <dalias@libc.org>, Richard Henderson <rth@twiddle.net>, Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, open list:IA64 (Itanium) PL

On 12. 02. 20 10:40, Geert Uytterhoeven wrote:
> Hi Michal,
> 
> On Wed, Feb 12, 2020 at 10:38 AM Michal Simek <michal.simek@xilinx.com> wrote:
>> On 12. 02. 20 10:32, Geert Uytterhoeven wrote:
>>> On Wed, Feb 12, 2020 at 10:27 AM Michal Simek <michal.simek@xilinx.com> wrote:
>>>> On 12. 02. 20 10:25, Geert Uytterhoeven wrote:
>>>>> On Wed, Feb 12, 2020 at 10:23 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>>>>>> On Wed, Feb 12, 2020 at 1:16 AM Michal Simek <michal.simek@xilinx.com> wrote:
>>>>>>>
>>>>>>> Generated files are also checked by sparse that's why add newline
>>>>>>> to remove sparse (C=1) warning.
>>>>>>>
>>>>>>> The issue was found on Microblaze and reported like this:
>>>>>>> ./arch/microblaze/include/generated/uapi/asm/unistd_32.h:438:45:
>>>>>>> warning: no newline at end of file
>>>>>>>
>>>>>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>>>>>> Reviewed-by: Stefan Asserhall <stefan.asserhall@xilinx.com>
>>>>>
>>>>>>> --- a/arch/m68k/kernel/syscalls/syscallhdr.sh
>>>>>>> +++ b/arch/m68k/kernel/syscalls/syscallhdr.sh
>>>>>>> @@ -33,4 +33,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
>>>>>>>         printf "#endif\n"
>>>>>>>         printf "\n"
>>>>>>>         printf "#endif /* %s */\n" "${fileguard}"
>>>>>>
>>>>>> Here there's already \n at the end, so no need for another one?
>>>>>
>>>>> Thanks! I completely missed that.
>>>>> So I did fix the original while applying ;-)
>>>>
>>>> I can drop m68k or align with with others. I would prefer to have the
>>>> same solution in all these scripts.
>>>
>>> Yeah, it makes sense to align as much as possible.
>>> IIRC, the original plan was to consolidate more later.
>>>
>>> Note that all other lines are terminated with a "\n" at the end.
>>> The separate 'printf "\n"' is an extra blank line, not the terminator for the
>>> previous line.
>>
>> Should we also get rid of 'printf "\n"' lines or just keep them as they
>> are today?
> 
> Usually there is a blank line above the include guard terminator, so IMHO
> it makes sense to have that in generated files, too.

I meant more not to get rid of \n just include them in current prints.
It means like this 'printf "\n#endif /* %s */\n" "${fileguard}"'

M
