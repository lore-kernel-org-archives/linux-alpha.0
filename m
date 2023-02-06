From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 11/22] mips/cpu: Mark play_dead() __noreturn
Date: Mon, 6 Feb 2023 14:36:51 -0800
Message-ID: <7a21e1fe-82ac-6285-ceaf-6450a7ee4325@gmail.com>
References: <cover.1675461757.git.jpoimboe@kernel.org>
 <829d68d289ad4eeac27c5220be695cfa6ace33f4.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2oBtxwWwjCPYyU17pu3lBwV9dmGFDQEYRoN+Ty55Io=;
        b=gbg0RnDrkEtPW9M9RcaDfqIaD3j5DMKgNppT25xHFz30aj9NTwFnwpbnaOLwXXhlRZ
         QOD2yBmRv+YeFmZkMj+FhGdSwVNXqCmW7skH37un5SuKUUfepwjqwXPCYumStY2RJP1U
         khj85lSeq3MEz8a0hbKrHO77vVv+3IJVswBqBvqaNW5v7961BQ6YJt7njEEoj5xry82G
         KoE7kVMauqpDG7hVLzqhTiqX/punkjXxIZ6ogZ0RIoBCEm7LTq4xvEybh0lsQWrxezF/
         s/gYh+8nSzJWTOnx4yewLISyuXcq+Sy89H36bl0rI5S9xupPWOMaMVVGcS6dYvPPHLpa
         pk7Q==
Content-Language: en-US
In-Reply-To: <829d68d289ad4eeac27c5220be695cfa6ace33f4.1675461757.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

On 2/3/23 14:05, Josh Poimboeuf wrote:
> play_dead() doesn't return.  Annotate it as such.  By extension this
> also makes arch_cpu_idle_dead() noreturn.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

