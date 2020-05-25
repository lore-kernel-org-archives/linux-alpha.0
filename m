From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5] alpha: fix memory barriers so that they conform to the specification
Date: Mon, 25 May 2020 16:07:17 +0200
Message-ID: <CAK8P3a0GVNvM3Sjcujwc0ybfxSftE9PfFBuXdUm1imfpQHmyig@mail.gmail.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
 <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
 <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org>
 <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru> <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
 <20200523151027.GA10128@mail.rc.ru> <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com> <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: "Maciej W. Rozycki" <macro@wdc.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "Maciej W. Rozycki" <macro@linux-mips.org>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

On Mon, May 25, 2020 at 3:56 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> On Sun, 24 May 2020, Maciej W. Rozycki wrote:

> >
> > respectively, with corresponding out-of-line entry points available, so
> > that there is no extra inline code produced where the call to the relevant
> > MMIO accessor is going to end up with an actual function call, as this
> > would not help performance in any way and would expand code unnecessarily
> > at all call sites.
> >
> >  Therefore I suggest that your new `static inline' functions follow the
> > pattern, perhaps by grouping them with the corresponding ordinary accessor
> > functions in arch/alpha/include/asm/io.h within the relevant existing
> > #ifdef, and then by making them `extern inline' and providing out-of-line
> > implementations in arch/alpha/kernel/io.c, with the individual symbols
> > exported.  Within arch/alpha/kernel/io.c the compiler will still inline
> > code as it sees fit as it already does, e.g. `__raw_readq' might get
> > inlined in `readq' if it turns out cheaper than arranging for an actual
> > call, including all the stack frame preparation for `ra' preservation;
> > it's less likely with say `writeq' which probably always ends with a tail
> > call to `__raw_writeq' as no stack frame is required in that case.
> >
> >  That for the read accessors.
>
> I think that making the read*_relaxed functions extern inline just causes
> source code bloat with no practical gain - if we make them extern inline,
> we would need two implementations (one in the include file, the other in
> the C file) - and it is not good practice to duplicate code.
>
> The functions __raw_read* are already extern inline, so the compiler will
> inline/noinline them depending on the macros trivial_io_bw and
> trivial_io_lq - so we can just call them from read*_relaxed without
> repeating the extern inline pattern.

You could consider using the helpers in include/asm-generic/io.h
to provide some of the wrappers and only provide the ones that
don't fit in that scheme already.

       Arnd
