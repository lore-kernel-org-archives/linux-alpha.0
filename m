From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] PCI: Provide a default pcibios_update_irq()
Date: Sat, 15 Sep 2012 09:32:10 +0200
Message-ID: <CAMuHMdWuR_tdMw9iVkaQ3D9p1HVU_L05ap=MzBuo1jLD6YdHHw@mail.gmail.com>
References: <1347655456-2542-1-git-send-email-thierry.reding@avionic-design.de>
        <1347655456-2542-2-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Return-path: <linux-mips-bounce@linux-mips.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=oKUjMbnOdMtqIHRgQqgb+0OJdvE9f4xQvLSj2N0dESk=;
        b=S6vCHoTLecI450CYovV8Z5ztOqEWmWJLeaWwNzYfRwEpMhQnIrFhwChcSlAXSUQdWU
         Lz23tMClZxbIc2eJgyncGe4rTmzMQnan4kjMCWPDB4kH8y36rvg1l7gWX1fYoBW4A5W5
         yzzcBxyY+hg7iJXLa0HJ1pMaeAy9DdQy5MvpPRDD8nIPc39I4LO6BXJ/cMhONcHiUIPU
         uUFmLIRpJJEpQFXJh7d+l9ARBUwnFAd7hVo9oBv5uDaO6XoHSR9/2mhS4ppFStoZ8ZNc
         4XOT1X39HM/9ZLd1Nw0MJKLEJld5+rVdkN1U+xzqf6JXp5y0tcWUIlyg3TCqy/7KzktG
         VSXw==
In-Reply-To: <1347655456-2542-2-git-send-email-thierry.reding@avionic-design.de>
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
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@arm.linux.org.uk>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Mundt <lethal@linux-sh.org>, "David S. Miller" <davem@davemloft.net>, Chris Metcalf <cmetcalf@tilera.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Chris Zankel <chris@zankel.net>, Greg Ungerer <gerg@uclinux.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org

On Fri, Sep 14, 2012 at 10:44 PM, Thierry Reding
<thierry.reding@avionic-design.de> wrote:
> --- a/drivers/pci/setup-irq.c
> +++ b/drivers/pci/setup-irq.c
> @@ -17,6 +17,14 @@
>  #include <linux/ioport.h>
>  #include <linux/cache.h>
>
> +void __devinit __weak pcibios_update_irq(struct pci_dev *dev, int irq)
> +{
> +#ifdef CONFIG_PCI_DEBUG
> +       printk(KERN_DEBUG "PCI: Assigning IRQ %02d to %s\n", irq,
> +              pci_name(dev));

pr_debug()?
Or even better, dev_dbg()?

> +#endif
> +       pci_write_config_byte(dev, PCI_INTERRUPT_LINE, irq);
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

