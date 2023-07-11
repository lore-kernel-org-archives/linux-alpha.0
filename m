From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v3 3/5] arch: Register fchmodat4, usually as syscall 451
Date: Tue, 11 Jul 2023 13:31:44 +0200
Message-ID: <55fee4b7-41f0-4f24-ad0e-a4527486bad1@app.fastmail.com>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <e48c4d4046de97205fd52a73f77e9b203c3b871e.1689074739.git.legion@kernel.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1689075125; x=1689161525; bh=/C
        vj5KuDdmHIGd859qaJsBs/f1fpWATGo78ystxolZ8=; b=C4Tl5XZgJGIc7j43HJ
        4fGyI/IRlktc3w6e0XFyC1Sg6fp8cLDzoB1xPJ/yosSCoI1QS/IIkA7A0lmOtSB5
        8dS0sjpFCOyKj521J54iNrg2Ng8+adx4HMWT43DkM+FJcICGaQpids1RewgEq1Xj
        0mY/MPzvKuffj8CGY+mzm9mDWmVhhvEbPTNxnU75mrfiB7BL+Eq7WxgavTeKOobo
        O8eQk0OtdaNegptl2lVjD4jRydZYvCjVnTJ66OECZngYMjqizqY133wtbpYlGLGk
        nxZgL729F0mocqDVx9p2E8s6g3NUBTZ0kf1O2D7yx4W09UvSleY+E25vqJ6FkgSF
        Hfrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1689075125; x=1689161525; bh=/Cvj5KuDdmHIG
        d859qaJsBs/f1fpWATGo78ystxolZ8=; b=QqHVCmHeA3F+kyNbq+cIkQQCEtoHx
        HsAMIDNNGIYjXVDzLpogMsF84iRhwfmY38lNiYRP4tDLqwRRID821vzTvgRLSw2N
        iQqDY6Iq8rWyG9lLkEmR5e/UJG9diErjrD8AFbczp0X5rKkN8AG44+gfgfPaGLvL
        hEL9WPOz/L9mb0cXjNy3JPxTH2oZtFGu2NYSMi0+g5/Ya/upwP8K+ycBfabbXSDS
        pC7VjP6/HjSulVngpPClEkB50uvje1m9i5hPtX8K305ne5TzZEfZciWBQo/Qos9j
        xbHxrcsOpeJnDp6IHEvgnIXFodpKlEk/s2SWjSA3iqRI90V/hVTnTDDhA==
In-Reply-To: <e48c4d4046de97205fd52a73f77e9b203c3b871e.1689074739.git.legion@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Gladkov <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Palmer Dabbelt <palmer@sifive.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, christian@brauner.io, Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, Deepa Dinamani <deepa.kernel@gmail.com>, Helge Deller <deller@gmx.de>, David Howells <dhowells@redhat.com>, fenghua.yu@intel.com, firoz.khan@linaro.org, Florian Weimer <fweimer@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, glebfm@altli

On Tue, Jul 11, 2023, at 13:25, Alexey Gladkov wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> This registers the new fchmodat4 syscall in most places as nuber 451,
> with alpha being the exception where it's 561.  I found all these sites
> by grepping for fspick, which I assume has found me everything.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

In linux-6.5-rc1, number 451 is used for __NR_cachestat, the
next free one at the moment is 452.

>  arch/arm/tools/syscall.tbl                  | 1 +
>  arch/arm64/include/asm/unistd32.h           | 2 ++

Unfortunately, you still also need to change __NR_compat_syscalls
in arch/arm64/include/asm/unistd.h. Aside from these two issues,
your patch is the correct way to hook up a new syscall.

   Arnd
