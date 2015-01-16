From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: [PATCH 01/28] PCI: Rip out pci_bus_add_devices() from pci_scan_bus()
Date: Fri, 16 Jan 2015 15:16:28 -0800
Message-ID: <CAE9FiQV97PuDWBZYRxh8R0ADnUFTbo1NO3wAufj97en0yseYSQ@mail.gmail.com>
References: <1421372666-12288-1-git-send-email-wangyijing@huawei.com>
	<1421372666-12288-2-git-send-email-wangyijing@huawei.com>
	<CAE9FiQUoocCzBKsHL_D4ypH1-DV7XxZMdREX7n=Tz1Kq3kHHeA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=1HzIN9abELsWjytSAlhMdNxc2ypYecyxp2MvlLItdFg=;
        b=aEf3nBMq4DuCfk+KVAza1/nE6/59OIaUN9aAH4JoGn/JGoThJOIV5+IIwZkWmywdFG
         kY48z91XZOb4tZGj02db+DYBeRLCcg8q0yNay3DahTvQsqQDQZcO1rR8sTlk6PpSmung
         5lK0Rrbsex0AQv7exyN1/9jSq5wdSONjA5iO35FDwjFKLnv/AFGJp5Rq5JNaWs9D7V4t
         cRqBCCKwcY1qoF6CUDv4eit6XSV8rpU9iRsICBiXwSy5apk3XJ55powTKRw2lfzk63uT
         TLIDl0MfGY4NtmkfEQqbUZ5HNn8V/beC3PGHjUQtTDyxCISQnB91RcZRo/rlbUheYQo2
         nUWA==
In-Reply-To: <CAE9FiQUoocCzBKsHL_D4ypH1-DV7XxZMdREX7n=Tz1Kq3kHHeA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yijing Wang <wangyijing@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jiang Liu <jiang.liu@linux.intel.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, the arch/x86 maintainers <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>

On Fri, Jan 16, 2015 at 3:15 PM, Yinghai Lu <yinghai@kernel.org> wrote:
> On Thu, Jan 15, 2015 at 5:43 PM, Yijing Wang <wangyijing@huawei.com> wrote:
>> Pci_bus_add_devices() should not be placed in pci_scan_bus().
>> Now pci device will be added to driver core once its
>> creation. All things left in pci_bus_add_devices() are
>> driver attachment and other trivial sysfs things.
>> Pci_scan_bus() should be the function responsible for
>> scanning PCI devices, not including driver attachment.
>> Other, some callers(m68k,unicore32,alpha) of pci_scan_bus()
>> will call pci_bus_size_bridges() and pci_bus_assign_resources()
>> after pci_scan_bus().
>>
>> E.g.
>> In m68k
>> mcf_pci_init()
>>         pci_scan_bus()
>>                 ...
>>                 pci_bus_add_devices() --- try to attach driver
>>         pci_fixup_irqs()
>>         pci_bus_size_bridges()
>>         pci_bus_assign_resources()
>>
>> It is not correct, resources should be assigned correctly
>> before attaching driver.
>
No, for booting path, at that time pci drivers are *NOT* loaded yet.

Thanks

Yinghai
