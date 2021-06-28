From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH 2/9] signal/seccomp: Refactor seccomp signal and coredump generation
Date: Mon, 28 Jun 2021 14:21:24 -0500
Message-ID: <87im1xx0az.fsf@disp2133>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
        <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
        <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
        <87a6njf0ia.fsf@disp2133>
        <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
        <87tulpbp19.fsf@disp2133>
        <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
        <87zgvgabw1.fsf@disp2133> <875yy3850g.fsf_-_@disp2133>
        <87r1gr6qc4.fsf_-_@disp2133> <202106252014.5AE600929@keescook>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <202106252014.5AE600929@keescook> (Kees Cook's message of "Fri,
        25 Jun 2021 20:17:51 -0700")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>

Kees Cook <keescook@chromium.org> writes:

> On Thu, Jun 24, 2021 at 01:59:55PM -0500, Eric W. Biederman wrote:
>> 
>> Factor out force_sig_seccomp from the seccomp signal generation and
>> place it in kernel/signal.c.  The function force_sig_seccomp takes a
>> paramter force_coredump to indicate that the sigaction field should be
>> reset to SIGDFL so that a coredump will be generated when the signal
>> is delivered.
>
> Ah! This is the part I missed when I was originally trying to figure
> out the coredump stuff. It's the need for setting a default handler
> (i.e. doing a coredump)?

Yes.  If we don't force the handler to SIG_DFL someone might catch
SIGSYS.

>> force_sig_seccomp is then used to replace both seccomp_send_sigsys
>> and seccomp_init_siginfo.
>> 
>> force_sig_info_to_task gains an extra parameter to force using
>> the default signal action.
>> 
>> With this change seccomp is no longer a special case and there
>> becomes exactly one place do_coredump is called from.
>
> Looks good to me. This may benefit from force_sig_seccomp() to be wrapped
> in an #ifdef CONFIG_SECCOMP.

At which point Linus will probably be grumpy with me for introducing
#ifdefs.

I suspect seccomp at this point is sufficiently common that is probably
more productive to figure out how to remove #ifdef  CONFIG_SECCOMP.

> (This patch reminds me that the seccomp self tests don't check for core
> dumps...)

This patch is slightly wrong in that it kept the call to do_group_exit
when it can never be reached.

Eric


