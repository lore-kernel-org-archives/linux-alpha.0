From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 36/91] arch/m68k/mac/macboing.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:08:57 -0700
Message-ID: <1283461746-7905-6-git-send-email-justinmattock@gmail.com>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=SkN8oMytMoesQIL2uX511e1OldcZd1js7eiNGnklxzg=;
        b=d+hcpAifcC2bLCbcAPSpeAzu5jrepyJyzLI6FREPdQ72HFAC37LwhoB9juo22cSnhf
         VKIy8K9En2qCxo5nHx5JpH54fUTloAJuCF1t/2WCeB5wa2RuKK95nIrfw+bUrlDphRIm
         EqTW7kwBRkQLhecMuJgYGSoIHOVb3BWySOtYE=
In-Reply-To: <1283461746-7905-1-git-send-email-justinmattock@gmail.com>
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
 arch/m68k/mac/macboing.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/mac/macboing.c b/arch/m68k/mac/macboing.c
index 8f06408..e1e3377 100644
--- a/arch/m68k/mac/macboing.c
+++ b/arch/m68k/mac/macboing.c
@@ -114,7 +114,7 @@ static void mac_init_asc( void )
 			 *   16-bit I/O functionality.  The PowerBook 500 series computers
 			 *   support 16-bit stereo output, but only mono input."
 			 *
-			 *   http://til.info.apple.com/techinfo.nsf/artnum/n16405
+			 *   http://www.apple.com/
 			 *
 			 * --David Kilzer
 			 */
-- 
1.7.2.1

