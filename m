From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 32/91] arch/ia64/include/asm/numa.h Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:08:53 -0700
Message-ID: <1283461746-7905-2-git-send-email-justinmattock@gmail.com>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=9Mlbw47ko1MQPgm7JD/WMcOcCBXWPcB15Uau9j9W/jo=;
        b=QLlITGYBt+qngG371deg/5LOb3Hg7jO68ihu1szUuvxAQhwy983CRlqr9N9BOy3AuX
         NXYqoirscAwdU7sican2kY/904Tc3GATUTTp3ysFzxEPugeA0O3dwMYOQU+vGBbThR3+
         ydv/NLvp2TVFOzcVfoTAbqM1Wz60PZFFk2vdk=
In-Reply-To: <1283461746-7905-1-git-send-email-justinmattock@gmail.com>
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
 arch/ia64/include/asm/numa.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/ia64/include/asm/numa.h b/arch/ia64/include/asm/numa.h
index 6a8a27c..6decabb 100644
--- a/arch/ia64/include/asm/numa.h
+++ b/arch/ia64/include/asm/numa.h
@@ -52,7 +52,8 @@ extern struct node_cpuid_s node_cpuid[NR_CPUS];
 
 /*
  * ACPI 2.0 SLIT (System Locality Information Table)
- * http://devresource.hp.com/devresource/Docs/TechPapers/IA64/slit.pdf
+ * http://web.archive.org/web/*/http://devresource.hp.com/
+ * devresource/Docs/TechPapers/IA64/slit.pdf 
  *
  * This is a matrix with "distances" between nodes, they should be
  * proportional to the memory access latency ratios.
-- 
1.7.2.1
