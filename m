From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
Date: Wed, 24 Nov 2021 09:23:37 -0800
Message-ID: <CAMo8BfL18MQah-Bsf3NUUH+U5inLyErMfHoqr2vdwzUzCc=dyA@mail.gmail.com>
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ccJMIpDP63AsSWP0+gJpsJishWCjmMXQ0SENwgrm5zo=;
        b=LPQIsg+fnQjP+GIjcU+s2UMMyjwiLbLz29SB7qHmon0OqWk06zH7knq6feBANLCkBL
         i+O6SprIXvZ/RMchNw5acYJ9uMkd508g1WcEDkla4Ao/ZDtmKCSaEIOCy2BS48JnD6eZ
         eeJrqZuQva7WkELPIdub8lRIf/sL2XOOBWo1kY07QXJydijSe8PceQm7ghukbsZsXEvJ
         uTIZScnEmTsw7dp6imxmSBAeZV7cV5J7Ob229ctIQbA9R+O2pki82r+BhKZf9nOgVP3w
         p3BqEV6FrEZJK/3S3ghUyyumlvAqmGtD401bgDgsomSwG5ofZf3kcRFfKYo3ZIwOKFj9
         TyLg==
In-Reply-To: <20211124132112.11641-1-andrealmeid@collabora.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, "open list:IA64 (Itanium) PL..." <linux-ia64@vger.kernel.org>, "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, linuxppc-dev@lists.ozlabs.org, "open list:SUPERH" <linux-sh@vger.kernel.org>, "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>, "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, Andrew Morton <akpm@linux-foundatio>

On Wed, Nov 24, 2021 at 5:21 AM Andr=C3=A9 Almeida <andrealmeid@collabora.c=
om> wrote:
>
> Wireup futex_waitv syscall for all remaining archs.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@collabora.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
>  arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +
>  arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
>  arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
>  arch/sh/kernel/syscalls/syscall.tbl         | 1 +
>  arch/sparc/kernel/syscalls/syscall.tbl      | 1 +
>  arch/xtensa/kernel/syscalls/syscall.tbl     | 1 +
>  8 files changed, 8 insertions(+)

For xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
