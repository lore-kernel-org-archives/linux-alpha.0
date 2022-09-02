From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 7/7] alpha: lazy FPU switching
Date: Thu, 1 Sep 2022 21:24:52 -0700
Message-ID: <CAHk-=wjfCBF_xYtKacU920YFMKNDnesTUy-gYq8qHucLDTWNHQ@mail.gmail.com>
References: <YxFhB4/cEXX5aHbn@ZenIV> <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
 <20220902015012.2664521-7-viro@zeniv.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=DNMV9IFQkgeSNCmDnVXBpUsVGpL/AV76Y6Bz/ERRPxE=;
        b=M54WbbUJ66QWCtytfwr6nfi7weprv1gdbbFSx2j7OZD3CiQex/eJv4ff0haKCow2UH
         aF1DblgbmhW0jJWnX1xu97zDyHEFx2OjD+mmnwg0z5oTWKF5CT1fdc2sin2KW3akYWsE
         wuYXpd4MnnNIpuAUUsisbKyWENR+MyXnCiGCU=
In-Reply-To: <20220902015012.2664521-7-viro@zeniv.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-alpha@vger.kernel.org

On Thu, Sep 1, 2022 at 6:50 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         On each context switch we save the FPU registers on stack
> of old process and restore FPU registers from the stack of new one.
> That allows us to avoid doing that each time we enter/leave the
> kernel mode; however, that can get suboptimal in some cases.

Do we really care, for what is effectively a dead architecture?

This patch feels like something that might have made sense 25 years
ago. Does it make sense today?

I guess I don't care (for the same reason), but just how much testing
has this gotten, and what subtle bugs might this have?

With the asm even having a comment about how it only works because
alpha doesn't do preemption (ARCH_NO_PREEMPT), but then the C code
does do those preempt_disable/enable pairs, and I see an actual bug in
there too:

Both alpha_read_fp_reg() and alpha_read_fp_reg_s() do a
preempt_enable() -> preempt_enable() pair (ie the first one should be
a preempt_disable()).

Does that bug matter? No. ARCH_NO_PREEMPT means that it's all no-ops
anyway. But it's wrong and I think shows the status of this patch -
well-meaning, but maybe not really fully thought out.

           Linus
