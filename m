From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 19/24] xtensa/cpu: Make sure cpu_die() doesn't return
Date: Tue, 14 Feb 2023 14:29:44 -0500
Message-ID: <20230214142944.100214fe@rorschach.local.home>
References: <cover.1676358308.git.jpoimboe@kernel.org>
        <cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
        <1b4afd82-83cb-0060-7cab-8e16d2e69ff9@linaro.org>
        <20230214182322.r5tyeowxzloiuh72@treble>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20230214182322.r5tyeowxzloiuh72@treble>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, linux-kernel@vger.kernel.org, jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net

On Tue, 14 Feb 2023 10:23:22 -0800
Josh Poimboeuf <jpoimboe@kernel.org> wrote:


> void __ref cpu_die(void)
> {
> 	idle_task_exit();
> 	local_irq_disable();
> 	__asm__ __volatile__(
> 			"	movi	a2, cpu_restart\n"
> 			"	jx	a2\n");
> 
> 	BUG();
> }
> 
> Hm, not only is the comment wrong, but it seems to be branching to
> cpu_restart?  That doesn't seem right at all.

Agreed, that does not look right at all.

-- Steve

> 
> Max/Chris?
> 

