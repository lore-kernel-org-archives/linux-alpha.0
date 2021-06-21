From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Tue, 22 Jun 2021 11:24:57 +1200
Message-ID: <d8105fc4-9551-c80a-37f4-2c57b3173283@gmail.com>
References: <87sg1lwhvm.fsf@disp2133>
 <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
 <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com> <87eed4v2dc.fsf@disp2133>
 <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com> <87fsxjorgs.fsf@disp2133>
 <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <YNDnY0niP+IfSx+X@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=r0VwenRqskFTDoxa2BG069i4DjqqTYGW10YD8Bvo/q0=;
        b=F+xHU0Aq6hmH1YvvN8TsIaDZ+1YxE0TAC/D7AUDfDVD99ivp1J2/ZEe+x6H78uyvXj
         E3ihUPFI1h6CinFlQiMGG9N/FK57sYaQBEHYKmbxomJfPEevCH3VNE9VvZYCh2EFsghE
         f/HFVrKLPWMR/AoMFOGbraO2smRAYLfRB9g2p0gs6svzmnCwmD2LKKhlymdV7bvrAyiF
         bZ5H+34iH1uRaGrMDypbUXzPC99bK1vJS/SsOQ1yuMsrhStJouJdPbuOTjsC4KacgFq7
         zNn+nXPzUDdD/SjHRFw34nmjK53kw1U/2GRYEOaSyDHA8Wp7EQ+lOYrEvt5YlvltZ1kq
         7nPw==
In-Reply-To: <YNDnY0niP+IfSx+X@zeniv-ca.linux.org.uk>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Al Viro <viro@zeniv.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Hi Al,

On 22/06/21 7:24 am, Al Viro wrote:
>
>> 	There's a large mess around do_exit() - we have a bunch of
>> callers all over arch/*; if nothing else, I very much doubt that really
>> want to let tracer play with a thread in the middle of die_if_kernel()
>> or similar.
>>
>> We sure as hell do not want to arrange for anything on the kernel
>> stack in such situations, no matter what's done in exit(2)...
> FWIW, on alpha it's die_if_kernel(), do_entUna() and do_page_fault(),
> all in not-from-userland cases.  On m68k - die_if_kernel(), do_page_fault()
> (both for non-from-userland cases) and something really odd - fpsp040_die().
> Exception handling for floating point stuff on 68040?  Looks like it has
Exception handling for emulated floating point instructions, really - 
exceptions happening when excecuting FPU instructions on hardware will 
do the normal exception processing.
> an open-coded copy_to_user()/copy_from_user(), with faults doing hard
> do_exit(SIGSEGV) instead of raising a signal and trying to do something
> sane...

Yes, that's what it does. Not pretty ... though all that using m68k 
copy_to_user()/copy_from_user() would change is returning how many bytes 
could not copied. In contrast to the ifpsp060 code, we could not pass on 
that return status to callers of copyin/copyout in fpsp040, so I don't 
see what sane thing could be done if a fault happens.

(I'd expect the MMU would have raised a bus error and resolved the 
problem by a page fault if possible, before we ever get to this point?)

> I really don't want to try and figure out how painful would it be to
> teach that code how to deal with faults - _testing_ anything in that
> area sure as hell will be.  IIRC, details of recovery from FPU exceptions
> on 68040 in the manual left impression of a minefield...

This is only about faults when moving data from/to user space. FPU 
exceptions are handled elsewhere in the code. So we at least don't have 
to deal with that particular minefield.

Teaching the fpsp040 code to deal with access faults looks horrible 
indeed... let's not go there.

Cheers,

     Michael


