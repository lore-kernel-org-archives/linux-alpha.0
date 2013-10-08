From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH v2 14/14] Kconfig cleanup (PARPORT_PC dependencies)
Date: Tue, 8 Oct 2013 09:00:54 +0200
Message-ID: <20131008070054.GE1615@linux-mips.org>
References: <1381209030-351-1-git-send-email-msalter@redhat.com>
 <1381209030-351-15-git-send-email-msalter@redhat.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1381209030-351-15-git-send-email-msalter@redhat.com>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Salter <msalter@redhat.com>
Cc: linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, linux-ia64@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, Michal Simek <monstr@monstr.eu>, microblaze-uclinux@itee.uq.edu.au, linux-mips@linux-mips.org, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Paul Mundt <lethal@linux-sh.org>, linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>, Thomas Gleixner <tgl>

On Tue, Oct 08, 2013 at 01:10:30AM -0400, Mark Salter wrote:

> Remove messy dependencies from PARPORT_PC by having it depend on one
> Kconfig symbol (ARCH_MAY_HAVE_PC_PARPORT) and having architectures
> which need it, select ARCH_MAY_HAVE_PC_PARPORT in arch/*/Kconfig.
> New architectures are unlikely to need PARPORT_PC, so this avoids
> having an ever growing list of architectures to exclude. Those
> architectures which do select ARCH_MAY_HAVE_PC_PARPORT in this
> patch are the ones which have an asm/parport.h (or use the generic
> version).

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf
