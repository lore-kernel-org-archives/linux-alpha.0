From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] PCI: Keep pci_fixup_irqs() around after init
Date: Mon, 17 Sep 2012 04:34:23 -0700
Message-ID: <20120917113423.GA28759@kroah.com>
References: <1347880974-13615-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1347880974-13615-1-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-pci-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@arm.linux.org.uk>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Mundt <lethal@linux-sh.org>, "David S. Miller" <davem@davemloft.net>, Chris Metcalf <cmetcalf@tilera.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Chris Zankel <chris@zankel.net>, Greg Ungerer <gerg@uclinux.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, linux-sh@vger.kernel

On Mon, Sep 17, 2012 at 01:22:53PM +0200, Thierry Reding wrote:
> Remove the __init annotations in order to keep pci_fixup_irqs() around
> after init (e.g. for hotplug). This requires the same change for the
> implementation of pcibios_update_irq() on all architectures. While at
> it, all __devinit annotations are removed as well, since they will be
> useless now that HOTPLUG is always on.
> 
> Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
> ---
> Changes in v2:
> - remove __init and __devinit annotations altogether

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
