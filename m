From: Balint Cristian <rezso@rdsor.ro>
Subject: Re: linux-2.6.0-test6 error during linking
Date: Mon, 29 Sep 2003 11:48:14 +0300
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <200309291148.14567.rezso@rdsor.ro>
References: <3F773C9D.3080009@bmind.it> <87d6dk3acp.fsf@student.uni-tuebingen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <87d6dk3acp.fsf@student.uni-tuebingen.de>
Content-Disposition: inline
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Falk Hueffner <falk.hueffner@student.uni-tuebingen.de>, Paolo Dovera <pdovera@bmind.it>
Cc: linux-alpha@vger.kernel.org

On Sunday 28 September 2003 23:51, Falk Hueffner wrote:
> Paolo Dovera <pdovera@bmind.it> writes:
> > Applied patch-2.6.0-test6 I receive the following error:
> >
> > kernel/built-in.o(.text+0x5068): In function `copy_process':
> > : undefined reference to `sched_clock'
> >
> > kernel/built-in.o(.text+0x506c): more undefined references to
> > `sched_clock' follow
>
> sched_clock is not implemented yet for Alpha. It is supposed to return
> a high resolution timer. As workaround, you could just copy the
> implementation from ARM, which simply returns the value based on
> jiffies.  Ideally, one would take into account the cycle counter, but
> it wraps every few seconds, which has to be taken care of.

Can post here a patch based on arm ?

I am courious to see it !

Eventualy post it on linux kernel list or to Richard Henderson ?

Thx a lot !

