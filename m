From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
Date: Thu, 2 Feb 2023 12:34:44 -0800
Message-ID: <CAHk-=wheJHX0YyE1YakywU0vT0pBxiNxQ7e4PY=z6TEYZwFq1Q@mail.gmail.com>
References: <Y9lz6yk113LmC9SI@ZenIV> <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV> <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <Y9te+4n4ajSF++Ex@ZenIV>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h+Un5B9HU12CMMbobxB6ypBJ4/8ctn7jjqj34fe39Mg=;
        b=aA69/CVDF6+jXdLxh52nR1XCBIjQNZfHvLRWS5bm9Bv1Bj4Fh66EJ72EHlD2MgIFVp
         ZTamzSeyAPHJnPaIOS1uKJnM8KjGK82kAHMvQtI54FqlWglR03RTFWDMg7N0Z9APN+Es
         hIwm19EyF9DgJI53Q10nix2NttOal21TqByxw=
In-Reply-To: <Y9te+4n4ajSF++Ex@ZenIV>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>

On Wed, Feb 1, 2023 at 10:58 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> BTW, speaking of alpha page faults - maybe I'm misreading the manual,
> but it seems to imply that interrupts are *not* disabled when entering
> page fault handler:

Yeah, I think you are right.

And we *thought* we didn't need to disable interrupts like we do on
x86, because (unlike x86), we get the fault address in an
interrupt-safe way as an argument from palcode, rather than having to
read it from a register.

But now interrupts can race with that vmalloc case.

> is not just missing local_irq_save()/local_irq_restore() around that
> fragment - if it finds pgd already present, it needs to check pte
> before deciding to proceed to no_context.

Well, the logic there is that if the pgd was already present, then
something *else* wasn't present, so no_context makes perfect sense.

But that assumption does not hold for the "we raced with an interrupt"
case, so yes, it's broken.

And as you point out, it's doubly broken because "pgd_present()"
doesn't actually do what it historically did, and what that code
*thinks* it still does.

So yeah, this looks all broken.

            Linus
