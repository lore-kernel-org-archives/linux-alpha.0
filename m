From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v3 10/24] sparc: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 11:50:23 +0300
Message-ID: <017f0b40-8021-8b3b-24d2-c70661b6b292__31972.5062859774$1676364663$gmane$org@omp.ru>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-11-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20230214074925.228106-11-alexghiti@rivosinc.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

On 2/14/23 10:49 AM, Alexandre Ghiti wrote:

> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/sparc/include/asm/setup.h      | 6 +++++-
>  arch/sparc/include/uapi/asm/setup.h | 7 -------
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/setup.h b/arch/sparc/include/asm/setup.h
> index 72205684e51e..d1384ed92547 100644
> --- a/arch/sparc/include/asm/setup.h
> +++ b/arch/sparc/include/asm/setup.h
> @@ -7,7 +7,11 @@
>  
>  #include <linux/interrupt.h>
>  
> -#include <uapi/asm/setup.h>
> +#if defined(__sparc__) && defined(__arch64__)

   Mhm, I don't think these two can be #define'd simulaneously...

> +# define COMMAND_LINE_SIZE 2048
> +#else
> +# define COMMAND_LINE_SIZE 256
> +#endif
>  
>  extern char reboot_command[];
>  
> diff --git a/arch/sparc/include/uapi/asm/setup.h b/arch/sparc/include/uapi/asm/setup.h
> index 3c208a4dd464..c3cf1b0d30b3 100644
> --- a/arch/sparc/include/uapi/asm/setup.h
> +++ b/arch/sparc/include/uapi/asm/setup.h
> @@ -6,11 +6,4 @@
>  #ifndef _UAPI_SPARC_SETUP_H
>  #define _UAPI_SPARC_SETUP_H
>  
> -#if defined(__sparc__) && defined(__arch64__)
> -# define COMMAND_LINE_SIZE 2048
> -#else
> -# define COMMAND_LINE_SIZE 256
> -#endif
> -
> -
>  #endif /* _UAPI_SPARC_SETUP_H */

MBR, Sergey
