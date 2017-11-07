From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] alpha: osf_sys.c: fix put_tv32 regression
Date: Tue, 7 Nov 2017 17:03:14 +0100
Message-ID: <CAK8P3a1gP=3N1z3=2sZpDyz6LHJohNhPAet+Xm-Q26jKY9KRjw@mail.gmail.com>
References: <20171107141029.3160278-1-arnd@arndb.de> <20171107155222.GV21978@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=a9r31ih50DFPr8gQeO8U82HovBgsq9brSZZB3nA6Rsk=;
        b=TU+VQ4lb3TH7WNCOKG/91i0lfDcCnqmMRi3nRqwOyWh8I7ewvNljt4C9Cx+uHsm9f3
         QVoe0saM2FEJmfZIwIj4hFo8Mbi6uhhYq9rl1i0ZWBC8O+OZL1FpQqDD+CkDXZoF2m3t
         uDxwGksdG/wFe4qIRZRtGoNiTj0KzulvB5I/ubZG54DqIrcB8huFa+4zjiRr5fuYcUEt
         /yK+lOMtfl4kofpKseYwRakeC4jFHJ4iy1OexUHqhNChkaN8IHjbaYpm5iNre+lSFor4
         xcG26P3855bzttnVCrDnOglt+NxxUtw7iYoTt5BuRz30NBv7HGr2esz3FimAaqjzssuo
         ytsQ==
In-Reply-To: <20171107155222.GV21978@ZenIV.linux.org.uk>
Sender: stable-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, y2038 Mailman List <y2038@lists.linaro.org>, Deepa Dinamani <deepa.kernel@gmail.com>, "# 3.4.x" <stable@vger.kernel.org>, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Nov 7, 2017 at 4:52 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Tue, Nov 07, 2017 at 03:09:24PM +0100, Arnd Bergmann wrote:
>> There was a typo in the new version of put_tv32() that caused
>> uninitialized stack data to be written back to user space, rather
>> than writing the actual timeval for the emulation of
>> gettimeofday(), wait4(), usleep_thread() and old_adjtimex().
>>
>> This fixes it to write the correct data again.
>
> *blink*
>
> the bug is real, all right, and the fix is correct one, but where
> do you get an infoleak?  What it is is a user-triggerable oops -
> just pass it an unmapped address.  For anything mapped r/w it's
> simply a no-op - userland data is unchanged.
>
> IOW, the fix is correct, but commit message isn't - it's
>
> "user-triggerable oops and in all cases failed to modify userland timeval32"
>
> not
>
> "uninitialized stack data to be written back to user space"

Ah right, sorry about that. I misread the statement as setting
the temporary structure to itself rather than setting it to the contents
of the user structure.

Do you want to update the description as suggested and forward it,
or should I send a fixed version? I'm about to leave the office for
today, so I'd have to do it tomorrow then.

       Arnd
