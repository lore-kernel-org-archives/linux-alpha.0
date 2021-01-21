From: Chunyou Tang <tangchunyou@163.com>
Subject: Re: [PATCH] arch/alpha: fix typo in a comment in
 arch/alpha/boot/bootpz.c
Date: Thu, 21 Jan 2021 10:20:42 +0800
Message-ID: <20210121102042.00005504@163.com>
References: <20210120133410.2182-1-tangchunyou@163.com>
        <5e4ed85d-140c-3d85-e4f4-97b27fa37885@infradead.org>
        <0df77d48-8541-32c9-d39d-3e59f89f1f86@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=suB9M
        vgNkgi6OBoaUS2FIQFjCRzO9+B2UkAsx0+Ld/4=; b=mT5qT08jGB9Yevps0oaMY
        6ueIVt8dDzFAmRTxnPxuXEQZloK2CsHujxOgZAQew3jSJTrJLnzND2Pb2g+8HHtW
        yX+hDhnojluleaPrx+ESHtUr2ACOvH3a49jWXqnaAuWtnCL7KYAqL9LhmYJgWWo5
        zobbFLNszLcAjOnk7bAMOU=
In-Reply-To: <0df77d48-8541-32c9-d39d-3e59f89f1f86@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, ink@jurassic.park.msu.ru, mattst88@gmail.com, akpm@linux-foundation.org, rppt@kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, zhangwen@yulong.com, tangchunyou@yulong.com

On Wed, 20 Jan 2021 17:37:07 +0100
John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:

> On 1/20/21 5:20 PM, Randy Dunlap wrote:
> > On 1/20/21 5:34 AM, ChunyouTang wrote:  
> >> From: tangchunyou <tangchunyou@yulong.com>
> >>
> >> "kerne" -> "kernel"
> >>
> >> Signed-off-by: tangchunyou <tangchunyou@yulong.com>
> >> ---
> >>  arch/alpha/boot/bootpz.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
> >> index 43af718..61b61be 100644
> >> --- a/arch/alpha/boot/bootpz.c
> >> +++ b/arch/alpha/boot/bootpz.c
> >> @@ -200,7 +200,7 @@ extern int decompress_kernel(void*
> >> destination, void *source, START_ADDR	KSEG address of the
> >> entry point of kernel code. 
> >>  	ZERO_PGE	KSEG address of page full of zeroes, but 
> >> -			upon entry to kerne cvan be expected
> >> +			upon entry to kernel cvan be expected  
> > 
> > s/cvan/can/ also  
> 
> Right. Reading the whole paragraph helps. It probably should be:
> 
> ZERO_PGE	KSEG address of page full of zeroes, but
> 		upon entry to kernel, it can be expected
> 		to hold the parameter list and possible
> 		INTRD information.
> 
> Adrian
> 

ok, I change it as :
ZERO_PGE	KSEG address of page full of zeroes, but
		upon entry to kernel, it can be expected
		to hold the parameter list and possible
		INTRD information.
then I commit it.

Chunyou Tang

