From: Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Date: Wed, 5 Apr 2023 20:53:45 +0200
Message-ID: <CAFULd4a6u=LB0ivfHtHt=jRxeJeLWuBot=Pync6pbrvKi=CdjA@mail.gmail.com>
References: <20230405141710.3551-1-ubizjak@gmail.com> <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680720837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRtXFO8p+VJqvb8EGOqoRE2s3RWE1f66fx+Rp1t5D9o=;
        b=OMlSV93FLik5uu6Z8lBQaDkNCKwnSNM3KQNtekolqO7lEAxeuPLjS7vAMwzAzhfHZ9
         iiFaH/lpB9PdL8VEOyRPJ2pWuyf0eRnq8GXT9u4Qo7TmPlJABcbGiYYymYezYDB9VYTc
         xkNWzfRwbvB7nsbQtDV4/jeva/rzwD/SG5iPLBdW1yU5S04rD1O1LmD0uMbkKZ9cGtiw
         +p904lLQLMu8a2ioQfdd0zG/38JialqxNkswfgAIGzhFtqnihwTUUxXK7+i0iOfKFj0n
         RxGvXaOp6UMT9qYlKaIWuENHXQXsbghZYBb+ZiWjtEDaJJlLAe6PZq1h6UR5rPhPq351
         o8gA==
In-Reply-To: <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Dave Hansen <dave.hansen@intel.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.c>

On Wed, Apr 5, 2023 at 6:37=E2=80=AFPM Dave Hansen <dave.hansen@intel.com> =
wrote:
>
> On 4/5/23 07:17, Uros Bizjak wrote:
> > Add generic and target specific support for local{,64}_try_cmpxchg
> > and wire up support for all targets that use local_t infrastructure.
>
> I feel like I'm missing some context.
>
> What are the actual end user visible effects of this series?  Is there a
> measurable decrease in perf overhead?  Why go to all this trouble for
> perf?  Who else will use local_try_cmpxchg()?

This functionality was requested by perf people [1], so perhaps Steven
can give us some concrete examples. In general, apart from the removal
of unneeded compare instruction on x86, usage of try_cmpxchg also
results in slightly better code on non-x86 targets [2], since the code
now correctly identifies fast-path through the cmpxchg loop.

Also important is that try_cmpxchg code reuses the result of cmpxchg
instruction in the loop, so a read from the memory in the loop is
eliminated. When reviewing the cmpxchg usage sites, I found numerous
places where unnecessary read from memory was present in the loop, two
examples can be seen in the last patch of this series.

Also, using try_cmpxchg prevents inconsistencies of the cmpxchg loop,
where the result of the cmpxchg is compared with the wrong "old" value
- one such bug is still lurking in x86 APIC code, please see [3].

Please note that apart from perf subsystem, event subsystem can also
be improved by using local_try_cmpxchg. This is the reason that the
last patch includes a change in events/core.c.

> I'm all for improving things, and perf is an important user.  But, if
> the goal here is improving performance, it would be nice to see at least
> a stab at quantifying the performance delta.

[1] https://lore.kernel.org/lkml/20230301131831.6c8d4ff5@gandalf.local.home=
/
[2] https://lore.kernel.org/lkml/Yo91omfDZtTgXhyn@FVFF77S0Q05N.cambridge.ar=
m.com/
[3] https://lore.kernel.org/lkml/20230227160917.107820-1-ubizjak@gmail.com/

Uros.
