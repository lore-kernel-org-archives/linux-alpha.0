From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 2/2] PCI: Provide a default pcibios_update_irq()
Date: Thu, 20 Sep 2012 21:19:30 -0600
Message-ID: <CAErSpo4RgNjFE7zH9vKTgAq_7djbWi5sR7k_DJYr8=G3A=0zeg@mail.gmail.com>
References: <1347880974-13615-1-git-send-email-thierry.reding@avionic-design.de>
 <1347880974-13615-2-git-send-email-thierry.reding@avionic-design.de>
 <20120920083731.b99255eb8fdeea908d34ed2f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-type:x-system-of-record;
 bh=Rtw/GkRDlF7fki5PjlDcM6jPF9f0BbRmFMmdNfrs20k=;
 b=RMOxlJ35LjtETIc2eAIf5cUH41K9yX+YZWyguFHI+Ja1FHr63nesPrT0pUhXqqXBX7
 8TV0rMd5R9NA3LsMsmqmjviuadijPg3BJI3n8R5dRJSb8w8dBKAczghZTs+XgkB2Oqnb
 bAveLvYXu/oYwJi7fa+TMx20Gk+iuv3JpVOQkaX2T8atBH37OwKyl3K8WzOmmMX+Kfw0
 E92hJgn5jLAd0Q3JnsnXo68W791Husi1OvnenBKacuw8vgivfOSuUEPtoJeFdl++z7LV
 7huHBKlURmJGBjIqL1cU6SMpD3gC+nyGVw7TdTeWKbAx72ivHB1g2WX99YwcBFXfuikJ
 w8cA==
In-Reply-To: <20120920083731.b99255eb8fdeea908d34ed2f@canb.auug.org.au>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-mips@linux-mips.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Thierry Reding <thierry.reding@avionic-design.de>, Greg Ungerer <gerg@uclinux.org>, sparclinux@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>, "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, Chris Metcalf <cmetcalf@tilera.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@lin>

On Wed, Sep 19, 2012 at 4:37 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi,
>
> On Mon, 17 Sep 2012 13:22:54 +0200 Thierry Reding <thierry.reding@avionic-design.de> wrote:
>>
>> diff --git a/drivers/pci/setup-irq.c b/drivers/pci/setup-irq.c
>> index 270ae7b..3d61ce3 100644
>> --- a/drivers/pci/setup-irq.c
>> +++ b/drivers/pci/setup-irq.c
>> @@ -17,6 +17,11 @@
>>  #include <linux/ioport.h>
>>  #include <linux/cache.h>
>>
>> +void __weak pcibios_update_irq(struct pci_dev *dev, int irq)
>> +{
>> +     dev_dbg(&dev->dev, "Assigning IRQ %02d\n", irq);
>> +     pci_write_config_byte(dev, PCI_INTERRUPT_LINE, irq);
>> +}
>>
>>  static void
>>  pdev_fixup_irq(struct pci_dev *dev,
>
> Didn't we have a problem with some compiler versions when the weak
> definition was in the same file as the call (there is a call to this
> function in drivers/pci/setup-irq.c)?

There was such a bug, but as far as I know, we aren't worrying about
it anymore: https://lkml.org/lkml/2011/7/4/9
