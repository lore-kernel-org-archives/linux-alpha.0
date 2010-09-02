From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 87/91] arch/x86/kernel/cpu/cpufreq/powernow-k8.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:13:38 -0700
Message-ID: <1283462022-8024-12-git-send-email-justinmattock@gmail.com>
References: <1283462022-8024-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=vBfEHepSBGGEz1X9s7uZFPshFJwcL2lhgG9J7nlAV4o=;
        b=LuTG0igdSz4WlixBSBxpXS9rDCZ2mJVvG6Jy3SQsEUkB2tUT+brXmn4Ugf1nDpUl11
         YWk0sHfLfO80Q3PysSOwbKAqULLhEDfRcl/kvrzqkOyLdNrPsmbiLlwUI20IWmqme7gR
         +q32Po4cgCRCqi0x4stu8QRqOigLIsCz3ujng=
In-Reply-To: <1283462022-8024-1-git-send-email-justinmattock@gmail.com>
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
 arch/x86/kernel/cpu/cpufreq/powernow-k8.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index 491977b..278dd2f 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@ -21,7 +21,8 @@
  *  Opteron Processors" available for download from www.amd.com
  *
  *  Tables for specific CPUs can be inferred from
- *     http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/30430.pdf
+ *    http://web.archive.org/web/*/http://www.amd.com/us-en/assets/content_type
+ *    /white_papers_and_tech_docs/30430.pdf 
  */
 
 #include <linux/kernel.h>
-- 
1.7.2.1
