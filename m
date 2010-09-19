From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: fix build breakage in asm/cacheflush.h
Date: Sun, 19 Sep 2010 00:52:19 -0400
Message-ID: <AANLkTimsf03FvWeTV0mC=dX7vsH=6yihiXa5MH_raAw+@mail.gmail.com>
References: <20100914002132.bf17c19e.sfr@canb.auug.org.au> <4C8F39A6.10504@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=mBc4511Q+/2mEOOX+ZUT3ox+PEtzafHAeLB19/r+kbc=;
        b=w1ZXx7fRDVh2HszjAbPaElj+YZJIkob9RzqVpCQLVgsYWVTADp/PU6eAWtusOjQNKL
         b6UnR9Kvg1HwJq0S6TtFfje0R2NFm/z1yPKFupZpYZmGJSgUumyhCeURYkedJK8l26f5
         84+ND1GfyBG5R2pISC1IVlqc2+2TCuo1LMNvs=
In-Reply-To: <4C8F39A6.10504@kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tejun Heo <tj@kernel.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Sep 14, 2010 at 5:00 AM, Tejun Heo <tj@kernel.org> wrote:
> Alpha SMP flush_icache_user_range() is implemented as an inline
> function inside include/asm/cacheflush.h. =A0It dereferences @current
> but doesn't include linux/sched.h and thus causes build failure if
> linux/sched.h wasn't included previously. =A0Fix it by including the
> needed header file explicitly.
>
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> =A0arch/alpha/include/asm/cacheflush.h | =A0 =A02 ++
> =A01 file changed, 2 insertions(+)
>
> diff --git a/arch/alpha/include/asm/cacheflush.h b/arch/alpha/include=
/asm/cacheflush.h
> index 01d71e1..012f124 100644
> --- a/arch/alpha/include/asm/cacheflush.h
> +++ b/arch/alpha/include/asm/cacheflush.h
> @@ -43,6 +43,8 @@ extern void smp_imb(void);
> =A0/* ??? Ought to use this in arch/alpha/kernel/signal.c too. =A0*/
>
> =A0#ifndef CONFIG_SMP
> +#include <linux/sched.h>
> +
> =A0extern void __load_new_mm_context(struct mm_struct *);
> =A0static inline void
> =A0flush_icache_user_range(struct vm_area_struct *vma, struct page *p=
age,

Thanks! Applied this to my tree and sent it to Linus.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
