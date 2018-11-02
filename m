From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] include/asm/cmpxchg.h: Remove duplicate header
Date: Fri, 2 Nov 2018 12:01:18 -0700
Message-ID: <CAEdQ38Fh99QmusGbEBi9TjUKQbQDX90pEaUC5Y=s-BL=RQ3o_A@mail.gmail.com>
References: <20181102152637.GA3105@hp-pavilion-15-notebook-pc-brajeswar>
 <20181102182905.3klrdw4dxapeoiib@tower> <CAFqt6zYmBFQ7gDJJkYAhPzPYyLGsDqOdr8ctXmYbd7e9sv75xg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IhU2XrXFH1Kd1kmLevrD6bAw5GU/51Fr/Y3DBQC8Uo4=;
        b=uyLPVGUfxtvGIuY4oZxPSD3ztYWoyWW/md8zYE3HJrjiFR8SRWMUkTetTfbGuOf2Ac
         /Gu7xL5l5a5Tjsn+WW1jdUmlJ5FC6FPZCi4JrM7B8wSOJX/fRirhUg4vSs8jCgnYnyij
         blqDJ4AHO/45pHHV0BYsu19iaefn2112IHa7ELWXJqFpUHrXJaeBJtXvp1DgjznqcNsE
         wtbtMoThH1cmBD7lksigWNSbDSTFNsS+tLmWQdmgPupnTj3DPJuHpbrKUr4ibXqf8NnH
         RV0pyx3hx+rDENUX7S1L3u4NginaXgqgcCrt98cRpWzgnQEZ03LCkr7JeZmP7ic6X/7q
         +8iA==
In-Reply-To: <CAFqt6zYmBFQ7gDJJkYAhPzPYyLGsDqOdr8ctXmYbd7e9sv75xg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jrdr.linux@gmail.com
Cc: Michael Cree <mcree@orcon.net.nz>, brajeswar.linux@gmail.com, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Andrea Parri <parri.andrea@gmail.com>, Ingo Molnar <mingo@kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, sabyasachi.linux@gmail.com

On Fri, Nov 2, 2018 at 11:55 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
> We run the static analyser "make includecheck" which list out files where
> duplicate headers can be removed and based on that we thought to remove
> from this file. Didn't understood about the existence of second include ??


#define ____xchg(type, args...)         __xchg ## type ## _local(args)
#define ____cmpxchg(type, args...)      __cmpxchg ## type ## _local(args)
#include <asm/xchg.h>
[snip]
#undef ____xchg
#undef ____cmpxchg
#define ____xchg(type, args...)         __xchg ##type(args)
#define ____cmpxchg(type, args...)      __cmpxchg ##type(args)
#include <asm/xchg.h>

asm/xchg.h has a comment at the top that says

/*
 * xchg/xchg_local and cmpxchg/cmpxchg_local share the same code
 * except that local version do not have the expensive memory barrier.
 * So this file is included twice from asm/cmpxchg.h.
 */
