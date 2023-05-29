From: "Nicholas Piggin" <npiggin@gmail.com>
Subject: Re: [RFC PATCH 0/6] Implement MMU_LAZY_TLB_SHOOTDOWN for alpha
Date: Mon, 29 May 2023 11:45:50 +1000
Message-ID: <CSYDRI4DZR8L.3JREZ0ONNHOLN@wheely>
References: <20230524171822.177133-1-npiggin@gmail.com>
 <CAHk-=wjdRm=0kHEAByy5FdV0TsnWt270Yi55RmoOdsPB6qSwzw@mail.gmail.com>
 <CAEdQ38Gj8WC0X6vSEogLXhkBMtQD0a-pON2rbK2ZjKoEc69LVA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685324757; x=1687916757;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQkbWL+3Ev4nMwJJ7UFzRpYF9hOTVDMnYEMUVrkmMnA=;
        b=MKKjYM3tC123uLigsG3vu+S+cjQhXdJbyj4SpSUD5oihrc9ak7SDpxWYAtxPDjJoMo
         SW868iZGKqAaFcJRtqdw5L/sjvJ8NX7P4FNh8o1iCRzrhJnLquhuXUZY00Mh2gq2T8ht
         J7Aj/GeBFoK/HOFOcap947xleDFz6P2yOJ9q/NHYkDt3FRomuQCoDnbmuvqjMfU053Ge
         fT9GmacYaS+4q/JZ8ajbkZ8YNZg0yQpl52CvdTM79vLDdtWjHoW0jCKjLb7dfbm37pAg
         5qaexZt2kQapDkItpl2olrZymiPJ3hXzps98r2/jeB7Fcdpk/uhErlzNLjtcpxLsMNIe
         1CHw==
In-Reply-To: <CAEdQ38Gj8WC0X6vSEogLXhkBMtQD0a-pON2rbK2ZjKoEc69LVA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Matt Turner <mattst88@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On Thu May 25, 2023 at 3:52 AM AEST, Matt Turner wrote:
> On Wed, May 24, 2023 at 1:28=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, May 24, 2023 at 10:18=E2=80=AFAM Nicholas Piggin <npiggin@gmail=
.com> wrote:
> > >
> > > Any thoughts about the series would be interesting to hear.
> >
> > Well, alpha is in a deathmatch with ia64 on "least relevant
> > architecture ever, and next to be removed".
> >
> > There are no winners in that match.

Except that I don't get yelled at by so many people when things break.
Why do you think I work on powerpc? (/s, kind of).

At least it's a reference, hopefully we can get a bit more interest. If
we get a few converted then we could find some common patterns and pull
them into generic code or at least a simpler recipe as we try to convert
everything and just make this the only way it's implemented. Of course
we need the big archs on board at some point.

> > I still have the alpha architecture manual somewhere here, but I
> > haven't touched any actual hardware in decades.
> >
> > But I certainly don't see anything _wrong_ with your series from a
> > quick read-through.  It would be nice to hear that it works on real
> > hardware, of course, but from previous attempts, there's only a couple
> > of people that still occasionally run it.
>
> I'll be happy to test.

Thanks Matt, I'll put a git tree up and ping you.

Thanks,
Nick
