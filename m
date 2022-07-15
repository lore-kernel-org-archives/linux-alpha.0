From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [RFC PATCH 1/2] asm-generic: Remove pci.h copying code out to architectures
Date: Thu, 14 Jul 2022 18:45:27 -0700
Message-ID: <CAMo8BfKkGRHiFq1vu1ZKkURkUqC+Ee7D42yuKrCeDF+578s9cw@mail.gmail.com>
References: <20220714214657.2402250-1-shorne@gmail.com> <20220714214657.2402250-2-shorne@gmail.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sKJrgib6NlReGRP7CDPUE/smLyqBXa9C7wMlxNQsBTA=;
        b=qReu0qeW9uesDP35O40Ak1r8idK4O9CgbEfPz8c7sbqOOC4g19rgOwc7Y7Nf0cMJve
         VHwud/zZzm5annCADY978tvLQA29IgL5uKARrzb7nA7Kp/u9ohAHU/Uoc3laFfeyFv82
         3NvE6Fr+IPR9MFSUs+KYaXTLE4npBFJ2Vcj4F42Mz6qv3HaC4MCx+ag8MrpcmkWW+LoD
         A8pexKC8qY5puSe0QuRx1/diSs17MAvOjpvCEI7jRLHU+cirQYK6oQpe7bjOxKMCXwV4
         h3T37BG2LAfhfJKirkYm4c6biwPu6itaR0LZe1EIroqmoe0m+x1vrKsTKeSrtgYQAI2e
         A1DQ==
In-Reply-To: <20220714214657.2402250-2-shorne@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, maintainer:X86 ARCH

On Thu, Jul 14, 2022 at 2:47 PM Stafford Horne <shorne@gmail.com> wrote:
>
> The generic pci.h header provides a definition of pci_get_legacy_ide_irq
> which is used by architectures that use PC-style interrupt numbers.
>
> This patch removes the old pci.h in order to make room for a new
> pci.h to be used by arm64, riscv, openrisc, etc.
>
> The existing code in pci.h is moved out to architectures.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>  arch/alpha/include/asm/pci.h   |  1 -
>  arch/ia64/include/asm/pci.h    |  1 -
>  arch/m68k/include/asm/pci.h    |  7 +++++--
>  arch/powerpc/include/asm/pci.h |  1 -
>  arch/s390/include/asm/pci.h    |  6 +++++-
>  arch/sparc/include/asm/pci.h   |  5 ++++-
>  arch/x86/include/asm/pci.h     |  6 ++++--
>  arch/xtensa/include/asm/pci.h  |  6 ++++--
>  include/asm-generic/pci.h      | 17 -----------------
>  9 files changed, 22 insertions(+), 28 deletions(-)
>  delete mode 100644 include/asm-generic/pci.h

[...]

> diff --git a/arch/xtensa/include/asm/pci.h b/arch/xtensa/include/asm/pci.h
> index 8e2b48a268db..f57ede61f5db 100644
> --- a/arch/xtensa/include/asm/pci.h
> +++ b/arch/xtensa/include/asm/pci.h
> @@ -43,7 +43,9 @@
>  #define ARCH_GENERIC_PCI_MMAP_RESOURCE 1
>  #define arch_can_pci_mmap_io()         1
>
> -/* Generic PCI */
> -#include <asm-generic/pci.h>

Ok.

> +static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> +{
> +       return channel ? 15 : 14;
> +}

This addition does not make sense for the xtensa as it isn't even possible
to enable PNP support (the only user of this function) on xtensa.

-- 
Thanks.
-- Max
