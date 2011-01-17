From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: fix WARN_ON in __local_bh_enable()
Date: Mon, 17 Jan 2011 04:39:19 +0000
Message-ID: <AANLkTinxLaGqkh_JoCeQk=0AE7GBKdBKirG9Tc=SVD+K@mail.gmail.com>
References: <AANLkTinLCqS+E8CXmAfs51sWuPS1JtNguA2VcoKK4g4f@mail.gmail.com> <20110112220224.GB18643@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=eIpW66E5A1GPQl7462BJYa+8r28KPd7lcM9pIJQI28Y=;
        b=vR3CkklfdQZ8IWtmelqJMr4BLeIhVn3VzbEJw/N3wVIAMUGraoCIaSTG6B31gEHDuh
         wb/VgH5bRnPkXO/XtZGJ+u1xIMUzi043822NGqgrvNw6yZ2vmpnMBQvYAZI/o4Wjq6VN
         qNAU9gz4jzASg1f6L+kIVxv9U7Xn31QiMqZAI=
In-Reply-To: <20110112220224.GB18643@jurassic.park.msu.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-alpha@vger.kernel.org, Kyle McMartin <kyle@redhat.com>, Michael Cree <mcree@orcon.net.nz>

On Wed, Jan 12, 2011 at 10:02 PM, Ivan Kokshaysky
<ink@jurassic.park.msu.ru> wrote:
> Interrupts ought to be disabled _before_ irq_enter().
>
> Signed-off-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
>
> diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
> index 5912900..9ab234f 100644
> --- a/arch/alpha/kernel/irq.c
> +++ b/arch/alpha/kernel/irq.c
> @@ -160,15 +160,14 @@ handle_irq(int irq)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 irq_enter();
> =A0 =A0 =A0 =A0/*
> - =A0 =A0 =A0 =A0* handle_irq() must be called with IPL_MAX. Note tha=
t we do not
> + =A0 =A0 =A0 =A0* From here we must proceed with IPL_MAX. Note that =
we do not
> =A0 =A0 =A0 =A0 * explicitly enable interrupts afterwards - some MILO=
 PALcode
> =A0 =A0 =A0 =A0 * (namely LX164 one) seems to have severe problems wi=
th RTI
> =A0 =A0 =A0 =A0 * at IPL 0.
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0local_irq_disable();
> + =A0 =A0 =A0 irq_enter();
> =A0 =A0 =A0 =A0generic_handle_irq_desc(irq, desc);
> =A0 =A0 =A0 =A0irq_exit();
> =A0}
> -

Thanks! Applied.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
