From: Matt Turner <mattst88@gmail.com>
Subject: Re: [RFC PATCH 0/6] Implement MMU_LAZY_TLB_SHOOTDOWN for alpha
Date: Wed, 24 May 2023 13:52:21 -0400
Message-ID: <CAEdQ38Gj8WC0X6vSEogLXhkBMtQD0a-pON2rbK2ZjKoEc69LVA@mail.gmail.com>
References: <20230524171822.177133-1-npiggin@gmail.com> <CAHk-=wjdRm=0kHEAByy5FdV0TsnWt270Yi55RmoOdsPB6qSwzw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684950752; x=1687542752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeLtVr4UO4JMNxK/AXKvfZvGOwBAANDQcSgKdemNgvA=;
        b=Ld1qt5/ZES5bjJsnDJ6647Z/VvYRUKZsx7NnddzH1W2J0Ew8UBRcLTl0q+AE9/4FMl
         MtGzjlpbKQfY/FMIj7xOTz+bt4YXR3Q39q4lojH0BC4WEleSHCZ1rbaB0EYBzQHJ67uR
         J0Wg6p5zX9QNfFebLMPD4Z8m1f5h8H3jvNlEmvv+Wl4KpWlGtkEroe3Wp0o7xEYct741
         vdh3OvRdyZ2on4hjS7qqDzI2sB2kaT+hoRVv7BGhAkTurOn9YUk+bZ+oPt0plDIQxJKK
         2UPXpWAHXYo7bzP3klaJcUMtHkQF5wwFsR4VCpbgVbnCBGwvZOh4AlLo9f1nqFVMRL/X
         XEVg==
In-Reply-To: <CAHk-=wjdRm=0kHEAByy5FdV0TsnWt270Yi55RmoOdsPB6qSwzw@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On Wed, May 24, 2023 at 1:28=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, May 24, 2023 at 10:18=E2=80=AFAM Nicholas Piggin <npiggin@gmail.c=
om> wrote:
> >
> > Any thoughts about the series would be interesting to hear.
>
> Well, alpha is in a deathmatch with ia64 on "least relevant
> architecture ever, and next to be removed".
>
> There are no winners in that match.
>
> I still have the alpha architecture manual somewhere here, but I
> haven't touched any actual hardware in decades.
>
> But I certainly don't see anything _wrong_ with your series from a
> quick read-through.  It would be nice to hear that it works on real
> hardware, of course, but from previous attempts, there's only a couple
> of people that still occasionally run it.

I'll be happy to test.
