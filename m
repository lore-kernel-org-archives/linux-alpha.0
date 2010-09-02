From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 29/91] arch/ia64/lib/idiv32.S Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:07:58 -0700
Message-ID: <1283461679-7851-14-git-send-email-justinmattock@gmail.com>
References: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=lGc8TOiRqId29ztHZwDpDYd1swNwe97pkIBV5E4HEX8=;
        b=d828q8fNypicvUgG0lu9OMW+hz/p9tzyHdgQuOo64R0c6wYptySG5MtrDx/rKMuZAN
         wOC4wb0TGLPUN/CQ1Yzk8Glql4GKsbLggLsOVkxuHzuzevzD3noE8rLSvSRxcQnKek21
         9u9aQgbRxh3HDmwvJREjjsZebR7UvCrDIkAdQ=
In-Reply-To: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
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
 arch/ia64/lib/idiv32.S |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/ia64/lib/idiv32.S b/arch/ia64/lib/idiv32.S
index 2ac28bf..dad1949 100644
--- a/arch/ia64/lib/idiv32.S
+++ b/arch/ia64/lib/idiv32.S
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

