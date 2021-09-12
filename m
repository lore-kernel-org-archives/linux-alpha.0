From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 4/4] alpha: Use absolute_pointer for strcmp on fixed
 memory location
Date: Sun, 12 Sep 2021 13:15:09 -0700
Message-ID: <155e002d-9546-4090-fc62-fab91412aec7@roeck-us.net>
References: <20210912160149.2227137-1-linux@roeck-us.net>
 <20210912160149.2227137-5-linux@roeck-us.net>
 <CAHk-=wi1=8shingNuo1CtfJ7eDByDsmwsz750Nbxq=7q0Gs+zg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3bXRAr8vzVgfue5qLyX/aEE51q1nNWyvUB1vQ8basms=;
        b=MHldca8gHolBBgtSYRPEdDb+GFyr/YOhkHnEp9Z2n4MugP/HGzAFsZU4/8h+u7UQYY
         uw20IDQ/5cI1lT4wjezown2p4wm9yIdDPiydbSzsWkWRj7oRz/5zIeEkGpQV1nBRA3k4
         cCkA9Pt03ctg9gd3ifk8xWeN23sF8b+SSrg7qpqhAYP8WbAw+tlZBhcAWM1IFg2n5lEb
         d5UrvDrh7gcNxUEg6H1aWDAV/L4+yy2NovGu8ldX0IOySuG+bFG9QYhVQrmWSLKTy97p
         YJ08XM1N0G70rISAvjIGBYBjOVM6dpgbGkMSiTA0jjC/+Hjzvdg4l7pRUUbuf+4AJ7v4
         gCYA==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <CAHk-=wi1=8shingNuo1CtfJ7eDByDsmwsz750Nbxq=7q0Gs+zg@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On 9/12/21 12:13 PM, Linus Torvalds wrote:
> On Sun, Sep 12, 2021 at 9:02 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> -       if (strcmp(COMMAND_LINE, "INSTALL") == 0) {
>> +       if (strcmp(absolute_pointer(COMMAND_LINE), "INSTALL") == 0) {
> 
> Again, this feels very much like treating the symptoms, not actually
> fixing the real issue.
> 
> It's COMMAND_LINE itself that should have been fixed up, not that one use of it.
> 
> Because the only reason you didn't get a warning from later uses is
> that 'strcmp()' is doing compiler-specific magic. You're just delaying
> the inevitable warnings about the other uses of that thing.
> 

Makes sense. I'll change the patch accordingly.

Thanks,
Guenter
