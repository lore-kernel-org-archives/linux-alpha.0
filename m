From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH v2] Alpha: unbreak osf_setsysinfo(SSI_NVPAIRS,
 [SSIN_UACPROC, UAC_SIGBUS])
Date: Sun, 14 Aug 2011 20:32:48 -0400
Message-ID: <CAEdQ38EjVZcjDVf=0SwdmMb7+TQETvPtFwGr1CPG4oZVckShtA@mail.gmail.com>
References: <1313182881-21266-1-git-send-email-slyfox@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=+UXh7SdAUR7scWzAe/vODvO3CcgpA1d46O8HJxrrFgs=;
        b=EWqk0uKn2OKRMhBZiXC8dOXmtYKS4R65jjb1iQJaIEQbj8SmLflnSXrdBw6pOcKNxY
         MVfjmn0RTrAuwDej8UHieVOdMUu2acBQTws8JlQ4sfSIF8NC/dKJAQ2E/Yo3J4QRuWxo
         4D0suzxbIvyv9r1s2UEq2SvJuTJwOPYVnZTJI=
In-Reply-To: <1313182881-21266-1-git-send-email-slyfox@gentoo.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sergei Trofimovich <slyfox@gentoo.org>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On Fri, Aug 12, 2011 at 5:01 PM, Sergei Trofimovich <slyfox@gentoo.org>=
 wrote:
> The bug was accidentally found by the following program:
> =A0 =A0#include <asm/sysinfo.h>
> =A0 =A0#include <asm/unistd.h>
> =A0 =A0#include <sys/syscall.h>
> =A0 =A0static int setsysinfo(unsigned long op, void *buffer, unsigned=
 long size,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int *start, void *=
arg, unsigned long flag) {
> =A0 =A0 =A0 =A0return syscall(__NR_osf_setsysinfo, op, buffer, size, =
start, arg, flag);
> =A0 =A0}
>
> =A0 =A0int main(int argc, char **argv) {
> =A0 =A0 =A0 =A0short x[10];
> =A0 =A0 =A0 =A0unsigned int buf[2] =3D { SSIN_UACPROC, UAC_SIGBUS, };
> =A0 =A0 =A0 =A0setsysinfo(SSI_NVPAIRS, buf, 1, 0, 0, 0);
>
> =A0 =A0 =A0 =A0int =A0*y =3D (int*) (x+1);
> =A0 =A0 =A0 =A0*y =3D 0;
> =A0 =A0 =A0 =A0return 0;
> =A0 =A0}
>
> The program shoud fail on SIGBUS, but didn't.
>
> The patch is a second part of userspace flag fix:
>> commit 745dd2405e281d96c0a449103bdf6a895048f28c
>> Author: Michael Cree <mcree@orcon.net.nz>
>> Date: =A0 Mon Nov 30 22:44:40 2009 -0500
>>
>> =A0 =A0Alpha: Rearrange thread info flags fixing two regressions
>>
>> =A0 =A0Both regressions fixed by (1) rearranging TIF_NOTIFY_RESUME f=
lag to be
>> =A0 =A0in lower 8 bits of the thread info flags, and (2) making sure=
 that
>> =A0 =A0ALPHA_UAC_SHIFT matches the rearrangement of the thread info =
flags.
>
> Deleted outdated out-of-sync 'UAC_SHIFT' (the cause of bug) in favour=
 of 'ALPHA_UAC_SHIFT'.
>
> Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> Cc: linux-alpha@vger.kernel.org
> Cc: Michael Cree <mcree@orcon.net.nz>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> ---
> =A0arch/alpha/include/asm/sysinfo.h =A0 =A0 | =A0 =A09 ---------
> =A0arch/alpha/include/asm/thread_info.h | =A0 =A08 ++++----
> =A0arch/alpha/kernel/osf_sys.c =A0 =A0 =A0 =A0 =A0| =A0 =A07 ++++---
> =A03 files changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/arch/alpha/include/asm/sysinfo.h b/arch/alpha/include/as=
m/sysinfo.h
> index 086aba2..e77d77c 100644
> --- a/arch/alpha/include/asm/sysinfo.h
> +++ b/arch/alpha/include/asm/sysinfo.h
> @@ -27,13 +27,4 @@
> =A0#define UAC_NOFIX =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02
> =A0#define UAC_SIGBUS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 4
>
> -
> -#ifdef __KERNEL__
> -
> -/* This is the shift that is applied to the UAC bits as stored in th=
e
> - =A0 per-thread flags. =A0See thread_info.h. =A0*/
> -#define UAC_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A06
> -
> -#endif
> -
> =A0#endif /* __ASM_ALPHA_SYSINFO_H */
> diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/includ=
e/asm/thread_info.h
> index 6f32f9c..ff73db0 100644
> --- a/arch/alpha/include/asm/thread_info.h
> +++ b/arch/alpha/include/asm/thread_info.h
> @@ -74,9 +74,9 @@ register struct thread_info *__current_thread_info =
__asm__("$8");
> =A0#define TIF_NEED_RESCHED =A0 =A0 =A0 3 =A0 =A0 =A0 /* rescheduling=
 necessary */
> =A0#define TIF_POLLING_NRFLAG =A0 =A0 8 =A0 =A0 =A0 /* poll_idle is p=
olling NEED_RESCHED */
> =A0#define TIF_DIE_IF_KERNEL =A0 =A0 =A09 =A0 =A0 =A0 /* dik recursio=
n lock */
> -#define TIF_UAC_NOPRINT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A010 =A0 =A0 =A0=
/* see sysinfo.h */
> -#define TIF_UAC_NOFIX =A0 =A0 =A0 =A0 =A011
> -#define TIF_UAC_SIGBUS =A0 =A0 =A0 =A0 12
> +#define TIF_UAC_NOPRINT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A010 =A0 =A0 =A0=
/* ! Preserve sequence of following */
> +#define TIF_UAC_NOFIX =A0 =A0 =A0 =A0 =A011 =A0 =A0 =A0/* ! flags as=
 they match =A0 =A0 =A0 =A0 =A0 =A0*/
> +#define TIF_UAC_SIGBUS =A0 =A0 =A0 =A0 12 =A0 =A0 =A0/* ! userspace =
part of 'osf_sysinfo' */
> =A0#define TIF_MEMDIE =A0 =A0 =A0 =A0 =A0 =A0 13 =A0 =A0 =A0/* is ter=
minating due to OOM killer */
> =A0#define TIF_RESTORE_SIGMASK =A0 =A014 =A0 =A0 =A0/* restore signal=
 mask in do_signal */
> =A0#define TIF_FREEZE =A0 =A0 =A0 =A0 =A0 =A0 16 =A0 =A0 =A0/* is fre=
ezing for suspend */
> @@ -97,7 +97,7 @@ register struct thread_info *__current_thread_info =
__asm__("$8");
> =A0#define _TIF_ALLWORK_MASK =A0 =A0 =A0(_TIF_WORK_MASK =A0 =A0 =A0 =A0=
 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | _TI=
=46_SYSCALL_TRACE)
>
> -#define ALPHA_UAC_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A010
> +#define ALPHA_UAC_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0TIF_UAC_NOPRI=
NT
> =A0#define ALPHA_UAC_MASK =A0 =A0 =A0 =A0 (1 << TIF_UAC_NOPRINT | 1 <=
< TIF_UAC_NOFIX | \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 << =
TIF_UAC_SIGBUS)
>
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.=
c
> index 326f0a2..2032f67 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -42,6 +42,7 @@
> =A0#include <asm/uaccess.h>
> =A0#include <asm/system.h>
> =A0#include <asm/sysinfo.h>
> +#include <asm/thread_info.h>
> =A0#include <asm/hwrpb.h>
> =A0#include <asm/processor.h>
>
> @@ -633,7 +634,7 @@ SYSCALL_DEFINE5(osf_getsysinfo, unsigned long, op=
, void __user *, buffer,
> =A0 =A0 =A0 =A0case GSI_UACPROC:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (nbytes < sizeof(unsigned int))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 w =3D (current_thread_info()->flags >> =
UAC_SHIFT) & UAC_BITMASK;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 w =3D (current_thread_info()->flags >> =
ALPHA_UAC_SHIFT) & UAC_BITMASK;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (put_user(w, (unsigned int __user *=
)buffer))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EFAULT;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;
> @@ -756,8 +757,8 @@ SYSCALL_DEFINE5(osf_setsysinfo, unsigned long, op=
, void __user *, buffer,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case SSIN_UACPROC:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0again:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0old =3D=
 current_thread_info()->flags;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 new =3D=
 old & ~(UAC_BITMASK << UAC_SHIFT);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 new =3D=
 new | (w & UAC_BITMASK) << UAC_SHIFT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 new =3D=
 old & ~(UAC_BITMASK << ALPHA_UAC_SHIFT);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 new =3D=
 new | (w & UAC_BITMASK) << ALPHA_UAC_SHIFT;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (cm=
pxchg(&current_thread_info()->flags,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0old, new) !=3D old)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0goto again;
> --
> 1.7.3.4

Thanks for finding and fixing this bug. I've added it to my tree.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
