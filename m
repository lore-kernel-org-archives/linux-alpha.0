From: Matt Turner <mattst88@gmail.com>
Subject: Re: is alpha jensen support dead?
Date: Sun, 21 May 2017 22:33:33 -0700
Message-ID: <CAEdQ38F4aKXX4aDStWB5GEfCUfQ1Aige7i1_Pev8CMUtN02faw@mail.gmail.com>
References: <20170521085848.GA14559@lst.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=b2FHRyuRaRAtlQjPd9sLrVYOl9mK2SyfDGohJYL8XKo=;
        b=uU8zIhk8VZGd8KqQBGhPM9oOWlWXvCGyBLiUYoF8UHn4gzH6AH/99XVaHjht18/nNs
         kk/Zh6PSzIAo2xPUY145xFgTFh/VcdGO4KIuYIiJDECf2xFeh6CWLhuvAarNfalIfOPP
         oy0GjPKNZ9PJHrTZdDpGCH2bvLOnwueBJ2biPXfNMDSNOE3sA4oDGxss4r2oB3jj/k34
         FvEkhgR6rIaRAfLXECMdVxOOziXDW6bj0oF6/Nlkxw0jgYB65gy0RK4gh1A1oFTDJrco
         QpOdgw4ppZETjRXd/km/3Mg3GyozREwoTLwSmlaD/S0EKi0jZYD2XgpiLzDXLRP2PrIK
         nN8g==
In-Reply-To: <20170521085848.GA14559@lst.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Christian Borntraeger <borntraeger@de.ibm.com>, linux-alpha <linux-alpha@vger.kernel.org>, linux-arch@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, May 21, 2017 at 1:58 AM, Christoph Hellwig <hch@lst.de> wrote:
> Hi all,
>
> it seems like the Alpha Jense build (the only one using pci-noop.c)
> and thus being a different build than all the later PCI capable
> system has been broken since at least:
>
> commit 6aca0503847f6329460b15b3ab2b0e30bb752793
> Author: Christian Borntraeger <borntraeger@de.ibm.com>
> Date:   Tue Feb 2 21:46:33 2016 -0800
>
>     alpha/dma: use common noop dma ops
>
> which switches pci-noop.c to use generic code, but fat fingered a symbol
> and didn't wire up the Kconfig.
>
> Is there any value in keeping it alive?  Especially as there probably
> isn't any build coverage..
>
> Btw, how well is alpha working these days?  It looks like there hasn't
> been any maintainer activity for about two years.

I haven't had time for alpha stuff in quite a while.

I've never even had a Jensen, so it's never been important to me personally.
