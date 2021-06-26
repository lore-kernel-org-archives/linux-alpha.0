From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 4/9] signal: Factor start_group_exit out of
 complete_signal
Date: Fri, 25 Jun 2021 20:24:04 -0700
Message-ID: <202106252022.79A9A1A@keescook>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133>
 <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
 <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133>
 <875yy3850g.fsf_-_@disp2133>
 <87czsb6q9r.fsf_-_@disp2133>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZYiH9nK6crmHzzEefhGaKJK98dSESEicqRD9TcJugLA=;
        b=DcagL9ukyAri4GHOF/R0Zf3Iu0Lo6msYVkx5FGprR+PMGBy9p9RQixD9ErVc1gzXH6
         mSli7Te1XBpclsd+1tAr6ijhr8hce6Hp3XBsdEJyda/f94I0H+WZ5DnF+oq1N6s+TGRd
         RJdvcGL/FQ4D2d/B27HhdT/IBBdxghruULKz4=
Content-Disposition: inline
In-Reply-To: <87czsb6q9r.fsf_-_@disp2133>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>

On Thu, Jun 24, 2021 at 02:01:20PM -0500, Eric W. Biederman wrote:
> +static void start_group_exit_locked(struct signal_struct *signal, int exit_code)
> +{
> +	/*
> +	 * Start a group exit and wake everybody up.
> +	 * This way we don't have other threads
> +	 * running and doing things after a slower
> +	 * thread has the fatal signal pending.
> +	 */
> +	struct task_struct *t;
> +
> +	signal->flags = SIGNAL_GROUP_EXIT;
> +	signal->group_exit_code = exit_code;
> +	signal->group_stop_count = 0;
> +	__for_each_thread(signal, t) {
> +		task_clear_jobctl_pending(t, JOBCTL_PENDING_MASK);
> +
> +		/* Don't bother with already dead threads */
> +		if (t->exit_state)
> +			continue;
> +		sigaddset(&t->pending.signal, SIGKILL);
> +		signal_wake_up(t, 1);
> +	}

This both extracts it and changes it. For ease-of-review, maybe split
this patch into the move and then the logic changes?

-- 
Kees Cook
