From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 22/91] arch/arm/mm/proc-xscale.S Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:07:51 -0700
Message-ID: <1283461679-7851-7-git-send-email-justinmattock@gmail.com>
References: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=LJAE/Ewd3mkWX6jrVvIgy6xcva4vacdzxTVbOe6MrZ8=;
        b=jje+847sTM5GFQ9+AKUODrggJgDZZrUjpKTCVEAXitjmRAE2PX1C7CDXCNECkQ5o55
         IFhv+H/r0Bg/Hwtz4IJdPZcItIrjbk2hFiQ7Za4vibYg+YjHtLC5ONCCmHEGmWj+g3Xj
         WZtXIbOwze7Lc5CW12fYRHIGLOAzqIYsv2gxc=
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
 arch/arm/mm/proc-xscale.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mm/proc-xscale.S b/arch/arm/mm/proc-xscale.S
index 1407597..887975f 100644
--- a/arch/arm/mm/proc-xscale.S
+++ b/arch/arm/mm/proc-xscale.S
@@ -418,7 +418,7 @@ ENTRY(xscale_cache_fns)
  *
  * See erratum #25 of "Intel 80200 Processor Specification Update",
  * revision January 22, 2003, available at:
- *     http://www.intel.com/design/iio/specupdt/273415.htm
+ *     http://www.intel.com/design/
  */
 ENTRY(xscale_80200_A0_A1_cache_fns)
 	.long	xscale_flush_kern_cache_all
-- 
1.7.2.1

