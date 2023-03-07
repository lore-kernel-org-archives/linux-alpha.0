From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v5 12/26] riscv: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 07 Mar 2023 13:41:57 -0800 (PST)
Message-ID: <mhng-d4be5bb5-f0ad-4e76-9b11-83732d233a45@palmer-ri-x1c9a>
References: <20230306100508.1171812-13-alexghiti@rivosinc.com>
Mime-Version: 1.0 (MHng)
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678225318;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0UBWEzua7mI1E3a/+R1pzklpJ+RGJpYFy9mijom/UM=;
        b=3d0i9L9fgsM6wfDV6SgEVPe2doCmA84h8dgaHpMbejZeZuQRklJuURRf6PhkCN7ukc
         w/n+8nbuC+OW0mQWtjtERbzb9wBvkWnsuB3UcR0sH2Ba3g7FDMT+jDol43sV0ZSapUuU
         afFVzDtGs7qaCnWpNgGUvXPCI9VeRCtjLQt1T3AcBXMLT19wGawFny88dkq7b+SM519J
         izcWM0iUW0/Sac/AVhLneLvdpP7x0olNKc4YqRIWvevDICe0+qs1ypmIQEYjXt6H2n6Q
         PGyqmNUpfeGmcTALJ+qCkHjqjpTn7tbuCsOrFtOo3YqXRw3n/PRxx6fcIN5oBf8fOwBc
         hPrQ==
In-Reply-To: <20230306100508.1171812-13-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: alexghiti@rivosinc.com
Cc: Greg KH <gregkh@linuxfoundation.org>, corbet@lwn.net, Richard Henderson <richard.henderson@linaro.org>, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@kernel.org, linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, chenhuacai@kernel.org, kernel@xen0n.name, geert@linux-m68k.org, monstr@monstr.eu, tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, bp@alien

On Mon, 06 Mar 2023 02:04:54 PST (-0800), alexghiti@rivosinc.com wrote:
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/setup.h      | 7 +++++++
>  arch/riscv/include/uapi/asm/setup.h | 2 --
>  2 files changed, 7 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/include/asm/setup.h
>
> diff --git a/arch/riscv/include/asm/setup.h b/arch/riscv/include/asm/setup.h
> new file mode 100644
> index 000000000000..f165a14344e2
> --- /dev/null
> +++ b/arch/riscv/include/asm/setup.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _ASM_RISCV_SETUP_H
> +#define _ASM_RISCV_SETUP_H
> +
> +#define COMMAND_LINE_SIZE       1024
> +
> +#endif /* _ASM_RISCV_SETUP_H */
> diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
> index 66b13a522880..17fcecd4a2f8 100644
> --- a/arch/riscv/include/uapi/asm/setup.h
> +++ b/arch/riscv/include/uapi/asm/setup.h
> @@ -3,6 +3,4 @@
>  #ifndef _UAPI_ASM_RISCV_SETUP_H
>  #define _UAPI_ASM_RISCV_SETUP_H
>
> -#define COMMAND_LINE_SIZE	1024
> -
>  #endif /* _UAPI_ASM_RISCV_SETUP_H */

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!
