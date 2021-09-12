From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/4] parisc: Use absolute_pointer for memcmp on fixed
 memory location
Date: Sun, 12 Sep 2021 13:28:32 -0700
Message-ID: <2702f518-da2f-5bca-11d3-35f5cd4316e6@roeck-us.net>
References: <20210912160149.2227137-1-linux@roeck-us.net>
 <20210912160149.2227137-4-linux@roeck-us.net>
 <CAHk-=wi1TBvyk7SWX+5LLYN8ZnTJMut1keQbOrKCG=nb08hdiQ@mail.gmail.com>
 <YT5b2HgrvL12Nrhx@ls3530>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AXSxIvFJqTwiufjYo/D6s+CkMzPMpGZ/GlVxsFHvRNA=;
        b=Q2WdxlOeY/qzPh2YwGGttsdCkzkxMQWwy7h0b8hpSJHAHJdc7mJzXYZEknKviVTv2A
         D3co9DESFaNB1suY1HUJ8JIZUWr2nYh2P6sRRjejKeWqLuoC5qsKANE1i8LsJIZDJcmq
         HvMtSDNIfEr64W0EWW3H4yxq4VzP7eh2JT4tV+akN5Jaxcmb+tVq+6X92PJCM8c6G8vi
         XMv7rKFO8DcfArnvi3JOSOjA+CBiS0ChiXvX6NN9hp9TmsA/CLWfsIuC0LFuKKN/DXII
         lT5pJ/otTNTX6SZhY3rkfw7LOwyu/BijLRvQ+PTsLxTFG5KtazRVUQMtrNcSo5zVauMT
         rzbg==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <YT5b2HgrvL12Nrhx@ls3530>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Helge Deller <deller@gmx.de>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On 9/12/21 12:58 PM, Helge Deller wrote:
> * Linus Torvalds <torvalds@linux-foundation.org>:
>> On Sun, Sep 12, 2021 at 9:02 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> -       running_on_qemu = (memcmp(&PAGE0->pad0, "SeaBIOS", 8) == 0);
>>> +       running_on_qemu = (memcmp(absolute_pointer(&PAGE0->pad0), "SeaBIOS", 8) == 0);
>>
>> This seems entirely the wrong thing to do, and makes no sense. That
>> "&PAGE0->pad0" is a perfectly valid pointer, and that's not where the
>> problem is.
>>
>> The problem is "PAGE0" itself:
>>
>>      #define PAGE0   ((struct zeropage *)__PAGE_OFFSET)
>>
>> which takes that absolute offset and creates a pointer out of it.
>>
>> IOW, _that_ is what should have the "absolute_pointer()" thing, and in
>> that context the name of that macro and its use actually makes sense.
>>
>> No?
>>
>> An alternative - and possibly cleaner - approach that doesn't need
>> absolute_pointer() at all might be to just do
>>
>>          extern struct zeropage PAGE0;
>>
>> and then make that PAGE0 be defined to __PAGE_OFFSET in the parisc
>> vmlinux.lds.S file.
>>
>> Then doing things like
>>
>>          running_on_qemu = !memcmp(&PAGE0.pad0, "SeaBIOS", 8);
>>
>> would JustWork(tm).
> 
> Yes, this second approach seems to work nicely, although the patch
> then gets slightly bigger.
> Below is a tested patch.
> I'll check it some further and apply it to the parisc tree then.
> 

There are several PAGE0-> references left in the code after applying your patch.

$ git grep "PAGE0->"
arch/parisc/kernel/firmware.c:  if (!PAGE0->mem_kbd.iodc_io)
arch/parisc/kernel/firmware.c:  real32_call(PAGE0->mem_kbd.iodc_io,
arch/parisc/kernel/firmware.c:              (unsigned long)PAGE0->mem_kbd.hpa, ENTRY_IO_CIN,
arch/parisc/kernel/firmware.c:              PAGE0->mem_kbd.spa, __pa(PAGE0->mem_kbd.dp.layers),
arch/parisc/kernel/smp.c:       WARN_ON(((unsigned long)(PAGE0->mem_pdc_hi) << 32
arch/parisc/kernel/smp.c:                       | PAGE0->mem_pdc) != pdce_proc);

After fixing those, I can build a parisc image and boot it in qemu (32 bit).

Guenter
