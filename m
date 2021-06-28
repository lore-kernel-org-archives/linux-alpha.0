From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/9] Refactoring exit
Date: Tue, 29 Jun 2021 05:14:16 +1200
Message-ID: <7ad6c3a9-b983-46a5-fc95-f961b636d3fe@gmail.com>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133>
 <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
 <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133> <875yy3850g.fsf_-_@disp2133>
 <YNULA+Ff+eB66bcP@zeniv-ca.linux.org.uk>
 <YNj4DItToR8FphxC@zeniv-ca.linux.org.uk>
 <6e283d24-7121-ae7c-d5ad-558f85858a09@gmail.com>
 <CAMuHMdXSU6_98NbC1UWTT_kmwxD=6Ha5LJxFAtbSuD=y78nASg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=8ssRK52MSevAKyQoJxF4jNVc366d3EchjdXo13/rUh0=;
        b=OTreY5lHoXNQ2THoqnz3iL4Rn8/qrdaoVrPCgJ8vwojjNX7ZbIGTNwLMegvtr3NEOx
         f4x1ieFMEEfPUc+TUB8eorPq6zNdNyAzIl04LigkNLL3eYJ5nryN8cPp+/c0l7T7gh4d
         dvS7oNd42R5Qco5BpF18DRN/tO3wBHjIcTLCCqfWMep5h3drVoEgJZgzx8BgTvWTjGv6
         iWoA3UG/Pe7zVTznLVgkz043hgsRJ5glZMvlCON65HheZ55cf5N6XebXtVxwPWm3mpJV
         MocqOsJokcMgzOQIIvEyDIafgzBURe9vogeNPnCUUsJDmqPGT9rr8UiKR3HW1MubaqDY
         cFvA==
In-Reply-To: <CAMuHMdXSU6_98NbC1UWTT_kmwxD=6Ha5LJxFAtbSuD=y78nASg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, "Eric W. Biederman" <ebiederm@xmission.com>, Linus Torvalds <torvalds@linux-foundation.org>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Hi Geert,

Am 28.06.2021 um 19:31 schrieb Geert Uytterhoeven:
>> Haven't found that warning in over 7 years' worth of console logs, and
>> I'm a good candidate for running the oldest userland in existence for m68k.
>>
>> Time to let it go.
>
> The warning is printed when using filesys-ELF-2.0.x-1400K-2.gz,
> which is a very old ramdisk from right after the m68k a.out to ELF
> transition:
>
>     warning: process `update' used the obsolete bdflush system call
>     Fix your initscripts?
>
> I still boot it, once in a while.

OK; you take the cake. That ramdisk came to mind when I thought about 
where I'd last seen bdflush, but I've not used it in ages (not sure 14 
MB are enough for that).

The question then is - will bdflush fail gracefully, or spin retrying 
the syscall?

Cheers,

	Michael

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
