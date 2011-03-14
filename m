From: Prasad Joshi <prasadjoshi124@gmail.com>
Subject: [RFC][PATCH v2 00/23] (alpha) __vmalloc: add gfp flags variant of pte
 and pmd allocation
Date: Mon, 14 Mar 2011 17:27:10 +0000
Message-ID: <AANLkTik3qn-RVUTZp5+gTk+wB9SO_MsxySHEwE8Yzi-e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=LbJYFQbFwAnK25TqITV+1O3xw8AQUYp+CdXREdgfrsI=;
        b=GI96LfStlWAazOG6LTz1NMw+7Nr32GVuk9WK1xdidjPCrJkGA5ulUqI/N2wQzJj5n4
         8XSLUVv2lHz74UcH/bhWPSYEMEXPcK82yHAhuuhnuGBhyz1CkuA9lwSf7zFgFzloH8kx
         NkvcDWSt/ljN4llVeMrPGcxe1gURKkwbiByS0=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.k

__vmalloc: propagating GFP allocation flag.

- adds functions to allow caller to pass the GFP flag for memory allocation
- helps in fixing the Bug 30702 (__vmalloc(GFP_NOFS) can callback
  file system evict_inode).

Signed-off-by: Anand Mitra <mitra@kqinfotech.com>
Signed-off-by: Prasad Joshi <prasadjoshi124@gmail.com>
---
Chnagelog:
arch/alpha/include/asm/pgalloc.h |   18 ++++++++++++++----
1 files changed, 14 insertions(+), 4 deletions(-)
---
diff --git a/arch/alpha/include/asm/pgalloc.h b/arch/alpha/include/asm/pgalloc.h
index bc2a0da..d05dfc2 100644
--- a/arch/alpha/include/asm/pgalloc.h
+++ b/arch/alpha/include/asm/pgalloc.h
@@ -38,10 +38,15 @@ pgd_free(struct mm_struct *mm, pgd_t *pgd)
 }

 static inline pmd_t *
+__pmd_alloc_one(struct mm_struct *mm, unsigned long address, gfp_t gfp_mask)
+{
+	return (pmd_t *)__get_free_page(gfp_mask | __GFP_ZERO);
+}
+
+static inline pmd_t *
 pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 {
-	pmd_t *ret = (pmd_t *)__get_free_page(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO);
-	return ret;
+	return __pmd_alloc_one(mm, address, GFP_KERNEL | __GFP_REPEAT);
 }

 static inline void
@@ -51,10 +56,15 @@ pmd_free(struct mm_struct *mm, pmd_t *pmd)
 }

 static inline pte_t *
+__pte_alloc_one_kernel(struct mm_struct *mm, unsigned long addressi,
gfp_t gfp_mask)
+{
+	return (pte_t *)__get_free_page(gfp_mask | __GFP_ZERO);
+}
+
+static inline pte_t *
 pte_alloc_one_kernel(struct mm_struct *mm, unsigned long address)
 {
-	pte_t *pte = (pte_t *)__get_free_page(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO);
-	return pte;
+	return __pte_alloc_one_kernel(mm, address, GFP_KERNEL | __GFP_REPEAT);
 }

 static inline void
