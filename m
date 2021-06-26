From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 2/9] signal/seccomp: Refactor seccomp signal and coredump
 generation
Date: Fri, 25 Jun 2021 20:17:51 -0700
Message-ID: <202106252014.5AE600929@keescook>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133>
 <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
 <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133>
 <875yy3850g.fsf_-_@disp2133>
 <87r1gr6qc4.fsf_-_@disp2133>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aM4y0UrWCLTv7rcBz2RIFnjL7rxnHwV/LKZu/4UV0wk=;
        b=nH6MyPY34BEZoiZq9gMd9L04Gprl6YIaeAZoBnp0GSMt6LQrC+9wF5uB7Gs9IBvMc7
         YHwFB8GDL7VOOkWUb/0Ni1Z+5TYZZGjbbN6/MIr6MnfKoetN0ss2z+DZofF60z2LgDtF
         eWrJMT5xunVz9YpztTCkxHoQKtZEc1cqE6z1Q=
Content-Disposition: inline
In-Reply-To: <87r1gr6qc4.fsf_-_@disp2133>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>

On Thu, Jun 24, 2021 at 01:59:55PM -0500, Eric W. Biederman wrote:
> 
> Factor out force_sig_seccomp from the seccomp signal generation and
> place it in kernel/signal.c.  The function force_sig_seccomp takes a
> paramter force_coredump to indicate that the sigaction field should be
> reset to SIGDFL so that a coredump will be generated when the signal
> is delivered.

Ah! This is the part I missed when I was originally trying to figure
out the coredump stuff. It's the need for setting a default handler
(i.e. doing a coredump)?

> force_sig_seccomp is then used to replace both seccomp_send_sigsys
> and seccomp_init_siginfo.
> 
> force_sig_info_to_task gains an extra parameter to force using
> the default signal action.
> 
> With this change seccomp is no longer a special case and there
> becomes exactly one place do_coredump is called from.

Looks good to me. This may benefit from force_sig_seccomp() to be wrapped
in an #ifdef CONFIG_SECCOMP.

(This patch reminds me that the seccomp self tests don't check for core
dumps...)

-- 
Kees Cook
