From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 10/10] Kconfig: cleanup SERIO_I8042 dependencies
Date: Sun, 15 Dec 2013 20:27:25 -0500 (EST)
Message-ID: <20131215.202725.1549146673897801643.davem@davemloft.net>
References: <52ACA43F.2040402@zytor.com>
        <20131215103657.GB20197@core.coreip.homeip.net>
        <1387122626.1979.136.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1387122626.1979.136.camel@deneb.redhat.com>
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
Content-Type: Text/Plain; charset="us-ascii"
To: msalter@redhat.com
Cc: dmitry.torokhov@gmail.com, hpa@zytor.com, linux-kernel@vger.kernel.org, rth@twiddle.net, linux-alpha@vger.kernel.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, fenghua.yu@intel.com, linux-ia64@vger.kernel.org, ralf@linux-mips.org, linux-mips@linux-mips.org, benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, lethal@linux-sh.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, gxt@mprc.pku.edu.cn, mingo@redhat.com, tglx@linutronix.de, x86@kernel.org

From: Mark Salter <msalter@redhat.com>
Date: Sun, 15 Dec 2013 10:50:26 -0500

> On Sun, 2013-12-15 at 02:36 -0800, Dmitry Torokhov wrote:
>> How are we going to merge this? In bulk through input tree or peacemeal
>> through all arches first?
>
> They should all go together to eliminate the chance of bisect breakage.
> Either the input tree or maybe akpm tree.

This sounds good to me.

