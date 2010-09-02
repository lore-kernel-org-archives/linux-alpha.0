From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 90/91] arch/x86/kernel/microcode_intel.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:13:41 -0700
Message-ID: <1283462022-8024-15-git-send-email-justinmattock@gmail.com>
References: <1283462022-8024-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=3ZLDIQ78Xda0PPOMj8xkLAUQQH4Xp9JsG2pGmza7MS0=;
        b=vOBcset65LSsW2edKF4U/8WcsfVL1dcXnFQY1x74Ggn5jmHC96vEHJ1xQ82znUcqmr
         iRXSI5wllGrZuS5Y7p2YCQs9LzXXI3W1VkCon2dfjrWc4QjG4qyVz9NPAzdy3t0bf5kv
         9Ase3hKNhZJim/68rNtw9LysCT6XLXOiYjctw=
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
 arch/x86/kernel/microcode_intel.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/microcode_intel.c b/arch/x86/kernel/microcode_intel.c
index 3561702..dcb65cc 100644
--- a/arch/x86/kernel/microcode_intel.c
+++ b/arch/x86/kernel/microcode_intel.c
@@ -12,7 +12,7 @@
  *	Software Developer's Manual
  *	Order Number 253668 or free download from:
  *
- *	http://developer.intel.com/design/pentium4/manuals/253668.htm
+ *	http://developer.intel.com/Assets/PDF/manual/253668.pdf	
  *
  *	For more information, go to http://www.urbanmyth.org/microcode
  *
-- 
1.7.2.1

