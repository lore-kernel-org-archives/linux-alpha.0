From: "Will L Givens" <wlgivens@gmail.com>
Subject: RE: Will's kernel compilation error
Date: Tue, 16 Mar 2010 13:38:55 -0500
Message-ID: <004f01cac537$f099e0d0$d1cda270$@com>
References: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com> <001e01cac4cc$98072ce0$c81586a0$@com> <20100316182534.GA818@ds20.borg.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=NxwKPJaxJubd6K70cuXCgUjcInJyxFXjHl6gQhqjTj0=;
        b=JvGjH/YPRrY1D884Mya/wPWhI9JBz5QiLlEXz3E+FaEpN1DIM8pwpLi5Yq+aR/tAJ+
         EQkK92cQLMDrRD4+L7QRo0aOlf2SiQhQ+R6l/a0BdEJu4Y+0LZCciHgNd+qTwA44LmQg
         4umZpkJ0PDLawbH9MmtGP0lFZVfwbLmGksblk=
In-Reply-To: <20100316182534.GA818@ds20.borg.net>
Content-Language: en-us
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dl8bcu@dl8bcu.de
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

> 
> when I hit the relocation overflow a couple of releases before, I
> locally
> applied this patch, which fixes it for me. I assume the kernel is
> slightly
> bigger this way, but I didn't measure it.
> 
> ev6, everything built in, gcc 4.4 I think
> 
> Thorsten
> 
> 
> diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
> index 4759fe7..2cc3cc5 100644
> --- a/arch/alpha/Makefile
> +++ b/arch/alpha/Makefile
> @@ -12,7 +12,7 @@ NM := $(NM) -B
> 
>  LDFLAGS_vmlinux	:= -static -N #-relax
>  CHECKFLAGS	+= -D__alpha__ -m64
> -cflags-y	:= -pipe -mno-fp-regs -ffixed-8 -msmall-data
> +cflags-y	:= -pipe -mno-fp-regs -ffixed-8
>  cflags-y	+= $(call cc-option, -fno-jump-tables)
> 
>  cpuflags-$(CONFIG_ALPHA_EV4)		:= -mcpu=ev4

Thanks!!! I'll give that a shot, this is one of the files that I
experimented on but I was setting the linker flags. Didn't think to simply
remove -msmall-data CFLAG!

