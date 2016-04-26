From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 16/23] alpha: remove ARCH_WANT_OPTIONAL_GPIOLIB
Date: Tue, 26 Apr 2016 13:59:04 +0200
Message-ID: <CACRpkdbPn8cC-ODnsYz=96srXMJCEt0ayQtJ2Zyro36s-dap=g@mail.gmail.com>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
	<1461142701-21096-17-git-send-email-linus.walleij@linaro.org>
	<CAEdQ38Hxa10s1QgEOrfL93=MFH4477ZLaFJSJyZdA3B+v++jtw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=JDyoxOG3pTXzwo2cxvEeL8Un0lT5wUFfv8JWvJVAzU0=;
        b=RHFTE+JqSdEbLxc03m0g6yFe93WX50poGO/E+D+ETY6H8XB3u0oqiB62EUFVm4zXdB
         j86orwtfKJTGOAAAP+Z17Wnr43/UKpT5VQJns5LkycyPRYgzI48YEqc4IbtrFKjz8+8v
         GS9a3dE9yJDavHDOQHKkuhjHswDjZUxWjmz/Y=
In-Reply-To: <CAEdQ38Hxa10s1QgEOrfL93=MFH4477ZLaFJSJyZdA3B+v++jtw@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Michael_B=C3=BCsch?= <m@bues.ch>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>

2016-04-20 18:15 GMT+02:00 Matt Turner <mattst88@gmail.com>:

> Acked-by: Matt Turner <mattst88@gmail.com>

Thanks, patch applied to the GPIO tree with your ACK.

Yours,
Linus Walleij
