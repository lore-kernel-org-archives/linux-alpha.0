From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Wed, 15 Sep 2021 22:30:37 +0200
Message-ID: <3d30d1e0-f60a-3f48-65d9-f53b76640a9d@gmx.de>
References: <20210915035227.630204-1-linux@roeck-us.net>
 <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
 <47fcc9cc-7d2e-bc79-122b-8eccfe00d8f3@roeck-us.net>
 <CAHk-=wgdEHPm6vGcJ_Zr-Q_p=Muv1Oby5H2+6QyPGxiZ7_Wv+w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sparse-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1631737840;
        bh=FT1bt5R/FOH6npv9XqUhIBjmnDojF0uwYc99SARbO9E=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=OuQsLKfmqSknDnjRmvpvF5gZFfr0LxiH64Sy2NNNbnXhiVtCWs2THcnQrkZ2gJfa0
         FarOSuApUNS2SMtGZvzkKU/bBX+QOgxALG+Cyvz4Kynaff3TI7IoXsTtP37rpElwBa
         wXl23EPHtoDcxUmKP/aZt692RXg3O2x7+PAF6JR0=
In-Reply-To: <CAHk-=wgdEHPm6vGcJ_Zr-Q_p=Muv1Oby5H2+6QyPGxiZ7_Wv+w@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On 9/15/21 9:47 PM, Linus Torvalds wrote:
> On Wed, Sep 15, 2021 at 12:35 PM Guenter Roeck <linux@roeck-us.net> wrot=
e:
>>
>> On a side note, we may revive the parisc patch. Helge isn't entirely
>> happy with the other solution for parisc; it is quite invasive and
>> touches a total of 19 files if I counted correctly.
>
> Ok, my suggestion to use the linker was not a "do it this way", it
> really was just a "maybe alternate approach". So no objections if
> absolute_pointer() ends up being the simpler solution.

Yes, it's a lot simpler and makes backporting patches later much easier.
I'll send a pull request with the updated parisc patch tomorrow.

Thanks,
Helge
