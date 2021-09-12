From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 3/4] parisc: Use absolute_pointer for memcmp on fixed
 memory location
Date: Sun, 12 Sep 2021 12:11:38 -0700
Message-ID: <CAHk-=wi1TBvyk7SWX+5LLYN8ZnTJMut1keQbOrKCG=nb08hdiQ@mail.gmail.com>
References: <20210912160149.2227137-1-linux@roeck-us.net> <20210912160149.2227137-4-linux@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E1PHZ6ydkqEkrZPVcY11k8G+o6nXM73c5JaOIi36jdM=;
        b=Mmh3TCnuXic/hCA6XvkP2osD5zmauEUtEa852ODITJl9q7DRJZnlYFaFYG+mxH6vf6
         Z+ggUrlsmP9EQRyIHakVw8bJD81GHQopdHiqd4QBP+UGydXePHYv5SH2cpjAaKjOE5af
         i5L6vjez7vZKGjXnjuCG5wVITdXtC1IYH3rOc=
In-Reply-To: <20210912160149.2227137-4-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Sun, Sep 12, 2021 at 9:02 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> -       running_on_qemu = (memcmp(&PAGE0->pad0, "SeaBIOS", 8) == 0);
> +       running_on_qemu = (memcmp(absolute_pointer(&PAGE0->pad0), "SeaBIOS", 8) == 0);

This seems entirely the wrong thing to do, and makes no sense. That
"&PAGE0->pad0" is a perfectly valid pointer, and that's not where the
problem is.

The problem is "PAGE0" itself:

    #define PAGE0   ((struct zeropage *)__PAGE_OFFSET)

which takes that absolute offset and creates a pointer out of it.

IOW, _that_ is what should have the "absolute_pointer()" thing, and in
that context the name of that macro and its use actually makes sense.

No?

An alternative - and possibly cleaner - approach that doesn't need
absolute_pointer() at all might be to just do

        extern struct zeropage PAGE0;

and then make that PAGE0 be defined to __PAGE_OFFSET in the parisc
vmlinux.lds.S file.

Then doing things like

        running_on_qemu = !memcmp(&PAGE0.pad0, "SeaBIOS", 8);

would JustWork(tm).

Hmm?

             Linus
