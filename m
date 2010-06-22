From: Dave Airlie <airlied@gmail.com>
Subject: Re: Problems with alpha/pci + radeon/ttm
Date: Tue, 22 Jun 2010 18:32:36 +1000
Message-ID: <AANLkTilMfDfy7BPiuAh9u-tR3kw1Vt_SebMziLUtLM6S@mail.gmail.com>
References: <AANLkTinG-5iKW5cigIQHPHRZuAMtG_xY-74XLL6vE5kb@mail.gmail.com>
	<20100622145805R.fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=WUB7zG6eug0wonYduF27LKv1O0r7hv5ufVMEOurmNow=;
        b=b339bE/OYlCUJH+fiPBnVR/6ZQf4Y8qHrenU4ClOWOlBoydKTHkYhNkBbDrIzPdWQS
         tRDScxAUuCimyPiKzZlja7mMUM3mkBpL31STg1nQELMQGhF+RCrbQg2yG1+4h7LgljPF
         NBafC6lGQj9CZ67sZS7UggOvVl8RQMziTdGu4=
In-Reply-To: <20100622145805R.fujita.tomonori@lab.ntt.co.jp>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Cc: mattst88@gmail.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mcree@orcon.net.nz, jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, alexdeucher@gmail.com, jglisse@redhat.com

On Tue, Jun 22, 2010 at 3:59 PM, FUJITA Tomonori
<fujita.tomonori@lab.ntt.co.jp> wrote:
> On Mon, 21 Jun 2010 17:19:43 -0400
> Matt Turner <mattst88@gmail.com> wrote:
>
>> Michael Cree and I have been debugging FDO bug 26403 [1]. I tried
>> booting with `radeon.test=3D1` and found this, which I think is rela=
ted:
>>
>> > [drm] Tested GTT->VRAM and VRAM->GTT copy for GTT offset 0x202000
>> > [drm] Tested GTT->VRAM and VRAM->GTT copy for GTT offset 0x302000
>> [snip]
>> > [drm] Tested GTT->VRAM and VRAM->GTT copy for GTT offset 0xfd02000
>> > [drm] Tested GTT->VRAM and VRAM->GTT copy for GTT offset 0xfe02000
>> > pci_map_single failed: could not allocate dma page tables
>> > [drm:radeon_ttm_backend_bind] *ERROR* failed to bind 128 pages at =
0x0FF02000
>> > [TTM] Couldn't bind backend.
>> > radeon 0000:00:07.0: object_init failed for (1048576, 0x00000002)
>> > [drm:radeon_test_moves] *ERROR* Failed to create GTT object 253
>> > Error while testing BO move.
>>
>> From what I can see, the call chain is
>> radeon_test_moves
>> =A0(radeon_ttm_backend_bind called through callback function)
>> =A0- radeon_ttm.c:radeon_ttm_backend_bind calls radeon_gart_bind
>> =A0 - radeon_gart.c:radeon_gart_bind calls pci_map_page
>> =A0 =A0- pci_map_page is alpha_pci_map_page, which calls...
>> =A0 =A0 - alpha_pci_map_page calls pci_iommu.c:pci_map_single_1
>> =A0 =A0 =A0- pci_map_single_1 calls iommu_arena_alloc
>> =A0 =A0 =A0 - iommu_arena_alloc calls iommu_arena_find_pages
>> =A0 =A0 =A0 =A0- iommu_arena_find_pages returns non-0
>> =A0 =A0 =A0 - iommu_arena_alloc returns non-0
>> =A0 =A0 =A0- pci_map_single_1 returns 0 after printing
>> =A0 =A0 =A0 =A0"could not allocate dma page tables" error
>> =A0 =A0 - alpha_pci_map_page returns 0 from pci_map_single_1
>> =A0 - radeon_gart_bind returns non-0, error path prints
>> =A0 =A0 "*ERROR* failed to bind 128 pages at 0x0FF02000"
>
> This happens in the latest git, right?
>
> Is this a regression (what kernel version worked)?
>
>
> Seems that the IOMMU can't find 128 pages. It's likely due to:
>
> - out of the IOMMU space (possibly someone doesn't free the IOMMU
> =A0space).
>
> or
>
> - the mapping parameters (such as align) aren't appropriate so the
> =A0IOMMU can't find space.

I don't think KMS drivers have ever worked on alpha so its not a
regression, they are working fine on x86 + powerpc and sparc has been
run at least once.

I suspect we are simply hitting the limits of the iommu, how big an
address space does it handle? since generally graphics drivers try to
bind a lot of things to the GART.

It might be worth limiting the PCIGART in radeon to 32MB to see if the
lower limit helps.

Dave.

>
>
>> Is this the cause of the bug we're seeing in the report [1]?
>>
>> Anyone know what's going wrong here?
>
>
> I've attached a patch to print the debug info about the mapping
> parameters.
>
>
> diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_io=
mmu.c
> index d1dbd9a..17cf0d8 100644
> --- a/arch/alpha/kernel/pci_iommu.c
> +++ b/arch/alpha/kernel/pci_iommu.c
> @@ -187,6 +187,10 @@ iommu_arena_alloc(struct device *dev, struct pci=
_iommu_arena *arena, long n,
> =A0 =A0 =A0 =A0/* Search for N empty ptes */
> =A0 =A0 =A0 =A0ptes =3D arena->ptes;
> =A0 =A0 =A0 =A0mask =3D max(align, arena->align_entry) - 1;
> +
> + =A0 =A0 =A0 printk("%s: %p, %p, %d, %ld, %lx, %u\n", __func__, dev,=
 arena, arena->size,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0n, mask, align);
> +
> =A0 =A0 =A0 =A0p =3D iommu_arena_find_pages(dev, arena, n, mask);
> =A0 =A0 =A0 =A0if (p < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0spin_unlock_irqrestore(&arena->lock, f=
lags);
>
>
