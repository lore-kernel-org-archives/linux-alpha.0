From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] alpha: Fix double word in comments
Date: Thu, 1 Sep 2022 09:00:58 +1200
Message-ID: <Yw/MCsb9v6jXWcE1@creeky>
References: <20220830074202.11274-1-dengshaomin@cdjrlc.com>
 <3ad149d0-916c-e80e-ef17-ca406a4d7f6d@linaro.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3ad149d0-916c-e80e-ef17-ca406a4d7f6d@linaro.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Shaomin Deng <dengshaomin@cdjrlc.com>, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On Tue, Aug 30, 2022 at 07:52:56AM -0700, Richard Henderson wrote:
> On 8/30/22 00:42, Shaomin Deng wrote:
> > Delete the rebundant word "and" in comments.
> 
> typo.

Are you sure it's a typo and not that the first "and" is a conjunction
and the second "and" is a verb (more properly "and out") that acts on
the object, namely "those lines"?

Cheers
Michael.

> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> > 
> > Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
> > ---
> >   arch/alpha/kernel/irq_i8259.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/alpha/kernel/irq_i8259.c b/arch/alpha/kernel/irq_i8259.c
> > index 1dcf0d9038fd..db574dcd6675 100644
> > --- a/arch/alpha/kernel/irq_i8259.c
> > +++ b/arch/alpha/kernel/irq_i8259.c
> > @@ -147,7 +147,7 @@ isa_no_iack_sc_device_interrupt(unsigned long vector)
> >   	 */
> >   	/*
> >   	 *  The first read of gives you *all* interrupting lines.
> > -	 *  Therefore, read the mask register and and out those lines
> > +	 *  Therefore, read the mask register and out those lines
> >   	 *  not enabled.  Note that some documentation has 21 and a1
> >   	 *  write only.  This is not true.
> >   	 */
> 
