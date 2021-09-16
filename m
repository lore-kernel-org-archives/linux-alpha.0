From: Anders Larsen <al@alarsen.net>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Thu, 16 Sep 2021 09:02:17 +0200
Message-ID: <5497691.DvuYhMxLoT@alarsen.net>
References: <20210915035227.630204-1-linux@roeck-us.net> <CAHk-=whSkMh9mc7+OSBZZvpoEEJmS6qY7kX3qixEXTLKGc=wgw@mail.gmail.com> <CAHk-=wjynK7SSgTOvW7tfpFZZ0pzo67BsOsqtVHYtvju8F_bng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alarsen.net; s=joe;
        t=1631775737; bh=oaWiy3941asGmQdU0t8Spdb3xrM4VKJq8AFtrBfhgJw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FA8bIvnmYzDGl1DiFArlpFrsxGozZYdTiPu3FAjfQ8BBaJL01aFd1YVLlrzsz8TEn
         dv+GKlWr7ihbAGrWebwbn410wk8qOwdKRBK7xP0k6mB2I0HXtTuPbJCfnbgNIZytC4
         jPDPqG0ytTKEtbkfS0IX9JQSPfWvwSGyORQqGtaA=
In-Reply-To: <CAHk-=wjynK7SSgTOvW7tfpFZZ0pzo67BsOsqtVHYtvju8F_bng@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Wednesday, 2021-09-15 23:19 Linus Torvalds wrote:
> Ok, I didn't love any of the patches I saw for the qnx4 problem, so I
> silenced that warning with a new patch of my own. Like the sparc64
> case, the fix is to describe more extensively to the compiler what the
> code is actually doing.

thanks, looks good to me, too!

> Looking at the qnx4 code-base history, I don't think it has gotten any
> actual development outside of cleanups in the git history timeframe,
> which makes me suspect nobody uses this code.
> 
> But hey, maybe it just works so well for the very specialized user base ...

it's actually the latter (although I guess the user base is shrinking)

Cheers
Anders



