Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2283441D111
	for <linux-alpha@vger.kernel.org>; Mon,  7 Sep 2026 21:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788815273; cv=pass; b=E/w4cewBv56gH/HHDgscxLZhkVm2dytbv9mUluxqAE9dkeSL9bgN5NGYNxopsYZxNB1eCNeyFExEZ/VR7QW2GnpM70Jx+dEmzQio82FmNylKskAe7pBi46Zuh8kiJX1Y1YBC3aUzCg9mix63LK4r+CKCIMWaX2vHDrDN8NqsCDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788815273; c=relaxed/simple;
	bh=OFnY5O2swjOM6Aa9822KWrZkE4mt65lLa95J2R/BasU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kbchnifa6Uf9PTKDQlmBOEtyBLJERIDTEmrevpnClZhwfUvUhCh5aw9ek7zTS2L0XOqugbv+G3okVo+W02ta0ecVs6UU16DzQv5Y6gAIiJKTFisQr5Go+M7nuyHlU/WBL71p2dnxfoif5/OntRc3JfBhJbPILZce4DcmGuEA5ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gZa1SEFO; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gZa1SEFO"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso455811cf.1
        for <linux-alpha@vger.kernel.org>; Mon, 07 Sep 2026 14:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788815270; cv=none;
        d=google.com; s=arc-20260327;
        b=oSZUFAT0x8UXRGzH39VXCAJ99BlSBeHrzkUEaHdrGm6waC51awZrCfYnmGpf6pbH/V
         gI0QqgZGkQd36om0C5njJeGv9VNP29hXP5t44WiqrJYrxBmOSu1EaIxoRtGLkPCB7E+S
         BzLWg27tLXR1DOx7ubDmpQdKZoDVhFaqgOi5TSS2Rm0Jk/ybjOAH1R83wMEdWVRXnwXG
         +MIMArc1mGz9ZKmHt2WTVUMgSGqdTPlRchQRA/pm0yqhf8GmsYhRIjwV2Tad8aE/RWAT
         LNWmdIWxQkD+TtMH6ZjFOHHOEC0Z7CQFiJnOtbvBUXtVZMl8ItZfBpEQzVJrpZXoNPte
         AIeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j33dWXa87ubHe2rcHlgmZCfdvDttwcXovkMGxt/Pcfc=;
        fh=8+zf7i7AXWwjn2pmO1ylXalYs63fPQNX7n4gRBIlcoQ=;
        b=B6TJxKwbJsCKsGRvRrXUZuAE/esObo7Dxqt6P7h2fIB9e4yVY5rCkGSS4JHSpge9Fs
         5sqQ4PKJcaBlBkGyLS++ump0Wbd53B+l1GMqNLznILU0vTHxtsjanOvxcJvVKikosycV
         2aes847wlAemJzVdwBaNPmwFKMQ6vpjAV3xEbkZy7dla246DpKSraDPoATgE+7pnBXlj
         ktCCee6Fhgp6nVCq4a9UP/uNXnTJfyiq3CnsvH/jIK4JBFNZ57CTxYasqfmmFYFkQBZ5
         nhSP0nkdvACImSr7sJSrYAhe/0JSxNbktDmomNmn1vucCjxmPUz9bzAGFZm/wm8n3IaP
         GdQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788815270; x=1789420070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j33dWXa87ubHe2rcHlgmZCfdvDttwcXovkMGxt/Pcfc=;
        b=gZa1SEFOVPdEV/FpjKaPjpj0KNPZ1Iecab4PdgmraoAo2b7ryO2g5NK6tMroCKiFKD
         8l8A80GfGN6lSE2YxLoxSsbPKgRu+TKEHgFwF27dcpWRyJvnyc+r0DAxKEw1/EFAuzU6
         KKPJCZaaMjwheVTJN8aQ5vV5MuubXIV3Oe9PyhSD3x1/06QFhB9XcXsN5pZDYd0GXKAd
         TF6DI3+Mha53Om1+XoVrw/AFKG4dAgedwx4/V9xi0JmbWhdVKLOshxId27o60xDKjUH5
         IX+y4q4Vm5ctTNthUn9LHNKyNANRCpLkuz0XIHO6E98Md0HMmTHO7f6AR+/XqzAgDxuh
         oH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788815270; x=1789420070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j33dWXa87ubHe2rcHlgmZCfdvDttwcXovkMGxt/Pcfc=;
        b=e5xeuR2cc35SVqhfg1xU/TKnhYMHYWtQ+BkAvQLyx6RfnyDLqMN0j6Ms85HE5CF1jN
         82FCGGE5AEXFAICzp3NeRrUFsuTaL7qANe6DMamHwSdVk1AAnaIVKusob5bVhElOaxjI
         jQd0Iqe8tl9YSQRy4R9b1Vb8dl6IBaIAS+vEOOvroHj/EpbtafaGXIT6M5vEuiWMF9gP
         5u7YyRqfd1iZspUV+Qm+zP4EhXDgvPCJnDsz6zGqtmBMEiqxDJ5bI5UfnuihXrzVZGnh
         qNKoC5L4R75qYpuW08Ud0HbGwbB54CSYC/yobCUPIfLMmU9RjRc+Pcmblwx2m+8+3U3k
         vj3Q==
X-Forwarded-Encrypted: i=1; AKwUvByZclJJpBUG93v39zLZG0m1HG2Sh4FiAInUo5datg3hUnsBCVNYEkN0V78usDmwV7sNN1r4RjLxIf1l3g==@vger.kernel.org
X-Gm-Message-State: AFuF++kVKn8PhBv4Df5bFn/jtLT+lDX3NJYMDCB/yZwr71C8QmjxtY/J
	oOjpca6KgkweLKpFbH/5IOsCicFaLQ/nZDj/6UEUTj5AxUQdQ1peoOVP5VnrMpsLac9vn6Hedsq
	lWeHJDjH0psXtOCtLlSX+sjkiWFPJYNibY5H9WHJr
X-Gm-Gg: AYBFou0imE7oj2BnQyQpj7kmayI4dly6HaR9DWiY2oj5MV3MIsjYuwPQtHGDlm6WkgB
	nnFsVUO4FlhNrvCoPih+MoQTJrECeytzPWcjdwK2oUzpYKeRXh3dCtNKKykk6hypTGz67Lfi+a+
	LizJqLXXylQgMIEIuLv1sXqghkDRejvJ4oAbEvdLjhHe7lD4y4O1fHOKp1mkHQ68B7oL8LK5CrS
	2nqGotSsn2sh9ulJXypCxPbuM7n/KizGzBX7CxtaOiWIqtytEOkG/WiKgIFpULAI4GyxIX2HP5W
	S55CQ/b5tmeQLwPEjlUPTUtvnjg/lc9wK8raUPCu9sw=
X-Received: by 2002:a05:622a:2589:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-53065d7943emr35669061cf.4.1788815269129; Mon, 07 Sep 2026
 14:07:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-rcu-pagetable-freeing-v1-0-5456a81c8212@kernel.org> <20260901-rcu-pagetable-freeing-v1-5-5456a81c8212@kernel.org>
In-Reply-To: <20260901-rcu-pagetable-freeing-v1-5-5456a81c8212@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 7 Sep 2026 14:07:37 -0700
X-Gm-Features: AcwNN1U8TkUrFVP6EqWbmqC7u-eOkQZui9u0urXe4uY9QHhCrt9ILjWVeJ-SJWo
Message-ID: <CAJuCfpESe_BXihJh-8FhjQVKzsSpnS4zdMgg3e59byJTc8QViA@mail.gmail.com>
Subject: Re: [PATCH 05/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for arc,
 microblaze, xtensa
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Simon Schuster <schuster.simon@siemens-energy.com>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, 
	Hugh Dickins <hughd@google.com>, Qi Zheng <qi.zheng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 4:06=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> Each of these architectures directly free page tables without routing the=
se
> changes through tlb_remove_ptdesc().
>
> The use of tlb_remove_ptdesc() is required for
> CONFIG_MMU_GATHER_RCU_TABLE_FREE to correctly free page tables under RCU,
> so simply update these architectures to use these functions.
>
> Since none of the architectures share page tables or do anything unusual,
> nothing complicated is required here.
>
> Therefore this is simply a mechanical change - convert __pud_free_tlb(),
> __pmd_free_tlb() and __pte_free_tlb() to use tlb_remove_ptdesc() as
> required.
>
> At the point this is in place, all mmu_gather page table freeing is
> performed under RCU, and thus MMU_GATHER_RCU_TABLE_FREE is selected for
> each architecture.
>
> This forms part of an overall effort to switch every architecture to this
> mode.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  arch/arc/Kconfig                      | 1 +
>  arch/arc/include/asm/pgalloc.h        | 6 +++---
>  arch/microblaze/Kconfig               | 1 +
>  arch/microblaze/include/asm/pgalloc.h | 2 +-
>  arch/xtensa/Kconfig                   | 1 +
>  arch/xtensa/include/asm/tlb.h         | 2 +-
>  6 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index 2ed7186c81c5..7a7542b61823 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -47,6 +47,7 @@ config ARC
>         select HAVE_SYSCALL_TRACEPOINTS
>         select IRQ_DOMAIN
>         select LOCK_MM_AND_FIND_VMA
> +       select MMU_GATHER_RCU_TABLE_FREE
>         select MODULES_USE_ELF_RELA
>         select OF
>         select OF_EARLY_FLATTREE
> diff --git a/arch/arc/include/asm/pgalloc.h b/arch/arc/include/asm/pgallo=
c.h
> index dfae070fe8d5..9b6c37f92e97 100644
> --- a/arch/arc/include/asm/pgalloc.h
> +++ b/arch/arc/include/asm/pgalloc.h
> @@ -72,7 +72,7 @@ static inline void p4d_populate(struct mm_struct *mm, p=
4d_t *p4dp, pud_t *pudp)
>         set_p4d(p4dp, __p4d((unsigned long)pudp));
>  }
>
> -#define __pud_free_tlb(tlb, pmd, addr)  pud_free((tlb)->mm, pmd)
> +#define __pud_free_tlb(tlb, pmd, addr)  tlb_remove_ptdesc((tlb), virt_to=
_ptdesc(pmd))
>
>  #endif
>
> @@ -83,10 +83,10 @@ static inline void pud_populate(struct mm_struct *mm,=
 pud_t *pudp, pmd_t *pmdp)
>         set_pud(pudp, __pud((unsigned long)pmdp));
>  }
>
> -#define __pmd_free_tlb(tlb, pmd, addr)  pmd_free((tlb)->mm, pmd)
> +#define __pmd_free_tlb(tlb, pmd, addr)  tlb_remove_ptdesc((tlb), virt_to=
_ptdesc(pmd))
>
>  #endif
>
> -#define __pte_free_tlb(tlb, pte, addr)  pte_free((tlb)->mm, pte)
> +#define __pte_free_tlb(tlb, pte, addr)  tlb_remove_ptdesc((tlb), page_pt=
desc(pte))
>
>  #endif /* _ASM_ARC_PGALLOC_H */
> diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
> index 484ebb3baedf..af7e821e96c1 100644
> --- a/arch/microblaze/Kconfig
> +++ b/arch/microblaze/Kconfig
> @@ -41,6 +41,7 @@ config MICROBLAZE
>         select PCI_SYSCALL if PCI
>         select CPU_NO_EFFICIENT_FFS
>         select MMU_GATHER_NO_RANGE
> +       select MMU_GATHER_RCU_TABLE_FREE
>         select SPARSE_IRQ
>         select ZONE_DMA
>         select TRACE_IRQFLAGS_SUPPORT
> diff --git a/arch/microblaze/include/asm/pgalloc.h b/arch/microblaze/incl=
ude/asm/pgalloc.h
> index 084a8a0dc239..ffee6a009219 100644
> --- a/arch/microblaze/include/asm/pgalloc.h
> +++ b/arch/microblaze/include/asm/pgalloc.h
> @@ -25,7 +25,7 @@ extern void __bad_pte(pmd_t *pmd);
>
>  extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
>
> -#define __pte_free_tlb(tlb, pte, addr) pte_free((tlb)->mm, (pte))
> +#define __pte_free_tlb(tlb, pte, addr) tlb_remove_ptdesc((tlb), page_ptd=
esc(pte))
>
>  #define pmd_populate(mm, pmd, pte) \
>                         (pmd_val(*(pmd)) =3D (unsigned long)page_address(=
pte))
> diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
> index f2f9cd9cde50..33c4caee30e2 100644
> --- a/arch/xtensa/Kconfig
> +++ b/arch/xtensa/Kconfig
> @@ -55,6 +55,7 @@ config XTENSA
>         select HAVE_VIRT_CPU_ACCOUNTING_GEN
>         select IRQ_DOMAIN
>         select LOCK_MM_AND_FIND_VMA
> +       select MMU_GATHER_RCU_TABLE_FREE if MMU

And MMU is required because NOMMU does not perform mmu_gather
operations, same as in the previous patch? If so, maybe make a note of
it in the changelog?

>         select MODULES_USE_ELF_RELA
>         select PERF_USE_VMALLOC
>         select TRACE_IRQFLAGS_SUPPORT
> diff --git a/arch/xtensa/include/asm/tlb.h b/arch/xtensa/include/asm/tlb.=
h
> index 8c3ceb427018..6fb7b78154f6 100644
> --- a/arch/xtensa/include/asm/tlb.h
> +++ b/arch/xtensa/include/asm/tlb.h
> @@ -16,7 +16,7 @@
>
>  #include <asm-generic/tlb.h>
>
> -#define __pte_free_tlb(tlb, pte, address)      pte_free((tlb)->mm, pte)
> +#define __pte_free_tlb(tlb, pte, address)      tlb_remove_ptdesc((tlb), =
page_ptdesc(pte))
>
>  void check_tlb_sanity(void);
>
>
> --
> 2.55.0
>
