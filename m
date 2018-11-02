From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] include/asm/cmpxchg.h: Remove duplicate header
Date: Fri, 2 Nov 2018 12:14:50 -0700
Message-ID: <CAEdQ38FNiY78zXMtqCUCjiGYBfjHXnDTQia3a62hJ_6UG3O+gw@mail.gmail.com>
References: <20181102152637.GA3105@hp-pavilion-15-notebook-pc-brajeswar>
 <20181102182905.3klrdw4dxapeoiib@tower> <CAFqt6zYmBFQ7gDJJkYAhPzPYyLGsDqOdr8ctXmYbd7e9sv75xg@mail.gmail.com>
 <CAEdQ38Fh99QmusGbEBi9TjUKQbQDX90pEaUC5Y=s-BL=RQ3o_A@mail.gmail.com> <CAFqt6zboDwTNUkvhRi2s=LUnqhvXoHtGQFkrUrW+2bCEb=5RRQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JDk1X3K4DSQkY1TL+z8S6gHQ4fsyb/pjGxgKFSecu0A=;
        b=LMeVSXftNyh8+Fn/zG5SQdXRbewBOYgyQkFtP9dcO4B3MmWtyXgshkHyOcJ0mFnoYG
         FpdlXLbA33kAJGyztxPolkiWtCNPuYlKYLWs8s1Db0HRiicPCuM07hqiCcSoeRqGh/17
         O9k3g3P+WhtnybTu9xsvmUKmhJaQW7uuwf7/5lIi0ycVOQLz6iFyKebdhmGlONZBeDCN
         LGKFoX0TtP17pFPYIns5CQCNPI2ibJUIPGUKTT5XPeATfRz0T1dyyB44khowFbegJ+d0
         cXohLzJdWZC28VWpUp+aWYL40T1t7HJjZfY/jB860zmAYstP/cuLTGr0eMs22QFQNQD3
         MPXQ==
In-Reply-To: <CAFqt6zboDwTNUkvhRi2s=LUnqhvXoHtGQFkrUrW+2bCEb=5RRQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jrdr.linux@gmail.com
Cc: Michael Cree <mcree@orcon.net.nz>, brajeswar.linux@gmail.com, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Andrea Parri <parri.andrea@gmail.com>, Ingo Molnar <mingo@kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, sabyasachi.linux@gmail.com

On Fri, Nov 2, 2018 at 12:09 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> On Sat, Nov 3, 2018 at 12:31 AM Matt Turner <mattst88@gmail.com> wrote:
> >
> > On Fri, Nov 2, 2018 at 11:55 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
> > > We run the static analyser "make includecheck" which list out files where
> > > duplicate headers can be removed and based on that we thought to remove
> > > from this file. Didn't understood about the existence of second include ??
> >
> >
> > #define ____xchg(type, args...)         __xchg ## type ## _local(args)
> > #define ____cmpxchg(type, args...)      __cmpxchg ## type ## _local(args)
> > #include <asm/xchg.h>
> > [snip]
> > #undef ____xchg
> > #undef ____cmpxchg
> > #define ____xchg(type, args...)         __xchg ##type(args)
> > #define ____cmpxchg(type, args...)      __cmpxchg ##type(args)
> > #include <asm/xchg.h>
> >
> > asm/xchg.h has a comment at the top that says
> >
> > /*
> >  * xchg/xchg_local and cmpxchg/cmpxchg_local share the same code
> >  * except that local version do not have the expensive memory barrier.
> >  * So this file is included twice from asm/cmpxchg.h.
> >  */
>
> Thanks Matt. Sorry for the noise.
> Is there any way to exclude it from static analyser that someone else will
> not do the same mistake in future ?

Since this is not an uncommon pattern in C, I think any static
analysis tool that attempts to find duplicate includes should attempt
to recognize such a pattern.

That, or humans should review the output of their static analysis
tools. Or you could try to compile the patches produced. I think any
of those would have caught the problem with the patch.
