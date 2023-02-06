From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 09/22] mips/cpu: Expose play_dead()'s prototype definition
Date: Mon, 6 Feb 2023 14:36:02 -0800
Message-ID: <efaa5dfa-cf00-d68f-2b7c-911b70b4cb5e@gmail.com>
References: <cover.1675461757.git.jpoimboe@kernel.org>
 <a532966831383927f5f4fbec0a1e13304588685a.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DY9UghIbQImNpjY3G2+UNsb+fzCnSZLDGPSaq6J2Oe0=;
        b=JRNn2PN7IQA8wrp++7waMCjV2w3MVSBHQy2yaFY5E1eD/qAR5eFFrTUqd7HHZZgOOh
         BKtoIdcfXcvfEkOkPxAPoMpSqz/4LLVV5QTg6sU/i6Ss894Zt1lunVB1YipN7YIy8x0+
         QHb2wW9sDuw07wqO8wKDOF74KYPEloiw8B7aDMqTs/WEYWrqrWe8u2TVT6mCHQjo3ppz
         BtPI49HLyU8i9EE65/3VpD4dZ9wc31UuOfGfWqaEw5Yo34lcugLN63L7bFLGCgoYQWwI
         4GTPN3tXbT1k6DU4Gcw03RgD0rJtIc2M2RiwxziJmhZNdqrRvanB+Br5nnhGtkocLLSf
         9qtQ==
Content-Language: en-US
In-Reply-To: <a532966831383927f5f4fbec0a1e13304588685a.1675461757.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

On 2/3/23 14:05, Josh Poimboeuf wrote:
> Include <asm/smp.h> to make sure play_dead() matches its prototype going
> forward.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

