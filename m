From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] alpha: eliminate old-style function definitions
Date: Tue, 20 Apr 2021 23:13:12 -0700
Message-ID: <20210421061312.30097-1-rdunlap@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
        :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=/XEuHM9LCAA/ybLdTU4Am5aL3JBSDVFKYObgKXbEK4o=; b=pF/2a9IwQHXhDK23QbwsgImXsO
        BxoUBIQGjR4Cyy7sO3x23SmfYX8mnYM7kGAX8ZvpZd2+Wl3zKQlRi/f4AJc7EuJGJG+exnksm6jM3
        Mq558U6zpBl5wrQ/7+g2mRUNPMk909CYU99UL29p4Qw3KVL820RXJq4+9NUiFPGwSPbjUMXJKF7Vf
        2TDxplRNKLBMK9HluDzX1q9W3oBeg9zT/MJzdV/cfGbsnXB8riHAwld+PgoL4aAQCvaEfjkkA3JOc
        nQty3lIh7fMETySCnQl9jkJ0ohmKnZtg5jZ+OwLFENsWGD7vwJarQF1sRamGjrWJ1G3sx26poa84n
        qH3W/CDA==;
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

'make ARCH=alpha W=1' reports a couple of old-style function
definitions with missing parameter list, so fix those.

../arch/alpha/kernel/pc873xx.c: In function 'pc873xx_get_base':
../arch/alpha/kernel/pc873xx.c:16:21: warning: old-style function definition [-Wold-style-definition]
   16 | unsigned int __init pc873xx_get_base()

../arch/alpha/kernel/pc873xx.c: In function 'pc873xx_get_model':
../arch/alpha/kernel/pc873xx.c:21:14: warning: old-style function definition [-Wold-style-definition]
   21 | char *__init pc873xx_get_model()

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 arch/alpha/kernel/pc873xx.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20210420.orig/arch/alpha/kernel/pc873xx.c
+++ linux-next-20210420/arch/alpha/kernel/pc873xx.c
@@ -13,12 +13,12 @@ static char *pc873xx_names[] = {
 static unsigned int base, model;
 
 
-unsigned int __init pc873xx_get_base()
+unsigned int __init pc873xx_get_base(void)
 {
 	return base;
 }
 
-char *__init pc873xx_get_model()
+char *__init pc873xx_get_model(void)
 {
 	return pc873xx_names[model];
 }
