From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Wed, 23 Jun 2021 09:57:23 +1200
Message-ID: <8badff67-64c9-ca03-7af1-de73d0d75285@gmail.com>
References: <87eed4v2dc.fsf@disp2133>
 <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com> <87fsxjorgs.fsf@disp2133>
 <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <YNDsYk6kbisbNy3I@zeniv-ca.linux.org.uk>
 <CAHk-=wh82uJ5Poqby3brn-D7xWbCMnGv-JnwfO0tuRfCvsVgXA@mail.gmail.com>
 <de5f0132-eed4-f1d0-ddd2-f65a62de6b81@gmail.com>
 <YNJFr5xUOm91Vy1r@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=q3sSzRhIYRc08dnfAfmCyTORkqMDLuhDq0YQcDshAkw=;
        b=b7F/isKgmlnCGn7ktKvQiwQaGkX//vxpblPW5Aj3zNKiPyoIi7L6xPA0H+VD3mmaV2
         KK3ZmsT5Kx0XYBSi6rAJB6yf4y+ypdpaF4k8xNGxuXiRoWYyzkzKrFOsZB2bTfuWyz1V
         pIZ6u6YjIWAFEzdxEpXck55WHYWnXfeO9tM4jXryNbRGP8x9lTwwMV7z1J5rYgQIb11J
         bwCo2XoKzw1Byt5bpTGrEVmHlrjyhQd9lRLB1mkL3qgJ/mZ4MLBh6HcydQ5giJyPyUg0
         o3lLcUur7tND7+LxDLyXT5AbbRNWGXXKNCuI54z4x98prRHyaHRJSFwZZyGaonB77FJq
         fE8A==
In-Reply-To: <YNJFr5xUOm91Vy1r@zeniv-ca.linux.org.uk>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Andreas Schwab <schwab@linux-m68k.org>

Hi Al,

On 23/06/21 8:18 am, Al Viro wrote:
> On Wed, Jun 23, 2021 at 08:04:11AM +1200, Michael Schmitz wrote:
>
>> All syscalls that _do_ save the switch stack are currently called through
>> wrappers which pull the syscall arguments out of the saved pt_regs on the
>> stack (pushing the switch stack after the SAVE_ALL saved stuff buries the
>> syscall arguments on the stack, see comment about m68k_clone(). We'd have to
>> push the switch stack _first_ when entering system_call to leave the syscall
>> arguments in place, but that will require further changes to the syscall
>> exit path (currently shared with the interrupt exit path). Not to mention
>> the register offset calculations in arch/m68k/kernel/ptrace.c, and perhaps a
>> few other dependencies that don't come to mind immediately.
>>
>> We have both pt_regs and switch_stack in uapi/asm/ptrace.h, but the ordering
>> of the two is only mentioned in a comment. Can we reorder them on the stack,
>> as long as we don't change the struct definitions proper?
>>
>> This will take a little more time to work out and test - certainly not
>> before the weekend. I'll send a corrected version of my debug patch before
>> that.
> This is insane, *especially* on m68k where you have the mess with different
> frame layouts and associated ->stkadj crap (see mangle_kernel_stack() for
> the (very) full barfbag).

Indeed - that's one of the uses of pt_regs and switch_stack that I 
hadn't yet seen.

So it's either leave the stack layout in system calls unchanged (aside 
from the ones that need the extra registers) and protect against 
accidental misuse of registers that weren't saved, with the overhead of 
playing with thread_info->status bits, or tackle the mess of redoing the 
stack layout to save all registers, always (did I already mention that 
I'd need a _lot_ of help from someone more conversant with m68k assembly 
coding for that option?).

Which one of these two barf bags is the fuller one?

Cheers,

     Michael

