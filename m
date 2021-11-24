From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
Date: Thu, 25 Nov 2021 00:18:00 +0100
Message-ID: <87v90hjg7r.ffs@tglx>
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
 <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1637795881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kgfD0hDh4gr0XMzkR2x84BR1TQ6+tWZptmE4dSLrghY=;
        b=X/yZX2zV8XlAus/FBu0sptVdXYWgFjt85wCwAiu6eUKJBsOkqXZw1bwG6D5eQ4y3XItSO5
        PME1b7NJiqjCFFOLUwssxvQfdm3YwlEVkZeZq2Lvaxr9X1F9DySBoKbtptiCypU7vX0lxb
        rLd2g2UZ9iw2md3zGsCQFZVDy+Ps1Wj2giT5og+i4j8yelPkAlnXWb1Z02Pec22ezIqgU2
        B24yr0FzQWwSctufH3JLXvswN/Vcon5CJcGGr3lK01xAYCAI+akKbgpKk2mMxDKnUMte1X
        HsR0U998RBH9nGgHbNTgaQPvxAzbH7/ZRc3B/1s5dnvXurNarvbbMcqz8xLFyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1637795881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kgfD0hDh4gr0XMzkR2x84BR1TQ6+tWZptmE4dSLrghY=;
        b=eAA9L8IY3vpIoozSoepqegehvk44k8iiAJ19r79ZDI+VHKbA09Xcb0eAefvCuqFa/D4MxI
        qHgBCZYVv9jhifBA==
In-Reply-To: <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Arnd Bergmann <arnd@arndb.de>, =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@collabora.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, David Miller <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, alpha <linux-alpha@vger.kernel.org>, linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, Andrew Morton <akpm@linux-foundation.org>, Sebastia

On Wed, Nov 24 2021 at 15:29, Arnd Bergmann wrote:
> On Wed, Nov 24, 2021 at 2:21 PM Andr=C3=A9 Almeida <andrealmeid@collabora=
.com> wrote:
>>
>> Wireup futex_waitv syscall for all remaining archs.
>>
>> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@collabora.com>
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> I double-checked that futex_waitv() doesn't need any architecture specific
> hacks, and that the list above is complete.
>
> Should I take this through the asm-generic tree, or would you send it
> through the tip tree?

Feel free to pick it up.

Thanks,

        tglx
