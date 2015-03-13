From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 00/30] Refine PCI scan interfaces and make generic pci
 host bridge
Date: Fri, 13 Mar 2015 09:48:25 -0500
Message-ID: <CAErSpo7KuchFy0U=80buz4oRKwn-tcwz1Ej9-hBZHg+a-eYCbw@mail.gmail.com>
References: <1425868467-9667-1-git-send-email-wangyijing@huawei.com>
 <20150312212306.GH7346@google.com> <20150313113156.GA4739@bart.dudau.co.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=5JscTEsVFNaPsuLrmPMPaS6VJK4MUbCbAeuWuKoco6A=;
        b=nAfDTJFCYsZ4hDZK1EecWDH5zSWVHU6gQ9BDKW6E31yN+V7WBbh5TGu83YgaWa9BhA
         90+zWy+odzlJgPHI5zXKqpW0Y+n634RAHOlkoFKCHtSCUqvPlRnSnS5K/H9D+xnryy4j
         Yw1+oqOT1UAwEJhGKWOOPiOQSJJUJtvkTXWmSNeVQ64nTZz5s1mJC4LitQinBDzBfcfG
         wpm3p9x9tA+PzU1JqTgKKkYExVb3ltTQhxwETzCNOGhzTgyxnX/VhmMikmY7YfRvcQe5
         nTDMmh8/W2z6v53nFTrvLKQ1IGESECkriiNtsbcHqUHb7+cOEheggBA7hXxQWI4Db6BQ
         BgHg==
In-Reply-To: <20150313113156.GA4739@bart.dudau.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liviu Dudau <liviu@dudau.co.uk>
Cc: Yijing Wang <wangyijing@huawei.com>, Jiang Liu <jiang.liu@linux.intel.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Yinghai Lu <yinghai@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, linux-arm <linux-arm-kernel@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, "x86@kernel.org" <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>

On Fri, Mar 13, 2015 at 6:31 AM, Liviu Dudau <liviu@dudau.co.uk> wrote:
> On Thu, Mar 12, 2015 at 04:23:06PM -0500, Bjorn Helgaas wrote:
>> On Mon, Mar 09, 2015 at 10:33:57AM +0800, Yijing Wang wrote:
>> > ...
>> > Yijing Wang (29):
>> >   PCI: Rip out pci_bus_add_devices() from pci_scan_bus()
>> >   PCI: Rip out pci_bus_add_devices() from pci_scan_root_bus()
>> >   sparc/PCI: Claim bus resources before pci_bus_add_devices()
>>
>> I put the above patches plus a cleanup patch on my pci/enumeration branch.
>> Please rebase your next revision to that.  If there's anything else
>> non-controversial that we can pull in to chip away at this, let me know.
>
> Hi Bjorn and Yijing,
>
> Sorry for not providing feedback earlier on this series (or any previous ones),
> I'm just crawling out from under a rock of doing graphics drivers :)
>
> The patch ripping out pci_bus_add_devices() from pci_scan_root_bus() misses out
> the users of that function from drivers/pci/host. If Yijing is going to refresh
> the series it is probably worth starting with adding back the call into pcie-xilinx.c
> and pci-versatile.c.

Huh, sure enough, I missed those, too.  Yijing, when you add those,
can you pull my branch, update the patch, and repost it?  That way
you'll keep my changelog and cleanup updates.

Bjorn
