From: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: API for setting multiple PTEs at once
Date: Wed, 8 Feb 2023 12:23:09 +0100
Message-ID: <ba99ed28-61e4-4acd-ce17-338f5a49ef26@ghiti.fr>
References: <Y9wnr8SGfGGbi/bk@casper.infradead.org>
 <Y+K0O35jNNzxiXE6@casper.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/Y7caiyDS6p3d5UTzjMxC6Ce1pVLO3JWXPSb7CVvck=; b=nprME3Obas2i5E
	+NWZV1rEDq5DgiLnlj2HeZUx0Fht5i8zB8lbZgmCml/H0G+Yphf2SLIRtBwciVuiHJU1QYn/Hj9Qc
	mm/CKaQjqqdyzr7UW+lEnOlXZMxdr6zmWHxUkS8Nev5kxyG2odc5a9U7vl91qF3reeYJsjwloDWA/
	WvL5TVZIE2UGhZ6hSrT78CnjsdhsB00ha10xEZO5Tt8chVYSF25dD2koLrLtffIqqv9xaXb/qH825
	uLXLA7w4cXtvuv7TcBig3vUq3yOCyfjwJd3egQ8WMTTplYYfMtzev97P8Aykt/dwoXeg60q1XGiTO
	QtzPJk5lRhvNRrzLHirQ==;
Content-Language: en-US
In-Reply-To: <Y+K0O35jNNzxiXE6@casper.infradead.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthew Wilcox <willy@infradead.org>, linux-arch@vger.kernel.org
Cc: Yin Fengwei <fengwei.yin@intel.com>, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org

Hi Matthew,

On 2/7/23 21:27, Matthew Wilcox wrote:
> On Thu, Feb 02, 2023 at 09:14:23PM +0000, Matthew Wilcox wrote:
>> For those of you not subscribed, linux-mm is currently discussing
>> how best to handle page faults on large folios.  I simply made it work
>> when adding large folio support.  Now Yin Fengwei is working on
>> making it fast.
> OK, here's an actual implementation:
>
> https://lore.kernel.org/linux-mm/20230207194937.122543-3-willy@infradead.org/
>
> It survives a run of xfstests.  If your architecture doesn't store its
> PFNs at PAGE_SHIFT, you're going to want to implement your own set_ptes(),


riscv stores its pfn at PAGE_PFN_SHIFT instead of PAGE_SHIFT, se we need 
to reimplement set_ptes. But I have been playing with your patchset and 
we never fall into the case where set_ptes is called with nr > 1, any 
idea why? I booted a large ubuntu defconfig and launched 
will_it_scale.page_fault4.

I'll come up with the proper implementation of set_ptes anyway soon.

Thanks,

Alex


> or you'll see entirely the wrong pages mapped into userspace.  You may
> also wish to implement set_ptes() if it can be done more efficiently
> than __pte(pteval(pte) + PAGE_SIZE).
>
> Architectures that implement things like flush_icache_page() and
> update_mmu_cache() may want to propose batched versions of those.
> That's alpha, csky, m68k, mips, nios2, parisc, sh,
> arm, loongarch, openrisc, powerpc, riscv, sparc and xtensa.
> Maintainers BCC'd, mailing lists CC'd.
>
> I'm happy to collect implementations and submit them as part of a v6.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
