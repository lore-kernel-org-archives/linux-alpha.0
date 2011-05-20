From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC][PATCH] extable: Make sure all archs define _sdata
Date: Fri, 20 May 2011 22:21:47 +0200
Message-ID: <20110520202147.GA24378@merkur.ravnborg.org>
References: <1305855298.1465.19.camel@gandalf.stny.rr.com> <4DD67A90.7010908@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4DD67A90.7010908@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Hirokazu Takata <takata@linux-m32r.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>, "JamesE.J.Bottomley" <jejb@parisc-linux.org>

> 
> Acked-by: Richard Henderson <rth@twiddle.net>
> 
> Although I suppose if we're supposedly standardizing on _sdata,
> the two uses of _data in arch/alpha/mm/ could be transitioned.

From include/asm-generic/vmlinux.lds.h:

 *
 *      _sdata = .;
 *      RO_DATA_SECTION(PAGE_SIZE)
 *      RW_DATA_SECTION(...)
 *      _edata = .;
 *

So yes - we do standardize on _sdata.
Other symbols for the same ought to be replaced...

	Sam
