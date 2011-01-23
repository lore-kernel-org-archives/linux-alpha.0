From: Matt Turner <mattst88@gmail.com>
Subject: Re: [patch 1/9] alpha: Replace deprecated spinlock initialization
Date: Sun, 23 Jan 2011 17:07:28 +0000
Message-ID: <AANLkTin1ct3NfBP8kiaEweA6ZEPTvKfCqgN-nVdJ0n0g@mail.gmail.com>
References: <20110123143631.392446736@linutronix.de> <20110123143836.940494132@linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=lkVu0gkKZpaEp8fieXLhxTEyeDMeDUvSmSBkeG+pXN4=;
        b=TZhbAiNumNGmjZFYgRhOmmwzDm4VgLWU+pM3j/nbN+xxjpay/1nLBrR7Am2w0xJZl6
         4gWHSfDzOvPH7ymK3NeNaIHPLuSlXkVSWNjGbhDI18HPmcwCPrJkfYprOHTkY+E4+i+d
         P/9LROQeV7ifk054ZcbxaDxx1SFZ63A1OUgWs=
In-Reply-To: <20110123143836.940494132@linutronix.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org

On Sun, Jan 23, 2011 at 3:16 PM, Thomas Gleixner <tglx@linutronix.de> w=
rote:
> SPIN_LOCK_UNLOCK is deprecated. Use the lockdep capable variant
> instead.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: linux-alpha@vger.kernel.org
> ---
> =A0arch/alpha/include/asm/rwsem.h | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> Index: linux-2.6/arch/alpha/include/asm/rwsem.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/arch/alpha/include/asm/rwsem.h
> +++ linux-2.6/arch/alpha/include/asm/rwsem.h
> @@ -39,7 +39,7 @@ struct rw_semaphore {
> =A0};
>
> =A0#define __RWSEM_INITIALIZER(name) \
> - =A0 =A0 =A0 { RWSEM_UNLOCKED_VALUE, SPIN_LOCK_UNLOCKED, \
> + =A0 =A0 =A0 { RWSEM_UNLOCKED_VALUE, __SPIN_LOCK_UNLOCKED((name).wai=
t_lock), \
> =A0 =A0 =A0 =A0LIST_HEAD_INIT((name).wait_list) }
>
> =A0#define DECLARE_RWSEM(name) \
>
>
> --

Thanks! I'll apply this.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
