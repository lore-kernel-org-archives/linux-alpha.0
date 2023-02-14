From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 19/24] xtensa/cpu: Make sure cpu_die() doesn't return
Date: Tue, 14 Feb 2023 11:48:41 -0800
Message-ID: <CAMo8BfLzV0Oe_i-QrMzE-BE028s6GNvOd827N5+tteELidjpvA@mail.gmail.com>
References: <cover.1676358308.git.jpoimboe@kernel.org> <cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
 <1b4afd82-83cb-0060-7cab-8e16d2e69ff9@linaro.org> <20230214182322.r5tyeowxzloiuh72@treble>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KPvoJ4GnlMgsohhv5ZFTkjPNgvE0397TI0CYAnCxqM=;
        b=Gr6T/uMmQW0P2TPA5kU2B0SezfYIPng0GmMu1nbsnL7n4Qhw9RF68MIXO9T2lIb4Vd
         9XqzWMo3zWupmo7DDnQIRZvSJhGTc3cJrOSj6qnw7ZLFMuv1jhehz7SDmTyxss5IvAuF
         ITBMuNHAK1NOe9nMNVZ11QjpI/ucBxZuVeSuDtnc42j7aN5Y3/LFY0jJey9dm6rJdUJ4
         LHKBtyEUPuxrQMMdOfkgTlii7etUm1Jsa4u0tgyMoqTav4keZsI205xjLS15k/6dNP48
         pxdBRqWKGSlZs5JtldCGgNcu4SmZfcR6VtsRIgsyLA6/xT3/Y75dtU4bMody4IfGBQxC
         Gv8w==
In-Reply-To: <20230214182322.r5tyeowxzloiuh72@treble>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, linux-kernel@vger.kernel.org, jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net

On Tue, Feb 14, 2023 at 10:23 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote=
:
> On Tue, Feb 14, 2023 at 08:55:32AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Can you update the documentation along? Currently we have:
> >
> >   /*
> >    * Called from the idle thread for the CPU which has been shutdown.
> >    *
> >    * Note that we disable IRQs here, but do not re-enable them
> >    * before returning to the caller. This is also the behaviour
> >    * of the other hotplug-cpu capable cores, so presumably coming
> >    * out of idle fixes this.
> >    */
>
> void __ref cpu_die(void)
> {
>         idle_task_exit();
>         local_irq_disable();
>         __asm__ __volatile__(
>                         "       movi    a2, cpu_restart\n"
>                         "       jx      a2\n");
>
>         BUG();
> }
>
> Hm, not only is the comment wrong, but it seems to be branching to
> cpu_restart?  That doesn't seem right at all.

Perhaps the name is a bit misleading. The CPU that enters 'cpu_restart'
loops there until a call to 'boot_secondary' releases it, after which it go=
es
to '_startup'. So it is a restart, but not immediate.

--=20
Thanks.
-- Max
