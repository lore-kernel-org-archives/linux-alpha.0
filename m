From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 1/2] alpha/ptrace: Record and handle the absence of
 switch_stack
Date: Mon, 21 Jun 2021 15:36:41 +1200
Message-ID: <9db8096e-677f-3852-6ca4-28143a228ec3@gmail.com>
References: <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133>
 <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
 <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133>
 <87k0mtek4n.fsf_-_@disp2133> <393c37de-5edf-effc-3d06-d7e63f34a317@gmail.com>
 <YM/5KAlgTtR6ncOl@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=xLiu6z7n8Nm4pgvs/bW2NXTNeK55NaWWpQGLLIvDVng=;
        b=S5rqecO5NnewVMiMgfEHBfVJRZG9DzFsYkSVQ/EFVweec1CqVq+fziE2JAteDFz7hb
         gw7srdiAAkBuFrsn8uyX3zPk1OLrFCbSRHe5kRgRTu9nPpcsrJGJ2CmehyJoJTz73Q/n
         CIIplHkKDn/X9xYpzxQHk1uC7tHbMq0bnAs+TFiWbtcgL3zZIO/K2cXgVv3wgeR970/W
         P8TZLmviFCrV1teriIklo40jrRJOoO3donZvc79Vkyz7IptxOVwgC1YmUnH6UOqmiaS/
         2dEG1K+YrBe3F+VsnA55g2h3uQrQgfc057DDfipoELXgQBCjs5Mtnfr+FUO2ZC5BUHmN
         iWHg==
In-Reply-To: <YM/5KAlgTtR6ncOl@zeniv-ca.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Linus Torvalds <torvalds@linux-foundation.org>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Hi Al,


Am 21.06.2021 um 14:27 schrieb Al Viro:
> On Mon, Jun 21, 2021 at 02:01:18PM +1200, Michael Schmitz wrote:
>> Hi Eric,
>>
>> instrumenting get_reg on m68k and using a similar patch to yours to warn
>> when unsaved registers are accessed on the switch stack, I get a hit from
>> getegid and getegid32, just by running a simple ptrace on ls.
>>
>> Going to wack those two moles now ...
>
> Explain, please.  get_reg() is called by tracer; whose state are you checking?

The check is only triggered when syscall tracing (I set a flag on trace 
entry, and clear that on trace exit)... From the WARN_ONCE stack dump, 
it appears that I get the warning from inside the syscall, not 
syscall_trace().

> Because you are *not* accessing the switch stack of the caller of get_reg().
> And tracee should be in something like syscall_trace() or do_notify_resume();
> both have SAVE_SWITCH_STACK done by the glue...

And that's where my problem may be - I stupidly forgot to set the 'all 
registers saved' flag before calling syscall_trace() ...

I'll fix that and try again. Sorry for the noise!

Cheers,

	Michael



>
