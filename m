From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH v5] alpha: fix memory barriers so that they conform to
 the specification
Date: Mon, 25 May 2020 09:56:00 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
 <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org> <20200513144128.GA16995@mail.rc.ru>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com> <20200523151027.GA10128@mail.rc.ru>
 <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590414967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bsOgnlg4oR4WwFA38CFO/QhjthpM3vWr1wpGrfS1Ex8=;
        b=Tz7KfLnOsRV34UWp6FIxJRLQW/Dl2XN7G3NJywDJaV/aDiJlDKHd65pISC2O5T4JqjiSBu
        THlOE7vg1ZPJf4jDlDd7gOSG6x2ohbkGK1smJfrRraeae/Lj4HlmQgOkDerOzsre4z7ee1
        AsxBUtmGQEpGq4v2uumpgZNI1Qyl/yQ=
In-Reply-To: <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@wdc.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "Maciej W. Rozycki" <macro@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org



On Sun, 24 May 2020, Maciej W. Rozycki wrote:

> Hi Mikulas,
> 
> > This patch makes barriers confiorm to the specification.
> > 
> > 1. We add mb() before readX_relaxed and writeX_relaxed -
> >    memory-barriers.txt claims that these functions must be ordered w.r.t.
> >    each other. Alpha doesn't order them, so we need an explicit barrier.
> > 2. We add mb() before reads from the I/O space - so that if there's a
> >    write followed by a read, there should be a barrier between them.
> > 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Fixes: cd0e00c10672 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering")
> > Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
> > Cc: stable@vger.kernel.org      # v4.17+
> > Acked-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> 
>  Thank you for your effort to address this regression.  I have looked 
> through your code and the context it is to be applied to.  Overall it 
> looks good to me, however I still have one concern as detailed below 
> (please accept my apologies if you find it tedious to address all the 
> points raised in the course of this review).
> 
> > Index: linux-stable/arch/alpha/include/asm/io.h
> > ===================================================================
> > --- linux-stable.orig/arch/alpha/include/asm/io.h	2020-05-23 10:01:22.000000000 +0200
> > +++ linux-stable/arch/alpha/include/asm/io.h	2020-05-23 17:29:22.000000000 +0200
> [...]
> > @@ -487,16 +501,59 @@ extern inline void writeq(u64 b, volatil
> >  #define outb_p		outb
> >  #define outw_p		outw
> >  #define outl_p		outl
> > -#define readb_relaxed(addr)	__raw_readb(addr)
> > -#define readw_relaxed(addr)	__raw_readw(addr)
> > -#define readl_relaxed(addr)	__raw_readl(addr)
> > -#define readq_relaxed(addr)	__raw_readq(addr)
> > -#define writeb_relaxed(b, addr)	__raw_writeb(b, addr)
> > -#define writew_relaxed(b, addr)	__raw_writew(b, addr)
> > -#define writel_relaxed(b, addr)	__raw_writel(b, addr)
> > -#define writeq_relaxed(b, addr)	__raw_writeq(b, addr)
> >  
> >  /*
> > + * The _relaxed functions must be ordered w.r.t. each other, but they don't
> > + * have to be ordered w.r.t. other memory accesses.
> > + */
> > +static inline u8 readb_relaxed(const volatile void __iomem *addr)
> > +{
> > +	mb();
> > +	return __raw_readb(addr);
> > +}
> [etc.]
> 
>  Please observe that changing the `*_relaxed' entry points from merely 
> aliasing the corresponding `__raw_*' handlers to more elaborate code 
> sequences (though indeed slightly only, but still) makes the situation 
> analogous to one we have with the ordinary MMIO accessor entry points.  
> Those regular entry points have been made `extern inline' and wrapped 
> into:
> 
> #if IO_CONCAT(__IO_PREFIX,trivial_rw_bw) == 1
> 
> and:
> 
> #if IO_CONCAT(__IO_PREFIX,trivial_rw_lq) == 1
> 
> respectively, with corresponding out-of-line entry points available, so 
> that there is no extra inline code produced where the call to the relevant 
> MMIO accessor is going to end up with an actual function call, as this 
> would not help performance in any way and would expand code unnecessarily 
> at all call sites.
> 
>  Therefore I suggest that your new `static inline' functions follow the 
> pattern, perhaps by grouping them with the corresponding ordinary accessor 
> functions in arch/alpha/include/asm/io.h within the relevant existing 
> #ifdef, and then by making them `extern inline' and providing out-of-line 
> implementations in arch/alpha/kernel/io.c, with the individual symbols 
> exported.  Within arch/alpha/kernel/io.c the compiler will still inline 
> code as it sees fit as it already does, e.g. `__raw_readq' might get 
> inlined in `readq' if it turns out cheaper than arranging for an actual 
> call, including all the stack frame preparation for `ra' preservation; 
> it's less likely with say `writeq' which probably always ends with a tail 
> call to `__raw_writeq' as no stack frame is required in that case.
> 
>  That for the read accessors.

I think that making the read*_relaxed functions extern inline just causes 
source code bloat with no practical gain - if we make them extern inline, 
we would need two implementations (one in the include file, the other in 
the C file) - and it is not good practice to duplicate code.

The functions __raw_read* are already extern inline, so the compiler will 
inline/noinline them depending on the macros trivial_io_bw and 
trivial_io_lq - so we can just call them from read*_relaxed without 
repeating the extern inline pattern.

> > +static inline void writeb_relaxed(u8 b, volatile void __iomem *addr)
> > +{
> > +	mb();
> > +	__raw_writeb(b, addr);
> > +}
> [etc.]
> 
>  Conversely for the write accessors, keeping in mind what I have noted 
> above, I suggest that you just redirect the existing aliases to the 
> ordinary accessors, as there will be no difference anymore between the 
> respective ordinary and relaxed accessors.  That is:
> 
> #define writeb_relaxed(b, addr)	writeb(b, addr)

Yes - that's a good point.

> etc.
> 
>  Let me know if you have any further questions or comments.
> 
>   Maciej

Mikulas

