From: Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
Date: Thu, 11 May 2023 09:57:11 +0200
Message-ID: <ZFyf195PuoBmaV2N@osiris>
References: <20230510195806.2902878-1-nphamcs@gmail.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=yfYCleIUn+xWJ9AcJe62X2wnauCgiMhHoQILlx/ttD4=;
 b=LFq957axn1UNzTUzhvNVYlDHbCfcqhQ2pRD8ZLsFp/RSpjT1uBMJ/d7ENLNjdQvs8b/O
 ETkXd8kuOadcVr2pCLjNWw4G6MBgssGxGpZMpJIuASv1SpR0PUK34wuL0h5qEW2QJh35
 I82bYrl1LLcaa8T78oJT6a6wtEhLMGPImsQm6ZZ7OMLR004RU4Y4gi9OSAsfKRz/2fjX
 JzkG3CzcsaF9fSk6t5lnZ7W3md1J2Vb7gFuVV3BeMsGsW3QU1zaunkYp8Yy88gnQ5l6D
 XVrXeBgHCOF+7Jj5+rSLVfvXlTFdfCzT/ZEvy3XYrdn6a7Y8+/7BRN1ptdRgFVOcV3xn Hg== 
Content-Disposition: inline
In-Reply-To: <20230510195806.2902878-1-nphamcs@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, linux-api@vger.kernel.org, kernel-team@meta.com, linux-arch@vger.kernel.org, hannes@cmpxchg.org, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux@armlinux.org.uk, geert@linux-m68k.org, monstr@monstr.eu, tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, chris@zankel.net, jcmvbkbc@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, li

On Wed, May 10, 2023 at 12:58:06PM -0700, Nhat Pham wrote:
> cachestat is previously only wired in for x86 (and architectures using
> the generic unistd.h table):
> 
> https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs@gmail.com/
> 
> This patch wires cachestat in for all the other architectures.
> 
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
...
>  arch/s390/kernel/syscalls/syscall.tbl       | 1 +

Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
