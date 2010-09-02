From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 38/91] arch/m68k/Kconfig Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:08:59 -0700
Message-ID: <1283461746-7905-8-git-send-email-justinmattock@gmail.com>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=b6zpJotRzi1eN85v7X5VtQlArluCgIGufiwfI0v2vF8=;
        b=NmWdQn0fexXgyWESVsrQOI8IiVBQyd0Ww89AaZwb8DJsZoMbvXtc2mDyZ6PGFOpYpJ
         NVdM7GTJQtoKFawDqhzSF5o3cIMk27Mz9KllL5HiyD113QTSTSVpjpkCQcqqYbCbtsCs
         PfPLmpwRD4P2KAcZyF6xf8tcQCvp6V6umBOrM=
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
 arch/m68k/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 8030e24..b092426 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -221,7 +221,7 @@ config SUN3X
 	  Be warned that this support is very experimental.
 	  Note that Sun 3x kernels are not compatible with Sun 3 hardware.
 	  General Linux information on the Sun 3x series (now discontinued)
-	  is at <http://www.angelfire.com/ca2/tech68k/sun3.html>.
+	  is at <http://web.archive.org/web/*/angelfire.com/ca2/tech68k/sun3.html>.
 
 	  If you don't want to compile a kernel for a Sun 3x, say N.
 
-- 
1.7.2.1
