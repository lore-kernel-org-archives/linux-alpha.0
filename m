From: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 11/13] m68k/mm: make node data and node setup depend on
 CONFIG_DISCONTIGMEM
Date: Wed, 28 Oct 2020 13:16:31 +0200
Message-ID: <20201028111631.GF1428094@kernel.org>
References: <20201027112955.14157-1-rppt@kernel.org>
 <20201027112955.14157-12-rppt@kernel.org>
 <CAMuHMdU4r4CJ1kBu7gx1jkputjDn2S8Lqkj7RPfa3XUnM1QOFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6whDlm42N3pELagMmdULzK2aTuiW2rxkqhHMxZjugg8=; b=AEjIEZSGRXvppWxnzwx4aKnro
	qV6tvZGHfstMKDMjFQTQroCUybLvGKdVWOsA80cWPS9w3vKjF/R9p1I9MyCIcvEdfWm0TKbO6aPqm
	szynrlDWstLZlOSefkWBY5gvtCC3XROu4262vRrtckMjVNfCr3m9DIDWFQcOCi051/dO6IaIMQM98
	3NBx4hj8jGSTVwoMFNw5QMhK1QjmvfS73AGdFgSj7WavuvT7wfxufAzdJfcgsG4Q65UCFeEUqCtY8
	fJBFFOtWHhP0j0YE/RCfeIr6xhkefgaVilG4K4CS12Eleq9+encjlnlbi//vOrstN96lJ/tXqxqdo
	Z/lQph6aQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603883801;
 bh=3DtSsbNWZaTf7v/7udK+AIDJ92sxyETNXeC2IzpbaLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nNqIykwPXzPeiPb6AYNYHQQXiJyXiYtwLr73B//voWR8TZa6Eb5++4CieyFXxEh1h
 1/1jSd7uHggtcYYQ6K5jPMWeaE8D3Si3dAD3bEDewru+HlpqXxaIyeUj0n/GkzF1sK
 d2ZhRYNYGHxIcFCusFeRPJXtjEnybkIYxxUOxr+4=
Content-Disposition: inline
In-Reply-To: <CAMuHMdU4r4CJ1kBu7gx1jkputjDn2S8Lqkj7RPfa3XUnM1QOFg@mail.gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linux MM <linux-mm@kvack.org>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>, Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>, Alexey Dobriyan <adobriyan@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux

Hi Geert,

On Wed, Oct 28, 2020 at 10:25:49AM +0100, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Tue, Oct 27, 2020 at 12:31 PM Mike Rapoport <rppt@kernel.org> wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > The pg_data_t node structures and their initialization currently depends on
> > !CONFIG_SINGLE_MEMORY_CHUNK. Since they are required only for DISCONTIGMEM
> > make this dependency explicit and replace usage of
> > CONFIG_SINGLE_MEMORY_CHUNK with CONFIG_DISCONTIGMEM where appropriate.
> >
> > The CONFIG_SINGLE_MEMORY_CHUNK was implicitly disabled on the ColdFire MMU
> > variant, although it always presumed a single memory bank. As there is no
> > actual need for DISCONTIGMEM in this case, make sure that ColdFire MMU
> > systems set CONFIG_SINGLE_MEMORY_CHUNK to 'y'.
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> Thanks for your patch!
> 
> > ---
> >  arch/m68k/Kconfig.cpu           | 6 +++---
> >  arch/m68k/include/asm/page_mm.h | 2 +-
> >  arch/m68k/mm/init.c             | 4 ++--
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> Is there any specific reason you didn't convert the checks for
> CONFIG_SINGLE_MEMORY_CHUNK in arch/m68k/kernel/setup_mm.c

In arch/m68k/kernel/setup_mm.c the CONFIG_SINGLE_MEMORY_CHUNK is needed
for the case when a system has two banks, the kernel is loaded into the
second bank and so the first bank cannot be used as normal memory. It
does not matter what memory model will be used in this case. 

> and arch/m68k/include/asm/virtconvert.h?
 
I remember I had build errors and troubles with include file
dependencies if I changed it there, but I might be mistaken. I'll
recheck again.

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Sincerely yours,
Mike.
