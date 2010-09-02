From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 26/91] arch/h8300/README Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:07:55 -0700
Message-ID: <1283461679-7851-11-git-send-email-justinmattock@gmail.com>
References: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=sjyQiKZqWMT+sWgrZJb+ZiK1dwjTLigk7swQg+XZ1NQ=;
        b=mGa5JzGzyRQQVWRiE9n5XWlbD+sN9NFYKoLAkOZMyPDrG4RJJHF5t1fPwTY/9su0UR
         708+UmXlJMqkz4b8Y/B+QdrnQF8/KCCPj6iFee/U1VfN4stp0/661Ui/jjTvFmX/YMli
         ElaZNrKWOylXrULqfK2f1ZL54E1hmudOU2IBM=
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
 arch/h8300/README |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/h8300/README b/arch/h8300/README
index 2fd6f6d..4254b15 100644
--- a/arch/h8300/README
+++ b/arch/h8300/README
@@ -11,18 +11,18 @@ H8/300H and H8S
 2.AE 3068/AE 3069
   more information 
   MICROTRONIQUE <http://www.microtronique.com/>
-  Akizuki Denshi Tsusho Ltd. <http://www.akizuki.ne.jp> (Japanese Only)
+  Akizuki Denshi Tsusho Ltd. <http://web.archive.org/web
+  /*/http://www.akizuki.ne.jp> (Japanese Only)
 
 3.H8MAX 
-  see http://ip-sol.jp/h8max/ (Japanese Only)
+  see http://strawberry-linux.com/h8/h8max.html (Japanese Only)
 
 4.EDOSK2674
-  see http://www.eu.renesas.com/products/mpumcu/tool/edk/support/edosk2674.html
-      http://www.azpower.com/H8-uClinux/
+  see http://www.renesas.eu/ 
+      http://h8-uclinux.sourceforge.net/ 
 
 * Toolchain Version
 gcc-3.1 or higher and patch
-see arch/h8300/tools_patch/README
 binutils-2.12 or higher
 gdb-5.2 or higher
 The environment that can compile a h8300-elf binary is necessary.
@@ -33,5 +33,4 @@ see http://www.uclinux.org/pub/uClinux/ports/h8/
 
 * A few words of thanks
 Porting to H8/300 serieses is support of Information-technology Promotion Agency, Japan.
-I thank support.
-and All developer/user.
+I thank support, and All developer/user.
-- 
1.7.2.1
