From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 82/91] arch/mips/Kconfig Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:13:33 -0700
Message-ID: <1283462022-8024-7-git-send-email-justinmattock@gmail.com>
References: <1283462022-8024-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=QzkYdc2z+/pfvBqueJtSUNHzU4v4Rj9JzTE0HN2qJrA=;
        b=h6iQTwWbI98b5rDcA0fV58SA+SZGiqFJYzxtePt8pa+3nmgEUOyyGkHi7p3qQAwqKU
         V5u4KnleZ7C4dN+OxIEULtxHcwBfMDXrcgQqxP6hjUEVefvWpGv+TSxnndaFW+lwEcME
         HwyVP6kbJmJng/TRhkk5nSkSZzmnC2UAPq2N8=
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
 arch/mips/Kconfig |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3ad59dd..984b14e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2178,7 +2178,8 @@ config TC
 	  TurboChannel is a DEC (now Compaq (now HP)) bus for Alpha and MIPS
 	  processors.  Documentation on writing device drivers for TurboChannel
 	  is available at:
-	  <http://www.cs.arizona.edu/computer.help/policy/DIGITAL_unix/AA-PS3HD-TET1_html/TITLE.html>.
+	  <http://web.archive.org/web/*/http://www.cs.arizona.edu/computer.help/
+	  policy/DIGITAL_unix/AA-PS3HD-TET1_html/TITLE.html>.
 
 #config ACCESSBUS
 #	bool "Access.Bus support"
-- 
1.7.2.1
