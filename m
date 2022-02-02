From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] alpha: Silence -Warray-bounds warnings
Date: Wed,  2 Feb 2022 14:18:25 -0800
Message-ID: <20220202221825.931307-1-keescook@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PvIMpuVZyrx2W3pDxCssZQEQ2K/pbzoOwCNLnMHvOS4=;
        b=eV4/8+kdNIxCQJirRUIl72MAxMT2PxHUkbH+xyPV/dMpd0CXQI9lPvt5HhwasEAbhK
         NOu0XUCADylaFw791IcP3Hw1h3LmK/dWCE2lKS5vDjHlWNXoxfPOTkKWeSCQi0O/WEqJ
         DeWox2hw8VY0TQB+SkRRZ8UJgdmLa0E5bhqo0=
X-Developer-Signature: v=1; a=openpgp-sha256; l=2488; h=from:subject; bh=T4ptorLGoemf/N9SvJlurYPJLNHVXVaxTruje8+ZTVU=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBh+wMwVDvf/S5SQmKa7J4cxYmsmNmgiJhrn+a3t0pd Yygy+p+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYfsDMAAKCRCJcvTf3G3AJvsSEA CKC4WWfVamcX7i35UpZ2lDxhsQwdSv/5qzBy2LdZhyiOgXuC12Pnx4PPn3+4VUG7xCLWyH37ZzgQ71 F1V/7Xca8i1yu3zv7y+RYB+YdRoPIpnBPnOca0LbhhHc+siw6OfnrmP6BP9Dvr61Nh2m5MIVzVYsWt 8pPJyhf16eUuElmyLeAreuxPTsQo9J3NVA1fQ2di1NKwUV9vjlyZkopP6ecNSA1im2+X0S4mSiQDad bwUiRznB6RKGc/rKyN2gc6sxqoyNDw2zhTgakL6e/FsAmdrzpV8LulwAj698o0nms8jN/NINov16FP P/zwZBkT26aKCIFxXNF+FqvxZDueM6yXSjDuY2UtVxOTWP4KDMYv2fmLYIY/4+5Lx4pwRH1mlPZB3Z e2Uk/1nSjO0m1CaJ+Cr1uWYNGRmExqiILZMiOXvAck3E/aVvjGpiTU5eVlLcsUGMg2aJ/WCBfxYnHP UyBprgl0SfjbCZKKlAZrID3KqLHZu4FRAt15ZpMlB4ABGPaiB
 rMprDyKMoPqwYUrzCzIaarsXV90Vz 4DwP4CAh1BMsUH03aD0mF64aaV0LGEQhrhFhRbgu+OBMyCqcJOpb65kbedFPUbzopfOm 
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>
Cc: Kees Cook <keescook@chromium.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-hardening@vger.kernel.org

GCC 11 (incorrectly[1]) assumes that literal values cast to (void *)
should be treated like a NULL pointer with an offset, and raises
diagnostics when doing bounds checking:

In function '__memset',
    inlined from '__bad_pagetable' at arch/alpha/mm/init.c:79:2:
./arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
   37 |                         return __builtin_memset(s, c, n);
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
In function '__memset',
    inlined from '__bad_page' at arch/alpha/mm/init.c:86:2:
./arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
   37 |                         return __builtin_memset(s, c, n);
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
In function '__memset',
    inlined from 'paging_init' at arch/alpha/mm/init.c:256:2:
./arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
   37 |                         return __builtin_memset(s, c, n);

This has been solved in other places[2] already by using the recently
added absolute_pointer() macro. Do the same here.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
[2] https://lore.kernel.org/all/20210912160149.2227137-1-linux@roeck-us.net/

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/alpha/mm/init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index f6114d03357c..7511723b7669 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -76,14 +76,14 @@ pgd_alloc(struct mm_struct *mm)
 pmd_t *
 __bad_pagetable(void)
 {
-	memset((void *) EMPTY_PGT, 0, PAGE_SIZE);
+	memset(absolute_pointer(EMPTY_PGT), 0, PAGE_SIZE);
 	return (pmd_t *) EMPTY_PGT;
 }
 
 pte_t
 __bad_page(void)
 {
-	memset((void *) EMPTY_PGE, 0, PAGE_SIZE);
+	memset(absolute_pointer(EMPTY_PGE), 0, PAGE_SIZE);
 	return pte_mkdirty(mk_pte(virt_to_page(EMPTY_PGE), PAGE_SHARED));
 }
 
@@ -253,7 +253,7 @@ void __init paging_init(void)
 	free_area_init(max_zone_pfn);
 
 	/* Initialize the kernel's ZERO_PGE. */
-	memset((void *)ZERO_PGE, 0, PAGE_SIZE);
+	memset(absolute_pointer(ZERO_PGE), 0, PAGE_SIZE);
 }
 
 #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
-- 
2.30.2

