From: Yijing Wang <wangyijing@huawei.com>
Subject: Re: [PATCH v4 12/30] PCI: Introduce pci_host_bridge_ops to support
 host specific operations
Date: Tue, 3 Mar 2015 16:08:29 +0800
Message-ID: <54F56BFD.2060008@huawei.com>
References: <1424938344-4017-1-git-send-email-wangyijing@huawei.com> <1424938344-4017-13-git-send-email-wangyijing@huawei.com> <20150303025020.GF11978@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20150303025020.GF11978@google.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, linux-pci@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>

>> +	if (host->ops && host->ops->phb_prepare) {
>> +		error = host->ops->phb_prepare(host);
>> +		if(error) {
> 
> Whitespace error.

Will fix.

> 
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -400,6 +400,13 @@ static inline int pci_channel_offline(struct pci_dev *pdev)
>>  	return (pdev->error_state != pci_channel_io_normal);
>>  }
>>  
>> +struct pci_host_bridge;
>> +struct pci_host_bridge_ops {
>> +	void (*phb_set_root_bus_speed)(struct pci_host_bridge *host);
>> +	int (*phb_prepare)(struct pci_host_bridge *host);
>> +	void (*phb_of_scan_bus)(struct pci_host_bridge *);
> 
> These function pointers don't need a "phb_" prefix.

Will update them.

> 
> .
> 


-- 
Thanks!
Yijing

