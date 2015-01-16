From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: [PATCH 01/28] PCI: Rip out pci_bus_add_devices() from pci_scan_bus()
Date: Fri, 16 Jan 2015 15:15:37 -0800
Message-ID: <CAE9FiQUoocCzBKsHL_D4ypH1-DV7XxZMdREX7n=Tz1Kq3kHHeA@mail.gmail.com>
References: <1421372666-12288-1-git-send-email-wangyijing@huawei.com>
	<1421372666-12288-2-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=CW6pNwo+hpJMW2dLw9my4TdPgzv/g9b38QRvRWL2Lfo=;
        b=evDcc+Z3rhtSF9D5vIisczjakSxjf3Tn0K8Y8kztAnv/YTwirV0vS0Zc01J3icEfB1
         JX7GVwAINmcv7kT/kAjNiC5zpbzQ2sYGnVnAxjyGg7aZ2JOirJ+VCAlZMRiDj5UodJ8k
         eZxb5isqLfzfI+dE4RWBwx1MHG+h44go+k2OkbqlxtRxANmhD1n3htidmN9MdTr0sclq
         63SAAeUYUHb/rWiX9wNeobHh+GbAr0pEcdZHAqNUkeKo7PpFm5X/EA+cRjMoOen6Yvw0
         GYIV1AWF36Lavp9dLudi8NueZIdg0pMbqyakK/8OPg1F4QCpf7pRG9d/gYAns0QTc+lx
         VhIQ==
In-Reply-To: <1421372666-12288-2-git-send-email-wangyijing@huawei.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yijing Wang <wangyijing@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jiang Liu <jiang.liu@linux.intel.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, the arch/x86 maintainers <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>

On Thu, Jan 15, 2015 at 5:43 PM, Yijing Wang <wangyijing@huawei.com> wrote:
> Pci_bus_add_devices() should not be placed in pci_scan_bus().
> Now pci device will be added to driver core once its
> creation. All things left in pci_bus_add_devices() are
> driver attachment and other trivial sysfs things.
> Pci_scan_bus() should be the function responsible for
> scanning PCI devices, not including driver attachment.
> Other, some callers(m68k,unicore32,alpha) of pci_scan_bus()
> will call pci_bus_size_bridges() and pci_bus_assign_resources()
> after pci_scan_bus().
>
> E.g.
> In m68k
> mcf_pci_init()
>         pci_scan_bus()
>                 ...
>                 pci_bus_add_devices() --- try to attach driver
>         pci_fixup_irqs()
>         pci_bus_size_bridges()
>         pci_bus_assign_resources()
>
> It is not correct, resources should be assigned correctly
> before attaching driver.

No, at that time pci drivers are loaded yet.

Thanks

Yinghai
