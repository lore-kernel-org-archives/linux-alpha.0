From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Wed, 15 Sep 2021 12:47:44 -0700
Message-ID: <CAHk-=wgdEHPm6vGcJ_Zr-Q_p=Muv1Oby5H2+6QyPGxiZ7_Wv+w@mail.gmail.com>
References: <20210915035227.630204-1-linux@roeck-us.net> <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
 <47fcc9cc-7d2e-bc79-122b-8eccfe00d8f3@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y64G4Nr6eLupd8AyUDQV+QjpzOrG0jVGWqFOvbj7NhQ=;
        b=Y4csyohCZU+8YoKj/T3AMNnwgk3FRg+INHHD4fuGyDsUm1wq1h6AKxBYulDw3FoQ7G
         0NziSuibsMyNi5yefbYsucBch28Uj+K3jgCIw+xC9NJQXLVMnDOuhKqiW0u/dIQHiVqz
         N3nrrQCoMhlCRtjeNcE5DeBxWUyUUAZ/n68kQ=
In-Reply-To: <47fcc9cc-7d2e-bc79-122b-8eccfe00d8f3@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Wed, Sep 15, 2021 at 12:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On a side note, we may revive the parisc patch. Helge isn't entirely
> happy with the other solution for parisc; it is quite invasive and
> touches a total of 19 files if I counted correctly.

Ok, my suggestion to use the linker was not a "do it this way", it
really was just a "maybe alternate approach". So no objections if
absolute_pointer() ends up being the simpler solution.

What other notable issues end up being still live? I sent out that one
patch for sparc, but didn't get any response to it. I'm inclined to
just apply it (the 'struct mdesc_hdr' pointer misuse one).

         Linus
