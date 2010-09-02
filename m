From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 89/91] arch/x86/kernel/apm_32.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:13:40 -0700
Message-ID: <1283462022-8024-14-git-send-email-justinmattock@gmail.com>
References: <1283462022-8024-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=cEUaOCWz0NNLLYICK/VnsUGBjzvherbrdraDZs/GKE4=;
        b=fCVYEQGBhhDaPJLm3D4GSOdxy1OfIG4eUBLpBisLXXiG0yePrNiTKE50+zpLfNroqB
         0CvAoqU+iE6hfaM1jEvDwefFmA8mMbrYqy9p8d+UAgvz52til19QW2nVD1NHwb9WPEHV
         6JKp0s71wqXfvPZ/S84T2/aSVJPc6umR7MjEc=
In-Reply-To: <1283462022-8024-1-git-send-email-justinmattock@gmail.com>
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
 arch/x86/kernel/apm_32.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/apm_32.c b/arch/x86/kernel/apm_32.c
index 4c9c67b..ef07a46 100644
--- a/arch/x86/kernel/apm_32.c
+++ b/arch/x86/kernel/apm_32.c
@@ -190,7 +190,7 @@
  *
  * [This document is available free from Intel by calling 800.628.8686 (fax
  * 916.356.6100) or 800.548.4725; or via anonymous ftp from
- * ftp://ftp.intel.com/pub/IAL/software_specs/apmv11.doc.  It is also
+ * ftp://ftp.intel.com/pub/.  It is also
  * available from Microsoft by calling 206.882.8080.]
  *
  * APM 1.2 Reference:
-- 
1.7.2.1

