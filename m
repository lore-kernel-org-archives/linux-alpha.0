From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] dma-mapping: introduce dma_get_seg_boundary_nr_pages()
Date: Thu, 3 Sep 2020 13:57:39 +0300
Message-ID: <CAHp75VcVJBSnPQ6NfdF8FdEDfM+oQ=Sr+cH5VGX4SrAqrgpf-g@mail.gmail.com>
References: <20200901221646.26491-1-nicoleotsuka@gmail.com>
 <20200901221646.26491-2-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XvxPmxtC0Bk31a11OwZrMge+dU3uUM43arNhidKdfeY=;
 b=q1yCvbZ8w01P8xuPxnIcZnEF3Hr07ImVQMcXxZgqnSncr+zba54pN3npDYYOjJXhbm
 XIqjp77VnYo3sJUa9nsc/OkcPZ2a5Y90boSJn50VaZ74haoOIwzEqzuApddDmuRsWA4t
 5LlNWMh47eFOI/t/pn9hyEBoN/9bMzFwyvwPxAFUkJ5XUIrhRgszLM/M8If1a/RC8WmZ
 6qZ5sWP8uitmybmf3cwkB0qwBCXj3OoX/HrhU+S1S1dHFyplWZAkXiQoi27iG3iQmbnm
 EQGK1zrcCUMrp+7WqPhSebA3XqqW6nM8d6/yeJZq7qMNXZRfKdpHSJtV5y0ESKKzTh/Z
 pJhA==
In-Reply-To: <20200901221646.26491-2-nicoleotsuka@gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-ia64@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Helge Deller <deller@gmx.de>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, Vasily Gorbik <gor@linux.ibm.com>, schnelle@linux.ibm.com, hca@linux.ibm.com, ink@jurassic.park.msu.ru, Thomas Gleixner <tglx@linutronix.de>, gerald.schaefer@linux.ibm.com, rth@twiddle.net, Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org, Borislav

On Wed, Sep 2, 2020 at 1:20 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> We found that callers of dma_get_seg_boundary mostly do an ALIGN
> with page mask and then do a page shift to get number of pages:
>     ALIGN(boundary + 1, 1 << shift) >> shift
>
> However, the boundary might be as large as ULONG_MAX, which means
> that a device has no specific boundary limit. So either "+ 1" or
> passing it to ALIGN() would potentially overflow.
>
> According to kernel defines:
>     #define ALIGN_MASK(x, mask) (((x) + (mask)) & ~(mask))
>     #define ALIGN(x, a) ALIGN_MASK(x, (typeof(x))(a) - 1)
>
> We can simplify the logic here into a helper function doing:
>   ALIGN(boundary + 1, 1 << shift) >> shift
> = ALIGN_MASK(b + 1, (1 << s) - 1) >> s
> = {[b + 1 + (1 << s) - 1] & ~[(1 << s) - 1]} >> s
> = [b + 1 + (1 << s) - 1] >> s
> = [b + (1 << s)] >> s
> = (b >> s) + 1
>
> This patch introduces and applies dma_get_seg_boundary_nr_pages()
> as an overflow-free helper for the dma_get_seg_boundary() callers
> to get numbers of pages. It also takes care of the NULL dev case
> for non-DMA API callers.

...

> +static inline unsigned long dma_get_seg_boundary_nr_pages(struct device *dev,
> +               unsigned int page_shift)
> +{
> +       if (!dev)
> +               return (U32_MAX >> page_shift) + 1;
> +       return (dma_get_seg_boundary(dev) >> page_shift) + 1;

Can it be better to do something like
  unsigned long boundary = dev ? dma_get_seg_boundary(dev) : U32_MAX;

  return (boundary >> page_shift) + 1;

?

> +}

-- 
With Best Regards,
Andy Shevchenko
