From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 24/91] arch/avr32/Kconfig Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:07:53 -0700
Message-ID: <1283461679-7851-9-git-send-email-justinmattock@gmail.com>
References: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=PCx6N9EFqqDhkjUJdmQMUhdmuxn3iF+5RusizB/mEqU=;
        b=erKIOyMklIDy4ITpZBN9v7EIVmxOwBq3MT1vL/fMnRl2QlBCAhwRnNI+Gz7GWrRebl
         H1nV+g6JhCdfVrGl4PoyG6YN/Wj4oVP8pLBxezFTyPTwvbB/1Spptz1anFK/eRrxSg+6
         0/GHG4tC037nzgnLba28hN31Q9h91eP1Y3jwU=
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
 arch/avr32/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/avr32/Kconfig b/arch/avr32/Kconfig
index f515727..787dcba 100644
--- a/arch/avr32/Kconfig
+++ b/arch/avr32/Kconfig
@@ -145,7 +145,7 @@ config BOARD_HAMMERHEAD
 	  will cover even the most exceptional need of memory bandwidth. Together with the onboard
 	  video decoder the board is ready for video processing.
 
-	  For more information see: http://www.miromico.com/hammerhead
+	  For more information see: http://www.hammerhead.ch/index.php/getting-started.html 
 
 config BOARD_FAVR_32
 	bool "Favr-32 LCD-board"
-- 
1.7.2.1
