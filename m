From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v2 19/24] xtensa/cpu: Make sure cpu_die() doesn't return
Date: Tue, 14 Feb 2023 12:19:09 -0800
Message-ID: <20230214201909.flqc3g3njnbl5hun@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
 <1b4afd82-83cb-0060-7cab-8e16d2e69ff9@linaro.org>
 <20230214182322.r5tyeowxzloiuh72@treble>
 <CAMo8BfLzV0Oe_i-QrMzE-BE028s6GNvOd827N5+tteELidjpvA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676405952;
        bh=8/V8zQrKDfVgeKbs27WthihxgwdivBHQ1xvEeA6uoYs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vQOpB4jZU06j0E1MKDDJZEPPNRmXS0/cOAjGFTxoXLPrgQIK/B47hTb0QFcKIneZb
         s0jPY923NwwG0EAaHw8yq2VeY+rnIZejt5UaWx/A6Novye6lAoPweaDLN/vVDTfV4/
         z2wbU080F9o3lsW1XlbaHeONXQOQPrvD/SUfEbdGlUuV0/0zX3LoW10/MVrsarzBdE
         ceX7Oa5FeZeJLYpScL4JzHvW13XbOGzyYkvzihDtHpZE/AnlwkFrJ1ZK6bjfdTEzD6
         0YVc817WUB5hgfgY4gpdM1zFQ3vDBu3uys4X8js6W3ZOQyDxWfawx8vYr8MN57D9M7
         IlAUpkSGii2pg==
Content-Disposition: inline
In-Reply-To: <CAMo8BfLzV0Oe_i-QrMzE-BE028s6GNvOd827N5+tteELidjpvA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lis

On Tue, Feb 14, 2023 at 11:48:41AM -0800, Max Filippov wrote:
> On Tue, Feb 14, 2023 at 10:23 AM Josh Poimboeuf <jpoimboe@kernel.org> wro=
te:
> > On Tue, Feb 14, 2023 at 08:55:32AM +0100, Philippe Mathieu-Daud=C3=A9 w=
rote:
> > > Can you update the documentation along? Currently we have:
> > >
> > >   /*
> > >    * Called from the idle thread for the CPU which has been shutdown.
> > >    *
> > >    * Note that we disable IRQs here, but do not re-enable them
> > >    * before returning to the caller. This is also the behaviour
> > >    * of the other hotplug-cpu capable cores, so presumably coming
> > >    * out of idle fixes this.
> > >    */
> >
> > void __ref cpu_die(void)
> > {
> >         idle_task_exit();
> >         local_irq_disable();
> >         __asm__ __volatile__(
> >                         "       movi    a2, cpu_restart\n"
> >                         "       jx      a2\n");
> >
> >         BUG();
> > }
> >
> > Hm, not only is the comment wrong, but it seems to be branching to
> > cpu_restart?  That doesn't seem right at all.
>=20
> Perhaps the name is a bit misleading. The CPU that enters 'cpu_restart'
> loops there until a call to 'boot_secondary' releases it, after which it =
goes
> to '_startup'. So it is a restart, but not immediate.

Ah, I see.  That sounds similar to what Xen does.

--=20
Josh
