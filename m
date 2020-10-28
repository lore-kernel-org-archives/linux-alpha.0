From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 11/13] m68k/mm: make node data and node setup depend on
 CONFIG_DISCONTIGMEM
Date: Wed, 28 Oct 2020 10:25:49 +0100
Message-ID: <CAMuHMdU4r4CJ1kBu7gx1jkputjDn2S8Lqkj7RPfa3XUnM1QOFg@mail.gmail.com>
References: <20201027112955.14157-1-rppt@kernel.org>
 <20201027112955.14157-12-rppt@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U7gMZYLrMU/08wE7w6fQsW3KtA7NGziWCcfCdA8V9fQ=; b=BL/47kH8Oz7N98rdwPGYW6Yj4
	FbZFscv5z5ia+S0NAL0dQtt86ZDc0+b3pkMynx28Hs1JSlA6Xa1YfYelcJgauG6tL/iqn/Rfl/dY3
	KHYfMuv8NcVR2lzJ/svWBYIYzul8l0m0Fuix08ylrdcia5Au6X4DLLwwh9Y777be89hM+inMZkX2D
	dHwS8PZIiB872uNwG9FoQ3yfIH48xwINXRXLi6do9LMj/3/HpOin2B4ZCWDbCUC1gCy3jHpMS4jpu
	Y/c5J3zPx6vzl0mX7v0gsrZMmk7oPLFnP3otClVfFWhhMiuaK3wultcxsIWItwAN9CDCOSF/87YGx
	8P17oY5Sw==;
In-Reply-To: <20201027112955.14157-12-rppt@kernel.org>
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
To: Mike Rapoport <rppt@kernel.org>
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linux MM <linux-mm@kvack.org>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>, Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>, Alexey Dobriyan <adobriyan@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux

Hi Mike,

On Tue, Oct 27, 2020 at 12:31 PM Mike Rapoport <rppt@kernel.org> wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> The pg_data_t node structures and their initialization currently depends on
> !CONFIG_SINGLE_MEMORY_CHUNK. Since they are required only for DISCONTIGMEM
> make this dependency explicit and replace usage of
> CONFIG_SINGLE_MEMORY_CHUNK with CONFIG_DISCONTIGMEM where appropriate.
>
> The CONFIG_SINGLE_MEMORY_CHUNK was implicitly disabled on the ColdFire MMU
> variant, although it always presumed a single memory bank. As there is no
> actual need for DISCONTIGMEM in this case, make sure that ColdFire MMU
> systems set CONFIG_SINGLE_MEMORY_CHUNK to 'y'.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks for your patch!

> ---
>  arch/m68k/Kconfig.cpu           | 6 +++---
>  arch/m68k/include/asm/page_mm.h | 2 +-
>  arch/m68k/mm/init.c             | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Is there any specific reason you didn't convert the checks for
CONFIG_SINGLE_MEMORY_CHUNK in arch/m68k/kernel/setup_mm.c
and arch/m68k/include/asm/virtconvert.h?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
