From: Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 04/21] memblock: drop memblock_alloc_base_nid()
Date: Wed, 16 Jan 2019 15:44:04 +0200
Message-ID: <1547646261-32535-5-git-send-email-rppt@linux.ibm.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	References:In-Reply-To:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lpJ1+LNbzcFQQUtfEL4G/TXk8OqLcBXPOCLBeBAAmC0=; b=S0Kw8+VQz1/llDIU2RkuKFvL+A
	1rX1Zsd/HhAYNeei5OrzKEHAdWNMcPl17G6y3wz2z2KUTSSehWnHaUSj91Ryd9ep9j4NL7BX3sQvK
	9pv3oxE8o5sR0Cm5PFp8LDqDSwPta18ChhloEBhxuQsU0DAutUTCApG+5GyRggRlEj/OnH+2I6ZIQ
	7Lv+EXhBAXroP2TUMLR5vPu1k2cljZpwl1mTnvraluuLfe86XNPJuFb1oaA3USIcTJEZuBbcST52k
	un0TvmrMjrO3lc6LAALriB1gGlFG+wv8HCvo2zuNvZypBj+TUteE8LzK2g8ZMlKBh2pyVNYGFXJeV
	A3P3WUFw==;
In-Reply-To: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: linux-mm@kvack.org
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xten

The memblock_alloc_base_nid() is a oneliner wrapper for
memblock_alloc_range_nid() without any side effect.
Replace it's usage by the direct calls to memblock_alloc_range_nid().

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 include/linux/memblock.h |  3 ---
 mm/memblock.c            | 15 ++++-----------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 60e100f..f7ef313 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -490,9 +490,6 @@ static inline bool memblock_bottom_up(void)
 phys_addr_t __init memblock_alloc_range(phys_addr_t size, phys_addr_t align,
 					phys_addr_t start, phys_addr_t end,
 					enum memblock_flags flags);
-phys_addr_t memblock_alloc_base_nid(phys_addr_t size,
-					phys_addr_t align, phys_addr_t max_addr,
-					int nid, enum memblock_flags flags);
 phys_addr_t memblock_alloc_base(phys_addr_t size, phys_addr_t align,
 				phys_addr_t max_addr);
 phys_addr_t __memblock_alloc_base(phys_addr_t size, phys_addr_t align,
diff --git a/mm/memblock.c b/mm/memblock.c
index a32db30..c80029e 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1346,21 +1346,14 @@ phys_addr_t __init memblock_alloc_range(phys_addr_t size, phys_addr_t align,
 					flags);
 }
 
-phys_addr_t __init memblock_alloc_base_nid(phys_addr_t size,
-					phys_addr_t align, phys_addr_t max_addr,
-					int nid, enum memblock_flags flags)
-{
-	return memblock_alloc_range_nid(size, align, 0, max_addr, nid, flags);
-}
-
 phys_addr_t __init memblock_phys_alloc_nid(phys_addr_t size, phys_addr_t align, int nid)
 {
 	enum memblock_flags flags = choose_memblock_flags();
 	phys_addr_t ret;
 
 again:
-	ret = memblock_alloc_base_nid(size, align, MEMBLOCK_ALLOC_ACCESSIBLE,
-				      nid, flags);
+	ret = memblock_alloc_range_nid(size, align, 0,
+				       MEMBLOCK_ALLOC_ACCESSIBLE, nid, flags);
 
 	if (!ret && (flags & MEMBLOCK_MIRROR)) {
 		flags &= ~MEMBLOCK_MIRROR;
@@ -1371,8 +1364,8 @@ phys_addr_t __init memblock_phys_alloc_nid(phys_addr_t size, phys_addr_t align,
 
 phys_addr_t __init __memblock_alloc_base(phys_addr_t size, phys_addr_t align, phys_addr_t max_addr)
 {
-	return memblock_alloc_base_nid(size, align, max_addr, NUMA_NO_NODE,
-				       MEMBLOCK_NONE);
+	return memblock_alloc_range_nid(size, align, 0, max_addr, NUMA_NO_NODE,
+					MEMBLOCK_NONE);
 }
 
 phys_addr_t __init memblock_alloc_base(phys_addr_t size, phys_addr_t align, phys_addr_t max_addr)
-- 
2.7.4
