From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 5/9] PCI: consolidate the PCI_DOMAINS and
 PCI_DOMAINS_GENERIC config options
Date: Fri, 23 Nov 2018 11:41:19 +0900
Message-ID: <CAK7LNASYobpeAMqenZXycNieWErRFkNHz6xQUzEruJ0-nNwfdA@mail.gmail.com>
References: <20181115190538.17016-1-hch@lst.de> <20181115190538.17016-6-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com wAN2fuXt031803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1542940917;
        bh=R157I6Dkx5Z2mskSmJELm97OIhgSrKrMbLwBuT6BgNs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Xt7kCeKg4GGBt+J3Snq2vwZlT+w8OiyFUD7LWOLXE5pvAZr8vzbRl4gtGpxjZCgvi
         jiI/tA6CFqnVBKV1A6ulng70p2WogPviu97lII0SBGEgEg7FDkVyWTQg3xtV41cvNy
         irGsOah7EPQzmlJgDxvwFEWAcyj43ZT1HYhwCO1euFFysGiGDsk9YBCokok4CAVjma
         ycb6MK+CPmqHkkD3Kio2yXGaHmbvv3Khf4KNlWwTVZzIgxtNOKNqTjsb0HZ13QjSTH
         V6sMtEtCbpCtQpon8IUwPymVv5ZHSRqjuuwFy83PmULgph7fKMvSmzssp7rtmewnSW
         s0c1V/zGJqR7Q==
In-Reply-To: <20181115190538.17016-6-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: mporter@kernel.crashing.org, Alex Bounine <alex.bou9@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-pci@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-alpha@vger.kernel.org, Linux-MIPS <linux-mips@linux-mips.org>

On Fri, Nov 16, 2018 at 4:07 AM Christoph Hellwig <hch@lst.de> wrote:

> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index a8128a1946a2..95812fc4958c 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -21,6 +21,15 @@ menuconfig PCI
>           support for PCI-X and the foundations for PCI Express support.
>           Say 'Y' here unless you know what you are doing.
>
> +config PCI_DOMAINS
> +       depends on PCI
> +       bool
> +
> +config PCI_DOMAINS_GENERIC
> +       depends on PCI
> +       select PCI_DOMAINS
> +       bool
> +
>  source "drivers/pci/pcie/Kconfig"
>
>  config PCI_MSI


I reordered this so it 'bool' comes first.

config PCI_DOMAINS
       bool
       depends on PCI


config PCI_DOMAINS_GENERIC
       bool
       depends on PCI
       select PCI_DOMAINS


Of course, it is just a matter of slight taste.
I just wanted the code to look consistent.




-- 
Best Regards
Masahiro Yamada
