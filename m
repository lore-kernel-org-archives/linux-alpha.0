From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 2/3] word-at-a-time.h: support zero_bytemask() on
 alpha and tile
Date: Wed, 7 Oct 2015 07:53:20 +0200
Message-ID: <20151007055320.GA27737@gmail.com>
References: <1444159429-4788-1-git-send-email-cmetcalf@ezchip.com>
 <1444159429-4788-3-git-send-email-cmetcalf@ezchip.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=pzmawmV/LmL2klt6lx4XY6XmxPH/VKR/l5YCKizGKtI=;
        b=QoUfNZ0s8pW/TvBdgaUxKsf4c2Pphn23JAoxVgFlBF0goM3C/SUlfmcKhOfq2XvLYC
         2yH1kjQj6enQ3YxxX2DzDUG1CreJ0V55HS5D6wxlh8J9VNlcA/PK/n/ToQ+WJMrliVZf
         eVb4MmfNRt2YJr84f22Iyl5aufilKuSE6wRfreHG/+wLULGC0ALD6SROrpnFz7DlKOl2
         0AgbUgNUwdaMQEO2zXThTzo6ZqTQ4Jaq7GyUg4ifooRg2pQ9nCoEp9Ga9LKMSxqu6RDh
         eY/nBdlvq8Ge4lD9JVa/BHdmUkN+LbNHipktc18BuycMY0rW2DCOysEIvKZ1Vp1tEmY9
         K91w==
Content-Disposition: inline
In-Reply-To: <1444159429-4788-3-git-send-email-cmetcalf@ezchip.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Metcalf <cmetcalf@ezchip.com>
Cc: Michael Cree <mcree@orcon.net.nz>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Alexey Dobriyan <adobriyan@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


* Chris Metcalf <cmetcalf@ezchip.com> wrote:

> Both alpha and tile needed implementations of zero_bytemask.
> 
> The alpha version is untested.
> 
> Signed-off-by: Chris Metcalf <cmetcalf@ezchip.com>
> ---
>  arch/alpha/include/asm/word-at-a-time.h | 2 ++
>  arch/tile/include/asm/word-at-a-time.h  | 8 +++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/alpha/include/asm/word-at-a-time.h b/arch/alpha/include/asm/word-at-a-time.h
> index 6b340d0f1521..902e6ab00a06 100644
> --- a/arch/alpha/include/asm/word-at-a-time.h
> +++ b/arch/alpha/include/asm/word-at-a-time.h
> @@ -52,4 +52,6 @@ static inline unsigned long find_zero(unsigned long bits)
>  #endif
>  }
>  
> +#define zero_bytemask(mask) ((2ul << (find_zero(mask) * 8)) - 1)

Small nit: please use a proper C inline function instead of CPP, as for example 
the PowerPC zero_bytemask() function is.

> -/* Generate 0x01 byte values for non-zero bytes using a SIMD instruction. */
> +/* Generate 0x01 byte values for zero bytes using a SIMD instruction. */
>  static inline unsigned long has_zero(unsigned long val, unsigned long *data,
>  				     const struct word_at_a_time *c)
>  {
> @@ -33,4 +33,10 @@ static inline long find_zero(unsigned long mask)
>  #endif
>  }
>  
> +#ifdef __BIG_ENDIAN
> +#define zero_bytemask(mask) (~1ul << (63 - __builtin_clzl(mask)))
> +#else
> +#define zero_bytemask(mask) ((2ul << __builtin_ctzl(mask)) - 1)
> +#endif

Ditto.

Other than that, for the whole series:

  Reviewed-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
