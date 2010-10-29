From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: add GENERIC_HARDIRQS_NO__DO_IRQ to Kconfig
Date: Fri, 29 Oct 2010 12:22:08 -0400
Message-ID: <1288369328-7281-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:from:to:cc:subject
         :date:message-id:x-mailer;
        bh=JKlmg1JmAjnSVeNL6SmqHQ6NQRf8ehu1OUH2VvFDg14=;
        b=GNi99UiIXnMR6mOQJ1hPK+t+WkyDbZDUFfhpVu+wgmTiVz1foSQAAg75jxh8kw+CuO
         iZyvCof3DdvDicjWUKujA52FbStDPOsBrbJ8JAlhStrCk1aXOuw+K9HnQaQXV2f0evkK
         z1QXCqxBfJUQAjs0OCQlHMyXgXjklWXS6VBvM=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Michael Cree <mcree@orcon.net.nz>, Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
This is a follow-on to Kyle's __do_IRQ removal.

 arch/alpha/Kconfig |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 943fe69..fc95ee1 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -68,6 +68,9 @@ config GENERIC_IOMAP
 	bool
 	default n
 
+config GENERIC_HARDIRQS_NO__DO_IRQ
+	def_bool y
+
 config GENERIC_HARDIRQS
 	bool
 	default y
-- 
1.7.2.2

