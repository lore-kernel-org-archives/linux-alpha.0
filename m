From: Matt Turner <mattst88@gmail.com>
Subject: Re: [RFC PATCH 4/6] alpha: clean mm_cpumask when flushing TLBs
Date: Fri, 2 Jun 2023 18:33:41 -0400
Message-ID: <CAEdQ38F6LqYbmAt+-NeV0gmsC+bYynmgBb8CPhHFNDzhcwC3Kg@mail.gmail.com>
References: <20230524171822.177133-1-npiggin@gmail.com> <20230524171822.177133-5-npiggin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685745232; x=1688337232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+3hWFYnGWyxsAH2PRek8Ref3rn2r0Dqi3RigjPcz3M=;
        b=SxYR7u6AfNUzUA1hQ0mPSp8mL9EXiYqn5cc9qk2RN0hz/yFmYnYyXfpyeNxb7xJiss
         7pRh7WSkCsMYhhh7pGqjuEWGW8qpmDt+OcnoEc0BTxaTkZIf9lv+EFgh4sJBop61/W4Z
         g2tcIMfXm2yawhWTwJ6kWntYWZ3U/INWRsHoiX1aMPwGR6uiVWKnH1tmYXtxaq3dd53A
         NH8Wctnv+JXwRst1Y2u7JR3+PdCATgT1hAUMAPElRogOL3AhH2GrSZNWpSknqNs80zhO
         GQ5FOW+DDCcoz75bBJRCLq3vgIXL/myK0aSlSFr/G99iNydtuJ2dGack6K2VNF1Y1wNs
         E+/Q==
In-Reply-To: <20230524171822.177133-5-npiggin@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Linus Torvalds <torvalds@linux-foundation.org>

On Wed, May 24, 2023 at 1:18=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com>=
 wrote:
>
> mm_cpumask is a map of the CPUs which must be IPIed to flush TLBs,
> and/or IPIed to shootdown lazy TLB mms at exit time.
>
> When flushing TLBs on the CPU, trim it from mm_cpumask if the mm is not
> currently active on the CPU. TLBs will have been flush, and the mm is
> not active, so there is no more reason to get IPIs.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/alpha/include/asm/tlbflush.h |  3 +++
>  arch/alpha/kernel/smp.c           | 29 +++++++++++++++++++++++++++--
>  2 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/arch/alpha/include/asm/tlbflush.h b/arch/alpha/include/asm/t=
lbflush.h
> index 94dc37cf873a..7c4e719ac9e7 100644
> --- a/arch/alpha/include/asm/tlbflush.h
> +++ b/arch/alpha/include/asm/tlbflush.h
> @@ -12,6 +12,7 @@
>  #endif
>
>  extern void __load_new_mm_context(struct mm_struct *);
> +extern void try_clear_mm_cpumask(struct mm_struct *);
>
>
>  /* Use a few helper functions to hide the ugly broken ASN
> @@ -106,6 +107,7 @@ static inline void flush_tlb_all(void)
>  static inline void
>  flush_tlb_mm(struct mm_struct *mm)
>  {
> +       try_clear_mm_cpumask(mm);
>         if (mm =3D=3D current->active_mm)
>                 flush_tlb_current(mm);
>         else
> @@ -118,6 +120,7 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned l=
ong addr)
>  {
>         struct mm_struct *mm =3D vma->vm_mm;
>
> +       try_clear_mm_cpumask(mm);
>         if (mm =3D=3D current->active_mm)
>                 flush_tlb_current_page(mm, vma, addr);
>         else
> diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
> index e436c056267d..d668b9d319af 100644
> --- a/arch/alpha/kernel/smp.c
> +++ b/arch/alpha/kernel/smp.c
> @@ -610,6 +610,28 @@ smp_imb(void)
>  }
>  EXPORT_SYMBOL(smp_imb);
>
> +#define asn_locked() (cpu_data[smp_processor_id()].asn_lock)
> +
> +/*
> + * If the mm_cpumask bit is cleared, the caller *must* flush the TLB for=
 the
> + * mm on this CPU. It is only cleared when the mm is not active, in whic=
h
> + * case the flushing always performs flush_tlb_other that flushes everyt=
hing.
> + * If that changes in callers, they will have to arrange to always do a =
full
> + * flush if mm_cpumask is cleared by this function.
> + */
> +void
> +try_clear_mm_cpumask(struct mm_struct *mm)
> +{
> +       int cpu;
> +
> +       if (current->active_mm =3D=3D mm || asn_locked())
> +               return;
> +
> +       cpu =3D smp_processor_id();
> +       if (cpumask_test_cpu(cpu, mm_cpumask(mm)))
> +               cpumask_clear_cpu(cpu, mm_cpumask(mm));
> +}

Since this is implemented in smp.c, the function is not available in
!CONFIG_SMP:

ld: kernel/fork.o: in function `dup_mmap':
(.text+0x1734): undefined reference to `try_clear_mm_cpumask'
ld: (.text+0x1738): undefined reference to `try_clear_mm_cpumask'
ld: mm/memory.o: in function `unmap_page_range':
(.text+0x1934): undefined reference to `try_clear_mm_cpumask'
ld: (.text+0x193c): undefined reference to `try_clear_mm_cpumask'
ld: (.text+0x1a28): undefined reference to `try_clear_mm_cpumask'
ld: mm/memory.o:(.text+0x1a30): more undefined references to
`try_clear_mm_cpumask' follow
make[1]: *** [scripts/Makefile.vmlinux:35: vmlinux] Error 1
make: *** [Makefile:1249: vmlinux] Error 2
