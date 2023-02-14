From: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: API for setting multiple PTEs at once
Date: Tue, 14 Feb 2023 10:55:43 +0100
Message-ID: <0bf59207-838b-2a0b-a95e-925a6bbf1913@ghiti.fr>
References: <Y9wnr8SGfGGbi/bk@casper.infradead.org>
 <Y+K0O35jNNzxiXE6@casper.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Language: en-US
In-Reply-To: <Y+K0O35jNNzxiXE6@casper.infradead.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Matthew Wilcox <willy@infradead.org>, linux-arch@vger.kernel.org
Cc: linux-xtensa@linux-xtensa.org, linux-parisc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, Yin Fengwei <fengwei.yin@intel.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

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


Please find below the riscv implementation for set_ptes:

diff --git a/arch/riscv/include/asm/pgtable.h 
b/arch/riscv/include/asm/pgtable.h
index ebee56d47003..10bf812776a4 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -463,6 +463,20 @@ static inline void set_pte_at(struct mm_struct *mm,
         __set_pte_at(mm, addr, ptep, pteval);
  }

+#define set_ptes set_ptes
+static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
+                           pte_t *ptep, pte_t pte, unsigned int nr)
+{
+       for (;;) {
+               set_pte_at(mm, addr, ptep, pte);
+               if (--nr == 0)
+                       break;
+               ptep++;
+               addr += PAGE_SIZE;
+               pte = __pte(pte_val(pte) + (1 << _PAGE_PFN_SHIFT));
+       }
+}
+
  static inline void pte_clear(struct mm_struct *mm,
         unsigned long addr, pte_t *ptep)
  {


Thanks,

Alex

