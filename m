From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 1/9] PCI: Use dev_is_pci() to check whether it is pci device
Date: Tue, 10 Dec 2013 10:28:01 -0700
Message-ID: <CAErSpo67ZB_GUrKpLbkfZs4qLe3S0eYy=oLTKg9=MSxZL2h+yw@mail.gmail.com>
References: <1386244373-35796-1-git-send-email-wangyijing@huawei.com>
 <20131210000154.GE4699@google.com> <1386647973.32037.57.camel@pasglop>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=jqTsU1rswo2BHNHZNkucQHEDDE8M/6NGRxyHcJ0rE4g=;
        b=Jg1x1sp4iQ0fV98UMzdbBrZeyFcGrSjiXT/x0w5dX3PVqxqE/9STxXpheNV+hL9Nxj
         lyxzg41rQ92pd7Lh0Bd5dmaKc8A99DN6Pzuai4H+3zG621I/SU3MqIHXNei8cTtaVewl
         IIS2Eq/o9LUAUKi+4zlis7ObdzTJd+HHjS4ZA53WWUQz8aUUOl6ZnaBgm8LeLJCJD5df
         90DY2XfWeRIKXgKEiCBlM6DAUIuEX8PZTZzCxVwRZxVtNJiyLDbF+OpyD6QFrDTt13qs
         ySoUFTwgq/IP12/hs4f2jmBs8c+4xRGOkE2lYBl1uki1OlqbOLHe8AcrIUAPv76zvcyo
         4hJA==
In-Reply-To: <1386647973.32037.57.camel@pasglop>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@au1.ibm.com>
Cc: Yijing Wang <wangyijing@huawei.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-parisc@vger.kernel.org, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arm <linux-arm-kernel@lists.infradead.org>

On Mon, Dec 9, 2013 at 8:59 PM, Benjamin Herrenschmidt <benh@au1.ibm.com> wrote:
> On Mon, 2013-12-09 at 17:01 -0700, Bjorn Helgaas wrote:
>> [+cc arch lists]
>>
>> On Thu, Dec 05, 2013 at 07:52:53PM +0800, Yijing Wang wrote:
>> > Use dev_is_pci() instead of directly compare
>> > pci_bus_type to check whether it is pci device.
>> >
>> > Signed-off-by: Yijing Wang <wangyijing@huawei.com>
>>
>> I applied all these to my pci/yijing-dev_is_pci branch for v3.14, thanks!
>>
>> Browse them here: http://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/log/?h=pci/yijing-dev_is_pci
>
> Ah ok. I also have the powerpc one in powerpc -next, no biggie though

I'll drop the powerpc one.
