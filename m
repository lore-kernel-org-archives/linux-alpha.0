From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH 0/2] char/agp: consolidate asm/agp.h
Date: Mon, 27 Feb 2023 21:04:04 +0100
Message-ID: <5de30963-9be9-4e87-a696-7a642d92630f@app.fastmail.com>
References: <20230212084611.1311177-1-rppt@kernel.org>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1677528265; x=1677614665; bh=zexpZQ5bJ9
        hbIaBDiHdAg4Kdi9EcW4M9yOSGV4fDHqI=; b=UmD1++vWuDhma9hYn/5OBgkV9W
        SmKh3J+jW/DRQw9ZayTbfH4doyDnfMKGcrUjRg+MHXB7+skv9MR2Wn6feDUwa/pc
        PGT3Jx1cKFRVV3yUC+Xbv73xv4yG9hlMD+x2L5XYUsFkhcKBk+bS73Zg84OwAvEZ
        RNZMUvBcMXHf7fLXwSvthCoH+1LmkzeFxFlxrddpojiVz793BS8I93v3s80ny4oe
        1FufDxHhi6hoVKIkPvvLYmJ+SFsDbckDivUEjltSlVQ3ucoef5IiqpK+X/HiLHU1
        GwGjKaqWwuFOXkvK+hEEYfudtjKdyB2/Ux5tmyNKJb3vsbFLjm9k6AAh9Bvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1677528265; x=1677614665; bh=zexpZQ5bJ9hbIaBDiHdAg4Kdi9Ec
        W4M9yOSGV4fDHqI=; b=j7dASZo3V9dUBM6DtvQO9/dlt76IBaikXPpslXjq6pST
        jFfZh2uRAMePwDHhoQQLNQzkC12wPkXcZPLXx2ADjJtqEKy7bW2+gxDbbcJDDOVQ
        VuvwS4PM8MQcf2Rr7qyfXLPe5Lc46+01w63aLtcMijCn/ZKTsn+l9IY4axqQB3ol
        2+Oudolo5/Ha3o/ZLMIKLoOyX7RvZncBzpV5PZV5kFhzlW2izGNS0rTWVEdEpYEc
        Al+q0KEZn6nANGo4y6fiDSB7LzYpD7c9+b8aYZTgtvzwWVL+zjKnTCaX+ZymZxf+
        98xn4wFADSco0SR13mRCBDtf/UGEqWcwjxcgYDRQuQ==
In-Reply-To: <20230212084611.1311177-1-rppt@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Rapoport <rppt@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, "David S . Miller" <davem@davemloft.net>, Helge Deller <deller@gmx.de>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, dri-devel@lists.freedesktop.org, linux-alpha@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org

On Sun, Feb 12, 2023, at 09:46, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> asm/agp.h is duplicated in several architectures, with x86 being the
> only instance that differs from the rest.
>
> Introduce asm-generic/agp.h and use it instead of per-architecture
> headers for the most cases.
>
> I believe that asm-generic is the best tree to pick up this patches.
>
> Mike Rapoport (IBM) (2):  char/agp: consolidate
> {alloc,free}_gatt_pages()  char/agp: introduce asm-generic/agp.h

Hi Mike,

It looks like I wrote an email saying I merged these two patches,
but never actually sent it out. Not sure if you found out another
way, but this was part of the asm-generic tree for 6.3 and is now
merged upstream.

Thanks for the cleanup,

     Arnd
