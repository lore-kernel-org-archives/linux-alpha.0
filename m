From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH] alpha: Use generic <asm-generic/io.h>
Date: Tue, 04 Oct 2022 22:28:24 +0200
Message-ID: <2e110666-7519-4693-8a89-240cbb118c7e@app.fastmail.com>
References: <20220818092059.103884-1-linus.walleij@linaro.org>
 <20221002224521.GA968453@roeck-us.net>
 <fd905ca5-fe0d-4cfb-a0d0-aea8af539cc7@app.fastmail.com>
 <57200020-c460-74ec-c786-9a2c16f4870e@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1664915325; x=1664918925; bh=L1dAVWM9hI
        49k06k8X7rdcp51n5V/7SEoorwe8xvFlI=; b=j8cpQrvHLhHNKhEn3FSlrRUTQj
        5lsbZnrGj2dMGEEfIx0TQ9xiYQabFZT4XLrcrcUp62XVyB8uA49q72FJXJlsLShr
        BCyzwPeo2aLCbThGQXpRcWByrlnPRpc6ZHtgjKRek/KM2FBFeKP4kdDHZ1Ehfxcy
        /ImnlH5l7ErXVwPNmMGtgAoa66tSAtkMr+1D05nvRkHjwMBH6XKnpTdQtWUubEon
        S3VbWx6IVb+GO1xRjlclEo6lvJT0SshFmsHMxot+4agGPGEcjuvVrlY1ndypU/L5
        fxxwx7TgvBtWGPXFf+sZoYqPumpurU+4wHGjsxCeKC4WJqPSEFRUN3dBJMug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1664915325; x=1664918925; bh=L1dAVWM9hI49k06k8X7rdcp51n5V
        /7SEoorwe8xvFlI=; b=k5m7Y7OwQG6MkZMKZrFceyesFcpw6IFEcb05DnsbFqI7
        v66JTiurhtijoCTNJOYeoWtn2EtbP0WTnIIQ9qNKtDo07Ae1BTyYHgfXAetuULms
        ypQaVEdZrnEYsIYJk3H+4i4vha8QEi36nThhgAOrMsGRj5T3NmhXBpUc+Nc/o0jq
        e+ZPYZehNxhV9awc0dTxHIHmQ9xFWZ+hj9ExIl7LKQsSm8KRZkAIV52c7ENLWcdP
        MzlvcbSLagM/MlUP16rqxUg2uJXxzVHS0cWtb8kFBw7YATrK5vsTv5Pt34tHFQsR
        xhPUDYojtL5zpkwx/VmdbArMq5yGN4unrZ9w5xYQaQ==
In-Reply-To: <57200020-c460-74ec-c786-9a2c16f4870e@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>

On Tue, Oct 4, 2022, at 9:42 PM, Guenter Roeck wrote:
> On 10/3/22 06:03, Arnd Bergmann wrote:
>> On Mon, Oct 3, 2022, at 12:45 AM, Guenter Roeck wrote:
>
> Looks like something was missed. When building alpha:allnoconfig
> in next-20221004:
>
> Building alpha:allnoconfig ... failed
> --------------
> Error log:
> <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> arch/alpha/kernel/core_marvel.c:807:1: error: conflicting types for 
> 'marvel_ioread8'; have 'unsigned int(const void *)'
>    807 | marvel_ioread8(const void __iomem *xaddr)
>        | ^~~~~~~~~~~~~~
> In file included from arch/alpha/kernel/core_marvel.c:10:
> arch/alpha/include/asm/core_marvel.h:335:11: note: previous declaration 
> of 'marvel_ioread8' with type 'u8(const void *)' {aka 'unsigned 
> char(const void *)'}
>    335 | extern u8 marvel_ioread8(const void __iomem *);
>        |           ^~~~~~~~~~~~~~

Right, I already noticed this and uploaded a fixed branch earlier today.
Should be ok tomorrow.

     Arnd
