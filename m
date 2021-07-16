From: Matt Turner <mattst88@gmail.com>
Subject: Re: Concern about arch/alpha/kernel/smc37c669.c
Date: Thu, 15 Jul 2021 23:28:33 -0700
Message-ID: <CAEdQ38Ht+WfROb1nvQBJaMjn49d98NYpEa6idAaWNMVJ8V-PFg@mail.gmail.com>
References: <7b314145-cbb9-b491-ccf5-d6021a574339@windriver.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kQbnoZ4GXI+Z/rBFLWYGRWA+0vR/EX50wcqWIvvUhI8=;
        b=NP6XNMxQc37xj118IifdcxKmgwuiZ+s0zb8sCoyhFMA0Trez8FyAUk9m/ZfUKppvjq
         WdaaPeD+IubA/cHuuO/64D3ChjKsuCDzLgjxSsWuVJEL+Moutr3tlF7WyZtpl34YHYx8
         rUl4ewW1qWPcqfgOff2FXe/9EjK+WAC708CeRz8Mav83FEOGUwHRO/dgF83SofkGeLIF
         Vizuad5jS6WfH7rMp7vmPGfSelPkskFixkA7LGm3mj3K/CHKJR/YFCuQDwXFKnHyVBU2
         bnQ45b4tutRZhmjHGNjm6m/oHuMG5aXn0S0Df9DuwqmRTBT1uExA02sU9nfPJwwp9TOi
         voWg==
In-Reply-To: <7b314145-cbb9-b491-ccf5-d6021a574339@windriver.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: He Zhe <zhe.he@windriver.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, May 7, 2021 at 1:31 AM He Zhe <zhe.he@windriver.com> wrote:
>
> Hello maintainers,
>
> There is no "SPDX-License-Identifier: GPL-2.0" in arch/alpha/kernel/smc37c669.c
> and the following copyright is found.
> "
> Copyright (C) 1997 by
> Digital Equipment Corporation, Maynard, Massachusetts.
> All rights reserved.
> "
>
> Does this conflict with GPLv2? Anything else we need to know when using this as opensource software?

Unless you're using a DEC Alpha CPU, you're not using this code.
