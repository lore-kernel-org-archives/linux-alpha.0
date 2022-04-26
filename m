From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH net-next] net: mark tulip obsolete
Date: Tue, 26 Apr 2022 22:53:00 +0200
Message-ID: <87650cea-d190-9642-edf7-7dea42802dab@gmx.de>
References: <20220315184342.1064038-1-kuba@kernel.org>
 <29f1daf3-e9f2-bbc5-f5e5-6334c040e3fa@gmx.de>
 <20220315120432.2a72810d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <a66551f3-192a-70dc-4eb9-62090dbfe5fb@gmx.de>
 <20220426055311.53dd8c31@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1651006381;
        bh=OJUDzpc6mAIOLTsHkxVTark5mkSrpVi6U11Y6K4ImT0=;
        h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
        b=hJU5kmyZJFKvYpNRNn/aAYWrckDrAdyS3SksJYChvc/eVdxtwpWzkRoZegCHSqhF7
         WoWbMLV30F264Kmdj2Cc2CR6fMfsyC2WjL9SpSdYxgsBPMwXZoNkr4XsausxQXkk1d
         uvNakWyJfgBecGvswfa6gn5b3URlzhsz4EIzs11g=
Content-Language: en-US
In-Reply-To: <20220426055311.53dd8c31@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-parisc@vger.kernel.org, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>

Hi Jakub,

On 4/26/22 14:53, Jakub Kicinski wrote:
> On Tue, 15 Mar 2022 23:18:38 +0100 Helge Deller wrote:
>> On 3/15/22 20:04, Jakub Kicinski wrote:
>>> On Tue, 15 Mar 2022 19:44:24 +0100 Helge Deller wrote:
>>>> On 3/15/22 19:43, Jakub Kicinski wrote:
>>>>> It's ancient, an likely completely unused at this point.
>>>>> Let's mark it obsolete to prevent refactoring.
>>>>
>>>> NAK.
>>>>
>>>> This driver is needed by nearly all PA-RISC machines.
>>>
>>> I was just trying to steer newcomers to code that's more relevant toda=
y.
>>
>> That intention is ok, but "obsolete" means it's not used any more,
>> and that's not true.
>
> Hi Helge! Which incarnation of tulip do you need for PA-RISC, exactly?

For parisc I have:

CONFIG_NET_TULIP=3Dy
# CONFIG_DE2104X is not set
CONFIG_TULIP=3Dy
# CONFIG_TULIP_MWI is not set
# CONFIG_TULIP_MMIO is not set
# CONFIG_TULIP_NAPI is not set
# CONFIG_DE4X5 is not set
# CONFIG_WINBOND_840 is not set
# CONFIG_DM9102 is not set
# CONFIG_ULI526X is not set
# CONFIG_PCMCIA_XIRCOM is not set
# CONFIG_NET_VENDOR_DLINK is not set
# CONFIG_NET_VENDOR_EMULEX is not set

So not the DE4X5.

> I'd like to try to remove DE4X5, if that's not the one you need
> (getting rid of virt_to_bus()-using drivers).

I've CC'ed the linux-alpha mailing list, as the DE4X5 driver might be
needed there, so removing it completely might not be the best idea.

But since you want to remove virt_to_bus()....
It seems this virt_to_bus() call is used for really old x86 machines/cards=
,
which probably aren't supported any longer.

See drivers/net/ethernet/dec/tulip/de4x5.c:
...
#if !defined(__alpha__) && !defined(__powerpc__) && !defined(CONFIG_SPARC)=
 && !defined(DE4X5_DO_MEMCPY)
...
    tmp =3D virt_to_bus(p->data);
...

Maybe you could simply remove the part inside #if...#else
and insert a pr_err() instead (and return NULL)?

Helge
