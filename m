From: Matt Turner <mattst88@gmail.com>
Subject: Re: 2.6.35-rc2 compilation error on Alpha
Date: Sun, 6 Jun 2010 20:08:51 -0400
Message-ID: <AANLkTim9aWVzb7v5fnS6x3ghMU2_tpaLlbZu3SKXV_0R@mail.gmail.com>
References: <4C0C22C4.3010705@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=PJIrxM+8uKd/b+hNrwngb3u7QIZWh2T+KW+FbIeOL3k=;
        b=Jd8rpI31bIUEBQDemlvA0hmhpySwl9qPfM7HGI/7717NqLNzos1qtYqH1RxVn2kHaJ
         k739x7ZpKOpKxGLxP4TNl+J17XC3WSNhw9m8mW83ArAgt3FyWFpD0dMCOcCz3mPbuS//
         yAdAHbYUksNN92nO4I/z1pEhzo+Gn/P2LZRnE=
In-Reply-To: <4C0C22C4.3010705@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <borislav.petkov@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org

On Sun, Jun 6, 2010 at 6:35 PM, Michael Cree <mcree@orcon.net.nz> wrote=
:
> When compiling 2.6.35-rc2 for Alpha architecture the following compil=
er
> error is seen:
>
> =A0CC =A0 =A0 =A0arch/alpha/kernel/asm-offsets.s
> In file included from include/linux/kernel.h:17,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/sched.h:54,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from arch/alpha/kernel/asm-offsets.c:=
9:
> include/linux/bitops.h: In function =91hweight_long=92:
> include/linux/bitops.h:49: error: implicit declaration of function
> =91__arch_hweight32=92
>
> Cheers
> Michael.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-alpha=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Yeah, it was a stupid typo in
1527bc8b928dd1399c3d3467dd47d9ede210978a. I've fixed it and put the
patch in my tree for Linus.

Unfortunately, there's another compile error--PCI breakage. I'll do thi=
s too...

Thanks,
Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
