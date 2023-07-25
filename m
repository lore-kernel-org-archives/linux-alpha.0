From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v4 3/5] arch: Register fchmodat2, usually as syscall 452
Date: Tue, 25 Jul 2023 09:16:17 +0200
Message-ID: <CAMuHMdXzYxo83AXfWWVyp2fL3fcEUNgbG5aSZuA62FwO2i3jDg@mail.gmail.com>
References: <cover.1689074739.git.legion@kernel.org> <cover.1689092120.git.legion@kernel.org>
 <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Alexey Gladkov <legion-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>, James.Bottomley-JuX6DAaQMKPCXq6kfMZ53/egYHeGw8Jk@public.gmane.org, acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, christian-STijNZzMWpgWenYVfaLwtA@public.gmane.org, dalias-8zAoT0mYgF4@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, deepa.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, deller-Mmb7MZpHnFY@public.gmane.org, dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, fenghua.yu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org, gor-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, hare-IBi9RG/b67k@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org, jhogan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kim.phillips-5wv7dgnIgG8@public.gmane.org, ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux

On Tue, Jul 11, 2023 at 6:25=E2=80=AFPM Alexey Gladkov <legion-DgEjT+Ai2ygd=
nm+yROfE0A@public.gmane.org> wrote:
> From: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
>
> This registers the new fchmodat2 syscall in most places as nuber 452,
> with alpha being the exception where it's 562.  I found all these sites
> by grepping for fspick, which I assume has found me everything.
>
> Signed-off-by: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane=
.org>
> Signed-off-by: Alexey Gladkov <legion-DgEjT+Ai2ygdnm+yROfE0A@public.gmane=
.org>

>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +

Acked-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCq=
xL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
