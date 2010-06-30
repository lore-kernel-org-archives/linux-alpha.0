From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: Problems with alpha/pci + radeon/ttm
Date: Wed, 30 Jun 2010 14:43:57 -0400
Message-ID: <20100630184357.GE16488@phenom.dumpdata.com>
References: <AANLkTinG-5iKW5cigIQHPHRZuAMtG_xY-74XLL6vE5kb@mail.gmail.com>
 <20100622145805R.fujita.tomonori@lab.ntt.co.jp>
 <AANLkTimTOTM8Tt5A7eBVbxcYaGQVn_Q6-9hL8B1B4bjY@mail.gmail.com>
 <20100627130717M.fujita.tomonori@lab.ntt.co.jp>
 <AANLkTim0JbmNLY1yG5MIWhcjM34h4HHVjS58jEobmPO0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTim0JbmNLY1yG5MIWhcjM34h4HHVjS58jEobmPO0@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matt Turner <mattst88@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mcree@orcon.net.nz, jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@gmail.com, alexdeucher@gmail.com, jglisse@redhat.com

On Sun, Jun 27, 2010 at 12:58:07AM -0400, Matt Turner wrote:
> On Sun, Jun 27, 2010 at 12:20 AM, FUJITA Tomonori
> <fujita.tomonori@lab.ntt.co.jp> wrote:
> > On Thu, 24 Jun 2010 10:53:52 -0400
> > Matt Turner <mattst88@gmail.com> wrote:
> >
> >> > Seems that the IOMMU can't find 128 pages. It's likely due to:
> >> >
> >> > - out of the IOMMU space (possibly someone doesn't free the IOMM=
U
> >> > =A0space).
> >> >
> >> > or
> >> >
> >> > - the mapping parameters (such as align) aren't appropriate so t=
he
> >> > =A0IOMMU can't find space.
> >> >
> >> >
> >> >> Is this the cause of the bug we're seeing in the report [1]?

=46or the fun I did:
 cat /tmp/screenlog.0 | grep iommu_arena | wc
  28509  199588 2167164

Which is to say 28509 * 4096 =3D 116736000. That looks to be about 111M=
B.

That does not look right when you are trying to allocate 128 pages. You
are sure it is 128 pages? Can you make the ttm_ code print out the tota=
l
of pages it is trying to PCI map ? It might also be interesting to see
how many pages the pci_iommu.c has already set aside for other devices.

The BAR is 128MB, but that would have been an ioremap call - and done
much earlier I think.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
