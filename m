From: lapinlam@vega.lnet.lut.fi (Tomi Lapinlampi)
Subject: Re: [alpha] linux-2.6.10-rc1-bk20 compile error
Date: Mon, 15 Nov 2004 23:07:19 +0200
Message-ID: <20041115210719.GC690@vega.lnet.lut.fi>
References: <1100202570.26565.3.camel@pro30.local.promotion-ie.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S261712AbUKOVLR@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1100202570.26565.3.camel@pro30.local.promotion-ie.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Rauth <Alexander.Rauth@promotion-ie.de>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-alpha <linux-alpha@vger.kernel.org>

On Thu, Nov 11, 2004 at 08:49:30PM +0100, Alexander Rauth wrote:
> 
> error appears with linux-2.6.10-rc1-bk20:
> 
>   CC      arch/alpha/kernel/setup.o
> arch/alpha/kernel/setup.c: In function `setup_arch':
> arch/alpha/kernel/setup.c:597: warning: implicit declaration of function
> `__sysrq_get_key_op'
> arch/alpha/kernel/setup.c:597: warning: initialization makes pointer
> from integer without a cast
> make[1]: *** [arch/alpha/kernel/setup.o] Error 1
> make: *** [arch/alpha/kernel] Error 2
> 

Hi,

This issue is still present in 2.6.10-rc2.

drivers/char/sysrq.c no longer exports __sysrq_get_key_op which
is required by arch/alpha/kernel/setup.c.

Tomi

