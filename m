From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: Some Alphas broken by f75b99d5a77d (PCI: Enforce bus address
 limits in resource allocation)
Date: Sat, 22 Feb 2020 10:55:56 -0600
Message-ID: <20200222165556.GA207281@google.com>
References: <CAEdQ38GUhL0R4c7ZjEZv89TmqQ0cwhnvBawxuXonSb9On=+B6A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582390558;
        bh=M5r7Xp2wBSq9yuBJ6z46E3v5P6Bp2kjPdnq2xvPG1L8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=nfNHhIuOp0+eaMnD9DWhbQ2Lwc7XheEhkv+KQ2/ssCwGSDDjCF3XHhs6ot8WYvFQB
         Psl+10dITVkzNxsfsVWKyoKjvA55xr0CKKWY5nzOE7fyZPUwIosoMz7RuK10fFCXmp
         k1wmXMHNJ2si3eL1tQstZgZsfb8x2iYPDPBwcbyw=
Content-Disposition: inline
In-Reply-To: <CAEdQ38GUhL0R4c7ZjEZv89TmqQ0cwhnvBawxuXonSb9On=+B6A@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Yinghai Lu <yinghai@kernel.org>, linux-pci@vger.kernel.org, linux-alpha <linux-alpha@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jay Estabrook <jay.estabrook@gmail.com>

On Mon, Apr 16, 2018 at 07:33:57AM -0700, Matt Turner wrote:
> Commit f75b99d5a77d63f20e07bd276d5a427808ac8ef6 (PCI: Enforce bus
> address limits in resource allocation) broke Alpha systems using
> CONFIG_ALPHA_NAUTILUS. Alpha is 64-bit, but Nautilus systems use a
> 32-bit AMD 751/761 chipset. arch/alpha/kernel/sys_nautilus.c maps PCI
> into the upper addresses just below 4GB.
> 
> I can get a working kernel by ifdef'ing out the code in
> drivers/pci/bus.c:pci_bus_alloc_resource. We can't tie
> PCI_BUS_ADDR_T_64BIT to ALPHA_NAUTILUS without breaking generic
> kernels.
> 
> How can we get Nautilus working again?

I don't see a resolution in this thread, so I assume this is still
broken?  Anybody have any more ideas?

Bjorn
