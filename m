From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 09:58:17 +0100
Message-ID: <CAMuHMdVG4=UmKDa17dys9e3iGM75u4+13nQVyjMHK--aD6WKfw@mail.gmail.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <Y+tIl07KOOrGZ2Et@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=562SvQpBzjQHa5cAw41xKdTFJrPEeCJPgQWZuU9C5Sw=; b=DVUA6lNR8u1+pq
	0Vf4mnfX3UuHfSjauFBPLxtfKcb5Rd2SmKX8skzu7d4lAC4KzjROEZqEwlwNHEheDAzzLpL9QhVWx
	hqwnFq1Kg01yJPcFcJnc3iTjkTt1m24TK/faHW4eJhYizqUcfKac3E4CILrTGpdRcnBCKckcbUT/Y
	PFjRXrtpKdEeVUPsGYwvak4EjGaCwVQuh3hv49LfV4bNJvorHI/n1+RbvklRFnAe845AcoYMiTJc2
	0OC+BsKVZU1qvrQIzx0k500ybDKzra4EctHm+2OCZja2JoZH1yJ+fwld+3qmP2sFgABiC/tA5cIxD
	9mJtscltrvsl0wSM4+Dg==;
In-Reply-To: <Y+tIl07KOOrGZ2Et@osiris>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Alex

Hi Heiko,

On Tue, Feb 14, 2023 at 9:39 AM Heiko Carstens <hca@linux.ibm.com> wrote:
> On Tue, Feb 14, 2023 at 08:49:01AM +0100, Alexandre Ghiti wrote:
> > This all came up in the context of increasing COMMAND_LINE_SIZE in the
> > RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
> > maximum length of /proc/cmdline and userspace could staticly rely on
> > that to be correct.
> >
> > Usually I wouldn't mess around with changing this sort of thing, but
> > PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
> > to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
> > increasing, but they're from before the UAPI split so I'm not quite sure
> > what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
> > asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
> > boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
> > and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
> > asm-generic/setup.h.").
> >
> > It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
> > part of the uapi to begin with, and userspace should be able to handle
> > /proc/cmdline of whatever length it turns out to be.  I don't see any
> > references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
> > search, but that's not really enough to consider it unused on my end.
> >
> > The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
> > shouldn't be part of uapi, so this now touches all the ports.  I've
> > tried to split this all out and leave it bisectable, but I haven't
> > tested it all that aggressively.
>
> Just to confirm this assumption a bit more: that's actually the same
> conclusion that we ended up with when commit 3da0243f906a ("s390: make
> command line configurable") went upstream.

Commit 622021cd6c560ce7 ("s390: make command line configurable"),
I assume?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
