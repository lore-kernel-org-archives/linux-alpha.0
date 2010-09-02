From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 02/91] arch/alpha/Kconfig Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:06:33 -0700
Message-ID: <1283461606-7803-3-git-send-email-justinmattock@gmail.com>
References: <1283461606-7803-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=/TEdIRrVycNbo+95XUej42X43fb/i72dvN6xoJWr5uY=;
        b=FRvTOCGBF9Fl5YQLhlKiX/PIFE38SogocZoBzBnW63BfsqWiBsyDkQm3CnQb1dQgI0
         MfzDPsCQPycKzWsFMm1la9+gGzhFVyj9L5+p6JRN1WUu/9Moti6KQ6PJ6lhlbW29Bl21
         5Hy1h00oC2hRAszQ6teM1fLLn0hWl9Dq6I4Og=
In-Reply-To: <1283461606-7803-1-git-send-email-justinmattock@gmail.com>
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
 arch/alpha/Kconfig |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index b9647bb..16ae162 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -219,7 +219,8 @@ config ALPHA_LX164
 	bool "LX164"
 	help
 	  A technical overview of this board is available at
-	  <http://www.unix-ag.org/Linux-Alpha/Architectures/LX164.html>.
+	  <http://web.archive.org/web/*/http://www.unix-ag.org/
+	  Linux-Alpha/Architectures/LX164.html>.
 
 config ALPHA_LYNX
 	bool "Lynx"
@@ -483,7 +484,8 @@ config ALPHA_AVANTI
 	help
 	  Avanti AS 200, AS 205, AS 250, AS 255, AS 300, and AS 400-based
 	  Alphas. Info at
-	  <http://www.unix-ag.org/Linux-Alpha/Architectures/Avanti.html>.
+	  <http://web.archive.org/web/*/http://www.unix-ag.org/Linux-Alpha/
+	  Architectures/Avanti.html>.
 
 config ALPHA_BROKEN_IRQ_MASK
 	bool
-- 
1.7.2.1

