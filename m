From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 2/2] PCI: Provide a default pcibios_update_irq()
Date: Sat, 15 Sep 2012 16:22:11 -0600
Message-ID: <CAErSpo7q9fvtjatfKqtb8SP3UOJdEXpbvFC_qMBTc6mAoRTQuA@mail.gmail.com>
References: <1347655456-2542-1-git-send-email-thierry.reding@avionic-design.de>
 <1347655456-2542-2-git-send-email-thierry.reding@avionic-design.de>
 <CAMuHMdWuR_tdMw9iVkaQ3D9p1HVU_L05ap=MzBuo1jLD6YdHHw@mail.gmail.com> <20120915075301.GA31044@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Return-path: <linux-mips-bounce@linux-mips.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:x-system-of-record;
        bh=5Wt5qkgo+oOBcu3h8EKDod3tPReHpckJ7yb6KaH2bgU=;
        b=JH7+btohi/2TyfzE5GKoDZF0YVfcFBB2RpB3XPn3CtutcjQnFTCIhYoMw2QgPcEYmU
         uHi2yIVa3Pzr6M0BZU8tpg9tBs4Slywcvy/LVCyHi2VmODhZW1hvaBJ1oWH0xyRkAELj
         HPRtdqZdCRyPTgo3znsEnOnavedOc6yzfESLyKTt/MKH0q3eo4m6bqbsVzRgYeinkUjH
         HrER5rBXWi01UJOqP1/6SiwIzpXTMPsXeHCmjckFVxP1HE18gMsVc1Q9IcjI9fmlVBiB
         yZf3Hff8M9qtSSMZC7l3zHs3YegSGqh/7JIEAjnjdC7/Okj0BUzWnwfQstuJz7PehNDD
         ZsZQ==
In-Reply-To: <20120915075301.GA31044@avionic-0098.mockup.avionic-design.de>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@arm.linux.org.uk>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Mundt <lethal@linux-sh.org>, "David S. Miller" <davem@davemloft.net>, Chris Metcalf <cmetcalf@tilera.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Chris Zankel <chris@zankel.net>, Greg Ungerer <gerg@uclinux.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kerne

On Sat, Sep 15, 2012 at 1:53 AM, Thierry Reding
<thierry.reding@avionic-design.de> wrote:
> On Sat, Sep 15, 2012 at 09:32:10AM +0200, Geert Uytterhoeven wrote:
>> On Fri, Sep 14, 2012 at 10:44 PM, Thierry Reding
>> <thierry.reding@avionic-design.de> wrote:
>> > --- a/drivers/pci/setup-irq.c
>> > +++ b/drivers/pci/setup-irq.c
>> > @@ -17,6 +17,14 @@
>> >  #include <linux/ioport.h>
>> >  #include <linux/cache.h>
>> >
>> > +void __devinit __weak pcibios_update_irq(struct pci_dev *dev, int irq)
>> > +{
>> > +#ifdef CONFIG_PCI_DEBUG
>> > +       printk(KERN_DEBUG "PCI: Assigning IRQ %02d to %s\n", irq,
>> > +              pci_name(dev));
>>
>> pr_debug()?
>> Or even better, dev_dbg()?
>
> The problem with pr_debug() and dev_dbg() is that they will be compiled
> out if DEBUG is not defined. Perhaps we should pass -DDEBUG if PCI_DEBUG
> is configured and make this dev_dbg()?

