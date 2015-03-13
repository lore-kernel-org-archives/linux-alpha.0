From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 04/30] xen/PCI: Don't use deprecated function pci_scan_bus_parented()
Date: Fri, 13 Mar 2015 08:24:58 -0500
Message-ID: <CAErSpo4T7f9PNVMLrQbCvW2a=HnRauQR2eBz6H69B7Q2=ELNWw@mail.gmail.com>
References: <1425868467-9667-1-git-send-email-wangyijing@huawei.com>
 <1425868467-9667-5-git-send-email-wangyijing@huawei.com> <20150311223211.GB1082@google.com>
 <55017CA5.2010502@huawei.com> <20150312193505.GB7346@google.com> <55024D35.6050509@huawei.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=LcbI1STGHEiO3vuJ+HyykAMyLY9qyOlMNwFqOcP5N8A=;
        b=imaAhv0hYjNgoHawmNJ01vEM6nZtpqBjubN5CEq0yeq9Qyj+yZHgtLxMkF9wVMa4ip
         P+JAd5/gC6CV0ht0s7f1lFYVYVzvj5m0tfoC76dMxl10Xo6p/Lq8ujjoUaAClL0AYJV8
         xaWF823G6NAyFnGl2Nl7QDWd1OVGw4kchwmsvHSkDw4o6wrtFJhqOn8QwWnOi5/adBS3
         sXPLZk9yafQT0HLBqZcace+xZU3vnEsBzEE/julAqOuGIpT89rmEnnwH/P1I4k1e4hai
         jYEsqy3EmpQDj0D39H/GclgPXA2C7vFw4iKTBlT+nKpEUZxWRrsyZ/28YfuTi3sAvhY5
         UrEA==
In-Reply-To: <55024D35.6050509@huawei.com>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yijing Wang <wangyijing@huawei.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Yinghai Lu <yinghai@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, linux-arm <linux-arm-kernel@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, "x86@kernel.org" <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@

On Thu, Mar 12, 2015 at 9:36 PM, Yijing Wang <wangyijing@huawei.com> wrote:
>>>>> +  pci_add_resource(&resources, &ioport_resource);
>>>>> +  pci_add_resource(&resources, &iomem_resource);
>>>>> +  pci_add_resource(&resources, &busn_resource);
>>>>
>>>> Since I don't want to export busn_resource, you might have to allocate your
>>>> own struct resource for it here.  And, of course, figure out the details of
>>>> which PCI domain you're in and whether you need to share one struct
>>>> resource across several host bridges in the same domain.
>>>
>>> Allocate its own resource here is ok for me, as I mentioned in previous reply,
>>> so do we still need to add additional info to figure out which domain own the bus resource ?
>>
>> That's up to the caller.  Only the platform knows which bridges it wants to
>> have in the same domain.  In principle, every host bridge could be in its
>> own domain, since each bridge is the root of a unique PCI hierarchy.  But
>> some platforms have firmware that assumes otherwise.  I have no idea what
>> xen assumes.
>
> I'm not xen guy, so I don't know much about it, but because it call pci_scan_bus_parented()
> before, and in which busn_resource is always shared for different host bridges(same domain or not),
> I think add a static bus resource(0,255) should be safe, at least, it would not introduce new risk.
>
> Something like:
>
> diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
> index b1ffebe..a69e529 100644
> --- a/drivers/pci/xen-pcifront.c
> +++ b/drivers/pci/xen-pcifront.c
> @@ -446,9 +446,15 @@ static int pcifront_scan_root(struct pcifront_device *pdev,
>                                  unsigned int domain, unsigned int bus)
>  {
>         struct pci_bus *b;
> +       LIST_HEAD(resources);
>         struct pcifront_sd *sd = NULL;
>         struct pci_bus_entry *bus_entry = NULL;
>         int err = 0;
> +       static struct resource busn_res = {
> +               .start = 0,
> +               .end = 255,
> +               .flags = IORESOURCE_BUS,
> +       };
>
>  #ifndef CONFIG_PCI_DOMAINS
>         if (domain != 0) {
> @@ -470,17 +476,21 @@ static int pcifront_scan_root(struct pcifront_device *pdev,
>                 err = -ENOMEM;
>                 goto err_out;
>         }
> +       pci_add_resource(&resources, &ioport_resource);
> +       pci_add_resource(&resources, &iomem_resource);
> +       pci_add_resource(&resources, &busn_res);
>         pcifront_init_sd(sd, domain, bus, pdev);
>
>         pci_lock_rescan_remove();
>
> -       b = pci_scan_bus_parented(&pdev->xdev->dev, bus,
> -                                 &pcifront_bus_ops, sd);
> +       b = pci_scan_root_bus(&pdev->xdev->dev, bus,
> +                                 &pcifront_bus_ops, sd, &resources);
>         if (!b) {
>
> Bjorn, what do you think about ?

That seems OK to me.  Probably still wrong, but no worse than it was before.

>>>>>    pcifront_init_sd(sd, domain, bus, pdev);
>>>>>
>>>>>    pci_lock_rescan_remove();
>>>>>
>>>>> -  b = pci_scan_bus_parented(&pdev->xdev->dev, bus,
>>>>> -                            &pcifront_bus_ops, sd);
>>>>> +  b = pci_scan_root_bus(&pdev->xdev->dev, bus,
>>>>> +                            &pcifront_bus_ops, sd, &resources);
>>>>>    if (!b) {
>>>>>            dev_err(&pdev->xdev->dev,
>>>>>                    "Error creating PCI Frontend Bus!\n");
>>>>>            err = -ENOMEM;
>>>>>            pci_unlock_rescan_remove();
>>>>> +          pci_free_resource_list(&resources);
>>>>>            goto err_out;
>>>>>    }
>>>>>
>>>>> @@ -488,7 +494,7 @@ static int pcifront_scan_root(struct pcifront_device *pdev,
>>>>>
>>>>>    list_add(&bus_entry->list, &pdev->root_buses);
>>>>>
>>>>> -  /* pci_scan_bus_parented skips devices which do not have a have
>>>>> +  /* pci_scan_root_bus skips devices which do not have a
>>>>>    * devfn==0. The pcifront_scan_bus enumerates all devfn. */
>>>>>    err = pcifront_scan_bus(pdev, domain, bus, b);
>>>>>
>>>>> --
>>>>> 1.7.1
>>>>>
>>>>> --
>>>>> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>> .
>>>>
>>>
>>>
>>> --
>>> Thanks!
>>> Yijing
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>> .
>>
>
>
> --
> Thanks!
> Yijing
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
