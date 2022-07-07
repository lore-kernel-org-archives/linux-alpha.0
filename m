From: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v3 1/8] irqchip/mips-gic: Only register IPI domain when
 SMP is enabled
Date: Thu, 7 Jul 2022 13:45:33 +0300
Message-ID: <20220707104533.7iakliv2f5i2qi33@mobilestation>
References: <20220701200056.46555-1-samuel@sholland.org>
 <20220701200056.46555-2-samuel@sholland.org>
 <20220705135243.ydbwfo4kois64elr@mobilestation>
 <87czehmiwt.wl-maz@kernel.org>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WY98p2xpQdOFXmhJtt3xHyGiLiAUhi6XRf4hr9Uc3Wg=;
        b=b6GFfkBqjaMf2ocm+NmB4Pdq8BftwMkyn64oPaQ4MV4pvFzFkwxMEQeq6P80Hm4/xV
         qZ+8LuyU5wRQNERGgQNFjcHh58vvfaC0ptqNORWmxffraiT9/DjbcHTSFTsFBlux58Ot
         XhtqsfAx1Sa2gM/tjlsL0QsZtd9LNBgjw9CnnsV557EhbpHb9gCv8v2p+Oj+GmTrlkqp
         mUp+nL+5dVYNjaxqq1uCJh+k/gsHSTvygVI9uMaKcsKBGCdHzMWvDPsDHQivCRNcB3z5
         282ePxgRE2AokBxYCEN4Y+8PqCSOtSZbzmUbIGk4eL7kv/uEwV39B6EvqmW8CS1gOdOi
         UC1w==
Content-Disposition: inline
In-Reply-To: <87czehmiwt.wl-maz@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Zyngier <maz@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy.shevchenko@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chris Zankel <chris@zankel.net>, Colin Ian King <colin.king@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Dexuan Cui <decui@microsoft.com>, Florian Fainelli <f.fainelli@gmail.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Haiyang Zhang <haiyangz@microsoft.com>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 

On Thu, Jul 07, 2022 at 09:22:26AM +0100, Marc Zyngier wrote:
> On Tue, 05 Jul 2022 14:52:43 +0100,
> Serge Semin <fancer.lancer@gmail.com> wrote:
> > 
> > Hi Samuel
> > 
> > On Fri, Jul 01, 2022 at 03:00:49PM -0500, Samuel Holland wrote:
> > > The MIPS GIC irqchip driver may be selected in a uniprocessor
> > > configuration, but it unconditionally registers an IPI domain.
> > > 
> > > Limit the part of the driver dealing with IPIs to only be compiled when
> > > GENERIC_IRQ_IPI is enabled, which corresponds to an SMP configuration.
> > 
> > Thanks for the patch. Some comment is below.
> > 
> > > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > > ---
> > > 
> > > Changes in v3:
> > >  - New patch to fix build errors in uniprocessor MIPS configs
> > > 
> > >  drivers/irqchip/Kconfig        |  3 +-
> > >  drivers/irqchip/irq-mips-gic.c | 80 +++++++++++++++++++++++-----------
> > >  2 files changed, 56 insertions(+), 27 deletions(-)
> > > 
> > > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > > index 1f23a6be7d88..d26a4ff7c99f 100644
> > > --- a/drivers/irqchip/Kconfig
> > > +++ b/drivers/irqchip/Kconfig
> > > @@ -322,7 +322,8 @@ config KEYSTONE_IRQ
> > >  
> > >  config MIPS_GIC
> > >  	bool
> > > -	select GENERIC_IRQ_IPI
> > > +	select GENERIC_IRQ_IPI if SMP
> > 
> > > +	select IRQ_DOMAIN_HIERARCHY
> > 
> > It seems to me that the IRQ domains hierarchy is supposed to be
> > created only if IPI is required. At least that's what the MIPS GIC
> > driver implies. Thus we can go further and CONFIG_IRQ_DOMAIN_HIERARCHY
> > ifdef-out the gic_irq_domain_alloc() and gic_irq_domain_free()
> > methods definition together with the initialization:
> > 
> >  static const struct irq_domain_ops gic_irq_domain_ops = {
> >  	.xlate = gic_irq_domain_xlate,
> > +#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
> >  	.alloc = gic_irq_domain_alloc,
> >  	.free = gic_irq_domain_free,
> > +#endif
> >  	.map = gic_irq_domain_map,
> > };
> > 
> > If the GENERIC_IRQ_IPI config is enabled, CONFIG_IRQ_DOMAIN_HIERARCHY
> > will be automatically selected (see the config definition in
> > kernel/irq/Kconfig). If the IRQs hierarchy is needed for some another
> > functionality like GENERIC_MSI_IRQ_DOMAIN or GPIOs then they will
> > explicitly enable the IRQ_DOMAIN_HIERARCHY config thus activating the
> > denoted .alloc and .free methods definitions.
> > 
> > To sum up you can get rid of the IRQ_DOMAIN_HIERARCHY config
> > force-select from this patch and make the MIPS GIC driver code a bit
> > more coherent.
> > 
> > @Marc, please correct me if were wrong.
> 

> Either way probably works correctly, but Samuel's approach is more
> readable IMO. It is far easier to reason about a high-level feature
> (GENERIC_IRQ_IPI) than an implementation detail (IRQ_DOMAIN_HIERARCHY).
> 

The main idea of my comment was to get rid of the forcible
IRQ_DOMAIN_HIERARCHY config selection, because the basic part of the
driver doesn't depends on the hierarchical IRQ-domains functionality.
It's needed only for IPIs and implicitly for the lower level IRQ
device drivers like GPIO or PCIe-controllers, which explicitly enable
the IRQ_DOMAIN_HIERARCHY config anyway. That's why instead of forcible
IRQ_DOMAIN_HIERARCHY config selection (see Samuel patch) I suggested
to make the corresponding functionality defined under the
IRQ_DOMAIN_HIERARCHY config ifdefs, thus having the driver capable of
creating the hierarchical IRQs domains only if it's required.

> If you really want to save a handful of bytes, you can make the
> callbacks conditional on GENERIC_IRQ_IPI, and be done with it.

AFAIU I can't in this case. It must be either IRQ_DOMAIN_HIERARCHY
ifdefs or explicit IRQ_DOMAIN_HIERARCHY select. There can be non-SMP
(UP) systems with no need in IPIs but for instance having a GPIO or
PCIe controller which require the hierarchical IRQ-domains support of
the parental IRQ controller. So making the callbacks definition
depended on the GENERIC_IRQ_IPI config state will break the driver for
these systems. That's why I suggested to use
CONFIG_IRQ_DOMAIN_HIERARCHY which activates the hierarchical IRQ
domains support in the IRQ-chip system (see the irq_domain_ops
structure conditional fields definition) and shall we have the
suggested approach implemented in the MIPS GIC driver.

-Sergey

> But this can come as an additional patch.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
