From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: fix nautilus PCI setup
Date: Mon, 16 Mar 2020 23:26:24 -0700
Message-ID: <CAEdQ38GP8XJpgaWRZKFVpHY1mYGh2oaQnnBPYH86tbCRc=U_Xg@mail.gmail.com>
References: <20200314194745.GB12510@mail.rc.ru>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=986MFMWS2fuD8X0pwumfKpMeJ4RrueeaFq6IWBfnpKQ=;
        b=njAU8PBN1d16SS/gtsi4wbrJkCXoaegvl4cYtm/v0rkhsXUbCqfYphdn8RZW9YQtfb
         8jh43swsYXeD+m6dNa/JoNK6tfTd99B5GIjltxFreYy586NXcGymCOM39oBfM0Pffsbk
         i3D5A5sQ2Y4WiLsp5CncNRmJ8VKMkh2GCfg0LusBGs1ZtoExnhXfTgNdhTDwnY7v9ysM
         kHDehL0Uxm7xdRkvuVRyvRGiVHPaJ0cf/Dn1ZY3TaAn1OSZybqsrSUmO8PkifjNbNaQl
         mb7qGyIKtOWP8YqTsdgW2pCcyYbRJRXCnizzhADH7bRDKZmupnlmlZUvo1jDiIRhD4/n
         oAxQ==
In-Reply-To: <20200314194745.GB12510@mail.rc.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Yinghai Lu <yinghai@kernel.org>, linux-pci@vger.kernel.org, linux-alpha <linux-alpha@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Jay Estabrook <jay.estabrook@gmail.com>, Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Sat, Mar 14, 2020 at 12:47 PM Ivan Kokshaysky
<ink@jurassic.park.msu.ru> wrote:
>
> Example (hopefully reasonable) of the new "size_windows" flag usage.
>
> Fixes accidental breakage caused by commit f75b99d5a77d (PCI: Enforce
> bus address limits in resource allocation),
>
> Signed-off-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> ---
>  arch/alpha/kernel/sys_nautilus.c | 51 ++++++++++++++++------------------------
>  1 file changed, 20 insertions(+), 31 deletions(-)
>
> diff --git a/arch/alpha/kernel/sys_nautilus.c b/arch/alpha/kernel/sys_nautilus.c
> index cd9a112d67ff..1a1e49f58e66 100644
> --- a/arch/alpha/kernel/sys_nautilus.c
> +++ b/arch/alpha/kernel/sys_nautilus.c
> @@ -187,10 +187,6 @@ nautilus_machine_check(unsigned long vector, unsigned long la_ptr)
>
>  extern void pcibios_claim_one_bus(struct pci_bus *);
>
> -static struct resource irongate_io = {
> -       .name   = "Irongate PCI IO",
> -       .flags  = IORESOURCE_IO,
> -};
>  static struct resource irongate_mem = {
>         .name   = "Irongate PCI MEM",
>         .flags  = IORESOURCE_MEM,
> @@ -211,14 +207,17 @@ nautilus_init_pci(void)
>         struct pci_dev *irongate;

One thing I noticed: this variable is now no longer used.
