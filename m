From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it as necessary
Date: Tue, 28 Dec 2021 11:08:05 +0100
Message-ID: <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com> <20211227164317.4146918-3-schnelle@linux.ibm.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20211227164317.4146918-3-schnelle@linux.ibm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Chris Zankel <chris@zankel.net>, Karol Gugala <kgugala@antmicro.com>, Jeff Dike <jdike@addtoit.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Brian Cain <bcain@codeaurora.org>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kern>

Hi Niklas,

On Mon, Dec 27, 2021 at 5:44 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> We introduce a new HAS_IOPORT Kconfig option to gate support for
> I/O port access. In a future patch HAS_IOPORT=n will disable compilation
> of the I/O accessor functions inb()/outb() and friends on architectures
> which can not meaningfully support legacy I/O spaces. On these platforms
> inb()/outb() etc are currently just stubs in asm-generic/io.h which when
> called will cause a NULL pointer access which some compilers actually
> detect and warn about.
>
> The dependencies on HAS_IOPORT in drivers as well as ifdefs for
> HAS_IOPORT specific sections will be added in subsequent patches on
> a per subsystem basis. Then a final patch will ifdef the I/O access
> functions on HAS_IOPORT thus turning any use not gated by HAS_IOPORT
> into a compile-time warning.
>
> Link: https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Thanks for your patch!

> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -16,6 +16,7 @@ config M68K
>         select GENERIC_CPU_DEVICES
>         select GENERIC_IOMAP
>         select GENERIC_IRQ_SHOW
> +       select HAS_IOPORT
>         select HAVE_AOUT if MMU
>         select HAVE_ASM_MODVERSIONS
>         select HAVE_DEBUG_BUGVERBOSE

This looks way too broad to me: most m68k platform do not have I/O
port access support.

My gut feeling says:

    select HAS_IOPORT if PCI || ISA

but that might miss some intricate details...

Gr{oetje,eeting}s,

                        Geert
