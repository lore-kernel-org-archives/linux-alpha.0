From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v4] Kconfig: introduce HAS_IOPORT option and select it as necessary
Date: Wed, 05 Apr 2023 22:24:15 +0200
Message-ID: <5d964527-92ef-49a8-bbb7-413eb09297a1@app.fastmail.com>
References: <20230323163354.1454196-1-schnelle@linux.ibm.com>
 <248a41a536d5a3c9e81e8e865b34c5bf74cd36d4.camel@linux.ibm.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1680726280; x=1680733480; bh=N9
        C/awAiXRMgnyyYXvPXUEJhSqaGPpbpLGKv/C3S1H0=; b=WYPwr8/VZV6zBYSovW
        FWa53JW+kTo73xaVm26HaPrq2i7dKIUDM7qfeMtNZC5V8yUXcANudnKjTuwrmFHT
        Bf6+wk1Vs7FzddiB5Fww3LDuUwLRjpNWpTXNZbaNnMZJpNay9E6WnjCkVe//D8OC
        a1+OaRb97j78Z7MDUL04PRkhE34VYZWmntrFiaKjV9XTISuY8/fSAtiwJ6olcwuF
        WA+DDruleUG4eG1RUCTaABOEXRHycG6io1Dvofh5YJy18HBl3YZyi5QFdRH8zPTN
        An8bgpPoA1hf/uyWLDZlmMkKFg4ebIJRTbAoxcXqWaSb60/SOA4weGBXxXcQ3qJh
        KdDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680726280; x=1680733480; bh=N9C/awAiXRMgn
        yyYXvPXUEJhSqaGPpbpLGKv/C3S1H0=; b=awCPWIxoS3smP/8nlGjUXH8x5hhZ5
        g669z2xjXBokBOPK93ThSmEiaLo1ezXohhrV+h6cMD6CioysuAVRHhq5zZ27Y8dv
        EZKxg17wtFmUUbQ/FtL8f+qwX+Wf1DDGalFLZmYHLDYsjHsLD+SGwizDU2yoiRnu
        VZmfzzwzVUmtf0oKnLxjaJ89u1NuxbN0q49Z7aC3Qgn2ji14Wc5AdSYrA43EycyX
        9/xLz5/UcfjD5Xjk6zvLCSzMcaXk01BUhpqlbpgIdTzbm6rAxecXUoRj3nBrExcK
        ZWJNYGvWuKZ2AsqsMBW1UFdR9q+Wcg0Rif72eQ7SEwxKwfyCggQbeNp0g==
In-Reply-To: <248a41a536d5a3c9e81e8e865b34c5bf74cd36d4.camel@linux.ibm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Niklas Schnelle <schnelle@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, linux-pci@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, sparcli

On Wed, Apr 5, 2023, at 17:12, Niklas Schnelle wrote:
> On Thu, 2023-03-23 at 17:33 +0100, Niklas Schnelle wrote:
>
> Gentle ping. As far as I can tell this hasn't been picked to any tree
> sp far but also hasn't seen complains so I'm wondering if I should send
> a new version of the combined series of this patch plus the added
> HAS_IOPORT dependencies per subsystem or wait until this is picked up.

My bad, I've created an 'asm-generic-io' branch in the asm-generic
tree now and merged that into the master branch for 6.4.

If anyone wants to merge the later patches for 6.4, feel free to
pull in

https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git asm-generic-io

as a stable base.

       Arnd
