From: Dave Airlie <airlied@gmail.com>
Subject: Re: Problems with alpha/pci + radeon/ttm
Date: Mon, 28 Jun 2010 09:14:29 +1000
Message-ID: <AANLkTinrscp_Vqh69dbH5t5yqNiR4Mgl7T2JRrmWwI4a@mail.gmail.com>
References: <20100622145805R.fujita.tomonori@lab.ntt.co.jp>
	<AANLkTilMfDfy7BPiuAh9u-tR3kw1Vt_SebMziLUtLM6S@mail.gmail.com>
	<4C232AAC.2010200@orcon.net.nz>
	<20100627131836T.fujita.tomonori@lab.ntt.co.jp>
	<4C272C1C.9000802@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Low0IxTc1cXWTeFnSUvAvJFn8D7TM+O4FSU34HyMQho=;
        b=EL28x031XKKtznRHtr8xogd6/CVM4HoNVqMkce162SDJ0Lki6Y5demVorEU0qGWEdS
         6jkdrMIs3xzWNo2Z5vnURmERZfJ6lxQRbl2JwSgwESpccyTmXN8Bmh6Of046iQyx7X3r
         QzEn9hRiU8Xzll7f7fAma8qZoCsm2SYHaBTyg=
In-Reply-To: <4C272C1C.9000802@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, mattst88@gmail.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, alexdeucher@gmail.com, jglisse@redhat.com

On Sun, Jun 27, 2010 at 8:46 PM, Michael Cree <mcree@orcon.net.nz> wrot=
e:
> On 27/06/10 16:20, FUJITA Tomonori wrote:
>>
>> On Thu, 24 Jun 2010 21:51:40 +1200
>> Michael Cree<mcree@orcon.net.nz> =A0wrote:
>>
>>>>> Is this a regression (what kernel version worked)?
>>>>>
>>>>> Seems that the IOMMU can't find 128 pages. It's likely due to:
>>>>>
>>>>> - out of the IOMMU space (possibly someone doesn't free the IOMMU
>>>>> =A0 space).
>>>>>
>>>>> or
>>>>>
>>>>> - the mapping parameters (such as align) aren't appropriate so th=
e
>>>>> =A0 IOMMU can't find space.
>>>>
>>>> I don't think KMS drivers have ever worked on alpha so its not a
>>>> regression, they are working fine on x86 + powerpc and sparc has b=
een
>>>> run at least once.
>>>
>>> KMS on the console boot up has worked since about 2.6.32, but start=
ing
>>> up the X server has always failed and, in my case, the system becom=
es
>>> unstable and eventually OOPs.
>>>
>>>> I suspect we are simply hitting the limits of the iommu, how big a=
n
>>>> address space does it handle? since generally graphics drivers try=
 to
>>>> bind a lot of things to the GART.
>>>
>>> No idea on the address space limit. =A0I applied the patch of Fujit=
a that
>>> logs all IOMMU allocations, and also inserted some extra printks in=
 the
>>> ttm kernel code so that I could see which routines failed and the e=
rror
>>> code returned. =A0Running the radeon test on boot exhibits the foll=
owing:
>>>
>>> [ =A0238.712768] [drm] Tested GTT->VRAM and VRAM->GTT copy for GTT =
offset
>>> 0x1a312000
>>> [ =A0239.281127] [drm] Tested GTT->VRAM and VRAM->GTT copy for GTT =
offset
>>> 0x1a412000
>>> [ =A0239.281127] ttm_tt_bind belched -12
>>> [ =A0239.282104] ttm_bo_handle_move_mem belched -12
>>> [ =A0239.282104] ttm_bo_move_buffer belched -12
>>> [ =A0239.282104] ttm_bo_validate belched -12
>>> [ =A0239.282104] radeon 0000:01:00.0: object_init failed for (10485=
76,
>>> 0x00000002) err=3D-12
>>> [ =A0239.282104] [drm:radeon_test_moves] *ERROR* Failed to create G=
TT
>>> object 419
>>> [ =A0239.399291] Error while testing BO move.
>>>
>>> Note that no IOMMU allocations are printed while radeon_test_moves =
is
>>> running so iommu_arena_alloc doesn't appear to be called. =A0Also t=
he
>>> error code returned up to radeon_test_moves is -12 which is ENOMEM.=
 =A0So
>>> does appear to be some memory limit.
>>
>> Hmm, not related with IOMMU? looks like ttm_tt_populate could return
>> ENOMEM too. Can we locate where we hit ENOMEM first?
>
> Yeah, in ttm_mem_global_reserve while it is walking glob->zones:
>
> [ =A0239.303588] [drm] Tested GTT->VRAM and VRAM->GTT copy for GTT of=
fset
> 0x1a412000
> [ =A0239.304564] ttm_mem_global_reserve zone used_mem (0x1a5f0000) ex=
ceeds
> limit (0x1a5ef000)
> [ =A0239.304564] ttm_mem_global_reserve zone used_mem (0x1a5f0000) ex=
ceeds
> limit (0x1a5ef000)
> [ =A0239.304564] ttm_mem_global_reserve zone used_mem (0x1a5f0000) ex=
ceeds
> limit (0x1a5ef000)
> [ =A0239.304564] ttm_mem_global_reserve zone used_mem (0x1a5f0000) ex=
ceeds
> limit (0x1a5ef000)
> [ =A0239.304564] ttm_mem_global_reserve zone used_mem (0x1a5f0000) ex=
ceeds
> limit (0x1a5ef000)
> [ =A0239.304564] ttm_mem_global_reserve return non-zero count decs to=
 zero
> [ =A0239.304564] ttm_mem_global_alloc_page belched -12
> [ =A0239.304564] __ttm_tt_get_page coughed NULL
> [ =A0239.304564] ttm_tt_populate belched -12
> [ =A0239.304564] ttm_tt_bind belched -12
> [ =A0239.304564] ttm_bo_handle_move_mem belched -12
> [ =A0239.304564] ttm_bo_move_buffer belched -12
> [ =A0239.304564] ttm_bo_validate belched -12
>
> On a hunch that we are chasing a red herring I installed another 256M=
B of
> memory into the machine (was 576MB for the test reported above) for a=
 total
> of 832MB.
>
> Now radeon_test_moves runs to completion without error.
>
> OK, now a test of starting up the X server - ah, a bus error again bu=
t now
> it looks like it's in the radeon driver:
>
> [ =A01435.014] (II) EXA(0): Driver allocated offscreen pixmaps
> [ =A01435.014] (II) EXA(0): Driver registered support for the followi=
ng
> operations:
> [ =A01435.014] (II) =A0 =A0 =A0 =A0 Solid
> [ =A01435.014] (II) =A0 =A0 =A0 =A0 Copy
> [ =A01435.014] (II) =A0 =A0 =A0 =A0 Composite (RENDER acceleration)
> [ =A01435.014] (II) =A0 =A0 =A0 =A0 UploadToScreen
> [ =A01435.014] (II) =A0 =A0 =A0 =A0 DownloadFromScreen
> [ =A01435.030]
> Backtrace:
> [ =A01435.032] 0: /opt/xorg-ev56/bin/X (xorg_backtrace+0x54) [0x12007=
0884]
> [ =A01435.032] 1: /opt/xorg-ev56/bin/X (0x120000000+0x65608) [0x12006=
5608]
> [ =A01435.033] 2: /lib/libc.so.6.1 (0x20000310000+0x3d610) [0x2000034=
d610]
> [ =A01435.034] 3: /opt/xorg-ev56/lib/xorg/modules/drivers/radeon_drv.=
so
> (0x20000758000+0x15b890) [0x200008b3890]
> [ =A01435.034] 4: /opt/xorg-ev56/lib/xorg/modules/drivers/radeon_drv.=
so
> (0x20000758000+0x1392a0) [0x200008912a0]
> [ =A01435.034] 5: /opt/xorg-ev56/lib/xorg/modules/drivers/radeon_drv.=
so
> (0x20000758000+0x139bec) [0x20000891bec]
> [ =A01435.034] 6: /opt/xorg-ev56/lib/xorg/modules/drivers/radeon_drv.=
so
> (0x20000758000+0x4f088) [0x200007a7088]
> [ =A01435.035] 7: /opt/xorg-ev56/lib/xorg/modules/drivers/radeon_drv.=
so
> (0x20000758000+0x16f0f8) [0x200008c70f8]
> [ =A01435.035] 8: /opt/xorg-ev56/bin/X (AddScreen+0x1c0) [0x1200532b0=
]
> [ =A01435.036] 9: /opt/xorg-ev56/bin/X (InitOutput+0x29c) [0x12008c6e=
c]
> [ =A01435.036] 10: /opt/xorg-ev56/bin/X (0x120000000+0x24b48) [0x1200=
24b48]
> [ =A01435.037] 11: /lib/libc.so.6.1 (__libc_start_main+0xec) [0x20000=
33267c]
> [ =A01435.037] 12: /opt/xorg-ev56/bin/X (__start+0x38) [0x120024788]
> [ =A01435.038] Bus error at address 0x20000030000
>
> And nothing in dmesg. =A0Now I'm not triggering the nasty page alloc =
errors.

The bus error is caused by the kernel, its something alpha specific
with how mmap works,
I'm not sure if alpha needs some special mmap flags or something,

Dave.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
