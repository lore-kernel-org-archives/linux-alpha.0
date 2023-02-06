From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 10/22] mips/cpu: Make sure play_dead() doesn't return
Date: Mon, 6 Feb 2023 14:36:32 -0800
Message-ID: <177ee7b1-9954-be71-a1c0-024bed9902db@gmail.com>
References: <cover.1675461757.git.jpoimboe@kernel.org>
 <b131d3e00967034d86692b894a66c6a656e7de3f.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GOsvo1Wy7rEBzdeEtnpUfAafl2KXxjzL9FtW2ispnjA=;
        b=KU85o3MbVzoHlkVJzhppe87qpv+MKx9lyyDdf3URpIiYW2Zidjluq5+t4NqrkTLUBv
         BRl/cCx5UTdh3aUIwMxRLKf3K19OUGtgV5HFrKptL15UYJmmTGvHZi6n1tGBM6Vf7Qec
         Fv2CPnc+/XIvJmWxKMyYwgaTKiV0NvjpGqskadXDL55OTeZQWVisLyUct3nRPo0Kq+cz
         3t+AtT7cMBjD/SfOlG/cCwpZ41t9OHqLYe3AnL8skDCedkkVLY3cSzbQ/y1Nym/wuNGd
         /htZGYXMc15GtuW+cC7bkrX2Xh3bzxXSEw5FuC89ogwPJcdKxuVchUBDZKlyGTgv95hH
         uqyQ==
Content-Language: en-US
In-Reply-To: <b131d3e00967034d86692b894a66c6a656e7de3f.1675461757.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

On 2/3/23 14:05, Josh Poimboeuf wrote:
> play_dead() doesn't return.  Make that more explicit with a BUG().
> 
> BUG() is preferable to unreachable() because BUG() is a more explicit
> failure mode and avoids undefined behavior like falling off the edge of
> the function into whatever code happens to be next.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

