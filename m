From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH 0/9] Refactoring exit
Date: Mon, 28 Jun 2021 11:20:03 -0500
Message-ID: <87pmw6yn9o.fsf@disp2133>
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
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXSU6_98NbC1UWTT_kmwxD=6Ha5LJxFAtbSuD=y78nASg@mail.gmail.com>
        (Geert Uytterhoeven's message of "Mon, 28 Jun 2021 09:31:36 +0200")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Michael,
>
> On Mon, Jun 28, 2021 at 1:00 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 28/06/21 10:13 am, Al Viro wrote:
>> > On Thu, Jun 24, 2021 at 10:45:23PM +0000, Al Viro wrote:
>> >
>> >> 13) there's bdflush(1, whatever), which is equivalent to exit(0).
>> >> IMO it's long past the time to simply remove the sucker.
>> > Incidentally, calling that from ptraced process on alpha leads to
>> > the same headache for tracer.  _If_ we leave it around, this is
>> > another candidate for "hit yourself with that special signal" -
>> > both alpha and m68k have that syscall, and IMO adding an asm
>> > wrapper for that one is over the top.
>> >
>> > Said that, we really ought to bury that thing:
>> >
>> > commit 2f268ee88abb33968501a44368db55c63adaad40
>> > Author: Andrew Morton <akpm@digeo.com>
>> > Date:   Sat Dec 14 03:16:29 2002 -0800
>> >
>> >      [PATCH] deprecate use of bdflush()
>> >
>> >      Patch from Robert Love <rml@tech9.net>
>> >
>> >      We can never get rid of it if we do not deprecate it - so do so and
>> >      print a stern warning to those who still run bdflush daemons.
>> >
>> > Deprecated for 18.5 years by now - I seriously suspect that we have
>> > some contributors younger than that...
>>
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

The only thing left in bdflush is func == 1 calls do_exit(0);

Which is a hack introduced in 2.3.23 aka October of 1999 to force the
userspace process calling bdflush to exit, instead of repeatedly calling
sys_bdflush.

Can you try deleting that func == 1 call and seeing if your old ramdisk
works?

I suspect userspace used to get into a tight spin calling bdflush
func == 1, when that function stopped doing anything.  That was back in
1999 so we are probably safe with out it.

Eric
