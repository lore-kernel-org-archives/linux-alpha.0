From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH 0/6] Implement MMU_LAZY_TLB_SHOOTDOWN for alpha
Date: Wed, 24 May 2023 10:27:56 -0700
Message-ID: <CAHk-=wjdRm=0kHEAByy5FdV0TsnWt270Yi55RmoOdsPB6qSwzw@mail.gmail.com>
References: <20230524171822.177133-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1684949295; x=1687541295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObDKBRhJ0vxirZ4DEKIOQzI3AAzidba1IRigzBqLyYk=;
        b=WGWMX8QcBo5lDwOdLsqpGgY4sJ9lJ0BHzkJ05ccXe8dgvRKPeKLcMobRLAQRuIq0uB
         GxDuHsc5e2q16d3ryv7g8oD929F1nuAJH44m6Ad3bJh8I9yNiB8qFg5XmmAJC3MTw9FG
         mnIw3qWDfDC/WkKWrcFfumXoOU95rmuTmYKL8=
In-Reply-To: <20230524171822.177133-1-npiggin@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On Wed, May 24, 2023 at 10:18=E2=80=AFAM Nicholas Piggin <npiggin@gmail.com=
> wrote:
>
> Any thoughts about the series would be interesting to hear.

Well, alpha is in a deathmatch with ia64 on "least relevant
architecture ever, and next to be removed".

There are no winners in that match.

I still have the alpha architecture manual somewhere here, but I
haven't touched any actual hardware in decades.

But I certainly don't see anything _wrong_ with your series from a
quick read-through.  It would be nice to hear that it works on real
hardware, of course, but from previous attempts, there's only a couple
of people that still occasionally run it.

               Linus
