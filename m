From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: [PATCH 1/4] PCI: Remove redundant pcibios_set_master()
 declarations
Date: Fri, 6 Oct 2017 09:28:27 +0200
Message-ID: <20171006072827.GQ17578@axis.com>
References: <20171005201939.18300.25690.stgit@bhelgaas-glaptop.roam.corp.google.com>
 <20171005203842.18300.67328.stgit@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171005203842.18300.67328.stgit@bhelgaas-glaptop.roam.corp.google.com>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Howells <dhowells@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Jesper Nilsson <jespern@axis.com>, linux-am33-list@redhat.com, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>, x86@kernel.org, "James E.J. Bottomley" <jejb@parisc-linux.org>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, linux-xtensa@linux-xtensa.org, Mikael Starvik <starvik@axis.com>

On Thu, Oct 05, 2017 at 03:38:42PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> All users of pcibios_set_master() include <linux/pci.h>, which already has
> a declaration.  Remove the unnecessary declarations from the <asm/pci.h>
> files.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  arch/alpha/include/asm/pci.h   |    2 --
>  arch/cris/include/asm/pci.h    |    1 -

For what it's worth, for the cris changes:

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

>  arch/frv/include/asm/pci.h     |    2 --
>  arch/mips/include/asm/pci.h    |    2 --
>  arch/mn10300/include/asm/pci.h |    2 --
>  arch/parisc/include/asm/pci.h  |    1 -
>  arch/sh/include/asm/pci.h      |    2 --
>  arch/x86/include/asm/pci.h     |    1 -
>  8 files changed, 13 deletions(-)

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
