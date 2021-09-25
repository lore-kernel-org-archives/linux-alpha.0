From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 7/7] alpha: lazy FPU switching
Date: Sat, 25 Sep 2021 12:07:17 -0700
Message-ID: <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk> <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
 <20210925025548.1694143-7-viro@zeniv.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XsW8W77uk1stibLZy1i0WuwqlVgYv+eU53F9QoWyYCo=;
        b=bC5ZIfglTQX/fqeYMrs58FzUn1tSkdAcfdliUN+zIbY5oh0F8hJ8N/i+pH58mVeabF
         m0qLCzUCuKBE3dwyd4ZEe4Rrq3GLOvS5/PaNhP3szisu/eBsBZWZ7KapWZHEgz8RVRDt
         cmaOzvngk/O7/hWG6lE7p20exnYGHn/GUJXcw=
In-Reply-To: <20210925025548.1694143-7-viro@zeniv.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: alpha <linux-alpha@vger.kernel.org>

On Fri, Sep 24, 2021 at 7:55 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         On each context switch we save the FPU registers on stack
> of old process and restore FPU registers from the stack of new one.
> That allows us to avoid doing that each time we enter/leave the
> kernel mode; however, that can get suboptimal in some cases.

Do you actually have a system or virtual image to test this all out on?

I'm not saying this doesn't look like an improvement, I'm more
questioning whether it's worth it...

          Linus
