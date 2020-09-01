From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH v3 02/23] alpha: use asm-generic/mmu_context.h for no-op implementations
Date: Tue, 1 Sep 2020 09:51:22 -0700
Message-ID: <CAEdQ38Em+s7e50Z+z+frwT8xHc=cHG70rjSmAPo+9RmJcCwTGw@mail.gmail.com>
References: <20200901141539.1757549-1-npiggin@gmail.com> <20200901141539.1757549-3-npiggin@gmail.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7wmhqZFH/qn9LDILgIA8ChHwbJC43R72DMR15uZTThk=;
        b=sEZr7yNRdN4XLqfS6kDyAxYMdSBUX91Lrvi8DIlpUfVVpd3J5MGuriq05qiGIsFfOS
         1nG7p40rnY/7KgeLHd2mSz2SaSPiph2LzX2zQveYL+gCSwfsUOJ91ylYKxowQstupoHr
         rTphTq7xjbalXBUO2YQtmYt1+/rlilxOjz44ZxPiHsE/E9HlrOzR3z8qcqtpWuQYlS6f
         C72bqQSR5JUMMlaYJCm9P0yK2PoKq9jpweruEfjJfyxZs3Q7AjjqPIpWmXwmsvQVaqwi
         xUReZMYW49QhZObiQuohBS57V2gw1dNeD/DJGMAANfTuhSdeg5KqD3YcCm0fRUMMsosd
         DJrg==
In-Reply-To: <20200901141539.1757549-3-npiggin@gmail.com>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>

On Tue, Sep 1, 2020 at 7:15 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>
> Please ack or nack if you object to this being mered via
> Arnd's tree.

That would be great.

Acked-by: Matt Turner <mattst88@gmail.com>
