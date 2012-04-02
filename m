From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: fix build failures from system.h dismemberment
Date: Mon, 2 Apr 2012 17:23:50 -0400
Message-ID: <CAEdQ38G=uwPuN1fmZca1w+1q0HGiLzLYP8DkZ-AFiRQcPJT+JA@mail.gmail.com>
References: <1333401674-26007-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=XuZbJeTeGKaPjK0ry45m+A1mFMJGGKzuCdN6R3rdMnc=;
        b=ulaJFvqKL36V2kKx3dXoRPX/IP5qhHSvE0Eein/1OhUADhatRhXe5wUm6s5EmVWfMH
         VkJZQPX3pbZ8ZOI6LpOx3FKDbFEjDUy1eNKEFUPK1oVP4yP6aJSIBywf3yLUtYuIZPlM
         Wyde5Gxk0BxrQE7zHQ6Vnrwoq3GxW1NteU6xjRBkRyU/AAL5W9MSA9KXtl5wo1pTe9E0
         uSoV9eG0yUaCM0+NzS/4ztgnQnmp2YN8eHh0Pr39Lw8WNSkVT+mdvatN8rWiSlM/1YOt
         DoVgGuEmEAejn9TfkGcVOggAnRr+bOPxTrg+pKibtdrXNKSlp0Pw6xhKqDRctM66XZ4k
         0SmQ==
In-Reply-To: <1333401674-26007-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, David Howells <dhowells@redhat.com>

On Mon, Apr 2, 2012 at 5:21 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> commit ec2212088c42ff7d1362629ec26dda4f3e8bdad3
>
> =A0 =A0"Disintegrate asm/system.h for Alpha"
>
> combined with commit b4816afa3986704d1404fc48e931da5135820472
>
> =A0 =A0"Move the asm-generic/system.h xchg() implementation to asm-ge=
neric/cmpxchg.h"
>
> introduced the concept of asm/cmpxchg.h but the alpha arch
> never got one. =A0Fork the cmpxchg content out of the asm/atomic.h
> file to create one.
>
> Some minor whitespace fixups were done on the block of code that
> created the new file.
>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: David Howells <dhowells@redhat.com>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: Matt Turner <mattst88@gmail.com>
