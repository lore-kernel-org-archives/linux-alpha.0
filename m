From: Prasad Joshi <prasadjoshi124@gmail.com>
Subject: Re: [RFC][PATCH v3 22/22] mm, alpha: add gfp flags variant of pmd
 and pte allocations
Date: Fri, 18 Mar 2011 20:10:21 +0000
Message-ID: <20110318201021.GW4746@prasad-kvm>
References: <20110318200045.GM4746@prasad-kvm>
 <20110318200150.GN4746@prasad-kvm>
 <20110318200254.GO4746@prasad-kvm>
 <20110318200401.GP4746@prasad-kvm>
 <20110318200452.GQ4746@prasad-kvm>
 <20110318200547.GR4746@prasad-kvm>
 <20110318200638.GS4746@prasad-kvm>
 <20110318200731.GT4746@prasad-kvm>
 <20110318200825.GU4746@prasad-kvm>
 <20110318200922.GV4746@prasad-kvm>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=8pd0eUsZzfcTnTUN6EIrZXXONYamyU+Sw148gK6q0Lg=;
        b=fAXz+uh43yM+A0ezUVwKyA5Q08OXo0uole5c/MGhuu3ZjZVqp3PeHwTXBUpm5OcZzg
         KYto/2n/GEXMJ7XCrl0IFGIgo/kZluPfHncmNQ1AS+HTzKTMO1nqhAwuSZzkBgD1TRgW
         jO+vC3VBmt44DZb4TyZHcATw5LUyiwi+Oa7b8=
Content-Disposition: inline
In-Reply-To: <20110318200922.GV4746@prasad-kvm>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, prasadjoshi124@gmail.com, mitra@kqinfotech.com


 - Added __pmd_alloc_one, __pte_alloc_one_kernel to allocate pages using specified GFP flag
 - changed pmd_alloc_one, pte_alloc_one_kernel to call these newly added function using GFP_KERNEL
 - helps in fixing the Bug 30702

Signed-off-by: Prasad Joshi <prasadjoshi124@gmail.com>
Signed-off-by: Anand Mitra <mitra@kqinfotech.com>
---
 arch/alpha/include/asm/pgalloc.h |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/pgalloc.h b/arch/alpha/include/asm/pgalloc.h
index bc2a0da..81281ac 100644
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
+__pte_alloc_one_kernel(struct mm_struct *mm, unsigned long address, gfp_t gfp_mask)
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
-- 
1.7.0.4

