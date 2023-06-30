From: Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH] syscalls: Cleanup references to sys_lookup_dcookie()
Date: Thu, 29 Jun 2023 22:33:51 -0700
Message-ID: <CAM9d7ch0GtTUjhtbph5rmCDvRBAKjLCN+25mukn_QPv4bDsjGQ@mail.gmail.com>
References: <20230628230935.1196180-1-sohil.mehta@intel.com> <08e273fc-49c5-dd09-1c9e-d85a080767f9@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <08e273fc-49c5-dd09-1c9e-d85a080767f9@infradead.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Sohil Mehta <sohil.mehta@intel.com>, Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <>

Hello,

On Wed, Jun 28, 2023 at 4:44=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 6/28/23 16:09, Sohil Mehta wrote:
> > commit 'be65de6b03aa ("fs: Remove dcookies support")' removed the
> > syscall definition for lookup_dcookie.  However, syscall tables still
> > point to the old sys_lookup_dcookie() definition. Update syscall tables
> > of all architectures to directly point to sys_ni_syscall() instead.
> >
> > Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

I was about to say that it'd be nice if you split the tools/perf part
since it can support old kernels.  But if the syscall is only used for
oprofile then probably perf doesn't need to care about it. :)

For the perf part,
Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung
