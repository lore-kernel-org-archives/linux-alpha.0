From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH 1/3] vgacon: rework screen_info #ifdef checks
Date: Fri, 07 Jul 2023 11:54:07 +0200
Message-ID: <981234cb-5b23-4751-a539-918a686d526b@app.fastmail.com>
References: <20230707095144.1378789-1-arnd@kernel.org>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1688723671; x=1688810071; bh=6X
        C0Wg3ewP983KQo8iZVYJNXYqhyj/JCtouCPSrRJR8=; b=SiHISIGeprZW8TfAXm
        scuKV2FcQSvigS+oHDr1qrsHA+cZ8xsBUy9NibPZKzcFtbUaQKsHl8D4ACfN4ZK2
        RR5Pf/Q8ixQInXaGU299P/H1ZtITQQzaRJX1pWGvn3y/Uue0sbq7Mmo5bkN7L0aR
        MJQbmVlFPI3Ic02b3ZC+WYpaO1oWSU9Be2mc3JUqIKJCRWf3AtIPufI+G4oe/z1p
        ZAr3ft3JMUK6xobZSTIBfYOohdVJJnyYJu4DkBpPqqLZHvXarQRoYin1HXkbqQ8O
        R+isPyFEQM5np2U+BQBLk5jHLnW7qNZPJyB9kjzyLJHa1Y5h8skufzr7BBoK8D+w
        u4mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1688723671; x=1688810071; bh=6XC0Wg3ewP983
        KQo8iZVYJNXYqhyj/JCtouCPSrRJR8=; b=otU0ea29ZNcdReu7aQRT+XjJV/YoC
        PQ6SElyG6RSHMrhoITEVG8rrm0ECTIzGl7Ww1VYB4rQGhglPRC5e8hfj5gAbpx2f
        wRsw+DWe437MdwxbA2JmYUXYnve0g4NNgaQx4WSCzOs1vkYPRTVKW7cAYlMEpDqg
        BSUvzrP97YZRwueEltKqEVA9nPQ/uxzovIJmGRR8tp8hGBDWr0ToeyXIY8zDrK59
        VkTYscq6juW+22/pqDYCYSYUznXN2k5U066fFlVKi/f701+Frtdie1fxYMkzw6R4
        Pk7LPjM2yBbxW77AeiVqG7NLjETEe2NvJk/oGKZqu+HOLea9LUXay85vQ==
In-Reply-To: <20230707095144.1378789-1-arnd@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, Ard Biesheuvel <ardb@kernel.org>, Helge Deller <deller@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>

On Fri, Jul 7, 2023, at 11:50, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> On non-x86 architectures, the screen_info variable is generally only
> used for the VGA console where supported, and in some cases the EFI
> framebuffer or vga16fb.
>

This should have been patch 2/4, not 1/3, please ignore this one and
look at the new version.

      Arnd
