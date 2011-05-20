From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [RFC][PATCH] extable: Make sure all archs define _sdata
Date: Fri, 20 May 2011 07:34:19 +0100
Message-ID: <20110520063419.GA27802@linux-mips.org>
References: <1305855298.1465.19.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1305855298.1465.19.camel@gandalf.stny.rr.com>
Sender: linux-m68k-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Hirokazu Takata <takata@linux-m32r.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>, "JamesE.J.Bottomley" <jejb@parisc-linux.org>

On Thu, May 19, 2011 at 09:34:58PM -0400, Steven Rostedt wrote:

> Can I get an Acked-by (or comment) from the following Maintainers:
> 
>   alpha
>   m32r
>   m68k
>   mips
>   parisc
> 
> Ingo has discovered that one of my patches broke the builds of these
> architectures. Although he added a quick fix, this patch supplies the
> proper fix and touches the affected architectures. Please review and Ack
> (or NACK with guidance) this patch.
> 
> -- Steve
> 
> A new utility function is used to determine if a passed in address is
> part of core kernel data or not. It may or may not return true for RO
> data, but this utility must work for RW data. Thus both _sdata and
> _edata must be defined and continuous, without .init sections that may
> later be freed and replaced by volatile memory (memory that can be
> freed).
> 
> This utility function is used to determine if data is safe from ever
> being freed. Thus it should return true for all RW global data that is
> not in a module or has been allocated, or false otherwise.

Acked-by: Ralf Baechle <ralf@linux-mips.org>

Thanks,

  Ralf
