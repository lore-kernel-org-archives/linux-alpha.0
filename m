From: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 21/27] sparc: remove wrong comment from arch/sparc/include/asm/Kbuild
Date: Mon, 15 Feb 2021 02:00:35 +0900
Message-ID: <CAK7LNAQDcfqSCsCeG9+ytrJNfD5mS8OLS2uZS8WRBuTHRL1qRg@mail.gmail.com>
References: <20210128005110.2613902-1-masahiroy@kernel.org> <20210128005110.2613902-22-masahiroy@kernel.org>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 11EH1DPf005787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613322074;
        bh=SP1sGJk9Sz6Zv6lJ9Wi/Vff8sScxvUIuNUkChOHpFR8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eW5SCVd/ORO2ykDHxnNRrd0j5pNeofX24lJWfc1sAWEZK87VwCvlyBONkk1p+q0pw
         n9urDcCM7JXO/83SDgjvjWIuq0kCzJpxghQ0kdEY/9lSUqF57fsB4kVM44LTekaoBL
         2K5usgTVkdb+i9kzobmJV+tecZNrbgkAygUEWwX3cvMZxzFNtx08+4IWsN9L58B4V9
         msLNld5lBI4A8trmLyO3EgTzKOINsLN5xgyvh+eWnDvPTyAVb6rNcHXCo6xnYQ8S9l
         7hdmlhpR1RGeMV1AEHEn5ADueffOKPk44du6buIJ89LAEEs34fToTGEhTLY+vWrQY3
         BiMMNZH6MaRbw==
In-Reply-To: <20210128005110.2613902-22-masahiroy@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>, linux-um@lists.infradead.org, "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, sparclinux <sparclinux@vger.kernel.org>

On Thu, Jan 28, 2021 at 9:52 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> These are NOT exported to userspace.
>
> The headers listed in arch/sparc/include/uapi/asm/Kbuild are exported.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Applied to linux-kbuild/fixes.


> ---
>
>  arch/sparc/include/asm/Kbuild | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/sparc/include/asm/Kbuild b/arch/sparc/include/asm/Kbuild
> index 3688fdae50e4..aec20406145e 100644
> --- a/arch/sparc/include/asm/Kbuild
> +++ b/arch/sparc/include/asm/Kbuild
> @@ -1,6 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -# User exported sparc header files
> -
>  generated-y += syscall_table_32.h
>  generated-y += syscall_table_64.h
>  generated-y += syscall_table_c32.h
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
