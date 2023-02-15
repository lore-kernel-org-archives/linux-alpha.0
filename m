From: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
Date: Wed, 15 Feb 2023 12:59:14 +0000
Message-ID: <Y+zXIgwO5wteLQZ5@shell.armlinux.org.uk>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-4-alexghiti@rivosinc.com>
Mime-Version: 1.0
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=T80Dv/pbeHv4yQbIV1WRGowSCcOuo+FwhGVSDYirNyo=; b=typStl4V61M+0LWV6CYl45n1NF
        m4W0eM90AoKd85qmixDcPpthnLk+b95bwsgFFcBvnssjyLxRNyWUkf38MBdHnC5hJMHQXzrAXfE4u
        sjXI9CnPsT2tyWCtaFGJReOhVBJ7C1Ky0fJf6uDeq4qgqxhR8LjP5C0F4+mFpu0QYM/1ri8+MwHzB
        Qf+rKkAOQgWN+tf3cp48UNgtPLftSBYrStzhBTXcXjZymQMX0JdBeGP5uBPfD69mswliqG6fC1C8X
        g8JyK0lQvJ+nNDGbGSfSRKRlMGVdmWQAdYU5t1SmOnXYVevrwp2QWkhQ7cr4d8xZJhXA4l/PEejz+
Content-Disposition: inline
In-Reply-To: <20230214074925.228106-4-alexghiti@rivosinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@d>

On Tue, Feb 14, 2023 at 08:49:04AM +0100, Alexandre Ghiti wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me. What's the merge plan for this?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
