From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v3 10/24] sparc: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 11:38:45 +0100
Message-ID: <6a420bb0e033562bc7f67cc8f218f994e0892d3b.camel__45221.024220676$1676371217$gmane$org@physik.fu-berlin.de>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
         <20230214074925.228106-11-alexghiti@rivosinc.com>
         <017f0b40-8021-8b3b-24d2-c70661b6b292@omp.ru>
         <f3db61bb-5c89-2724-769f-9d606f587f92@xen0n.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <f3db61bb-5c89-2724-769f-9d606f587f92@xen0n.name>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: WANG Xuerui <kernel@xen0n.name>, Sergey Shtylyov <s.shtylyov@omp.ru>, Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

On Tue, 2023-02-14 at 16:59 +0800, WANG Xuerui wrote:
> On 2023/2/14 16:50, Sergey Shtylyov wrote:
> > On 2/14/23 10:49 AM, Alexandre Ghiti wrote:
> > 
> > > From: Palmer Dabbelt <palmer@rivosinc.com>
> > > 
> > > As far as I can tell this is not used by userspace and thus should not
> > > be part of the user-visible API.
> > > 
> > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > ---
> > >   arch/sparc/include/asm/setup.h      | 6 +++++-
> > >   arch/sparc/include/uapi/asm/setup.h | 7 -------
> > >   2 files changed, 5 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/arch/sparc/include/asm/setup.h b/arch/sparc/include/asm/setup.h
> > > index 72205684e51e..d1384ed92547 100644
> > > --- a/arch/sparc/include/asm/setup.h
> > > +++ b/arch/sparc/include/asm/setup.h
> > > @@ -7,7 +7,11 @@
> > >   
> > >   #include <linux/interrupt.h>
> > >   
> > > -#include <uapi/asm/setup.h>
> > > +#if defined(__sparc__) && defined(__arch64__)
> > 
> >     Mhm, I don't think these two can be #define'd simulaneously...
> 
> I believe it's just a SPARC-ism [1] [2] that may look strange and be 
> easily confused for __aarch64__ (notice the extra 'a')...

Yep, that's correct. On 64-bit Linux/SPARC, gcc/clang define __sparc__ AND __arch64__.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
