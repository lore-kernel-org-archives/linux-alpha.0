From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] arch: alpha: kernel: remove deprecated call to pci_get_slot
Date: Wed, 20 May 2015 22:51:12 -0700
Message-ID: <CAEdQ38EaE6f0MDQiKrdHu16aXAM5S0j+h2XA-gUkqjzdb1-DnA@mail.gmail.com>
References: <1423171075-23058-1-git-send-email-pierrechevalier83@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=6B22mEUCWquOuKCPXZbAxcl1Fha/OG4o3HbvMkE/9/A=;
        b=IAPSNQMbOjzWcyA+WpQ+OoY5WUlfm8PtOoyZR3qBQWfu+DmZKh6BXoZd4M6B188N9W
         JxZ9r19hFpHMaiqndH0LxD/eKTgc7UZ+ZbUcNRkS/GCIwOaPJZIarLRJ0L1idb8IJRl7
         XibWhtrwj6yjLAd2RTgzSwzg2Lvza3nHsaWkxXKgIThmcH0QQYFRh4Eup574oHMJ3JXq
         N7mEk0vG8HiN4GZ19kCHi/B4IPgu4caV7FmOrOIgPQ7fcmr6VCWHXiaiKAExUEMExdI9
         yZM8/BruiKI99rA9raBZDdTGYaEYIwd8SDr4a1y5idvSC+G0Tyo8172dN/pMwkPCQxvq
         iMXA==
In-Reply-To: <1423171075-23058-1-git-send-email-pierrechevalier83@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Chevalier <pierrechevalier83@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, Feb 5, 2015 at 1:17 PM, Pierre Chevalier
<pierrechevalier83@gmail.com> wrote:
> According to Documentation/PCI/pci.txt, pci_get_slot has been
> superseded by pci_get_domain_bus_and_slot.
>
> Signed-off-by: Pierre Chevalier <pierrechevalier83@gmail.com>
> ---
>  arch/alpha/kernel/sys_miata.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/sys_miata.c b/arch/alpha/kernel/sys_miata.c
> index d5b9776..7b98b40 100644
> --- a/arch/alpha/kernel/sys_miata.c
> +++ b/arch/alpha/kernel/sys_miata.c
> @@ -182,7 +182,8 @@ miata_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
>
>         if((slot == 7) && (PCI_FUNC(dev->devfn) == 3)) {
>                 u8 irq=0;
> -               struct pci_dev *pdev = pci_get_slot(dev->bus, dev->devfn & ~7);
> +               struct pci_dev *pdev =
> +                       pci_get_domain_bus_and_slot(dev->bus, dev->devfn & ~7);

Given that pci_get_domain_bus_and_slot takes three arguments, I don't
think this compiles.
