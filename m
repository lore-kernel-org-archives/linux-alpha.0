From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] PCI: add support for root bus sizing
Date: Mon, 16 Mar 2020 21:58:04 -0700
Message-ID: <CAEdQ38ELWdKKPE1svWEUwnHBR+J2cFGO=zWTj3dS3D9JqxDHcg@mail.gmail.com>
References: <20200314194355.GA12510@mail.rc.ru>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QSlwcCW1wByXeYUT3JQbxi77+0v1S3fgiBq0ZW8UzqQ=;
        b=Sse7C8BnQ3sSG2GAEC2SuJEhmdjyyN4QD0FABveGRUuZ/u9Fxt+BLEn16bb+UzvW+X
         KgtvmSv0hepHbqx6LErjMdQ34NGc4heGyQrUJIEHWDcux9GTg1B4QL+so0y2twZK48MJ
         WFTumXlUtIu/6lW7GdXmRJO1uL/34yTMyLOXHA2vEniUeuA2ETOr00UkgjVHw3jdFbKm
         ZwsTgM7xloAXSNTq00vxxy2RC32eEf6U/zSKy/HbC4lpaGFxFx3aPCA6myhqi08WPo/N
         E1njT+cRrT22hPbp/XkEuu5JoDXu8RfkdsO0L6nV27uaJg3RhCW0NO2BwmoL1vu9Kilf
         gFuw==
In-Reply-To: <20200314194355.GA12510@mail.rc.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Yinghai Lu <yinghai@kernel.org>, linux-pci@vger.kernel.org, linux-alpha <linux-alpha@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Jay Estabrook <jay.estabrook@gmail.com>, Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Sat, Mar 14, 2020 at 12:44 PM Ivan Kokshaysky
<ink@jurassic.park.msu.ru> wrote:
>
> In certain cases we should be able to enumerate IO and MEM ranges
> of all PCI devices installed in the system, and then set respective
> host bridge apertures basing on calculated size and alignment.
> Particularly when firmware is broken and fails to assign bridge
> windows properly, like on Alpha UP1500 platform.
>
> Actually, almost everything is already in place, and required
> changes are minimal:
>
> - add "size_windows" flag to struct pci_host_bridge: when set, it
>   instructs __pci_bus_size_bridges() to continue with the root bus;
> - in the __pci_bus_size_bridges() path: add checks for bus->self,
>   as it can legitimately be null for the root bus.

Works great. Thanks Ivan!

Tested-by: Matt Turner <mattst88@gmail.com>
