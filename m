From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v2 04/24] arm64/cpu: Mark cpu_die() __noreturn
Date: Wed, 15 Feb 2023 11:45:38 -0800
Message-ID: <20230215194538.aiiris3uabnuvkkg@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <e47fc487980d5330e6059ac6e16416bec88cda0e.1676358308.git.jpoimboe@kernel.org>
 <14274f04-2991-95bd-c29b-07e86e8755c1@linaro.org>
 <Y+zZgZIP7RPIgyQf@FVFF77S0Q05N>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676490341;
        bh=jEHEKJREN3+faSwa9KQfDCZrIk1boGFeW1CEIEtwaE8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nR0NlH9Idu9r6K5BB6SiskW/nN4Duv8oUu4t8oAsMW/BA2jHnn50sUmTtFA09snEM
         MM4Q1KeVxIEK0CQ3heZ6KGEcJDJrmingPvv4ff3yLJnpeg2zJ4He1vCJjQd4s9mOGJ
         HhE0qrDT5xUO3xGvs5zweCTvugYIA2adLOusrfvLPAxv6b4Cny+j0eHRlRanyAeAV0
         ysxu48fte0a0SA7XcnPw1U31MXQzSfjcPpTrp4Qgi04O07kA/LeXjWVthIX5CMIF30
         JAfOEJGYLSGZoEytWeIGwTCLRlwIMdQ5V+BaoKw5Pr+bw7iEZ2yNGIfGT3LJDZnQTo
         qDwCO7AGpVLow==
Content-Disposition: inline
In-Reply-To: <Y+zZgZIP7RPIgyQf@FVFF77S0Q05N>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mark Rutland <mark.rutland@arm.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, dietmar.eggemann@arm.com, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, ri

On Wed, Feb 15, 2023 at 01:09:21PM +0000, Mark Rutland wrote:
> On Tue, Feb 14, 2023 at 09:13:08AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 14/2/23 08:05, Josh Poimboeuf wrote:
> > > cpu_die() doesn't return.  Annotate it as such.  By extension this al=
so
> > > makes arch_cpu_idle_dead() noreturn.
> > >=20
> > > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > > ---
> > >   arch/arm64/include/asm/smp.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/sm=
p.h
> > > index fc55f5a57a06..5733a31bab08 100644
> > > --- a/arch/arm64/include/asm/smp.h
> > > +++ b/arch/arm64/include/asm/smp.h
> > > @@ -100,7 +100,7 @@ static inline void arch_send_wakeup_ipi_mask(cons=
t struct cpumask *mask)
> > >   extern int __cpu_disable(void);
> > >   extern void __cpu_die(unsigned int cpu);
> > > -extern void cpu_die(void);
> > > +extern void __noreturn cpu_die(void);
> > >   extern void cpu_die_early(void);
> >=20
> > Shouldn't cpu_operations::cpu_die() be declared noreturn first?
>=20
> The cpu_die() function ends with a BUG(), and so does not return, even if=
 a
> cpu_operations::cpu_die() function that it calls erroneously returned.
>=20
> We *could* mark cpu_operations::cpu_die() as noreturn, but I'd prefer tha=
t we
> did not so that the compiler doesn't optimize away the BUG() which is the=
re to
> catch such erroneous returns.
>=20
> That said, could we please add __noreturn to the implementation of cpu_di=
e() in
> arch/arm64/kernel/smp.c? i.e. the fixup below.

Done.

> With that fixup:
>=20
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks!

--=20
Josh
