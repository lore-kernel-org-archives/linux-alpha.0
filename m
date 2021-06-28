From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/9] Refactoring exit
Date: Tue, 29 Jun 2021 11:42:16 +1200
Message-ID: <36123b5d-daa0-6c2b-f2d4-a942f069fd54@gmail.com>
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
 <7ad6c3a9-b983-46a5-fc95-f961b636d3fe@gmail.com>
 <CAMuHMdUi5Ri=GmWzS8hb7dkfPyAE=HpQHg6OsKSLDse_364E=g@mail.gmail.com>
 <dbb4ca2d-a857-84f0-f167-5ad4e06aa52b@gmail.com>
 <CAMuHMdVKdZNBU-cTUY0zotA5DmtQ=dxH+iFY0_GX=4DzqpycZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MnOd9iaFXNVD5FJdstRfyB3AFTdce3B7edCsrT/B65c=;
        b=pqa8SXQ/hrN3EE8tWnQaXTgQQ3IZBW/4UPp07rsEpJERt1vDmlBqwfOVQJuTRyq0Am
         H/71eemQRinvfC1+TvsMm3hta9jb1/e0qATCWojjxQKaLzr4Oml0uSu5Xq0jVZVXJqER
         MDi/VtgB+XdWcx9atuL8LQkkSpJ0xM/te+EfGO7nhhSi9Mhs8zUsnBMZEpBTkGIA4Fpk
         3pUjAvMP3WS/7h60szKRz131Yf2UsqM8p6CgL0/4ZV5qJrWEmM56TyOTQZFHm/pbrDd7
         L/MwUK09uULPkJsmlecXAHPFUVAJaGDsqbKUmRTCqPFtorFVPxlMJpH98IJ4wEi9vvlQ
         LPbA==
In-Reply-To: <CAMuHMdVKdZNBU-cTUY0zotA5DmtQ=dxH+iFY0_GX=4DzqpycZQ@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, "Eric W. Biederman" <ebiederm@xmission.com>, Linus Torvalds <torvalds@linux-foundation.org>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Hi Geert,

On 29/06/21 9:18 am, Geert Uytterhoeven wrote:
>
>>>> The question then is - will bdflush fail gracefully, or spin retrying
>>>> the syscall?
>>> Will add to my todo list...
>>> BTW, you can boot this ramdisk on ARAnyM, too.
>> True. I can't find that ramdisk image anywhere - if you can point me to
>> some archive, I'll give that a try.
> http://ftp.mac.linux-m68k.org/pub/linux-mac68k/initrd/

Thanks - removing the if (func==1) do_exit(0); part does give similar 
behaviour as before - kernel warns five times, then shuts up (without 
change, warns twice only, and /sbin/update no longer runs).

Removing the syscall from the m68k syscall table altogether still gives 
a working ramdisk. /sbin/update is still running, so evidently doesn't 
care about the invalid syscall result ...

Cheers,

     Michael


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
