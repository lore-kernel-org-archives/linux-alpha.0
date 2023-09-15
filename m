From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
Date: Fri, 15 Sep 2023 13:23:43 +1000
Message-ID: <878r986rwg.fsf@mail.lhotse>
References: <20230914185804.2000497-1-sohil.mehta@intel.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1694748242;
        bh=6XG3B0FzXsmvZoKkkhm5wOJHB7Zd1TpS1JWjBGpTusE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=PKpIyJXfdhJr2Sk2XiFpR9ouUJal5nD2tBGYvkTi+yQRsa9ZIvCgirZ5+6besrqBL
         UlCTRNeIti/3HlXKC5s/hNh/zWDyp0CAj38ooZCtURDec0zV29n1q0vvHWP8LzC/8u
         j+BMCh8sirKL/ZLOdFgRYAJwTicvGuLLCgCMve6s4NNE6G+YTeu3xI1X+6WSPiiUmJ
         53dID1WgSubZVw/xkbEC18yiNd+dsH+sCiTIMfNZ4C0SAAbyPBEWD+PT1gDHirRJ7I
         e1Oe/pJXxiN5V+sroGp3Ed6zutx8sxe3J/0iaG/Wx6C4lA/ghdRZcbu2waY0Piauup
         ceLVj/+K8GSVw==
In-Reply-To: <20230914185804.2000497-1-sohil.mehta@intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sohil Mehta <sohil.mehta@intel.com>, linux-api@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Sohil Mehta <sohil.mehta@intel.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sv

Sohil Mehta <sohil.mehta@intel.com> writes:
> commit c35559f94ebc ("x86/shstk: Introduce map_shadow_stack syscall")
> recently added support for map_shadow_stack() but it is limited to x86
> only for now. There is a possibility that other architectures (namely,
> arm64 and RISC-V), that are implementing equivalent support for shadow
> stacks, might need to add support for it.
>
> Independent of that, reserving arch-specific syscall numbers in the
> syscall tables of all architectures is good practice and would help
> avoid future conflicts. map_shadow_stack() is marked as a conditional
> syscall in sys_ni.c. Adding it to the syscall tables of other
> architectures is harmless and would return ENOSYS when exercised.
>
> Note, map_shadow_stack() was assigned #453 during the merge process
> since #452 was taken by fchmodat2().
>
> For Powerpc, map it to sys_ni_syscall() as is the norm for Powerpc
> syscall tables.

Mapping it to sys_map_shadow_stack() would work fine, but I'm happy with
sys_ni_syscall as I don't see powerpc implementing map_shadow_stack()
any time soon.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
