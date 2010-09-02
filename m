From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 23/91] arch/arm/mm/Kconfig Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:07:52 -0700
Message-ID: <1283461679-7851-8-git-send-email-justinmattock@gmail.com>
References: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=rY8O/7bWyQE1EPzQj5q/CdQSM/9ZjUP6rutyN6zDk+Y=;
        b=ovXNgPV9vDROgGlQ8vhyH3ToylM+9IehwwU1wUyw3AijaYam/YfsnmoOj9O7UG0dV8
         5b/qUZRNwN/zYh8rKU+cbUsf+q5RoNejOUhspKb31lCV5Rx1fz4tJB8wlyZ73KgLJZJH
         IvbtniPPqaS/w3ZxU6rTZW3/IPKOD00e6kHRY=
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
 arch/arm/mm/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 33c3f57..9516aaf 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -314,7 +314,7 @@ config CPU_SA110
 	  The Intel StrongARM(R) SA-110 is a 32-bit microprocessor and
 	  is available at five speeds ranging from 100 MHz to 233 MHz.
 	  More information is available at
-	  <http://developer.intel.com/design/strong/sa110.htm>.
+	  <http://developer.intel.com/design/>.
 
 	  Say Y if you want support for the SA-110 processor.
 	  Otherwise, say N.
-- 
1.7.2.1
