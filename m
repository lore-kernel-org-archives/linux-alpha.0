From: Matt Turner <mattst88@gmail.com>
Subject: Re: Problems with alpha/pci + radeon/ttm
Date: Thu, 24 Jun 2010 11:02:56 -0400
Message-ID: <AANLkTilhX0f90twPYjBzD1RQ84Zu6V0TW6Zulh56AZza@mail.gmail.com>
References: <AANLkTinG-5iKW5cigIQHPHRZuAMtG_xY-74XLL6vE5kb@mail.gmail.com>
	<20100622145805R.fujita.tomonori@lab.ntt.co.jp>
	<AANLkTilMfDfy7BPiuAh9u-tR3kw1Vt_SebMziLUtLM6S@mail.gmail.com>
	<4C232AAC.2010200@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=R/DO8dpTm0wD1IVcxVdJ/ja1G78QLv6v6Usn5BexTqw=;
        b=AKL7eIBukWkWO3cAbXp3QpzNI72PDq7RdJp9FdOiwg78x/XM2HG+g7lpCsxI8RJW55
         V1uERl3FDpFp/6UuN1O4kg5tKV7rLH3FSzgB0vR03MQquaJIHBnnhWfplAHidIx1qdmL
         eAPZf7wuOKOh512Q/EkXlQCy1GuDaNCmhchvU=
In-Reply-To: <4C232AAC.2010200@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: Dave Airlie <airlied@gmail.com>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, alexdeucher@gmail.com, jglisse@redhat.com

On Thu, Jun 24, 2010 at 5:51 AM, Michael Cree <mcree@orcon.net.nz> wrot=
e:
> On 22/06/10 20:32, Dave Airlie wrote:
>>
>> On Tue, Jun 22, 2010 at 3:59 PM, FUJITA Tomonori
>> <fujita.tomonori@lab.ntt.co.jp> =A0wrote:
>>>
>>> On Mon, 21 Jun 2010 17:19:43 -0400
>>> Matt Turner<mattst88@gmail.com> =A0wrote:
>>>
>>>> Michael Cree and I have been debugging FDO bug 26403 [1]. I tried
>>>> booting with `radeon.test=3D1` and found this, which I think is re=
lated:
>
> Note that my radeon card is PCI whereas I think Matt may be using an =
AGP
> card.

Actually, I'm using a plain Radeon 9100 PCI.

> My logs are very similar to Matt's except I don't see the following l=
ine:
>
>>>>> pci_map_single failed: could not allocate dma page tables
>
>
>>> This happens in the latest git, right?
>
> Indeed, testing 2.6.35-rc3 (plus a couple or so extra patches to fix
> unrelated compile errors).
>
>>> Is this a regression (what kernel version worked)?
>>>
>>> Seems that the IOMMU can't find 128 pages. It's likely due to:
>>>
>>> - out of the IOMMU space (possibly someone doesn't free the IOMMU
>>> =A0space).
>>>
>>> or
>>>
>>> - the mapping parameters (such as align) aren't appropriate so the
>>> =A0IOMMU can't find space.
>>
>> I don't think KMS drivers have ever worked on alpha so its not a
>> regression, they are working fine on x86 + powerpc and sparc has bee=
n
>> run at least once.
>
> KMS on the console boot up has worked since about 2.6.32, but startin=
g up
> the X server has always failed and, in my case, the system becomes un=
stable
> and eventually OOPs.
>
>> I suspect we are simply hitting the limits of the iommu, how big an
>> address space does it handle? since generally graphics drivers try t=
o
>> bind a lot of things to the GART.
>
> No idea on the address space limit. =A0I applied the patch of Fujita =
that logs
> all IOMMU allocations, and also inserted some extra printks in the tt=
m
> kernel code so that I could see which routines failed and the error c=
ode
> returned. =A0Running the radeon test on boot exhibits the following:
>
> [ =A0238.712768] [drm] Tested GTT->VRAM and VRAM->GTT copy for GTT of=
fset
> 0x1a312000
> [ =A0239.281127] [drm] Tested GTT->VRAM and VRAM->GTT copy for GTT of=
fset
> 0x1a412000
> [ =A0239.281127] ttm_tt_bind belched -12
> [ =A0239.282104] ttm_bo_handle_move_mem belched -12
> [ =A0239.282104] ttm_bo_move_buffer belched -12
> [ =A0239.282104] ttm_bo_validate belched -12
> [ =A0239.282104] radeon 0000:01:00.0: object_init failed for (1048576=
,
> 0x00000002) err=3D-12
> [ =A0239.282104] [drm:radeon_test_moves] *ERROR* Failed to create GTT=
 object
> 419
> [ =A0239.399291] Error while testing BO move.
>
> Note that no IOMMU allocations are printed while radeon_test_moves is
> running so iommu_arena_alloc doesn't appear to be called. =A0Also the=
 error
> code returned up to radeon_test_moves is -12 which is ENOMEM. =A0So d=
oes
> appear to be some memory limit.

I confirm that we're getting -ENOMEM. I don't know if it's coming from
radeon_gart_bind(), but if it is there's an interesting comment
immediately after the call to pci_map_page:

if (pci_dma_mapping_error(rdev->pdev, rdev->gart.pages_addr[p])) {
            /* FIXME: failed to map page (return -ENOMEM?) */
            radeon_gart_unbind(rdev, offset, pages);
            return -ENOMEM;
}

>> It might be worth limiting the PCIGART in radeon to 32MB to see if t=
he
>> lower limit helps.
>
> So, how does one do that?

Boot with `radeon.test=3D1 radeon.gartsize=3D<size in MB>`.
> Cheers
> Michael.

Thanks,
Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
