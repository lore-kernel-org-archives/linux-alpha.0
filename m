From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC][PATCH] extable: Make sure all archs define _sdata
Date: Fri, 20 May 2011 11:04:31 -0400
Message-ID: <1305903871.1465.22.camel@gandalf.stny.rr.com>
References: <1305855298.1465.19.camel@gandalf.stny.rr.com>
	 <4DD67A90.7010908@twiddle.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4DD67A90.7010908@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Hirokazu Takata <takata@linux-m32r.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>, "JamesE.J.Bottomley" <jejb@parisc-linux.org>

On Fri, 2011-05-20 at 07:28 -0700, Richard Henderson wrote:

> Although I suppose if we're supposedly standardizing on _sdata,
> the two uses of _data in arch/alpha/mm/ could be transitioned.
> 

If we start getting more uses of _sdata, then perhaps this would be a
good idea.

Currently I only need it to know if a pointer passed in to one of my
functions can be freed or not. If the pointer is pointing to a struct in
the core kernel data, it is safe from being freed. Anything else will
need the extra work to keep it safe (rcu logic and such) and takes a
path with a bit more overhead.

Thanks!

-- Steve


