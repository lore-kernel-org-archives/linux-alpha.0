From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Wed, 23 Jun 2021 09:36:45 -0500
Message-ID: <87sg18abr6.fsf@disp2133>
References: <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
        <87eed4v2dc.fsf@disp2133>
        <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
        <87fsxjorgs.fsf@disp2133>
        <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
        <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
        <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
        <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
        <YNDsYk6kbisbNy3I@zeniv-ca.linux.org.uk>
        <CAHk-=wh82uJ5Poqby3brn-D7xWbCMnGv-JnwfO0tuRfCvsVgXA@mail.gmail.com>
        <YNEfXhi80e/VXgc9@zeniv-ca.linux.org.uk>
        <CAHk-=wjtagi3g5thA-T8ooM8AXcy3brdHzugCPU0itdbpDYH_A@mail.gmail.com>
        <87h7hpbojt.fsf@disp2133>
        <20c787ec-4a3c-061c-c649-5bc3e7ef0464@gmail.com>
        <55bdad37-187b-e1f5-a359-c5206b20ff4d@gmail.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <55bdad37-187b-e1f5-a359-c5206b20ff4d@gmail.com> (Michael
        Schmitz's message of "Wed, 23 Jun 2021 17:26:22 +1200")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Michael Schmitz <schmitzmic@gmail.com> writes:

> Hi Eric,
>
> Am 23.06.2021 um 09:48 schrieb Michael Schmitz:
>>>
>>> The challenging ones are /proc/pid/syscall and seccomp which want to see
>>> all of the system call arguments.  I think every architecture always
>>> saves the system call arguments unconditionally, so those cases are
>>> probably not as interesting.  But they certain look like they could be
>>> trouble.
>>
>> Seccomp hasn't yet been implemented on m68k, though I'm working on that
>> with Adrian. The sole secure_computing() call will happen in
>> syscall_trace_enter(), so all system call arguments have been saved on
>> the stack.
>>
>> Haven't looked at /proc/pid/syscall yet ...
>
> Not supported at present (no HAVE_ARCH_TRACEHOOK for m68k). And the
> syscall_get_arguments I wrote for seccomp support only copies the first five
> data registers, which are always saved.

Yes.  It is looking like I can fix everything generically except for
faking user space registers for io_uring threads.

Eric
