From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Y2038] [PATCH 2/2] alpha: osf_sys.c: use timespec64 where appropriate
Date: Wed, 8 Nov 2017 15:54:15 +0100
Message-ID: <CAK8P3a1b-LBhvYPFKj7bQ4TT5dcfGvRChNizO4cNmtz1tW86xw@mail.gmail.com>
References: <20171107141029.3160278-1-arnd@arndb.de> <20171107141029.3160278-2-arnd@arndb.de>
 <1510100559.2465.44.camel@codethink.co.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=3AM9zGMEArw1Pdfhfhrm3BWxaJ/qfOEV486ghR6lFC4=;
        b=tj8jYTb4ujgLkojC8FSCpmdIiTq6t1IkPCqLMIEjeBZjzaRRjBR0CszONSh0LGOIy4
         84MWYJ1Jfu5L1E5Vs8vjnnaNdp7iFuqEcmXsDSArAcQu7KJh0dx8ybmMZ7UaQIr+F67n
         q8/mgs45E18eHdDweNsTqESMC3B/XzfB+XuGwlbts9cSmoawEeXhzX/5gs6K5vpYWOhG
         0MihLtuW8RiWqtmKgO09UYxyoXy0YJ8Za+HKJ3SyGnJZgOyIX/ncnjapganP8lK9VoYA
         7DAVhpMzUvTNpXlDKyDStyFjPk6TeEb/S6luHzCQUA6EbRbBU3JGEzD56FU4pQW+MxU1
         1aVA==
In-Reply-To: <1510100559.2465.44.camel@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Hutchings <ben.hutchings@codethink.co.uk>
Cc: Richard Henderson <rth@twiddle.net>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Deepa Dinamani <deepa.kernel@gmail.com>

On Wed, Nov 8, 2017 at 1:22 AM, Ben Hutchings
<ben.hutchings@codethink.co.uk> wrote:
> On Tue, 2017-11-07 at 15:09 +0100, Arnd Bergmann wrote:
>> Some of the syscall helper functions (do_utimes, poll_select_set_timeout,
>> core_sys_select) have changed over the past year or two to use
>> 'timespec64' pointers rather than 'timespec'. This was fine on alpha,
>> since 64-bit architectures treat the two as the same type.
>>
>> However, I'd like to change that behavior and make 'timespec64' a proper
>> type of its own even on 64-bit architectures, and that will introduce
>> harmless type mismatch warnings here.
>>
>> Also, I'm trying to kill off the do_gettimeofday() helper in favor of
>> ktime_get() and related interfaces throughout the kernel.
> [...]
>> @@ -1004,9 +1013,10 @@ SYSCALL_DEFINE2(osf_gettimeofday, struct timeval32 __user *, tv,
>>               struct timezone __user *, tz)
>>  {
>>       if (tv) {
>> -             struct timeval ktv;
>> -             do_gettimeofday(&ktv);
>> -             if (put_tv32(tv, &ktv))
>> +             struct timespec64 kts;
>> +
>> +             ktime_get_ts64(&kts);
> [...]
>
> But this syscall is supposed to use the realtime clock, no?  It seems
> like the correct substitute here is getnstimeofday64() (as the kernel-
> doc comment for do_gettimeofday() *almost* says).

It should be ktime_get_real_ts64(), thanks for noticing my mistake.

ktime_get_real_ts64() is the same as getnstimeofday64(), but I'm
trying to use the ktime_get* naming where possible.

        Arnd
