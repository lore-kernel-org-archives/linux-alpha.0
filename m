From: Matt Turner <mattst88@gmail.com>
Subject: Re: recent udev upgrade failure on alpha
Date: Thu, 24 Feb 2011 15:11:48 +0000
Message-ID: <AANLkTi=3mY=dUkhCRjFE_1-iPOMV8OHsGwqc1OF9zp9V@mail.gmail.com>
References: <20110224070203.GA28419@gherkin.frus.com> <20110224075149.GA28779@gherkin.frus.com>
 <002101cbd40a$fcb4a610$f61df230$@thetaphi.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=zhibfkhzYKw81NUWJ4NJlaTfc4hz38hMuTYG7MtQebc=;
        b=HI+jzMFM2ndcWcRrTAxlimD4BWh1qjaHYKdGc4stT5uUoESgnf3aOWfwAQ12hpDZQq
         s8O8HmbNE6JAxt/8dtwweBOrhzPOiLCgzUYlzZLRygFgbcsh4YPCedM6y9c2l7yPLczT
         X1JRReGr1L/oEjAw45gqzHzqSCoWG44QWyGks=
In-Reply-To: <002101cbd40a$fcb4a610$f61df230$@thetaphi.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Uwe Schindler <uwe@thetaphi.de>
Cc: Bob Tracy <rct@gherkin.frus.com>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org, mcree@orcon.net.nz

On Thu, Feb 24, 2011 at 10:09 AM, Uwe Schindler <uwe@thetaphi.de> wrote=
:
> My bigger problem is that recent kernels (even the stable one no long=
er work
> for me). On mounting my root =A0xfs filesystem it produces a message =
about a
> wrong relocation format / some other linking problem when loading the=
 XFS
> .ko (the exact message is not known, its somewhere in the screen buff=
er of
> the already rebooted with older kernel machine, I can only remember w=
hat the
> problem was - next time I try I will take a pen and write down the me=
ssage
> on console). This happens with the last stable kernel version, did no=
t test
> 2.7.37-1 until now.
> The last kernel that works for me is 2.6.31-1-alpha-generic. Does any=
body
> knows what the problem loading the XFS module is?
>
> Unstable is else still running fine!

This is the first I've heard of XFS not working (though, I've never
used it myself). Have you reported this anywhere?

Please mail linux-alpha@vger.kernel.org and the appropriate XFS
mailing list to try to get this fixed.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
