From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 84/91] arch/sh/cchips/Kconfig Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:13:35 -0700
Message-ID: <1283462022-8024-9-git-send-email-justinmattock@gmail.com>
References: <1283462022-8024-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=ILzPuKoVDCoDe9v9uJ/w3cYRXmA0nvcD2eBj2Q9EOJw=;
        b=MzFN64fiyDR36rFgEWL5lxPBByRmhWRAvz91PXKNkkY5JwxE1BmpwCCKpzBLH6fAJR
         DNs5KrIkEMTPc5YqE3aWIeFolLKgCxTOi3x3QiaQdt22F6qYa8IIXN9hOdCaJUtxYVWY
         nKy2M+Ez0C16J+vlVZiKBNJRKgiySZNWUUk9o=
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
 arch/sh/cchips/Kconfig |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/sh/cchips/Kconfig b/arch/sh/cchips/Kconfig
index a5ab2ec..a7b70ff 100644
--- a/arch/sh/cchips/Kconfig
+++ b/arch/sh/cchips/Kconfig
@@ -17,7 +17,8 @@ config HD64461
 	  PCMCIA controller supporting 2 slots.
 
 	  More information is available at
-	  <http://semiconductor.hitachi.com/windowsce/superh/sld013.htm>.
+	  <http://web.archive.org/web/*/http://semiconductor.hitachi.com
+	  /windowsce/superh/sld013.htm>.
 
 	  Say Y if you want support for the HD64461.
 	  Otherwise, say N.
-- 
1.7.2.1
