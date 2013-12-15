From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 10/10] Kconfig: cleanup SERIO_I8042 dependencies
Date: Sun, 15 Dec 2013 02:36:57 -0800
Message-ID: <20131215103657.GB20197@core.coreip.homeip.net>
References: <1387040376-26906-1-git-send-email-msalter@redhat.com>
 <1387040376-26906-11-git-send-email-msalter@redhat.com>
 <52ACA43F.2040402@zytor.com>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=C1QCmOuoDFf3toFrGAN0M2g41dYFvFZiRa9qL58m5gU=;
        b=VQiY7rEwiyOptXg+h+ckQhtOxXsa3HanX5V6jwpihI04ogI4Cr8nmS3NA1RkC9Us/R
         sD1ZwaXxJkiwSW43q84nYicPUAkwuCmmQakUrST7oPFdltMFQTqcpawS8PQFWZezAUKS
         Ya+kFbYYpzHiHGT4gd0DVFMK2S2yFcEDprfv73U55tNH5d+km7veka3jz13O0+2J+uKM
         CSoa0PbP/CeePH+y+/sh+uO9lfV4TuBluq27X8clbk3oWpq8iJxUY1dhIeZb/sxyrUbM
         PMER+mwImWchO8nv4T8cQ3VVAc1UhvP8sseUTfxBSoCIRmdgjE5vkH0FX9fFbNTDukhU
         gKaw==
Content-Disposition: inline
In-Reply-To: <52ACA43F.2040402@zytor.com>
Sender: linux-sh-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Mark Salter <msalter@redhat.com>, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, linux-ia64@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Paul Mundt <lethal@linux-sh.org>, linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org

On Sat, Dec 14, 2013 at 10:32:31AM -0800, H. Peter Anvin wrote:
> On 12/14/2013 08:59 AM, Mark Salter wrote:
> > Remove messy dependencies from SERIO_I8042 by having it depend on one
> > Kconfig symbol (ARCH_MIGHT_HAVE_PC_SERIO) and having architectures
> > which need it select ARCH_MIGHT_HAVE_PC_SERIO in arch/*/Kconfig.
> > New architectures are unlikely to need SERIO_I8042, so this avoids
> > having an ever growing list of architectures to exclude.
> > 
> > Signed-off-by: Mark Salter <msalter@redhat.com>
> > CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > CC: Richard Henderson <rth@twiddle.net>
> > CC: linux-alpha@vger.kernel.org
> > CC: Russell King <linux@arm.linux.org.uk>
> > CC: linux-arm-kernel@lists.infradead.org
> > CC: Tony Luck <tony.luck@intel.com>
> > CC: Fenghua Yu <fenghua.yu@intel.com>
> > CC: linux-ia64@vger.kernel.org
> > CC: Ralf Baechle <ralf@linux-mips.org>
> > CC: linux-mips@linux-mips.org
> > CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > CC: Paul Mackerras <paulus@samba.org>
> > CC: linuxppc-dev@lists.ozlabs.org
> > CC: Paul Mundt <lethal@linux-sh.org>
> > CC: linux-sh@vger.kernel.org
> > CC: "David S. Miller" <davem@davemloft.net>
> > CC: sparclinux@vger.kernel.org
> > CC: Guan Xuetao <gxt@mprc.pku.edu.cn>
> > CC: Ingo Molnar <mingo@redhat.com>
> > CC: Thomas Gleixner <tglx@linutronix.de>
> > CC: "H. Peter Anvin" <hpa@zytor.com>
> > CC: x86@kernel.org
> 
> Acked-by: H. Peter Anvin <hpa@linux.intel.com>

How are we going to merge this? In bulk through input tree or peacemeal
through all arches first?

-- 
Dmitry
