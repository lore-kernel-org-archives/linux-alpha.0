From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
Date: Thu, 11 May 2023 09:01:17 +0200
Message-ID: <CAMuHMdV=PNCb1VYfUkEb9rPwGVB=1tkwvm-XBqECyhHR4SNGKg@mail.gmail.com>
References: <20230510195806.2902878-1-nphamcs@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20230510195806.2902878-1-nphamcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Nhat Pham <nphamcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-team-M8Ki61LpUEw@public.gmane.org, linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hannes-druUgvl0LCNAfugRpC6u6w@public.gmane.org, richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org, mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org, James.Bottomley-JuX6DAaQMKPCXq6kfMZ53/egYHeGw8Jk@public.gmane.org, deller-Mmb7MZpHnFY@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe.leroy-2tlSp11Fh4xulxpn9UvDqw@public.gmane.org, hca-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, gor-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, agordeev-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, borntraeger-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, svens-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org, dalias-8zAoT0mYgF4@public.gmane.org, glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org, jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-m68k@li

Hi Nat,

On Wed, May 10, 2023 at 9:58=E2=80=AFPM Nhat Pham <nphamcs-Re5JQEeQqe8Avxti=
uMwx3w@public.gmane.org> wrote:
> cachestat is previously only wired in for x86 (and architectures using
> the generic unistd.h table):
>
> https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs-Re5JQEeQqe8=
AvxtiuMwx3w@public.gmane.org/
>
> This patch wires cachestat in for all the other architectures.
>
> Signed-off-by: Nhat Pham <nphamcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
>  arch/arm/tools/syscall.tbl                  | 1 +

Looking at the last addition of a syscall (commit 21b084fdf2a49ca1
("mm/mempolicy: wire up syscall set_mempolicy_home_node"), it looks
like you forgot to update arm64 in compat mode? Or is that not needed?

>  arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +

For m68k:
Acked-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>

>  arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
>  arch/mips/kernel/syscalls/syscall_n32.tbl   | 1 +
>  arch/mips/kernel/syscalls/syscall_n64.tbl   | 1 +
>  arch/mips/kernel/syscalls/syscall_o32.tbl   | 1 +
>  arch/parisc/kernel/syscalls/syscall.tbl     | 1 +
>  arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
>  arch/s390/kernel/syscalls/syscall.tbl       | 1 +
>  arch/sh/kernel/syscalls/syscall.tbl         | 1 +
>  arch/sparc/kernel/syscalls/syscall.tbl      | 1 +
>  arch/xtensa/kernel/syscalls/syscall.tbl     | 1 +
>  14 files changed, 14 insertions(+)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCq=
xL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
