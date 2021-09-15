From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/4] compiler.h: Introduce absolute_pointer macro
Date: Wed, 15 Sep 2021 07:03:26 -0700
Message-ID: <ab67dccf-cf29-523d-3cf7-7554c493dcd1@roeck-us.net>
References: <20210915035227.630204-1-linux@roeck-us.net>
 <20210915035227.630204-2-linux@roeck-us.net>
 <CAMuHMdXZcrjGAE5OOipKsYpEgk9AZ_hrWKh+v81FMBtQTBv2LA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dXV0TdJQZj6j+f/Hi7EIzy0MEGNbxXGsvCh8JJLlODg=;
        b=WPi3IOT8Z+un52mSPLE4sfqcvjdnW6YB61L3883DmVLJCseKT0/X5+UxUhOCmGoe6Z
         HIGh4/nwJMlyK+3dCdARsx7O83eqW0mxZ8VZ0aedkBHAaEN7l82Gy6kEnotJu0yF+MU+
         5a+7S37ulW2eIr6nSMyrGUZyXeMv3h4t8ZlzhCuIPCpxyX7J/TepZavW275hbZyhW2Gk
         YOa17FQn9TO4Gk7XgljwpYzkzDT+C2SZhOQvgqFsx4nDUuzNklzbH8Hgi4XLuqrfB5c3
         eMXBKePg1BOAfA5WW84beOgutATln1NmsNbVFEakI6+C4NMzrKEuxWlWU4otT5aApJjU
         fABw==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <CAMuHMdXZcrjGAE5OOipKsYpEgk9AZ_hrWKh+v81FMBtQTBv2LA@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>, linux-sparse@vger.kernel.org

On 9/15/21 12:13 AM, Geert Uytterhoeven wrote:
> Hi G=C3=BCnter,
>=20
> On Wed, Sep 15, 2021 at 5:52 AM Guenter Roeck <linux@roeck-us.net> wrote:
>> absolute_pointer() disassociates a pointer from its originating symbol
>> type and context. Use it to prevent compiler warnings/errors such as
>>
>> drivers/net/ethernet/i825xx/82596.c: In function 'i82596_probe':
>> ./arch/m68k/include/asm/string.h:72:25: error:
>>          '__builtin_memcpy' reading 6 bytes from a region of size 0
>>                  [-Werror=3Dstringop-overread]
>>
>> Such warnings may be reported by gcc 11.x for string and memory operatio=
ns
>> on fixed addresses.
>>
>> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v2: No change
>>
>>   include/linux/compiler.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
>> index b67261a1e3e9..3d5af56337bd 100644
>> --- a/include/linux/compiler.h
>> +++ b/include/linux/compiler.h
>> @@ -188,6 +188,8 @@ void ftrace_likely_update(struct ftrace_likely_data =
*f, int val,
>>       (typeof(ptr)) (__ptr + (off)); })
>>   #endif
>>
>> +#define absolute_pointer(val)  RELOC_HIDE((void *)(val), 0)
>=20
> I guess we're not worried about "val" being evaluated multiple
> times inside RELOC_HIDE(), as this is mainly intended for constants?
>=20

No, we are not. It is quite similar to RELOC_HIDE() in that regard.

Guenter
