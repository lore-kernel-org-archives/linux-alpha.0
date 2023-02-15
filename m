From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v3 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
Date: Wed, 15 Feb 2023 14:04:59 +0100
Message-ID: <f3e1585c-0d9d-4709-9b21-74a63d8cc9ac@app.fastmail.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-4-alexghiti@rivosinc.com>
 <Y+zXIgwO5wteLQZ5@shell.armlinux.org.uk>
Mime-Version: 1.0
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1676466318; x=1676552718; bh=NzdIn9sEy/
        TdUrl/ZdBVY4dMEk2Tnlph7NyUne+YOMM=; b=kl/EA19HJlIDNFEV5sMsHqgYTD
        FmlSiYGtsM1si6Xo7AfnbewsjK2qzM/exTVK7KRlph5xczdJTxspqQBBiSgDyUar
        0/fSOmeAkWXOKykdvq7ZjBD1IsDSNgHuJMr9jdqrxMZ427iK2YQWYazGyhNarvV+
        rz/pcQHi1wVqtUZnkL8uCj8I88gq6xd2D9S7lmvnrmDM5SQ0W1z+Qb3C6+wYAIM2
        AfuYHCBl3neJoKLQlQN5Mzxky+jYkkG9DLm7gfrh3K+BaB31NxErj+DDl06h26FZ
        Lbk631TihMW1/uvBaERmFnuy7Zo7bE+o4kaGFaECXI9tlwQzxtwDlstkclqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1676466318; x=1676552718; bh=NzdIn9sEy/TdUrl/ZdBVY4dMEk2T
        nlph7NyUne+YOMM=; b=Fj3/LiQbjc3zZVeQEFPn1JLksyP6OJKAqEthWeUwUdOy
        k7x0KqWkvb7b77D7xfan3iRDT3xhukpp4mvtLGJE/kVQChQOH1qp0nR/LnBR87Y1
        XDD47Zd1e+ArsjIbVJ2HC/gIqlxwXE9Yv3XVaU+KSxDHebKRD7UtGlZtwkd1DH9P
        2nl2CBlmUDumzN3QpVUsRj24U1jFxVa/Bkw0HG9aN7GFtyhzTAEI6Kui+fW06SlI
        P27LTtLWzSbpaclrnRpKS2BxaaFWBrD0e9YkEyfIAAX4SmnRcQLa6PTiOGSb1f3q
        k2vytFCMGUqoYhQef2Aclc0m2mYrSBprvVoJFASZqQ==
In-Reply-To: <Y+zXIgwO5wteLQZ5@shell.armlinux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King <linux@armlinux.org.uk>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>

On Wed, Feb 15, 2023, at 13:59, Russell King (Oracle) wrote:
> On Tue, Feb 14, 2023 at 08:49:04AM +0100, Alexandre Ghiti wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>> 
>> As far as I can tell this is not used by userspace and thus should not
>> be part of the user-visible API.
>> 
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> Looks good to me. What's the merge plan for this?

The easiest way is probably if I merge it through the whole
series through the asm-generic tree. The timing is a bit
unfortunate as we're just ahead of the merge window, so unless
we really need this in 6.3, I'd suggest that Alexandre resend
the series to me in two weeks with the Acks added in and I'll
pick it up for 6.4.

     Arnd
