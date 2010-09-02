From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 28/91] arch/ia64/lib/idiv64.S Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:07:57 -0700
Message-ID: <1283461679-7851-13-git-send-email-justinmattock@gmail.com>
References: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=2JCyMwbrZldz8ZsMxytA3zsZfKtiZ/2LxXKxKreAZt8=;
        b=NJRtpXsS7UyFsCnOib7jNzz777QMh2qjsFbo3Qd0PLTwzfSI4IJuO7LxES08TsM4jV
         cG20U+3u3wQyQryeWgVAd1YXNgQyClixN9G6O1iDjqHQXJdjGXtYjgkdWyqto6l3ET/o
         5CLMQkpgaGbpCPRhg8Uy1Oz7xKebkh5PTAoK0=
In-Reply-To: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, jkosina@suse.cz, "Justin P. Mattock" <justinmattock@gmail.com>

The below patch updates a broken web address that is no longer
working due to company buyout, and/or change of location.
(Please have a look through, and let me know if any of them
need to be changed, and I'll resend an updated patch).

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 arch/ia64/lib/idiv64.S |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/ia64/lib/idiv64.S b/arch/ia64/lib/idiv64.S
index f69bd2b..66ef4cf 100644
--- a/arch/ia64/lib/idiv64.S
+++ b/arch/ia64/lib/idiv64.S
@@ -7,7 +7,8 @@
  * This code is based on the application note entitled "Divide, Square Root
  * and Remainder Algorithms for the IA-64 Architecture".  This document
  * is available as Intel document number 248725-002 or via the web at
- * http://developer.intel.com/software/opensource/numerics/
+ * http://web.archive.org/web/20020611073250/developer.intel.com/
+ * software/products/opensource/libraries/num.htm 
  *
  * For more details on the theory behind these algorithms, see "IA-64
  * and Elementary Functions" by Peter Markstein; HP Professional Books
-- 
1.7.2.1
