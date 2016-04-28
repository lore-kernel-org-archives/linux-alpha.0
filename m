From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [patch V3] lib: GCD: add binary GCD algorithm
Date: Thu, 28 Apr 2016 19:51:06 +0200
Message-ID: <CAMuHMdU2e2PdwKYVaEsJ73X8Di1XHNPqnxuunr8R8bN8udazxw@mail.gmail.com>
References: <1461843824-19853-1-git-send-email-zengzhaoxiu@163.com>
	<20160428164856.10120.qmail@ns.horizon.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=IDC/Z2juvUxpC8A8fbWJYtyZOgEhS6AAXHTmxvSBt4Y=;
        b=DBFZdmBcf1VoR2mhZ8Z/KWS0p3iFp/YwbkUPJnPXYbNZhXnuTzVFAHjLRWXN9DfE7d
         lBV0jWnGrS4IhoWzwFnnrFLHsawGSXlGbr/FJjWmvBRYQdZZBT3XiGk6jmVyjZPq3NL9
         gl3XqRLLJmbx2TqCktjTyjRmlvNKUOB2ILugmmnX5Ceal/jy/xRXczZqR6laoMfpoHBb
         ETRaLzPkxtm2dlVB4GcTfpT0ErGyHXlRJFq9ZeS75Y555sj6yvt20fcxnLayBfZHQ52E
         W9LK0QCy9pSsSbLtLCdK0GMDaEpcqwR2eZh3x6wU1TzndHOjuRFvrqPEukMkrZK3X1di
         vCsA==
In-Reply-To: <20160428164856.10120.qmail@ns.horizon.com>
Sender: linux-m68k-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Spelvin <linux@horizon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, zengzhaoxiu@163.com, Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>, Helge Deller <deller@gmx.de>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, James Hogan <james.hogan@imgtec.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Jonas Bonn <jonas@southpole.se>, Lennox Wu <lennox.wu@gmail.com>, Ley Foon Tan <lftan@altera.com>, alpha <linux-alpha@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "open list:METAG ARCHITECTURE" <linux-metag@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Parisc List <linux-parisc@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Russell King <l>

On Thu, Apr 28, 2016 at 6:48 PM, George Spelvin <linux@horizon.com> wrote:
> Another few comments:
>
> 1. Would ARCH_HAS_FAST_FFS involve fewer changes than CPU_NO_EFFICIENT_FFS?

No, as you want to _disable_ ARCH_HAS_FAST_FFS / _enable_
CPU_NO_EFFICIENT_FFS as soon as you're enabling support for a
CPU that doesn't support it.

Logical OR is easier in both the Kconfig and C preprocessor languages
than logical NAND.

E.g. in Kconfig, a CPU core not supporting it can just select
CPU_NO_EFFICIENT_FFS.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
