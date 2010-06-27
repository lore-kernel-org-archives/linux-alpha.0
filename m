From: Matt Turner <mattst88@gmail.com>
Subject: Re: Problems with alpha/pci + radeon/ttm
Date: Sun, 27 Jun 2010 00:58:07 -0400
Message-ID: <AANLkTim0JbmNLY1yG5MIWhcjM34h4HHVjS58jEobmPO0@mail.gmail.com>
References: <AANLkTinG-5iKW5cigIQHPHRZuAMtG_xY-74XLL6vE5kb@mail.gmail.com>
	<20100622145805R.fujita.tomonori@lab.ntt.co.jp>
	<AANLkTimTOTM8Tt5A7eBVbxcYaGQVn_Q6-9hL8B1B4bjY@mail.gmail.com>
	<20100627130717M.fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=1qm0grWRUYHdEVyJTHGCVIeBwuDActzBkUyOx78NQa8=;
        b=JTDgD7JWsFGF0d4L9pVeXEW61j68e3x+FqT4MYQBjgPETZToCANbs4dEFLxtfj4SSE
         THZ68yBTz9nt3FhSSfQMxdV1xJLCyNsq/G3oXoGmXtgXfNlEI6v07j1COmr4qeQU766k
         +srDvWrfar1shZ7hvER0N9qOUIqpYj0mD+pe8=
In-Reply-To: <20100627130717M.fujita.tomonori@lab.ntt.co.jp>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mcree@orcon.net.nz, jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@gmail.com, alexdeucher@gmail.com, jglisse@redhat.com

On Sun, Jun 27, 2010 at 12:20 AM, FUJITA Tomonori
<fujita.tomonori@lab.ntt.co.jp> wrote:
> On Thu, 24 Jun 2010 10:53:52 -0400
> Matt Turner <mattst88@gmail.com> wrote:
>
>> > Seems that the IOMMU can't find 128 pages. It's likely due to:
>> >
>> > - out of the IOMMU space (possibly someone doesn't free the IOMMU
>> > =A0space).
>> >
>> > or
>> >
>> > - the mapping parameters (such as align) aren't appropriate so the
>> > =A0IOMMU can't find space.
>> >
>> >
>> >> Is this the cause of the bug we're seeing in the report [1]?
>> >>
>> >> Anyone know what's going wrong here?
>> >
>> >
>> > I've attached a patch to print the debug info about the mapping
>> > parameters.
>> >
>> >
>> > diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci=
_iommu.c
>> > index d1dbd9a..17cf0d8 100644
>> > --- a/arch/alpha/kernel/pci_iommu.c
>> > +++ b/arch/alpha/kernel/pci_iommu.c
>> > @@ -187,6 +187,10 @@ iommu_arena_alloc(struct device *dev, struct =
pci_iommu_arena *arena, long n,
>> > =A0 =A0 =A0 =A0/* Search for N empty ptes */
>> > =A0 =A0 =A0 =A0ptes =3D arena->ptes;
>> > =A0 =A0 =A0 =A0mask =3D max(align, arena->align_entry) - 1;
>> > +
>> > + =A0 =A0 =A0 printk("%s: %p, %p, %d, %ld, %lx, %u\n", __func__, d=
ev, arena, arena->size,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0n, mask, align);
>> > +
>> > =A0 =A0 =A0 =A0p =3D iommu_arena_find_pages(dev, arena, n, mask);
>> > =A0 =A0 =A0 =A0if (p < 0) {
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0spin_unlock_irqrestore(&arena->lock=
, flags);
>>
>> Using this patch, I log the attached output.
>
> Your system has 1GB iommu address space. I guess that it's enough for
> KSM?

I would definitely think so. The video card I'm using here is a 64MB
Radeon 9100 PCI, with a 128MB BAR.

> The parameters in the log looks good. But you got this log before you
> started X?

Yes, that's right.

I'll see if I can isolate where the first -ENOMEM is coming from.

Thanks Fujita for helping with this!

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
