From: Michel Lespinasse <walken@google.com>
Subject: [PATCH 2/8] mm: use vm_unmapped_area() on alpha architecture
Date: Tue,  8 Jan 2013 17:28:09 -0800
Message-ID: <1357694895-520-3-git-send-email-walken@google.com>
References: <1357694895-520-1-git-send-email-walken@google.com>
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=m8BhLQt09z/FIiDqu8x1NEjL2ZCS/TnXPYNPNj+0qyc=;
        b=Pbv9DeD/S79iRbegg+D14tCm7krsi5TLsptlLWCqhuGM0o0B0o/eittiwuDsIKQvft
         BHz21T7x4kWyAUFRlKy4EV1Lme/0X6h63tOB8wIcPYEunIre0om04Qz2RsURCYnHcco7
         RbBD3+2FXd5Cvj1n29JDkmsSm334SoEOmZMIdkldQLyDiPOZxG5IyZM1uB9qw9G+oTG9
         DzXHdPiqqnuDZKxAiahrBgV+7hKh4sHf0/sBi29A4gN4ufs/AyWbTsAJ2sDzUaisSzgW
         4/W3ISojCRAGQMrKrCXA2tx0t9KtNcYxdQKWtk6dfOMH88gpAetXKXGGUbh4/Oa3Kt60
         ywpw==
In-Reply-To: <1357694895-520-1-git-send-email-walken@google.com>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Matt Turner <mattst88@gmail.com>, David Howells <dhowells@redhat.com>, Tony Luck <tony.luck@intel.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org

Update the alpha arch_get_unmapped_area function to make use of
vm_unmapped_area() instead of implementing a brute force search.

Signed-off-by: Michel Lespinasse <walken@google.com>

---
 arch/alpha/kernel/osf_sys.c |   20 +++++++++-----------
 1 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 14db93e4c8a8..ba707e23ef37 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1298,17 +1298,15 @@ static unsigned long
 arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
 		         unsigned long limit)
 {
-	struct vm_area_struct *vma = find_vma(current->mm, addr);
-
-	while (1) {
-		/* At this point:  (!vma || addr < vma->vm_end). */
-		if (limit - len < addr)
-			return -ENOMEM;
-		if (!vma || addr + len <= vma->vm_start)
-			return addr;
-		addr = vma->vm_end;
-		vma = vma->vm_next;
-	}
+	struct vm_unmapped_area_info info;
+
+	info.flags = 0;
+	info.length = len;
+	info.low_limit = addr;
+	info.high_limit = limit;
+	info.align_mask = 0;
+	info.align_offset = 0;
+	return vm_unmapped_area(&info);
 }
 
 unsigned long
-- 
1.7.7.3

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
