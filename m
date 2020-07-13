From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 00/18] Allow architectures to override __READ_ONCE()
Date: Mon, 13 Jul 2020 12:34:43 +0200
Message-ID: <20200713103443.GE10769@hirez.programming.kicks-ass.net>
References: <20200710165203.31284-1-will@kernel.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=INXvaMVTxBym4z/fKJuakqyDRZOcv2j8dD0l03DIIOk=; b=SG6VIgfVujIJwV1bkl//5xt+9g
        GLP/+l5nCGy7FOXXJBltMRU67LYncxDKPW6XsBHqK5/7I+gwAZZAeIi4Fw+AU9EP/1AStl19tAaLC
        SfbNHamPt4X0L+rDd63gUKANJkUMuOF7Pl9RtdotmVNYk2uice1ic0JG1iXWOkPm+uBxb3DNG+iMu
        WBQD3crMEPQqSfLG0NJ363PhffAs9/YPu277+hE0NShjZJpTyx12XnfZwkkoHATqijESikkzytS65
        d4z7k9jTm4g7VM/nUtS3uougp6mu4u9g36XTFN6DBr/Hme/NNU3thCLE+pHtDGeIM5w+F+NxASdO6
        4MG6AvCA==;
Content-Disposition: inline
In-Reply-To: <20200710165203.31284-1-will@kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Joel Fernandes <joelaf@google.com>, Sami Tolvanen <samitolvanen@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Alan Stern <stern@rowland.harvard.edu>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, virtualization@lists.linux-foundation.org, kernel-team@andro

On Fri, Jul 10, 2020 at 05:51:44PM +0100, Will Deacon wrote:

> SeongJae Park (1):
>   Documentation/barriers/kokr: Remove references to
>     [smp_]read_barrier_depends()
> 
> Will Deacon (18):
>   tools: bpf: Use local copy of headers including uapi/linux/filter.h
>   compiler.h: Split {READ,WRITE}_ONCE definitions out into rwonce.h
>   asm/rwonce: Allow __READ_ONCE to be overridden by the architecture
>   alpha: Override READ_ONCE() with barriered implementation
>   asm/rwonce: Remove smp_read_barrier_depends() invocation
>   asm/rwonce: Don't pull <asm/barrier.h> into 'asm-generic/rwonce.h'
>   vhost: Remove redundant use of read_barrier_depends() barrier
>   alpha: Replace smp_read_barrier_depends() usage with smp_[r]mb()
>   locking/barriers: Remove definitions for [smp_]read_barrier_depends()
>   Documentation/barriers: Remove references to
>     [smp_]read_barrier_depends()
>   tools/memory-model: Remove smp_read_barrier_depends() from informal
>     doc
>   include/linux: Remove smp_read_barrier_depends() from comments
>   checkpatch: Remove checks relating to [smp_]read_barrier_depends()
>   arm64: Reduce the number of header files pulled into vmlinux.lds.S
>   arm64: alternatives: Split up alternative.h
>   arm64: cpufeatures: Add capability for LDAPR instruction
>   arm64: alternatives: Remove READ_ONCE() usage during patch operation
>   arm64: lto: Strengthen READ_ONCE() to acquire when CONFIG_LTO=y

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
