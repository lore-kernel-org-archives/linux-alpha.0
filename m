From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 3/9] signal/seccomp: Dump core when there is only one
 live thread
Date: Fri, 25 Jun 2021 20:20:29 -0700
Message-ID: <202106252018.0EC329C@keescook>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133>
 <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
 <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133>
 <875yy3850g.fsf_-_@disp2133>
 <87lf6z6qbd.fsf_-_@disp2133>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m/r2jKnf6mzXHGS0+mY6tO8kdxoIVifevnwrBMvWaHk=;
        b=k5evDFcu122UMvrbb5kz6pJG46rSJobzAashV394QfzBP+VFZW1qcemLOWIMTqTwnO
         KhX0VgfKs97JSqirj7NxmKbJhyY7pwgk8AjhjA15rr2M34TyDxxbjmKofm2KW8+ZtL0q
         Wq8LJ8oNzBFS43JDygd5Msv1UzewtYzPIfmIg=
Content-Disposition: inline
In-Reply-To: <87lf6z6qbd.fsf_-_@disp2133>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>

On Thu, Jun 24, 2021 at 02:00:22PM -0500, Eric W. Biederman wrote:
> Replace get_nr_threads with atomic_read(&current->signal->live) as
> that is a more accurate number that is decremented sooner.

Okay, seems fine to me. :)

-- 
Kees Cook
