From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH 18/18] arm64: lto: Strengthen READ_ONCE() to acquire when CLANG_LTO=y
Date: Tue, 30 Jun 2020 15:57:54 -0700
Message-ID: <CABCJKudxmrSNNzgPkc4NHt71rfdjAqFbb9n49S4QBDZPQ52e0w@mail.gmail.com>
References: <20200630173734.14057-1-will@kernel.org> <20200630173734.14057-19-will@kernel.org>
 <CANpmjNPOO=AVsVJMdL8sq03jwHsDR_1_FfWccwaLKEBRn1RFtA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DSyr2ChJftwUjYWgZAXvEatbLcj++yS0JpUL3ndj5DU=;
        b=pWOYL6MjvPFUe7s+sL3ssAVAE3rJ+0I0MBPbDe/8jAsZ2gDipFCWXaJL200o2afH7G
         au84QSD0EygQdxbIL9VONLF7MbwZwZaFgu6ZkN21qA4RUY3BnRHodQWC7SIrlTbfNfsV
         HqDH+IR53dpqnNGYDlmyPKrIwiyg3NQAdJctr9t/wDs2ZMYxSZNZDkeNMq7bKzV9SpMk
         HmaA29N/8jKpjSnzb35OalgVh+uYKvGgzAYUzHDKm6krOCVQRSoTuGK2M+tJrvWZs/pu
         qaTkSYV7fYgWGgp6rSLHtNlJ8K1K+t8poHIRIQpL8gm2b9cRsfpBo+50hsIuWYEIBSKB
         Y/Eg==
In-Reply-To: <CANpmjNPOO=AVsVJMdL8sq03jwHsDR_1_FfWccwaLKEBRn1RFtA@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Elver <elver@google.com>
Cc: Will Deacon <will@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Josh Triplett <josh@joshtriplett.org>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-alpha@vger.kernel.org, virtualization@lists.linux

On Tue, Jun 30, 2020 at 12:47 PM Marco Elver <elver@google.com> wrote:
>
> On Tue, 30 Jun 2020 at 19:39, Will Deacon <will@kernel.org> wrote:
> >
> > When building with LTO, there is an increased risk of the compiler
> > converting an address dependency headed by a READ_ONCE() invocation
> > into a control dependency and consequently allowing for harmful
> > reordering by the CPU.
> >
> > Ensure that such transformations are harmless by overriding the generic
> > READ_ONCE() definition with one that provides acquire semantics when
> > building with LTO.
> >
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/include/asm/rwonce.h   | 63 +++++++++++++++++++++++++++++++
> >  arch/arm64/kernel/vdso/Makefile   |  2 +-
> >  arch/arm64/kernel/vdso32/Makefile |  2 +-
> >  3 files changed, 65 insertions(+), 2 deletions(-)
> >  create mode 100644 arch/arm64/include/asm/rwonce.h
>
> This seems reasonable, given we can't realistically tell the compiler
> about dependent loads. What (if any), is the performance impact? I
> guess this also heavily depends on the actual silicon.
>
> I do wonder, though, if there is some way to make the compiler do
> something better for us. Clearly, implementing real
> memory_order_consume hasn't worked out until today. But maybe the
> compiler could promote dependent loads to acquires if it recognizes it
> lost dependencies during optimizations. Just thinking out loud, it
> probably still has some weird corner case that will break. ;-)
>
> The other thing is that I'd be cautious blaming LTO, as I tried to
> summarize here:
> https://lore.kernel.org/kernel-hardening/20200630191931.GA884155@elver.google.com/
>
> The main thing is that, yes, this might be something to be worried
> about, but if we are worried about it, we need to be worried about it
> in *all* builds (LTO or not). My guess is that's not acceptable. Would
> it be better to just guard the promotion of READ_ONCE() to acquire
> behind a config option like CONFIG_ACQUIRE_READ_DEPENDENCIES, and then
> make LTO select that (or maybe leave it optional?). In future, for
> very aggressive non-LTO compilers even, one may then also select that
> if there is substantiated worry things do actually break.

I agree, a separate config option would be better here.

Also Will, the LTO patches use CONFIG_LTO_CLANG instead of CLANG_LTO.

Sami
