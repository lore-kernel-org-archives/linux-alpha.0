From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 86/91] arch/x86/kernel/microcode_core.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:13:37 -0700
Message-ID: <1283462022-8024-11-git-send-email-justinmattock@gmail.com>
References: <1283462022-8024-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=Jv2ZIKs6OlGnBj65Wp3FWyWUyhqlqKiaAIlTXswVfEI=;
        b=HjRdZVeukGzr7Wp0+o+pTVOWXRCRARPzH6AXFRC3itYTBNFR5Gk1fmx3sFh2CHQ6F3
         X9foabgmqGj1rJD/0FduO/D1RI1aIsiTEFJOxbyPaQj84e38KgFNwbOm87D8kE+OGfJo
         HsR2yajJxRQglMT2+pPp3poaqS3EQ1+rYoMCo=
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
 arch/x86/kernel/microcode_core.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/microcode_core.c b/arch/x86/kernel/microcode_core.c
index fa6551d..b9c5c54 100644
--- a/arch/x86/kernel/microcode_core.c
+++ b/arch/x86/kernel/microcode_core.c
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

