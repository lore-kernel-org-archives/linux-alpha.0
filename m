From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 3/4] PCI: Remove unused declarations
Date: Thu, 5 Oct 2017 22:57:53 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1710052257350.2398@nanos>
References: <20171005201939.18300.25690.stgit@bhelgaas-glaptop.roam.corp.google.com> <20171005203856.18300.62381.stgit@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20171005203856.18300.62381.stgit@bhelgaas-glaptop.roam.corp.google.com>
Sender: linux-sh-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Howells <dhowells@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Jesper Nilsson <jesper.nilsson@axis.com>, linux-am33-list@redhat.com, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>, x86@kernel.org, "James E.J. Bottomley" <jejb@parisc-linux.org>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, linux-xtensa@linux-xtensa.org, Mikael Starvik <starv>

On Thu, 5 Oct 2017, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Remove these unused declarations:
> 
>   pcibios_config_init()              # never defined anywhere
>   pcibios_scan_root()                # only defined by x86
>   pcibios_get_irq_routing_table()    # only defined by x86
>   pcibios_set_irq_routing()          # only defined by x86
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
