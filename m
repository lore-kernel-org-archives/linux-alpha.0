From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] syscalls: Cleanup references to sys_lookup_dcookie()
Date: Tue, 25 Jul 2023 09:18:19 +0200
Message-ID: <CAMuHMdX4HAMD5PA8OOsTGvx_1LuUw=Stegtcb9KQFVa-CP3T_w@mail.gmail.com>
References: <20230628230935.1196180-1-sohil.mehta@intel.com> <20230710185124.3848462-1-sohil.mehta@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20230710185124.3848462-1-sohil.mehta@intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian

On Mon, Jul 10, 2023 at 8:52=E2=80=AFPM Sohil Mehta <sohil.mehta@intel.com>=
 wrote:
> commit 'be65de6b03aa ("fs: Remove dcookies support")' removed the
> syscall definition for lookup_dcookie.  However, syscall tables still
> point to the old sys_lookup_dcookie() definition. Update syscall tables
> of all architectures to directly point to sys_ni_syscall() instead.
>
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Namhyung Kim <namhyung@kernel.org> # for perf
> ---
> v2:
> - Rebased to v6.5-rc1. No other dependencies.
> - Added acquired tags.

>  arch/m68k/kernel/syscalls/syscall.tbl               | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
