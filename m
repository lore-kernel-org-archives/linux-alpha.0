From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH 1/2] alpha: Remove "strange" OSF/1 fork semantics
Date: Thu, 31 Jul 2014 00:35:25 +0100
Message-ID: <yw1xfvhi5sjm.fsf@unicorn.mansr.com>
References: <1406756552-23864-1-git-send-email-rth@twiddle.net>
	<1406756552-23864-2-git-send-email-rth@twiddle.net>
	<yw1xk36u5wrf.fsf@unicorn.mansr.com> <53D97A9E.3090908@twiddle.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <53D97A9E.3090908@twiddle.net> (Richard Henderson's message of
	"Wed, 30 Jul 2014 13:07:10 -1000")
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Richard Henderson <rth@twiddle.net>
Cc: linux-kernel@vger.kernel.org, mcree@orcon.net.nz, linux-alpha@vger.kernel.org

Richard Henderson <rth@twiddle.net> writes:

> On 07/30/2014 12:04 PM, M=E5ns Rullg=E5rd wrote:
>> Richard Henderson <rth@twiddle.net> writes:
>>=20
>>> The assignment to regs->r20 kills the original tls_val input
>>> to the clone syscall, which means that clone can no longer be
>>> restarted with the original inputs.
>>>
>>> We could, perhaps, retain this result for true fork, but OSF/1
>>> compatibility is no longer important.  Note that glibc has never
>>> used the r20 result value, instead always testing r0 vs 0 to
>>> determine the child/parent status.
>>=20
>> What effect does this have on OSF/1 compat?
>
> I don't know, as I've never had access to osf/1 myself.  It depends o=
n
> how that $20 value is used -- potentially, fork(3) no longer works.

That would render the entire OSF/1 compat useless.

> I can imagine that we could retain these assignments under the
> condition of clone_flags =3D=3D 0, which both implies a basic fork as=
 well
> as the fact that the tls_val argument is unused.
>
> But I do have to ask first if anyone actually cares.  Surely the
> amount of osf-on-linux emulation is a vanishingly small proportion of
> the already small alpha-linux population.

I don't like the idea of breaking features without good reason.  It's
also not obvious to me that those who have reasons to run Alpha hardwar=
e
at all also don't have reasons to run OSF/1 binaries on it.

I have Alpha machines with both Linux and OSF/1 (Tru64), so I could run
some quick tests, though I'm not certain what would make a good test
case for this.

--=20
M=E5ns Rullg=E5rd
mans@mansr.com
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
