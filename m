From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 4/9] PCI: consolidate PCI config entry in drivers/pci
Date: Mon, 19 Nov 2018 21:13:29 +0000
Message-ID: <20181119211327.h2lugf2ttuiz3fp6@pburton-laptop>
References: <20181115190538.17016-1-hch@lst.de>
 <20181115190538.17016-5-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFrZnnSCW0M69MoOPURhPUKtM4maqeOX5Dq5QPqadVs=;
 b=YCv1CWHlUYbkV6QLleQsonGR5+YfEiKJ+Lh7LOJ3fcioOYIY6jJyVrNErcIRTdvThqDDaEIDSLeZBg2271SgMYkYXlvtJyxI1Z8LHtNDKkfih6kdsnLV0SL8cP6l3OIk+FUERTS2Rez9gSTUgM93tCm3wT7ePmMzOh8cmbJFjKU=
In-Reply-To: <20181115190538.17016-5-hch@lst.de>
Content-Language: en-US
Content-ID: <3555B391B5C5094C84F54A5D1FC10A55@namprd22.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine <alex.bou9@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>

Hi Christoph,

On Thu, Nov 15, 2018 at 08:05:32PM +0100, Christoph Hellwig wrote:
> There is no good reason to duplicate the PCI menu in every architecture.
> Instead provide a selectable HAVE_PCI symbol that indicates availability
> of PCI support, and a FORCE_PCI symbol to for PCI on and the handle the
> rest in drivers/pci.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
> Acked-by: Thomas Gleixner <tglx@linutronix.de>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

For patches 4, 5, 7, 8 & 9:

    Acked-by: Paul Burton <paul.burton@mips.com> # MIPS parts

Thanks,
    Paul
