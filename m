From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] alpha: csum_partial_copy.c: add function prototypes from <net/checksum.h>
Date: Sun, 25 Apr 2021 16:57:49 -0700
Message-ID: <20210425235749.19113-1-rdunlap@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
        :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=z5G/dHyVh1dT5W5QVYbtCd25tzIkokFqAw96MLvxJV8=; b=AKZRrwvB48cKrrWpby4azeqrip
        mjTqOVC/L4lkiALke8ZeuKnZ7Nz0CidPxOcjaCbGRJP6Rvbj1DNfGIOUjABhGyz5zt0oA9cYpLsEa
        J9kjvJCuOwCNeknUWNGXUwSyRKBBehIpNFWb7D/4t57/3sn5+EW1GMAqrnCZYCqZj1xpqR//fB7M/
        DlTdnTTkgzKxzHpIZyy2IWTfAf86ARZ8kXhA8ULPWJ5VNIwzqyLQfRuQO/y8IgEevUdzxlKF7MKRA
        suY7/GHFf2Bi9YqdcuZ9/ECCzsX1kqE1K4VjNhdoQSMZYRsn14Bg8aOW1rseyyTvI/Hj9UjozxBQ0
        sYdpKD4g==;
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>, Al Viro <viro@zeniv.linux.org.uk>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Fix "no previous prototype" W=1 warnings from the kernel test robot:

../arch/alpha/lib/csum_partial_copy.c:349:1: error: no previous prototype for 'csum_and_copy_from_user' [-Werror=missing-prototypes]
  349 | csum_and_copy_from_user(const void __user *src, void *dst, int len)
      | ^~~~~~~~~~~~~~~~~~~~~~~
../arch/alpha/lib/csum_partial_copy.c:358:1: error: no previous prototype for 'csum_partial_copy_nocheck' [-Werror=missing-prototypes]
  358 | csum_partial_copy_nocheck(const void *src, void *dst, int len)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 808b49da54e6 ("alpha: turn csum_partial_copy_from_user() into csum_and_copy_from_user()")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
Adding the header file suggested by Al.

 arch/alpha/lib/csum_partial_copy.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210423.orig/arch/alpha/lib/csum_partial_copy.c
+++ linux-next-20210423/arch/alpha/lib/csum_partial_copy.c
@@ -13,6 +13,7 @@
 #include <linux/types.h>
 #include <linux/string.h>
 #include <linux/uaccess.h>
+#include <net/checksum.h>
 
 
 #define ldq_u(x,y) \
