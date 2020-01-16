From: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] ubifs: Fix ino_t format warnings in orphan_delete()
Date: Fri, 17 Jan 2020 00:44:03 +0100
Message-ID: <CAFLxGvxNUcKiaCxXy_oracH-3xg3MPETxkaDqgtkMkB1vp-02Q@mail.gmail.com>
References: <20200113105156.25945-1-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dHTGBkgzigId/zi0TOnYQjBsf6HAV19Aov7etVocQr4=;
        b=nkMxee7mkhPsFnsTSgqVfS0Up+8cTe72MvM/2bMae4kd1D0j7q1OUOdW0oLJxBbSIK
         9Bi90ue3VO7d+kNj/BGIwnKKDFCAeb3JxpNleXMZETVXxztv1FIZFCIO66SPBeHDnkXJ
         WDA0TAbej0BCxjfO9HgpdHtEkdbpsP2wkxY/ktTPOF9jGQpd5h0kup9rrP8UKQ+AEy9B
         xzLvt3IZ71WZZRPbY9DQFQrKlS5Qf9aZSejvh9ePXKBHpsxk695jLXQSpp9oGijyPgno
         CECYx2xCkwz1/b/1dPu/WExst1CjFWG8F8q7i4DfSFwFRLPE9uSSS7gyOHJu+f0PCG6F
         1iRA==
In-Reply-To: <20200113105156.25945-1-geert@linux-m68k.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

On Mon, Jan 13, 2020 at 11:52 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On alpha and s390x:
>
>     fs/ubifs/debug.h:158:11: warning: format =E2=80=98%lu=E2=80=99 expect=
s argument of type =E2=80=98long unsigned int=E2=80=99, but argument 4 has =
type =E2=80=98ino_t {aka unsigned int}=E2=80=99 [-Wformat=3D]
>     ...
>     fs/ubifs/orphan.c:132:3: note: in expansion of macro =E2=80=98dbg_gen=
=E2=80=99
>        dbg_gen("deleted twice ino %lu", orph->inum);
>     ...
>     fs/ubifs/orphan.c:140:3: note: in expansion of macro =E2=80=98dbg_gen=
=E2=80=99
>        dbg_gen("delete later ino %lu", orph->inum);
>
> __kernel_ino_t is "unsigned long" on most architectures, but not on
> alpha and s390x, where it is "unsigned int".  Hence when printing an
> ino_t, it should always be cast to "unsigned long" first.
>
> Fix this by re-adding the recently removed casts.
>
> Fixes: 8009ce956c3d2802 ("ubifs: Don't leak orphans on memory during comm=
it")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  fs/ubifs/orphan.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied! Thank you, Geert.

--=20
Thanks,
//richard
