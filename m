From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] Alpha: Rearrange thread info flags fixing two regressions
Date: Mon, 30 Nov 2009 23:06:52 -0500
Message-ID: <b4198de60911302006u43f52bd5xe198615971352696@mail.gmail.com>
References: <4AE8D005.1030302@twiddle.net>
	 <1256956383-2652-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=73ibCpEZYWXscQ6BAirFS9DzOh9c8CC+HaO3v1wLO1Y=;
        b=EzHmlH6by1S16yr3xYL5HZBk29EjVFUqn6JBLF1h/4+i83TgOEyeAsn0pmGfo8gl8i
         3ruALhR3lOiE3o+D0bzSz/eN6gjaDhw9U6fy5yM8Rp74vQi1JuvMZZr1jF5qP8YAY3IX
         MB/KLv82aOvLlbAjS9MnOJuNONrJ3jpspBz20=
In-Reply-To: <1256956383-2652-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, David Howells <dhowells@redhat.com>

On Fri, Oct 30, 2009 at 9:33 PM, Michael Cree <mcree@orcon.net.nz> wrot=
e:
> The removal of the TIF_NOTIFY_RESUME flag, commit a583f1b54249b
> "remove unused TIF_NOTIFY_RESUME flag," resulted in incorrect
> setting of the unaligned access control flags by the prctl syscall.
>
> The re-addition of the TIF_NOTIFY_RESUME flag, commit d0420c83f39f
> "KEYS: Extend TIF_NOTIFY_RESUME to (almost) all architectures [try #6=
]"
> further caused problems, namely incorrect operands to assembler code
> as evidenced by:
>
> AS =A0 =A0 =A0arch/alpha/kernel/entry.o
> arch/alpha/kernel/entry.S: Assembler messages:
> arch/alpha/kernel/entry.S:326: Warning: operand out of range (0x00000=
00000000406 is not between 0x0000000000000000 and 0x00000000000000ff)
>
> Both regressions fixed by (1) rearranging TIF_NOTIFY_RESUME flag to b=
e
> in lower 8 bits of the thread info flags, and (2) making sure that
> ALPHA_UAC_SHIFT matches the rearrangement of the thread info flags.
>
> Signed-off-by: Michael Cree <mcree@orcon.net.nz>
> ---
> =A0arch/alpha/include/asm/thread_info.h | =A0 27 +++++++++++++++-----=
-------
> =A01 files changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/includ=
e/asm/thread_info.h
> index e7a07f6..3ba4ded 100644
> --- a/arch/alpha/include/asm/thread_info.h
> +++ b/arch/alpha/include/asm/thread_info.h
> @@ -61,21 +61,24 @@ register struct thread_info *__current_thread_inf=
o __asm__("$8");
> =A0/*
> =A0* Thread information flags:
> =A0* - these are process state flags and used from assembly
> - * - pending work-to-be-done flags come first to fit in and immediat=
e operand.
> + * - pending work-to-be-done flags come first and must be assigned t=
o be
> + * =A0 within bits 0 to 7 to fit in and immediate operand.
> + * - ALPHA_UAC_SHIFT below must be kept consistent with the unaligne=
d
> + * =A0 control flags.
> =A0*
> =A0* TIF_SYSCALL_TRACE is known to be 0 via blbs.
> =A0*/
> =A0#define TIF_SYSCALL_TRACE =A0 =A0 =A00 =A0 =A0 =A0 /* syscall trac=
e active */
> -#define TIF_SIGPENDING =A0 =A0 =A0 =A0 1 =A0 =A0 =A0 /* signal pendi=
ng */
> -#define TIF_NEED_RESCHED =A0 =A0 =A0 2 =A0 =A0 =A0 /* rescheduling n=
ecessary */
> -#define TIF_POLLING_NRFLAG =A0 =A0 3 =A0 =A0 =A0 /* poll_idle is pol=
ling NEED_RESCHED */
> -#define TIF_DIE_IF_KERNEL =A0 =A0 =A04 =A0 =A0 =A0 /* dik recursion =
lock */
> -#define TIF_UAC_NOPRINT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A05 =A0 =A0 =A0=
 /* see sysinfo.h */
> -#define TIF_UAC_NOFIX =A0 =A0 =A0 =A0 =A06
> -#define TIF_UAC_SIGBUS =A0 =A0 =A0 =A0 7
> -#define TIF_MEMDIE =A0 =A0 =A0 =A0 =A0 =A0 8
> -#define TIF_RESTORE_SIGMASK =A0 =A09 =A0 =A0 =A0 /* restore signal m=
ask in do_signal */
> -#define TIF_NOTIFY_RESUME =A0 =A0 =A010 =A0 =A0 =A0/* callback befor=
e returning to user */
> +#define TIF_NOTIFY_RESUME =A0 =A0 =A01 =A0 =A0 =A0 /* callback befor=
e returning to user */
> +#define TIF_SIGPENDING =A0 =A0 =A0 =A0 2 =A0 =A0 =A0 /* signal pendi=
ng */
> +#define TIF_NEED_RESCHED =A0 =A0 =A0 3 =A0 =A0 =A0 /* rescheduling n=
ecessary */
> +#define TIF_POLLING_NRFLAG =A0 =A0 8 =A0 =A0 =A0 /* poll_idle is pol=
ling NEED_RESCHED */
> +#define TIF_DIE_IF_KERNEL =A0 =A0 =A09 =A0 =A0 =A0 /* dik recursion =
lock */
> +#define TIF_UAC_NOPRINT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A010 =A0 =A0 =A0=
/* see sysinfo.h */
> +#define TIF_UAC_NOFIX =A0 =A0 =A0 =A0 =A011
> +#define TIF_UAC_SIGBUS =A0 =A0 =A0 =A0 12
> +#define TIF_MEMDIE =A0 =A0 =A0 =A0 =A0 =A0 13
> +#define TIF_RESTORE_SIGMASK =A0 =A014 =A0 =A0 =A0/* restore signal m=
ask in do_signal */
> =A0#define TIF_FREEZE =A0 =A0 =A0 =A0 =A0 =A0 16 =A0 =A0 =A0/* is fre=
ezing for suspend */
>
> =A0#define _TIF_SYSCALL_TRACE =A0 =A0 (1<<TIF_SYSCALL_TRACE)
> @@ -94,7 +97,7 @@ register struct thread_info *__current_thread_info =
__asm__("$8");
> =A0#define _TIF_ALLWORK_MASK =A0 =A0 =A0(_TIF_WORK_MASK =A0 =A0 =A0 =A0=
 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | _TI=
=46_SYSCALL_TRACE)
>
> -#define ALPHA_UAC_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A06
> +#define ALPHA_UAC_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A010
> =A0#define ALPHA_UAC_MASK =A0 =A0 =A0 =A0 (1 << TIF_UAC_NOPRINT | 1 <=
< TIF_UAC_NOFIX | \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 << =
TIF_UAC_SIGBUS)
>
> --
> 1.6.3.3
>
> --

Applied to alpha-2.6.git. Thanks!

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
