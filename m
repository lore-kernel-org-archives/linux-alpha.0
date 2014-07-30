From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH 1/2] alpha: Remove "strange" OSF/1 fork semantics
Date: Wed, 30 Jul 2014 23:04:20 +0100
Message-ID: <yw1xk36u5wrf.fsf@unicorn.mansr.com>
References: <1406756552-23864-1-git-send-email-rth@twiddle.net>
	<1406756552-23864-2-git-send-email-rth@twiddle.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1406756552-23864-2-git-send-email-rth@twiddle.net> (Richard
	Henderson's message of "Wed, 30 Jul 2014 11:42:31 -1000")
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Richard Henderson <rth@twiddle.net>
Cc: linux-kernel@vger.kernel.org, mcree@orcon.net.nz, linux-alpha@vger.kernel.org

Richard Henderson <rth@twiddle.net> writes:

> The assignment to regs->r20 kills the original tls_val input
> to the clone syscall, which means that clone can no longer be
> restarted with the original inputs.
>
> We could, perhaps, retain this result for true fork, but OSF/1
> compatibility is no longer important.  Note that glibc has never
> used the r20 result value, instead always testing r0 vs 0 to
> determine the child/parent status.

What effect does this have on OSF/1 compat?

> This failure can be seen in the glibc nptl/tst-eintr* tests.
>
> Reported-by: Michael Cree <mcree@orcon.net.nz>
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---
>  arch/alpha/kernel/process.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.=
c
> index 1941a07..77028d7 100644
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -278,8 +278,6 @@ copy_thread(unsigned long clone_flags, unsigned l=
ong usp,
>  	*childregs =3D *regs;
>  	childregs->r0 =3D 0;
>  	childregs->r19 =3D 0;
> -	childregs->r20 =3D 1;	/* OSF/1 has some strange fork() semantics.  =
*/
> -	regs->r20 =3D 0;
>  	stack =3D ((struct switch_stack *) regs) - 1;
>  	*childstack =3D *stack;
>  	childstack->r26 =3D (unsigned long) ret_from_fork;
> --=20
> 1.9.3
>

--=20
M=E5ns Rullg=E5rd
mans@mansr.com
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
