From: Richard Henderson <rth@twiddle.net>
Subject: Re: [RFC][PATCH] extable: Make sure all archs define _sdata
Date: Fri, 20 May 2011 07:28:32 -0700
Message-ID: <4DD67A90.7010908@twiddle.net>
References: <1305855298.1465.19.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:message-id:date:from:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=/BxG+7UtFI+PmcUv9Wr4VRqmJ5P/3k9OPj7HxS6PKjM=;
        b=m2Oup/lD4V27KnnBlF3o+es6f7a/Cwnb2BOjULL3aKcNXuW6MXIId0FYQLmLG5rNRW
         xDwQXiuk2fnhsQ6NVTwXDpO8R/2trli3CgVm/F9+R+FdLmRkH8eBJtrl4Xf9KYndPdr1
         M5SP9KkQQ7nWx5zWBIPkiNTuHos8jcbUYYN1I=
In-Reply-To: <1305855298.1465.19.camel@gandalf.stny.rr.com>
Sender: linux-m68k-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Hirokazu Takata <takata@linux-m32r.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>, "JamesE.J.Bottomley" <jejb@parisc-linux.org>

On 05/19/2011 06:34 PM, Steven Rostedt wrote:
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
> 
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

Acked-by: Richard Henderson <rth@twiddle.net>

Although I suppose if we're supposedly standardizing on _sdata,
the two uses of _data in arch/alpha/mm/ could be transitioned.


r~
