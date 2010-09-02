From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 07/91] arch/arm/common/icst.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:06:38 -0700
Message-ID: <1283461606-7803-8-git-send-email-justinmattock@gmail.com>
References: <1283461606-7803-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=Zx7pIVJLxb9iW7oKA2rLUvf+0LD/xqheyk3FQqv84UM=;
        b=SZLZjkQ5msQcaBWdwsXG15IFk5UFYnF/TuOSoZWLxx6ZG8hwUtofzkyBaVuh5ye78v
         r2emJfHe2K8AQCXhgBtHbJ3/L91uK2cMtTCSls9/CqZPLJlWmc3ee31nCXX3XtdqNeXO
         4nRzARXyBoGGZZ9CHjzOZ4hbdY2+APTg088OQ=
In-Reply-To: <1283461606-7803-1-git-send-email-justinmattock@gmail.com>
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
 arch/arm/common/icst.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/common/icst.c b/arch/arm/common/icst.c
index 9a7f09c..2dc6da70 100644
--- a/arch/arm/common/icst.c
+++ b/arch/arm/common/icst.c
@@ -8,7 +8,7 @@
  * published by the Free Software Foundation.
  *
  *  Support functions for calculating clocks/divisors for the ICST307
- *  clock generators.  See http://www.icst.com/ for more information
+ *  clock generators.  See http://www.idt.com/ for more information
  *  on these devices.
  *
  *  This is an almost identical implementation to the ICST525 clock generator.
-- 
1.7.2.1
