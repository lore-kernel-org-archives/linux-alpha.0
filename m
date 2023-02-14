From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 00/24] cpu,sched: Mark arch_cpu_idle_dead() __noreturn
Date: Tue, 14 Feb 2023 10:25:50 +0100
Message-ID: <a48ebe98-82b5-8f7b-8327-4e60bdb231c8__26123.0489400745$1676366806$gmane$org@linaro.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QDxRPg0tzmSlpSdGNasFtKDU/RizntlcLVEvFLg/3J0=;
        b=NES+X0jitlSFN9CMyxtOBnwXvr4UEkpCwjSf8ktPB+wXMhbktMrNUflH+JM2ssaH9K
         1szwzK+H0w1R1obMWrGYq2h5EqmbiN8TzRSCSDfQ0xIRnMtUM0YXe0sOqWpLCMwXuGjf
         pq5Tp+btAH/Jp2UMc+IUaq03lyRqROMWnwZHj0SyNjg2aEHISp2YzMuCIH2fFqgRFL2C
         nh8rUW+D8G8ohs7qk9rK8//cKtczB59ooJFvWHa+cMfxk4FIJRL/sUbUY+TwB9aq5oQ6
         5XNgdahaS2tg0VmMYr3n7xy9L8AkuRxwtGbyTzFH3A9vsOSJ49wrhdrqe9fR4BHUPm/1
         +QNw==
Content-Language: en-US
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

On 14/2/23 08:05, Josh Poimboeuf wrote:
> v2:
> - make arch_call_rest_init() and rest_init() __noreturn
> - make objtool 'global_returns' work for weak functions
> - rebase on tip/objtool/core with dependencies merged in (mingo)
> - add acks
> 
> v1.1:
> - add __noreturn to all arch_cpu_idle_dead() implementations (mpe)

Possible similar candidates: panic_smp_self_stop, nmi_panic_self_stop
and kexec.

