From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] syscalls: Cleanup references to sys_lookup_dcookie()
Date: Wed, 28 Jun 2023 16:43:27 -0700
Message-ID: <08e273fc-49c5-dd09-1c9e-d85a080767f9@infradead.org>
References: <20230628230935.1196180-1-sohil.mehta@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=mkpKticynoUGDZ1Tdpq3P9FZu5kxXQf0JefJvMLgJuA=; b=eVGM60hxW/1oCROBhJRKbbF9pd
        /WHGc+o+pb+fkeVze6GKs3Hcu2mjtmWM/4oUGYCU0t+UbFMtrvvcjHSl/cglLWbeBdgmG30OqcMNt
        S2Pr1+dHNTd4T3qFeiVwQeps/R+LjlmcLTRsuZ8NdhZsmraeYrB2Kel7p0VxJ6+7q7EgMQ6Wx6ank
        P+yHcdGkzLdLPcfc5husZ1HslNubmokchQy4wGscGAVnBMae971Q/C5VLDp5JrfEWC1X5YToHzDHK
        +ikxlG8dV0EOrjRrjMKr08rEq8iFClaMjdpXxuLncvJrq9YBnHim1BxRohfVxP5cT8JFsbmDDx9YM
        9l9IY3yQ==;
Content-Language: en-US
In-Reply-To: <20230628230935.1196180-1-sohil.mehta@intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sohil Mehta <sohil.mehta@intel.com>, Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>



On 6/28/23 16:09, Sohil Mehta wrote:
> commit 'be65de6b03aa ("fs: Remove dcookies support")' removed the
> syscall definition for lookup_dcookie.  However, syscall tables still
> point to the old sys_lookup_dcookie() definition. Update syscall tables
> of all architectures to directly point to sys_ni_syscall() instead.
> 
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> This patch has a dependency on another patch that has been applied to the
> asm-generic tree:
> https://lore.kernel.org/lkml/20230621223600.1348693-1-sohil.mehta@intel.com/
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl              | 2 +-
>  arch/arm/tools/syscall.tbl                          | 2 +-
>  arch/arm64/include/asm/unistd32.h                   | 4 ++--
>  arch/ia64/kernel/syscalls/syscall.tbl               | 2 +-
>  arch/m68k/kernel/syscalls/syscall.tbl               | 2 +-
>  arch/microblaze/kernel/syscalls/syscall.tbl         | 2 +-
>  arch/mips/kernel/syscalls/syscall_n32.tbl           | 2 +-
>  arch/mips/kernel/syscalls/syscall_n64.tbl           | 2 +-
>  arch/mips/kernel/syscalls/syscall_o32.tbl           | 2 +-
>  arch/parisc/kernel/syscalls/syscall.tbl             | 2 +-
>  arch/powerpc/kernel/syscalls/syscall.tbl            | 2 +-
>  arch/s390/kernel/syscalls/syscall.tbl               | 2 +-
>  arch/sh/kernel/syscalls/syscall.tbl                 | 2 +-
>  arch/sparc/kernel/syscalls/syscall.tbl              | 2 +-
>  arch/x86/entry/syscalls/syscall_32.tbl              | 2 +-
>  arch/x86/entry/syscalls/syscall_64.tbl              | 2 +-
>  arch/xtensa/kernel/syscalls/syscall.tbl             | 2 +-
>  include/linux/compat.h                              | 1 -
>  include/linux/syscalls.h                            | 1 -
>  include/uapi/asm-generic/unistd.h                   | 2 +-
>  kernel/sys_ni.c                                     | 2 --
>  tools/include/uapi/asm-generic/unistd.h             | 2 +-
>  tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl | 2 +-
>  tools/perf/arch/powerpc/entry/syscalls/syscall.tbl  | 2 +-
>  tools/perf/arch/s390/entry/syscalls/syscall.tbl     | 2 +-
>  tools/perf/arch/x86/entry/syscalls/syscall_64.tbl   | 2 +-
>  26 files changed, 24 insertions(+), 28 deletions(-)
> 


-- 
~Randy
