From: Charlemagne Lasse <charlemagnelasse@gmail.com>
Subject: Re: [PATCH v2 3/5] locking/arch: Wire up local_try_cmpxchg
Date: Wed, 17 May 2023 09:41:41 +0200
Message-ID: <CAFGhKbyxtuk=LoW-E3yLXgcmR93m+Dfo5-u9oQA_YC5Fcy_t9g@mail.gmail.com>
References: <20230405141710.3551-1-ubizjak@gmail.com> <20230405141710.3551-4-ubizjak@gmail.com>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684309312; x=1686901312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt8vcqfcBcSzFv5CqI8kXtZUiisqmIiLAVfG/Z4B1wo=;
        b=gNAni+aefYGCbzXJZ1KCoFg8ZVjbrHwK7u+sKWIsmjjGqQJ2bWNPSg+WakHJQVS3ab
         Bp5bqMntw1uQkVw+IN1lOsU4BFRNTNuMiq9ef5c1RW9TLIi66HUQpNRoz99rtQztmRGD
         KYnmVtSd+sNgymFummMsYYEpskLLZBxJnmkacqEQxSIDH8jjQDIifWpfH9ktAgm+tMoA
         l5xZHrVJnxwv1lhnl/gXppJABX//LI0ugS4VIj2bunZX7U1ejXCSJwy/Tf02yZh0TYX/
         2qa/8Rhqzrv1gtxn/rhiuEfjmYRrH3Jk4TsxNllrNjP6UscF1wHGQheDYKzJXyF9J7W6
         2Wiw==
In-Reply-To: <20230405141710.3551-4-ubizjak@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Jun Yi <yijun@loongson.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>

> +static __inline__ bool local_try_cmpxchg(local_t *l, long *old, long new)
> +{
> +       typeof(l->a.counter) *__old = (typeof(l->a.counter) *) old;
> +       return try_cmpxchg_local(&l->a.counter, __old, new);
> +}
> +

This patch then causes following sparse errors:

    ./arch/x86/include/asm/local.h:131:16: warning: symbol '__old'
shadows an earlier one
    ./arch/x86/include/asm/local.h:130:30: originally declared here

This is then visible in all kinds of builds - which makes it hard to
find out actual problems with sparse.
