From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: fix R_ALPHA_LITERAL reloc for large modules
Date: Sat, 25 Feb 2023 21:04:55 -0500
Message-ID: <CAEdQ38Hw2b2RG0-v2=+sZ5pLdzGwBsWRNyTKsnFC6nPFPvEcyA@mail.gmail.com>
References: <20220827064939.461790-1-aurxenon@lunos.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N2OCqEMPQ8qAUblLybxvKPB1KcvQKq3wt9E6sXvPAGQ=;
        b=K+ZFa91xdiFyNq5t9Wo+HrNVpOVXR3WusKDLvmYP0huv17kIKiYsm47AfTTYblPybr
         73jsI2y9KVmHmy6nckRRS/BuHaRj3lECdXhuk36M906Wknh2g0hoDpjbmmPKhzxne9XD
         eTamr51WJdnmAHfONMjLLWgO6rX8C+qMmqdZBWeY+BmmALWy+9pl7PWmZZc0MPhpIEI8
         JQ3IdFo2r7QFBXtvA/Gd/+Km+YqtjK7CqI7azk5Lcfnp+tzMj21MGOJRZWR3Ovo4PetN
         4CZFNmkCQqkqFaAFNqVCbUJpHRdcSAVyUDewS6kHxFlbIg/X4OGf2JpAdTG67R4kyVYz
         I5Dw==
In-Reply-To: <20220827064939.461790-1-aurxenon@lunos.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Humes <aurxenon@lunos.org>
Cc: linux-alpha@vger.kernel.org, ink@jurassic.park.msu.ru, richard.henderson@linaro.org

On Sat, Aug 27, 2022 at 2:49 AM Edward Humes <aurxenon@lunos.org> wrote:
>
> Previously, R_ALPHA_LITERAL relocations would overflow for large kernel
> modules.
>
> This was because the Alpha's apply_relocate_add was relying on the kernel's
> module loader to have sorted the GOT towards the very end of the module as it
> was mapped into memory in order to correctly assign the global pointer. While
> this behavior would mostly work fine for small kernel modules, this approach
> would overflow on kernel modules with large GOT's since the global pointer
> would be very far away from the GOT, and thus, certain entries would be out of
> range.
>
> This patch fixes this by instead using the Tru64 behavior of assigning the
> global pointer to be 32KB away from the start of the GOT. The change made
> in this patch won't work for multi-GOT kernel modules as it makes the
> assumption the module only has one GOT located at the beginning of .got,
> although for the vast majority kernel modules, this should be fine. Of the
> kernel modules that would previously result in a relocation error, none of
> them, even modules like nouveau, have even come close to filling up a single
> GOT, and they've all worked fine under this patch.
>
> Signed-off-by: Edward Humes <aurxenon@lunos.org>
> ---
>  arch/alpha/kernel/module.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/alpha/kernel/module.c b/arch/alpha/kernel/module.c
> index 5b60c248de9e..cbefa5a77384 100644
> --- a/arch/alpha/kernel/module.c
> +++ b/arch/alpha/kernel/module.c
> @@ -146,10 +146,8 @@ apply_relocate_add(Elf64_Shdr *sechdrs, const char *strtab,
>         base = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr;
>         symtab = (Elf64_Sym *)sechdrs[symindex].sh_addr;
>
> -       /* The small sections were sorted to the end of the segment.
> -          The following should definitely cover them.  */
> -       gp = (u64)me->core_layout.base + me->core_layout.size - 0x8000;
>         got = sechdrs[me->arch.gotsecindex].sh_addr;
> +       gp = got + 0x8000;
>
>         for (i = 0; i < n; i++) {
>                 unsigned long r_sym = ELF64_R_SYM (rela[i].r_info);
> --
> 2.34.1
>

Thanks for the patch! This was included in my pull request today and
is now upstream in Linus' tree.
