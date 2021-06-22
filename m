From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Tue, 22 Jun 2021 12:01:06 +1200
Message-ID: <c7144d54-539d-6aef-ed15-beea91836468@gmail.com>
References: <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
 <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com> <87eed4v2dc.fsf@disp2133>
 <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com> <87fsxjorgs.fsf@disp2133>
 <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <YNDsYk6kbisbNy3I@zeniv-ca.linux.org.uk>
 <CAHk-=wh82uJ5Poqby3brn-D7xWbCMnGv-JnwfO0tuRfCvsVgXA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=UB9+acUzK3vzXh9+7U7bnmX5b1NlglHQrLIGUPXU/88=;
        b=cRhwrbwLthRHZEl5qtGandK0P3Pe5BMBQohYB/3hQrx0hUMho6jLEp/UuaUMGcJaM+
         hXc6cf+8iFf+gafOybzC2MxTmCEqprQ8MbAf94Uh+hXrOSmblBBKTShlXYqVr6ivlTVP
         qoodjF6SXnAvnmSJm2loNMg78iFlVIZ9CAiS9BF2nlQuOE11dtNt0+c72MFUUNiwWtW8
         wLLaslzd8qJjw5k7bioVuUj9yORV1Hc9Rc6j7QW8bRufm21y4UUtCIB11KsjXzFH6oe9
         DEjh0qANHksXAVFf6NYp414vqSzmNRDS4CwYYDYXtAkf5DXRRpcViaEOkQQ6YFHZWdHE
         EMwA==
In-Reply-To: <CAHk-=wh82uJ5Poqby3brn-D7xWbCMnGv-JnwfO0tuRfCvsVgXA@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>

Hi Linus,

On 22/06/21 11:14 am, Linus Torvalds wrote:
> On Mon, Jun 21, 2021 at 12:45 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>>> Looks like sys_exit() and do_group_exit() would be the two places to
>>> do it (do_group_exit() would handle the signal case and
>>> sys_group_exit()).
>> Maybe...  I'm digging through that pile right now, will follow up when
>> I get a reasonably complete picture
> We might have another possible way to solve this:
>
>   (a) make it the rule that everybody always saves the full (integer)
> register set in pt_regs
>
>   (b) make m68k just always create that switch-stack for all system
> calls (it's really not that big, I think it's like six words or
> something)

Correct - six words for registers, one for the return address. Probably 
still a win compared to setting and clearing flag bits all over the 
place in an attempt to catch any as yet undetected unsafe cases of 
ptrace_stop.

I'll have to see how much of a performance impact I can see (not that I 
can even remotely measure that accurately - it's more of a 'does it now 
feel real sluggish' thing).

Cheers,

     Michael

>
>   (c) admit that alpha is broken, but nobody really cares
>
>> In the meanwhile, do kernel/kthread.c uses look even remotely sane?
>> Intentional - sure, but it really looks wrong to use thread exit code
>> as communication channel there...
> I really doubt that it is even "intentional".
>
> I think it's "use some errno as a random exit code" and nobody ever
> really thought about it, or thought about how that doesn't really
> work. People are used to the error numbers, not thinking about how
> do_exit() doesn't take an error number, but a signal number (and an
> 8-bit positive error code in bits 8-15).
>
> Because no, it's not even remotely sane.
>
> I think the do_exit(-EINTR) could be do_exit(SIGINT) and it would make
> more sense. And the -ENOMEM might be SIGBUS, perhaps.
>
> It does look like the usermode-helper code does save the exit code
> with things like
>
>                  kernel_wait(pid, &sub_info->retval);
>
> and I see call_usermodehelper_exec() doing
>
>          retval = sub_info->retval;
>
> and treating it as an error code. But I think those have never been
> tested with that (bogus) exit code thing from kernel_wait(), because
> it wouldn't have worked.  It has only ever been tested with the (real)
> exit code things like
>
>                  if (pid < 0) {
>                          sub_info->retval = pid;
>
> which does actually assign a negative error code to it.
>
> So I think that
>
>                  kernel_wait(pid, &sub_info->retval);
>
> line is buggy, and should be something like
>
>                  int wstatus;
>                  kernel_wait(pid, &wstatus);
>                  sub_info->retval = WEXITSTATUS(wstatus) ? -EINVAL : 0;
>
> or something.
>
>              Linus
