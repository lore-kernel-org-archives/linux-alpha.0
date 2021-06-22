From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Wed, 23 Jun 2021 09:48:40 +1200
Message-ID: <20c787ec-4a3c-061c-c649-5bc3e7ef0464@gmail.com>
References: <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/a89jzJmhEpzXyHwVhCcKZ9uKv9DiUWiMoXSo4IAqPE=;
        b=Fj7WoX0NrdmFtDXSPbtKbFgnFmECG0CoEZ4apdWVK9HbJGRvJ+ZBhc5XMlidFXofUP
         RWjfmZvk+mM6RhZumcg0dSaV1oUyKYulB5H/nEg0lJ3cvPqePy77b0IcPVxSDSISJnIJ
         dcpLcgeGt3kO1NwuKcgE8BzaK4Y1D7n4IalQxNKpU5rzjl/3eO9988IoJHBxOWH99sio
         dlNfD9HjdJ+dm7+L/b4tD3GXwtXFTQ3R6hStNTzps39P1kALUFKhlDTgPPlxApk+m7OQ
         VpgUUKRGveGFPy/XEon+N+/Hos5/Mvs0VE2YkMq1h73qmm76/kJqcqRlEt8oA52XTgfJ
         01bA==
In-Reply-To: <87h7hpbojt.fsf@disp2133>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "Eric W. Biederman" <ebiederm@xmission.com>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Hi Eric,

On 23/06/21 9:02 am, Eric W. Biederman wrote:
> Linus Torvalds <torvalds@linux-foundation.org> writes:
>
> So I was more thinking of the debug patch for m68k to catch all the
> _regular_ cases, and all the other random cases of ptrace_event() or
> ptrace_notify().
>
> Although maybe we've really caught them all. The exit case was clearly
> missing, and the thread fork case was scrogged. There are patches for
> the known problems. The patches I really don't like are the
> verification ones to find any unknown ones..
> We still have nios2 which copied the m68k logic at some point.  I think
> that is a processor that is still ``shipping'' and that people might
> still be using in new designs.
>
> I haven't looked closely enough to see what the other architectures with
> caller saved registers are doing.
>
> The challenging ones are /proc/pid/syscall and seccomp which want to see
> all of the system call arguments.  I think every architecture always
> saves the system call arguments unconditionally, so those cases are
> probably not as interesting.  But they certain look like they could be
> trouble.

Seccomp hasn't yet been implemented on m68k, though I'm working on that 
with Adrian. The sole secure_computing() call will happen in 
syscall_trace_enter(), so all system call arguments have been saved on 
the stack.

Haven't looked at /proc/pid/syscall yet ...

Cheers,

     Michael

> Eric
>
