From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 30/91] arch/ia64/sn/kernel/sn2/timer_interrupt.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:07:59 -0700
Message-ID: <1283461679-7851-15-git-send-email-justinmattock@gmail.com>
References: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=el3+jfM3+RGSa3I36mBkAK3AdD0QTuEj/ZAE1aORyrc=;
        b=sOhSez/uHRCu31rkOu+arZMU/OZ9eY3/CIOlI4zn5slSPLhrzSTmnF1UeT/1o8qlXV
         aXVHfmhgxYIFxQMMal2dkNEI8YVxlwn7kGfwSJF7Ox8bymGHo+PGOVGlN05FgKuo6WL0
         SfPTV2fCJmJaJbWvAfFEfeS65KyJdL/fbfJ0s=
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
 arch/ia64/sn/kernel/sn2/timer_interrupt.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/arch/ia64/sn/kernel/sn2/timer_interrupt.c b/arch/ia64/sn/kernel/sn2/timer_interrupt.c
index 103d6ea..9f9d5f2 100644
--- a/arch/ia64/sn/kernel/sn2/timer_interrupt.c
+++ b/arch/ia64/sn/kernel/sn2/timer_interrupt.c
@@ -1,6 +1,4 @@
 /*
- *
- *
  * Copyright (c) 2005, 2006 Silicon Graphics, Inc.  All Rights Reserved.
  * 
  * This program is free software; you can redistribute it and/or modify it 
@@ -24,7 +22,7 @@
  * 
  * For further information regarding this notice, see: 
  * 
- * http://oss.sgi.com/projects/GenInfo/NoticeExplan
+ * http://oss.sgi.com/
  */
 
 #include <linux/interrupt.h>
-- 
1.7.2.1

