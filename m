From: "Yin, Fengwei" <fengwei.yin@intel.com>
Subject: Re: API for setting multiple PTEs at once
Date: Wed, 8 Feb 2023 20:09:00 +0800
Message-ID: <b44d5dc7-ee7a-80e0-5401-829bf5740de5@intel.com>
References: <Y9wnr8SGfGGbi/bk@casper.infradead.org>
 <Y+K0O35jNNzxiXE6@casper.infradead.org>
 <ba99ed28-61e4-4acd-ce17-338f5a49ef26@ghiti.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675858167; x=1707394167;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=is0pnbUlCSwNC13hHLUzg+YQtH+19+Etby7SBYvbZhw=;
  b=NQVU7u0R1lOu/u1ATOCoCWIPXgxsfBiQfhFWmXTVq0NQ3rnw5i2yjJZU
   vUGDP/YltIVrrJIZHl+owyPEgTwFXqxpB0QbD3+QnNiX2Yy7z+WkPCY44
   UrSklNPoX6ZyQARcTw7YzYcdb0NHZpRYzz1n+VJBW1hXNxJJRelzRZFBE
   AmRgfPhdUGox1mLPJb0x9VamiKEDPYi+xlQSvnp4//Pe3BKmDNDjacNt3
   jqJGxkvnB2H+xEIlt0U7igbnT/maKPQKYNsz9HR7U8E+s5QYCQcSWKnHD
   sT0/2Es6QTBxpmWbV8hIOfSTxMIrv8i5t12dfgs5jnmDl3rBkIHvZUWfY
   g==;
Content-Language: en-US
In-Reply-To: <ba99ed28-61e4-4acd-ce17-338f5a49ef26@ghiti.fr>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alexandre Ghiti <alex@ghiti.fr>, Matthew Wilcox <willy@infradead.org>, linux-arch@vger.kernel.org
Cc: linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org



On 2/8/2023 7:23 PM, Alexandre Ghiti wrote:
> Hi Matthew,
> 
> On 2/7/23 21:27, Matthew Wilcox wrote:
>> On Thu, Feb 02, 2023 at 09:14:23PM +0000, Matthew Wilcox wrote:
>>> For those of you not subscribed, linux-mm is currently discussing
>>> how best to handle page faults on large folios.  I simply made it work
>>> when adding large folio support.  Now Yin Fengwei is working on
>>> making it fast.
>> OK, here's an actual implementation:
>>
>> https://lore.kernel.org/linux-mm/20230207194937.122543-3-willy@infradead.org/
>>
>> It survives a run of xfstests.  If your architecture doesn't store its
>> PFNs at PAGE_SHIFT, you're going to want to implement your own set_ptes(),
> 
> 
> riscv stores its pfn at PAGE_PFN_SHIFT instead of PAGE_SHIFT, se we need to reimplement set_ptes. But I have been playing with your patchset and we never fall into the case where set_ptes is called with nr > 1, any idea why? I booted a large ubuntu defconfig and launched will_it_scale.page_fault4.
Need to use xfs filesystem to get large folio for file mapping.
Other filesystem may be also OK. But I just tried xfs. Thanks.


Regards
Yin, Fengwei

> 
> I'll come up with the proper implementation of set_ptes anyway soon.
> 
> Thanks,
> 
> Alex
> 
> 
>> or you'll see entirely the wrong pages mapped into userspace.  You may
>> also wish to implement set_ptes() if it can be done more efficiently
>> than __pte(pteval(pte) + PAGE_SIZE).
>>
>> Architectures that implement things like flush_icache_page() and
>> update_mmu_cache() may want to propose batched versions of those.
>> That's alpha, csky, m68k, mips, nios2, parisc, sh,
>> arm, loongarch, openrisc, powerpc, riscv, sparc and xtensa.
>> Maintainers BCC'd, mailing lists CC'd.
>>
>> I'm happy to collect implementations and submit them as part of a v6.
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
