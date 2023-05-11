From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
Date: Thu, 11 May 2023 13:23:12 +1000
Message-ID: <874joja6vz.fsf@mail.lhotse>
References: <20230510195806.2902878-1-nphamcs@gmail.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1683775400;
        bh=segvorBuGekPc5jSCLXtWJe7pAKDaM/2mPQxUa2lvTw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mpN6WZbs8ze5YaIng5ERyTBY3chApO1uFrN1U1lTsRVA9HI18/rgyaG/eZmexoGi4
         xyNRjwovMhVVlZljbfexsALAQ/VC7SXFkLQXhGs4Bb0CKdQ9ZE7uWK8mAGQpR/wXnj
         Wj/Kq9bEbYeNfiJORTh/qbHavius2OrvxO8nKOQelnsk3QR4A3TJ4hsLhIW2fK+19D
         90D5YoD3X1p3CFTX+0ixP4wpazzRWLy7HTHBpgR9OBJW3WUEJ01CMuFyOW/rNQ/1o1
         jq40YmakA31zDnqwNmvC6KPPEIJRM2z/UjkLs2qgYubScN3CGu05cVDjwVg/DFcNT6
         LL1PDlPViTPUQ==
In-Reply-To: <20230510195806.2902878-1-nphamcs@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-api@vger.kernel.org, kernel-team@meta.com, linux-arch@vger.kernel.org, hannes@cmpxchg.org, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux@armlinux.org.uk, geert@linux-m68k.org, monstr@monstr.eu, tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com, deller@gmx.de, npiggin@gmail.com, christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, chris@zankel.net, jcmvbkbc@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org

Nhat Pham <nphamcs@gmail.com> writes:
> cachestat is previously only wired in for x86 (and architectures using
> the generic unistd.h table):
>
> https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs@gmail.com/
>
> This patch wires cachestat in for all the other architectures.
>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
>  arch/arm/tools/syscall.tbl                  | 1 +
>  arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +
>  arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
>  arch/mips/kernel/syscalls/syscall_n32.tbl   | 1 +
>  arch/mips/kernel/syscalls/syscall_n64.tbl   | 1 +
>  arch/mips/kernel/syscalls/syscall_o32.tbl   | 1 +
>  arch/parisc/kernel/syscalls/syscall.tbl     | 1 +
>  arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +

With the change to the selftest (see my other mail), I tested this on
powerpc and all tests pass.

Tested-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)


cheers
