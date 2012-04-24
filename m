From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [PATCH] alpha: add io{read,write}{16,32}be functions
Date: Tue, 24 Apr 2012 00:51:23 -0500
Message-ID: <20120424055123.GA7140@burratino>
References: <1322640100-14534-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=RD1DcTSX63GKnE3TZr56fG85jDrBet78L6DioXJY7nE=;
        b=xfPUmeUHL8kblXtXuRLpDPQpF1bAWTD5YCxZQxXhA8Qtr10x8enMRZja27rn+/Kchk
         ApoiP/FPTqxnHKpd7Ba5+EiPQIgYGe3k5E8QqB/bmxvW2xY3vU1IR1NUvWrXfpLY3y4p
         rQerMwGo1vYJsXTR94p8lLVSwcYHO0Ged4sIwlrBmQsKwGDuPa9j1FZ0aaR7d/s/bIVB
         m9qH+FryG0wrul8otEmPG00phJG0q8WOk6jI+5Lzt2fSLKJClPCXr9g+O+C9XhR8Wwg5
         BceJiBfAeqM5P0yRIQHPq1WWhgx6OlWoBuGtSkXEEFlPqczpFVHvtE0/ghn4U2+ZMzYG
         3r4g==
Content-Disposition: inline
In-Reply-To: <1322640100-14534-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Ben Hutchings <ben@decadent.org.uk>, =?utf-8?B?UmHDumw=?= Porcel <armin76@gentoo.org>

Hi Matt et al,

Michael Cree wrote:

> These functions are used in some PCI drivers with big-endian
> MMIO space.
>
> Admittedly it is almost certain that no one this side of the
> Moon would use such a card in an Alpha but it does get us
> closer to being able to build allyesconfig or allmodconfig,
[...]
> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -490,6 +490,11 @@ extern inline void writeq(u64 b, volatile void __iomem *addr)
>  }
>  #endif
>  
> +#define ioread16be(p) be16_to_cpu(ioread16(p))
> +#define ioread32be(p) be32_to_cpu(ioread32(p))
> +#define iowrite16be(v,p) iowrite16(cpu_to_be16(v), (p))
> +#define iowrite32be(v,p) iowrite32(cpu_to_be32(v), (p))
> +
>  #define inb_p		inb

This patch has been in use in Debian's development branch since
January.  Does it look sensible to you?  (If so, I'd like to see it in
mainline eventually so we can more easily share bugfixes depending on
it in the future.)

Thanks,
Jonathan
