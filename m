From: Richard Henderson <rth@twiddle.net>
Subject: Re: [RFC] alpha: hack objstrip.c to make it compile.
Date: Tue, 30 Mar 2010 07:28:59 -0700
Message-ID: <4BB20AAB.7000909@twiddle.net>
References: <1269913795-1852-1-git-send-email-mattst88@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1269913795-1852-1-git-send-email-mattst88@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, ang@brigante.org

On 03/29/2010 06:49 PM, Matt Turner wrote:
> I don't think this is the appropriate fix. What should I do to fix this?
> ---
>  arch/alpha/boot/tools/objstrip.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/alpha/boot/tools/objstrip.c b/arch/alpha/boot/tools/objstrip.c
> index 367d53d..54fa1ef 100644
> --- a/arch/alpha/boot/tools/objstrip.c
> +++ b/arch/alpha/boot/tools/objstrip.c
> @@ -27,6 +27,9 @@
>  #include <linux/param.h>
>  #ifdef __ELF__
>  # include <linux/elf.h>
> +# define elfhdr	elf64_hdr
> +# define elf_phdr	elf64_phdr
> +# define elf_check_arch(x) ((x)->e_machine == EM_ALPHA)
>  #endif
>  

Hum.  Is it so bad to just #define __KERNEL__ here before
that one include?  Similar games are played in tools/perf/,
and with a suitible comment I think that should be all right.


r~
