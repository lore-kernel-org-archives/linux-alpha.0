From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] alpha: Fix ioread64/iowrite64 helpers
Date: Mon, 3 Oct 2022 20:47:11 +0200
Message-ID: <CACRpkdYHcTPNLj_GBjKh2Xex1rKQDZTLwppHAEjhhouPqdivtw@mail.gmail.com>
References: <20221003121316.2540339-1-linus.walleij@linaro.org> <49e40308-969f-4b22-a8b5-d7f07e50b8ef@app.fastmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=M385r7adQFP2eJtYDCJbx5h+dCbHhqD1X387se0QADM=;
        b=CwuXfWTQtGBI+ETWvrJJg/XCJL1CuB9zIHoM7dxASoTS9jlc+jKMFINn+BEXIBID5D
         wS3GpKZ1rlLmy4u8btcISk1/TjgjmjZ+ezSc7v6WoJcEapfwLw8IzdAhR1U6q/vr9WZc
         I9w4nvXpkuxXxuLLZhgVdjyTL8iU+cgsw0jNHuSShk2jIoBLF7aoZwofUnsbOrnqDjFq
         oF8cpKazfVDBmpusVajY10W4Q7t7aFBDSHi85//zExevfkIFngCGsajVxTX3206GP/ac
         V2fRkUxcsmdMbjiAIbSygG+Ia/0VvUDuhSBYqtikAjHXHdwiY7i5kePM1BsGCduRQH7V
         A0uw==
In-Reply-To: <49e40308-969f-4b22-a8b5-d7f07e50b8ef@app.fastmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Linux-Arch <linux-arch@vger.kernel.org>

On Mon, Oct 3, 2022 at 3:05 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Oct 3, 2022, at 2:13 PM, Linus Walleij wrote:
> > When doing allmod builds it turns out some modules are using
> > ioread64() and iowrite64() that the alpha does not implement,
> > as it is using <asm-generic/iomap.h> without selecting
> > GENERIC_IOMAP.
> >
> > Fix this by implementing the ioread64()/iowrite64() stubs
> > as well, using readq() and writeq() respectively.
> >
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Fixes: 7e772dad9913 ("alpha: Use generic <asm-generic/io.h>")
> > Link: https://lore.kernel.org/linux-arch/20221002224521.GA968453@roeck-us.net/
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> > Cc: Matt Turner <mattst88@gmail.com>
> > Cc: linux-arch@vger.kernel.org
> > Cc: linux-alpha@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Arnd if this looks OK then please apply it on linux-arch
> > for fixes.
> > --
>
> It looks like we just crossed patches. I also sent a fix a minute
> ago, but I think mine is better here because it also works on
> I/O ports.

Hey! :D
Take your patch instead.

Yours,
Linus Walleij
