From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
Date: Wed, 24 Nov 2021 15:29:23 +0100
Message-ID: <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20211124132112.11641-1-andrealmeid@collabora.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, David Miller <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, alpha <linux-alpha@vger.kernel.org>, linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, Andrew Morton <akpm@linux-foundation.org>, Sebastia

On Wed, Nov 24, 2021 at 2:21 PM André Almeida <andrealmeid@collabora.com> wrote:
>
> Wireup futex_waitv syscall for all remaining archs.
>
> Signed-off-by: André Almeida <andrealmeid@collabora.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I double-checked that futex_waitv() doesn't need any architecture specific
hacks, and that the list above is complete.

Should I take this through the asm-generic tree, or would you send it
through the
tip tree?

        Arnd
