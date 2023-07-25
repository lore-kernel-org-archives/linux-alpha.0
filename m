From: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH v2] syscalls: Cleanup references to sys_lookup_dcookie()
Date: Tue, 25 Jul 2023 14:53:30 +0100
Message-ID: <ZL/T2nKuQMpmYmdT@shell.armlinux.org.uk>
References: <20230628230935.1196180-1-sohil.mehta@intel.com>
 <20230710185124.3848462-1-sohil.mehta@intel.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kUarT7SqOQZrBPiZOzWe23N1GMcQyN5+VXjtUtV2R/o=; b=j7Op8Vnl+TeUjCVjxxLMl9FHBt
        WKJxykg7g16NKswDExs4jzNi8JWW6mpiTguyj1SPnEcQjfWgdy2MUZ2bQ+j4bGZtswkN3xtxSKae/
        6lMSlisjrFOxcc3OsbI+6afW+irogze5rV2uX9xHH+7y6n+SGl1OFu9FrKMecFfuJff8q3F59fLTL
        CjQ6PI2It3ik66VJaFO6n5D9+ajE1/a9OiGpIHPg3yCNrepTv6STJpnBSD2MINup6sFgTP3Uh4wux
        sbDi8Okf9PZRr42KbxLiRbikZNMDd+6DMq2bYuGaqKOSDN1vr6G6bnreE5cg+299OLCxWxIvo2Eqi
Content-Disposition: inline
In-Reply-To: <20230710185124.3848462-1-sohil.mehta@intel.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Chr

On Mon, Jul 10, 2023 at 06:51:24PM +0000, Sohil Mehta wrote:
> diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
> index 8ebed8a13874..cb7ea3bf18cf 100644
> --- a/arch/arm/tools/syscall.tbl
> +++ b/arch/arm/tools/syscall.tbl
> @@ -263,7 +263,7 @@
>  246	common	io_submit		sys_io_submit
>  247	common	io_cancel		sys_io_cancel
>  248	common	exit_group		sys_exit_group
> -249	common	lookup_dcookie		sys_lookup_dcookie
> +249	common	lookup_dcookie		sys_ni_syscall

Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
