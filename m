From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] fix osf_wait4() breakage
Date: Sun, 22 Jul 2018 11:45:29 -0700
Message-ID: <CA+55aFxyagGA=3XqqVhw8XAKG90Z+EWKYA=DSVkQKzmHsO+6cQ@mail.gmail.com>
References: <20180722140711.GF30522@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2zIYqof/wyWEfb8OugjakOp1sks1FLuEozB2G3y4u6E=;
        b=TW5EyYmeT+IL+U+Fn+e+fjq3Rf8PyCuamzLiGyalo0y31ztqzbs3c16ItoHAYDBBi8
         6nu1UG9agzvkmb1z4i2NTiEDf8323284SWqXGbJwx1D5gRX+iCH1z6JIO0I9/FF8qWct
         +Fi73CfeEFUU3domicuO+Ogu6RCm5eO4gQThY=
In-Reply-To: <20180722140711.GF30522@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

Applied.

Just a note:

On Sun, Jul 22, 2018 at 7:07 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Fixes: "osf_wait4: switch to kernel_wait4()"

Please put the actual commit ID there too, because that's what people
with automation check.

> Cc: stable@vger.kernel.org # v4.12+

.. and when you do that, you'll see that it wasn't actually in 4.12,
but got merged during the 4.13 merge window:

    $ git name-rev 92ebce5ac55d
    92ebce5ac55d tags/v4.13-rc1~154^2

(unless it was backported, but I don't think it was).

Also, the prototype for kernel_wait4() (in <linux/sched/task.h>) is
wrong, and doesn't have the __user annotation.

                Linus
