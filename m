From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH] alpha: Implement "current_stack_pointer"
Date: Sun, 26 Feb 2023 11:24:13 +0100
Message-ID: <29763841-bdaa-4a4b-aa0e-5e1b3935317d@app.fastmail.com>
References: <20220224060558.1856804-1-keescook@chromium.org>
 <CAEdQ38Fg=Au5=BbyTHiEO+GaivheCe6hPBjcZhjgALxn4503Mg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1677407087; x=1677493487; bh=qvprucDJaZ
        MPGC2xxQDJGF4hnoZoF7bFF2Ldncdq+yE=; b=OI6MSH8tehUg+t61CTC6oBr3tK
        BagtQQc4URzzPmCvMIcefcYHkeoj50796rbyZ9/RJmx/ZIXs+gxZjDTOJSMY/Y6m
        bWk1DYSQlTrWE7FHYfiIZNOk+JZ4q0gXMHCfzwc0+U1/Ozm9ppchzU5nkdsPwOsJ
        L6+iDv5OVXTCqhfho3xTsDaV0LEix46TNePpteDqEBMNP09Fy9Ccv8zGsHIwbVYv
        8gYmj1lUgqo1xrswDJuAv/qawHQL/b5q0XDvIxVNhr7mndeVXhchvyTBpx1xMEXO
        exV1gK14efpV0EZ/uMm/+gZOjMc73fedf0UDQDCkSJ/hLpwnktT6R5WGeZ8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1677407087; x=1677493487; bh=qvprucDJaZMPGC2xxQDJGF4hnoZo
        F7bFF2Ldncdq+yE=; b=PRmE3mnXSeWF2pOk7TXh5n+ECRx06eFYFNHqGpPffp5t
        OoAn2hroGJuIWdEKxo6bWxbgEk+U0cvvN6j6ODD31EECmoVFaRWf50ig7IConEs0
        yqKuTjFz+d2IFVBLiRpDkKc4K2Kl6MZn7X6I5lLx1hhsUUrXcrecoMMWKGZI4/wQ
        DDwwgh5hPIBFi3xTptf1B4IuZ87Stagr0uVIjSlYzIcSUaMN59BDw6QXaMo96YBn
        XXLKRdFDvqt7IRAzmqY3dDUtGEVC3FGHDJEp2sblJIQKMUvc+atppzvEvmSUJeRz
        NCYnpzqRNBxrvPu+UFcxhXYSHfFH8lwHS1PLCaV0sQ==
In-Reply-To: <CAEdQ38Fg=Au5=BbyTHiEO+GaivheCe6hPBjcZhjgALxn4503Mg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Sun, Feb 26, 2023, at 03:08, Matt Turner wrote:
>
> Thanks for the patch! This was included in my pull request today and
> is now upstream in Linus' tree.

[trimming Cc list for hijacked thread]

Hi Matt,

I remember that Stephen Rothwell mentioned he dropped a couple of
architecture trees from linux-next due to long inactivity, and I
see that none of your branches are included any more. Should

https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git/log/?h=for-linus

or the (currently empty) alpha-next branch be added back there?

      Arnd
