From: Kulikov Vasiliy <segooon@gmail.com>
Subject: [PATCH 01/15] alpha: srmcons: localize spin_lock section
Date: Fri, 16 Jul 2010 20:12:27 +0400
Message-ID: <1279296747-24783-1-git-send-email-segooon@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=Q7D8qx7kjCUGr3dQGcgeqaWRlWs3uSbxkt92RGduNF8=;
        b=WsaJcjgvW1lBJPZ71Y2V9/K4w3rJMhLbccEdpyVC/NdarNWtOsFiq2jwaJj+hungU/
         ErQpHtG9PaIev8O0Vfaog11KAyWPsUWDQv9hPKG/KN0iqT7cIol+wbcKOpLf3rstSf2s
         XIa2rQbNFDOXYxTrgPi0tOb/xpPAd0mXVsAyA=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Scale down spin_lock_irqsave/spin_unlock_irqrestore exactly to area
where it is needed. Also it makes static checkers happy as code checks
kmalloc() result value exactly after call.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/alpha/kernel/srmcons.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
index 783f4e5..6b04005 100644
--- a/arch/alpha/kernel/srmcons.c
+++ b/arch/alpha/kernel/srmcons.c
@@ -165,17 +165,15 @@ srmcons_get_private_struct(struct srmcons_private **ps)
 
 	if (srmconsp == NULL) {
 		srmconsp = kmalloc(sizeof(*srmconsp), GFP_KERNEL);
-		spin_lock_irqsave(&srmconsp_lock, flags);
-
 		if (srmconsp == NULL)
 			retval = -ENOMEM;
 		else {
+			spin_lock_irqsave(&srmconsp_lock, flags);
 			srmconsp->tty = NULL;
 			spin_lock_init(&srmconsp->lock);
 			init_timer(&srmconsp->timer);
+			spin_unlock_irqrestore(&srmconsp_lock, flags);
 		}
-
-		spin_unlock_irqrestore(&srmconsp_lock, flags);
 	}
 
 	*ps = srmconsp;
-- 
1.7.0.4
