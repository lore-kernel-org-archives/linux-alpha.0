From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 1/2] PCI: Keep pci_fixup_irqs() around after init
Date: Wed, 19 Sep 2012 10:57:15 -0600
Message-ID: <CAErSpo4q7KYn3bvNQ0wAXV=+PRAFH_c=MgOLOTDKgaNCjE_aXg@mail.gmail.com>
References: <1347880974-13615-1-git-send-email-thierry.reding@avionic-design.de>
 <20120917113423.GA28759@kroah.com>
Mime-Version: 1.0
Return-path: <linux-pci-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:x-system-of-record;
        bh=NcZkJLhJEkiZyo9XfUYupBdttT84j2In1pupDVmRMdw=;
        b=TJxBD1qLVax9WdsnmW86fjX0IGjGyeexW5CsJ/MCwAadbHkfkTvcHO+Vho00nue8nU
         6h+5Z+XNGVqE75Lbc5pZLWxX0LdH/taziXW5WTragdMqDU55KA6coULtO+nhfL674M8u
         2iS+p6nNx+vQ25senO33DlUi/smWJxri5hpvgguesXb9ZaBgpeMNd1FItrNDl3ZdyrlZ
         ZlqZfwpq9IB1pyGgQuZ8G4+xXEdHyV/h0WuhRA6W2mqgXLcTGpUGXlegbahO30G/0T+M
         4ZGJ6Uh4qb8RAWX6mHu8vH8WnmFK0lSwj1H9RsPYRnlfDUztCXVTjnqtQKSjtV6Cu45J
         Mh3A==
In-Reply-To: <20120917113423.GA28759@kroah.com>
Sender: linux-pci-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@arm.linux.org.uk>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Mundt <lethal@linux-sh.org>, "David S. Miller" <davem@davemloft.net>, Chris Metcalf <cmetcalf@tilera.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Chris Zankel <chris@zankel.net>, Greg Ungerer <gerg@uclinux.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, linux-

On Mon, Sep 17, 2012 at 5:34 AM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Mon, Sep 17, 2012 at 01:22:53PM +0200, Thierry Reding wrote:
>> Remove the __init annotations in order to keep pci_fixup_irqs() around
>> after init (e.g. for hotplug). This requires the same change for the
>> implementation of pcibios_update_irq() on all architectures. While at
>> it, all __devinit annotations are removed as well, since they will be
>> useless now that HOTPLUG is always on.
>>
>> Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
>> ---
>> Changes in v2:
>> - remove __init and __devinit annotations altogether
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I applied these (both 1/2 and 2/2) to my "next" branch.  Thanks!

Bjorn
