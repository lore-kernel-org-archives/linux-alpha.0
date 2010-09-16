From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] wire up fanotify and prlimit64 syscalls on Alpha
Date: Thu, 16 Sep 2010 10:49:01 -0400
Message-ID: <AANLkTi=r9u+snuhJCbv9ACSPC32sDj42xSyFA8S2j+HL@mail.gmail.com>
References: <19602.9703.537889.99030@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=i0WG9hiu/E9rXGRYRlHQ9NbWpJHNVQ2c5PgEOlLxlic=;
        b=giZQ+9SjVBEKFOwLDH30LfwfFmgavQhtoHjiJjn/SHIc/SvFmG50NlLyPijRIryQhP
         +JzVX8wp9j+aLmUQnb4WomP3SkCnHf8fV8xE9i6cdKrQsxA9gquQEaBJFJlA7a5NPmOu
         aLT3XySfTBgHe+Ykd73m5ueG5lsN5N9I9kW00=
In-Reply-To: <19602.9703.537889.99030@pilspetsen.it.uu.se>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mikael Pettersson <mikpe@it.uu.se>
Cc: linux-alpha@vger.kernel.org

On Thu, Sep 16, 2010 at 10:12 AM, Mikael Pettersson <mikpe@it.uu.se> wr=
ote:
> The 2.6.36-rc kernel added three new system calls:
> fanotify_init, fanotify_mark, and prlimit64. =A0This
> patch wires them up on Alpha.
>
> Built and booted on an XP900. =A0Untested beyond that.
>
> Signed-off-by: Mikael Pettersson <mikpe@it.uu.se>
> ---
> =A0arch/alpha/include/asm/unistd.h | =A0 =A05 ++++-
> =A0arch/alpha/kernel/systbls.S =A0 =A0 | =A0 =A03 +++
> =A02 files changed, 7 insertions(+), 1 deletion(-)
>
> diff -rupN linux-2.6.36-rc4/arch/alpha/include/asm/unistd.h linux-2.6=
=2E36-rc4.alpha-fanotify+prlimit64-syscalls/arch/alpha/include/asm/unis=
td.h
> --- linux-2.6.36-rc4/arch/alpha/include/asm/unistd.h =A0 =A02010-02-2=
5 14:45:00.000000000 +0100
> +++ linux-2.6.36-rc4.alpha-fanotify+prlimit64-syscalls/arch/alpha/inc=
lude/asm/unistd.h =A02010-09-16 15:50:45.000000000 +0200
> @@ -449,10 +449,13 @@
> =A0#define __NR_pwritev =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 491
> =A0#define __NR_rt_tgsigqueueinfo =A0 =A0 =A0 =A0 492
> =A0#define __NR_perf_event_open =A0 =A0 =A0 =A0 =A0 493
> +#define __NR_fanotify_init =A0 =A0 =A0 =A0 =A0 =A0 494
> +#define __NR_fanotify_mark =A0 =A0 =A0 =A0 =A0 =A0 495
> +#define __NR_prlimit64 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 496
>
> =A0#ifdef __KERNEL__
>
> -#define NR_SYSCALLS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0494
> +#define NR_SYSCALLS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0497
>
> =A0#define __ARCH_WANT_IPC_PARSE_VERSION
> =A0#define __ARCH_WANT_OLD_READDIR
> diff -rupN linux-2.6.36-rc4/arch/alpha/kernel/systbls.S linux-2.6.36-=
rc4.alpha-fanotify+prlimit64-syscalls/arch/alpha/kernel/systbls.S
> --- linux-2.6.36-rc4/arch/alpha/kernel/systbls.S =A0 =A0 =A0 =A02010-=
02-25 14:45:00.000000000 +0100
> +++ linux-2.6.36-rc4.alpha-fanotify+prlimit64-syscalls/arch/alpha/ker=
nel/systbls.S =A0 =A0 =A02010-09-16 15:50:45.000000000 +0200
> @@ -512,6 +512,9 @@ sys_call_table:
> =A0 =A0 =A0 =A0.quad sys_pwritev
> =A0 =A0 =A0 =A0.quad sys_rt_tgsigqueueinfo
> =A0 =A0 =A0 =A0.quad sys_perf_event_open
> + =A0 =A0 =A0 .quad sys_fanotify_init
> + =A0 =A0 =A0 .quad sys_fanotify_mark =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 /* 495 */
> + =A0 =A0 =A0 .quad sys_prlimit64
>
> =A0 =A0 =A0 =A0.size sys_call_table, . - sys_call_table
> =A0 =A0 =A0 =A0.type sys_call_table, @object
> --

Thanks! Will apply.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
