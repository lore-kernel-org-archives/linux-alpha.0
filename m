From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH] pci: Add and use PCI_GENERIC_SETUP Kconfig entry
Date: Sat, 24 Jun 2017 08:08:43 -0700
Message-ID: <60bd9a54-0220-5d52-8843-ea3a654020a6@twiddle.net>
References: <20170623220104.GE31455@jhogan-linux.le.imgtec.org>
 <20170623220857.28774-1-palmer@dabbelt.com>
 <20170623220857.28774-2-palmer@dabbelt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=16E7wkPxU7ZP5kdFTxJFcC88q0K4sDxq6OIOk+zXe6w=;
        b=EHtY9aBXF7Z0sLX6FYXbOw0aEl2lSx+g7SpgaurTuAM+I0UmwTyI/CwB/YovI30sox
         6JCO0lpkLCaX+M/BKgL8kD0z4An7cBFZrAW3O/D1nX/FiGZ1WTUC6TjXzIM1CeZ1/WPj
         CxfMmX41qNGDv/XnZ5VavHxiG9KOx4p1BQWnfPN1lepaqrgHnFE4OaNxImYy4yjJ2faM
         yIR9cAweSnEzA6muYfZ+pIveBVIuo5Lx81WE49Qmp7173cNLMZxBOEO2pIQQSoUbN9yn
         1Bw8QMxWdso92f7HqiDlWOOUaNyVdhYn6EE25lQWBkI05fWTp+io/vn7EkygsT6Yr9Dg
         iYuw==
In-Reply-To: <20170623220857.28774-2-palmer@dabbelt.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Palmer Dabbelt <palmer@dabbelt.com>, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, geert@linux-m68k.org, ralf@linux-mips.org, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, cmetcalf@mellanox.com, gxt@mprc.pku.edu.cn, bhelgaas@google.com, viro@zeniv.linux.org.uk, akpm@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-m68k@vger.kernel.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, hch@infradead.org

On 06/23/2017 03:08 PM, Palmer Dabbelt wrote:
> We wanted to add RISC-V to the list of architectures that used the
> generic PCI setup-irq.o inside the Makefile and it was suggested that
> instead we define a Kconfig entry and use that.
> 
> I've done very minimal testing on this: I just checked to see that
> an aarch64 defconfig still build setup-irq.o with the patch applied.
> The intention is that this patch doesn't change the behavior of any
> build.
> 
> Signed-off-by: Palmer Dabbelt<palmer@dabbelt.com>
> Reviewed-by: James Hogan<james.hogan@imgtec.com>
> ---
>   arch/alpha/Kconfig     |  1 +

Acked-by: Richard Henderson <rth@twiddle.net>


r~
