From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: build failure of next-20220818 due to 81c0386c1376 ("regmap:
 mmio: Support accelerared noinc operations")
Date: Thu, 18 Aug 2022 22:55:58 +0200
Message-ID: <CACRpkda1-FBa5Pg1WxaPYGYgaYWz-nEAiN01twouJ4AeKpnMWQ@mail.gmail.com>
References: <Yv4hhoTTcRuk/2Kl@debian>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=5AqMTUOafuor9bD+L7lV88ZEJ/jKLotcwTHvR2YIZ54=;
        b=d6rI5yBNn0HKXzLQQzJICy5/Ucwg1kVprijxc1ueN4xCG6rnpFDv2sJw4c9gn0pFb/
         oxK8vBM1d9KVBz3PmQobsROfOdNSb8ttqmJAF6coEGldZZ3YWfYgH8ajrUfSFLcf49sq
         5rXnDKt5muPjVmilXrq2WH8beyBFahPcNQUAi3eotyAiK69lQ3apFPLDgF+YadMzikP2
         J+8rQOuh3NuH8tqcivIj0DpVByKsZqLZ8G4bMeS1Rg5F/YFgJVLRhRqXCYHUgsLDvjHs
         dVGgifndGmF8hE7VnXfgNV4jRVZI1iGTkr2KV3iYNzWi1qtHmPzxHJ2awfJHqEKNHGTo
         yE1w==
In-Reply-To: <Yv4hhoTTcRuk/2Kl@debian>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On Thu, Aug 18, 2022 at 1:24 PM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:

> Not sure if it has been reported, builds of alpha allmodconfig have
> failed to build next-20220818 with the error:

Patch has been sent already:
https://lore.kernel.org/linux-arch/CAK8P3a1x52F8Ya3ShQ+v6x_jANfUsEq0E55u+pOBNaYniRO7cA@mail.gmail.com/T/#t

Yours,
Linus Walleij
