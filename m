From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: remove the ->mapping_error method from dma_map_ops V3
Date: Fri, 30 Nov 2018 11:43:18 -0800
Message-ID: <CAHk-=wia7wykuDu-mzbhF+rL1M9FnJfnoidsvkz5TPMPHUep7g@mail.gmail.com>
References: <20181130132231.16512-1-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0fFziNXyQiaQ1gvrUPztS5FG34FXTL1N9RRdX0cNN0I=;
        b=PYYzwo0tMsYcbfvIwf5RJHUWXOgcVNaoJMWTqvQHUXo6niteO0eX+YGc9YbavQQZ4o
         A3xhEHVVs3h8icNVlNAfkkD18bgt6X8F/+ZxJmD6Dohzfq+w2vLdqOs3NbA9JWYuqqhV
         ggiiYzO4IlKiR7LYTtwCRapGsYtr1FAz+wjs4=
In-Reply-To: <20181130132231.16512-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux-foundation.org, jdmason@kudzu.us, joro@8bytes.org, David Woodhouse <dwmw2@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, robin.murphy@arm.com, the arch/x86 maintainers <x86@kernel.org>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>

On Fri, Nov 30, 2018 at 5:23 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Error reporting for the dma_map_single and dma_map_page operations is
> currently a mess. [..]

I don't see anything objectionable there, but it's not like I checked
any of the context of the patches. For all I know there are odd corner
cases where some zero vs DMA_MAPPING_ERROR confusion lurks, but I
guess we'll find out..

So you can add my acked-by, fwiw.

                Linus
