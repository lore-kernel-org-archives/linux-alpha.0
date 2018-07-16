From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/6] System call table generation support
Date: Mon, 16 Jul 2018 16:09:15 +0200
Message-ID: <CAK8P3a113b4uKsw2qKbgggk2S1=m3a7REN5_qoVuLPfT_7jdSw@mail.gmail.com>
References: <1531736638-15294-1-git-send-email-firoz.khan@linaro.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=ZaAWHOpu7THAehIsI+L+7MYGdelx6lzUlWrSr3HQaWw=;
        b=pWYGLJvzwU2xfEN1LaqXyT9zQnv/KcNwyDG6rtGAjKAdyrRcQ8deic1TXcdKAi2deN
         IA2XY1fqxnFmTo+n3oMpycRNIh0XviIAUWd1cR7EFduR9rz16mJPvpvUu0OE08JRyC9J
         1UqQvGo+VffuTH9T008/bB6PO9t0YS2MsDYbvC+pRVCDYVPHeALR5dacGeIGTkY1ouNj
         pl75Z14zXmfVO8J6+tsbXthm8gnYQrdvFg1aRPIfvI5UWSzlSFhER8US1n17E8Brm1Ga
         Xo3QW6/e/0O5+i1zqNrHXdhMffiNBH8zJGVibr0zJIkygrgr1iRuu5JlTv6xbSs/y2EG
         bInQ==
In-Reply-To: <1531736638-15294-1-git-send-email-firoz.khan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Firoz Khan <firoz.khan@linaro.org>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

On Mon, Jul 16, 2018 at 12:23 PM, Firoz Khan <firoz.khan@linaro.org> wrote:
> The goal of this patch series is to easily add/modify/delete a
> system call by changing entry in syscall.tbl file. No need
> to manually edit many files.
>
> The another goal of this patch series is to to unify the system
> call implementation across all the architectures. ARM, s390 and
> x86 architecuture does have the similar support. I leverage their
> implementation to come up with a generic solution.
>
> I have done the same support for work for ia64, m68k, microblaze,
> mips, parisc, powerpc, sh, sparc, and xtensa. But I started sending
> the patch for one architecuture for review. Below mentioned git
> repository contains more details.
> Git repo:- https://github.com/frzkhn/system_call_table_generator/
>
> Finally, this is the ground work for solving the Y2038 issue. We
> need to change two dozen of system calls to solve Y2038 issue. So
> this implementation will help to easily modify from existing system
> call to Y2038 compatible system calls.

Thanks a lot Firoz for getting this started!

(adding Marcin to Cc)

I think doing this for all architectures will help in a number of ways.
As we need to do a relatively complex conversion for the system
calls for y2038 support (changing old calls into compat ones,
and adding the new ones at the end), this will give us some
confidence.

I also hope that this makes scripting easier when we can check
which calls are implemented on which architecture, and maybe get
to a common baseline again by adding the missing calls on
all architectures that are rarely updated, now that we have thrown
out the architectures that were simply unmaintained. (looking
at the syscall table used to be a good way to see how well
maintained an architecture is). Once the y2038 calls are added,
glibc and others will have to set a new minimum version of kernel
headers (e.g. changing from linux-3.2 to 4.20) to get the new calls,
and that at that time, it would be great to have all the recently
added calls available on all architectures, so a future glibc version
that takes linux-4.20 as the minimum runtime version doesn't have
to emulate those calls through older ones. In particular, this
would be helpful for the new mount() API and the rseq() call that
have recently been added.

We might run into a few problems on architectures while we
transition to generated tables at the same as as adding new
calls, we'll have to see how to deal with that.

      Arnd
