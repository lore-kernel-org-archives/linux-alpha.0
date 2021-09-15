From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Wed, 15 Sep 2021 12:18:58 -0700
Message-ID: <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
References: <20210915035227.630204-1-linux@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hRAe5/tE1Mx+glbEumA/10LHbf2sLTrpOcfg2d46p4U=;
        b=VWatl0Tg6Rs2+8cyQ1nNI7llz+Jwjnz45GyA7Ialu8h0m7yH1LKoqAuI6k/Ywlygil
         KDQQX525bUWsnQP59sCymg2Xi7UR5AijXzfqK2/Z2O+QbzWUet5is4fYAxM3ieQOdqUi
         Q6n8XepF4xgcAuR6YdqHkkzo9csOkkBGuEk5Y=
In-Reply-To: <20210915035227.630204-1-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Tue, Sep 14, 2021 at 8:52 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> This patch series introduces absolute_pointer() to fix the problem.
> absolute_pointer() disassociates a pointer from its originating symbol
> type and context, and thus prevents gcc from making assumptions about
> pointers passed to memory operations.

Ok, I've applied this to my tree.

I note that the physical BOOT_PCB addresses in the alpha setup.h file
might be useful for things like MILO in user space, but since I
couldn't even find MILO sources any more, I couldn't really check.

I suspect alpha is basically on life support and presumably nobody
would ever compile a bootloader anyway, so it's unlikely to matter.

If somebody does find any issues, we'll know better and we can ask
where the user space sources are that might use that alpha setup.h
file.

                Linus
