From: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v3 0/3] phase out CONFIG_VIRT_TO_BUS
Date: Tue, 28 Jun 2022 13:31:30 +0200
Message-ID: <CAK8P3a3-D_Ct1jBpKzv7OPZ3Mfkx4iD1QG8ELuib02aGXUAS6A@mail.gmail.com>
References: <20220624155226.2889613-1-arnd@kernel.org> <yq1bkudh4va.fsf@ca-mkp.ca.oracle.com>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656415908;
        bh=mGQ17FxEruXP1Se/YhPh1NXTTafvPHopAQxVYAQOAng=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S9ev2a8N8YQmk0FkOdWFCB7fzksaF3TDIqbfcHvGcwSqAPQBjVarw4vw9M3l6HHmL
         ssCxgmsI8FHt9fG0XtnHdMUgr0QiYRCSQ79IVVpF+/C1G6eLSjq//dde0lc2VRCRaS
         1FOEBaNxnclo7b2FYkWs82psE+DIlzk94a+i0CS0kc4yOVpaZiit6FGLCMgT4MtfTp
         CwGZaSPgvhkEFi/ozVYkEbtrBOACwSSrasTZCqcPAk1+8mx2bwdjGw8Jo6F9FVGxwT
         aWToqKSq2ntJ+svOn8tdm9iL+aJ6hyyGwGM/YXBZrhOMDyTMuQVPNXGFsy/i9skP/1
         Bv9FMX2w5oSmA==
In-Reply-To: <yq1bkudh4va.fsf@ca-mkp.ca.oracle.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-parisc@vger.kernel.org>, Denis Efremov <efremov@linux.com>

On Tue, Jun 28, 2022 at 4:59 AM Martin K. Petersen
<martin.petersen@oracle.com> wrote:
> Hi Arnd!
>
> > If there are no more issues identified with this series, I'll merge it
> > through the asm-generic tree. The SCSI patches can also get merged
> > separately through the SCSI maintainers' tree if they prefer.
>
> I put patches 1 and 2 in scsi-staging to see if anything breaks...

Ok, thanks!

I have just the third patch in the asm-generic tree now. As long as it all
make it into the merge window, this should work out fine without build
issues, though there is a small bisection window during which the buslogic
driver becomes hidden. I think that's ok here.

       Arnd
