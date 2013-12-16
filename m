From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 10/10] Kconfig: cleanup SERIO_I8042 dependencies
Date: Mon, 16 Dec 2013 17:23:47 +0100
Message-ID: <20131216162346.GA19285@linux-mips.org>
References: <1387040376-26906-1-git-send-email-msalter@redhat.com>
 <1387040376-26906-11-git-send-email-msalter@redhat.com>
Mime-Version: 1.0
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <1387040376-26906-11-git-send-email-msalter@redhat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-Id: <linux-alpha.vger.kernel.org>
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Salter <msalter@redhat.com>
Cc: linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, linux-ia64@vger.kernel.org, linux-mips@linux-mips.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Paul Mundt <lethal@linux-sh.org>, linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org

On Sat, Dec 14, 2013 at 11:59:36AM -0500, Mark Salter wrote:

> -	depends on !PARISC && (!ARM || FOOTBRIDGE_HOST) && \
> -		   (!SUPERH || SH_CAYMAN) && !M68K && !BLACKFIN && !S390 && \
> -		   !ARC
> +	depends on ARCH_MIGHT_HAVE_PC_SERIO

Most dependencies on an architecture's kconfig symbol outside arch/
should probably be treated as a bug.

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf

