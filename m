From: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 0/6] phase out CONFIG_VIRT_TO_BUS
Date: Mon, 6 Jun 2022 17:01:44 +0200
Message-ID: <CAK8P3a15RuR3VOPLPV3SfdBAGuoyor6o7JMs3kC5dNB5nfDuKA@mail.gmail.com>
References: <20220606084109.4108188-1-arnd@kernel.org> <Yp3ID86TBFxl7qyL@kroah.com>
Mime-Version: 1.0
Return-path: <linux-scsi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654527722;
        bh=q53e8R7rif+9VorkencnO96O5zseGyAcQ5tiTh4wb5o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Apz8+ZKOfRfLg28N7czbQCp5u1APChOU6nUGQX9FaMmYF1sAaX/E+Ib6PkoNMTzP7
         8jDO0yt1/l7zDqKQc6tX4/clq/6HkX/3W3KZ8nM3wihQ+jMlDOK9ZA4eyqtiXknfW8
         nDehGJBGcME9NWhLnKjuKwi1RHsvWVfiUTSGjzwMBXLmNypEOY8dRiUMaB2ZPKhMqN
         +sCEMynb2DFl+FqYA+WAgVaik3iEnEQyHuNJCcowrCU57ufs9pWJIioY3E4DJJPNzW
         kpZWUqqFJEO2bKuHGgUG6lR6HDAoCyo7pL/NzPacNwyF3UCEA3Cxsbw6IvBn5Rr2+E
         lkYasSc/0weOA==
In-Reply-To: <Yp3ID86TBFxl7qyL@kroah.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, linux-scsi <linux-scsi@vger.kernel.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-parisc@vger.kernel.org>, Denis Efremov <efremov@linux.com>

On Mon, Jun 6, 2022 at 11:25 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> I'll take patches 1 and 2 right now through my staging tree if that's
> ok.

Yes, that's perfect, as there are no actual interdependencies with the
other drivers -- applying the last patch first would just hide the driver
I'm removing here.

Thanks,

      Arnd
