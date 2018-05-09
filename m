From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: io: reorder barriers to guarantee writeX() and
 iowriteX() ordering #2
Date: Tue, 8 May 2018 19:57:53 -0700
Message-ID: <CAEdQ38GY9ZtNqOt1ZSetwZjyKAokY6-qEVy1t+t=_FEqx+-+zQ@mail.gmail.com>
References: <1523917017-28084-1-git-send-email-okaya@codeaurora.org>
 <b9d845ad-62af-d300-53d9-2b62f5da6c44@codeaurora.org> <2fd54f7c-ff73-5935-a253-c924f4373cc6@codeaurora.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=3V6078sTNyE6vRCKAWqQM8IE+8J6mVjwWpraQzprASc=;
        b=etS+ZdS9mRfIM3vCbmsN3IuyZH8hfsxI1Ah5CGGRj7623rAY5zUoVwYmSSXn/gOyA9
         KvXo0sc8JVcWnO/AUPk244LSYE6upzd4tuIvli7iac7o8ud0LpRSZinr5TngCOIC6F3Q
         wYA7nnYTYls5C0v7KxLtrFTsf+G7B02yC6RlSOHHmi4q95EaQIJPVbNmJU4K58yOZ4xp
         zdffSvoVQCQ0gl7fkhhofSox4FJ2QYA4Hx/99N3o1dLjxJqvFLysSeKmF7jfm59ZLnDc
         ugCscjkzCz0yHHrrdsvwII2g8gSaXzKju3IOOh68phGUlMaX0jf9eA/GcJKvWJQzZaR2
         IdEg==
In-Reply-To: <2fd54f7c-ff73-5935-a253-c924f4373cc6@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sinan Kaya <okaya@codeaurora.org>
Cc: linux-alpha <linux-alpha@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Timur Tabi <timur@codeaurora.org>, sulrich@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Kate Stewart <kstewart@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Apr 20, 2018 at 9:20 AM, Sinan Kaya <okaya@codeaurora.org> wrote:
> Hi Matt,
>
> On 4/17/2018 2:43 PM, Sinan Kaya wrote:
>> On 4/16/2018 6:16 PM, Sinan Kaya wrote:
>>> memory-barriers.txt has been updated with the following requirement.
>>>
>>> "When using writel(), a prior wmb() is not needed to guarantee that the
>>> cache coherent memory writes have completed before writing to the MMIO
>>> region."
>>>
>>> Current writeX() and iowriteX() implementations on alpha are not
>>> satisfying this requirement as the barrier is after the register write.
>>>
>>> Move mb() in writeX() and iowriteX() functions to guarantee that HW
>>> observes memory changes before performing register operations.
>>>
>>> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
>>> Reported-by: Arnd Bergmann <arnd@arndb.de>
>>> ---
>>>  arch/alpha/kernel/io.c | 14 +++++++-------
>>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> Sorry for catching this late but this also needs to go to 4.17 after
>> review.
>>
>> I missed the writel() implementation on arch/alpha/kernel/io.c file
>> on my first patch.
>>
>
> Can you also queue this for 4.17?
>
> There are already drivers checked into 4.17 that dropped the unnecessary
> barriers.
>
> I really hate to see Alpha broken because of this.

Yes, I will pick it up for 4.17.

Thanks for the patch.
