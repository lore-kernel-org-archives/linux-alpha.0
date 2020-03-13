From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH v4] alpha: Replace setup_irq() by request_irq()
Date: Fri, 13 Mar 2020 10:38:18 -0700
Message-ID: <CAEdQ38E2VEK=XZySOdm=zPj6dAOf0FuzuS39Y+AYTFVctB6zuw@mail.gmail.com>
References: <20200304005209.5636-1-afzal.mohd.ma@gmail.com>
 <20200305130843.17989-1-afzal.mohd.ma@gmail.com> <20200313124821.GD7225@afzalpc>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R3dyNr4k5uWyS12uYVE6FnBN9I0mOgh5neR4n7Md79s=;
        b=ee5U9Uz3MBtT6Nz8t621V9cJN5wg3+7ZOmT+cjtjz9yVgKB6xgHYYRybpm0tjQ9QFW
         UGcjiprG0XDeCfpQbAFG3voJF42p6Tz15VbiqWg1ueGEmyyZ1wRpScmPVSclQ1Wo59Cp
         ig37pPj54xRLrAg5Ne+sMfrmKMbHCRItjmSra80vHh0cwjoHwx0JF00QJDe5Erhe5Kr1
         tTLxmCmwU71NpDntU9u6MzMCayInnzI7hiMNZfnfHdJDmESGEqGaMwasHrNoGnvcgC9U
         EeSrZgB7hscZD4CSfsB8PAdy+S1PbcjEjInySA6+4S0CDDeh7bTQcWiHUb32n41DthI7
         Px2A==
In-Reply-To: <20200313124821.GD7225@afzalpc>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: afzal mohammed <afzal.mohd.ma@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Mar 13, 2020 at 5:48 AM afzal mohammed <afzal.mohd.ma@gmail.com> wrote:
>
> Hi Richard Henderson, Ivan Kokshaysky, Matt Turner,
>
> On Thu, Mar 05, 2020 at 06:38:41PM +0530, afzal mohammed wrote:
> > request_irq() is preferred over setup_irq(). Invocations of setup_irq()
> > occur after memory allocators are ready.
> >
> > Per tglx[1], setup_irq() existed in olden days when allocators were not
> > ready by the time early interrupts were initialized.
> >
> > Hence replace setup_irq() by request_irq().
> >
> > [1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
> >
> > Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
>
> If this patch is okay, please consider acking it so as to take it via
> tglx.
>
> Regards
> afzal

Thanks afzal,

Acked-by: Matt Turner <mattst88@gmail.com>
