From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch V4] lib: GCD: Use binary GCD algorithm instead of
 Euclidean
Date: Sat, 7 May 2016 13:23:56 +0200
Message-ID: <20160507112308.GA2612@ravnborg.org>
References: <1462527763-15301-1-git-send-email-zengzhaoxiu@163.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462527763-15301-1-git-send-email-zengzhaoxiu@163.com>
Sender: linux-m68k-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zengzhaoxiu@163.com
Cc: akpm@linux-foundation.org, linux@horizon.com, peterz@infradead.org, jjuran@gmail.com, James.Bottomley@HansenPartnership.com, geert@linux-m68k.org, dalias@libc.org, davem@davemloft.net, Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@arm.linux.org.uk>, Yoshinori Sato <ysato@users.sourceforge.jp>, James Hogan <james.hogan@imgtec.com>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, Ley Foon Tan <lftan@altera.com>, Jonas Bonn <jonas@southpole.se>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Chen Liqin <liqin.linux@gmail.com>, Lennox Wu <lennox.wu@gmail.com>, linux-ke

> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index 57ffaf2..ca675ed 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -42,6 +42,7 @@ config SPARC
>  	select ODD_RT_SIGACTION
>  	select OLD_SIGSUSPEND
>  	select ARCH_HAS_SG_CHAIN
> +	select CPU_NO_EFFICIENT_FFS
>  
>  config SPARC32
>  	def_bool !64BIT

sparc64 have an efficient ffs implementation.
We use run-time patching to use the proper version
depending on the actual sparc cpu.

As this is determinded at config time, then let the
sparc cpu that has the efficient ffs benefit from this.

In other words - select CPU_NO_EFFICIENT_FFS only for SPARC32.

	Sam
