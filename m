From: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Tue, 28 Jun 2022 23:50:37 +0200
Message-ID: <CAK8P3a1rxEVwVF5U-PO6pQkfURU5Tro1Qp8SPUfHEV9jjWOmCQ@mail.gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org> <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com> <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com> <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com> <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656453055;
        bh=Eulr4Y0cWb7qjc6CpxCm3Vct1+OoFSfv0gPahuMP8H0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=elEeeKUDea9hk5aQmAteuIyRdHZZsKhLl3Vgkrf0ebuHMVDyxzs1owwkAc5icxtXR
         Tv3y3Ypg5BZfSAA4fm/1du/h9YT9oUMVvzdwBxhJY45v0cynFE7MH/FGecsgnZV2dk
         iPm6ogOEDIT42r9PUlRQz9dQNjh6tOzSwvfw+orYrQP8DJdAcBTb8Txl9TLsSqkRI5
         7J7GSf1511sS2KBwajo4lNLtrnzx6YNYJIcRb3aJarxomVr3XyXRVQbc5LQe6sATzH
         Szilv/6OGgYptkfbHHlymMEVoWlRUtOrH4DB1kh3spBftyplxnSoqxW2EfM72iufIW
         dnOIf5/XmvBRg==
In-Reply-To: <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, scsi <linux-scsi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux-Arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-pa>

On Tue, Jun 28, 2022 at 11:03 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 28/06/22 19:03, Geert Uytterhoeven wrote:
> >> The driver allocates bounce buffers using kmalloc if it hits an
> >> unaligned data buffer - can such buffers still even happen these days?
> > No idea.
> Hmmm - I think I'll stick a WARN_ONCE() in there so we know whether this
> code path is still being used.

kmalloc() guarantees alignment to the next power-of-two size or
KMALLOC_MIN_ALIGN, whichever is bigger. On m68k this means it
is cacheline aligned.

      Arnd
