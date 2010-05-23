From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 123/199] arch/alpha/lib/memmove.S: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:17 +0200
Message-ID: <1274644466-24577-15-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=x0eTwsiv/GGk3m3OGb48jlz0B3G0b7zQOHMUHznM6jA=;
        b=iOOX5tfkIbgqki63oB+iwHI+pShHTe+YYTfIWib3So0W/Okic/IAaFfKecnq8SdWpc
         EI8ee6mi29ape3V+3ZoWVvQvwjrWdOWQeoFMDSnPqYdkU3dquRPzthzx4yiNX7jd7TEg
         gW9UEn3h44Dq9SXdP5hww4rgs1lr6vB0KzWPs=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/memmove.S:9: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/memmove.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/lib/memmove.S b/arch/alpha/lib/memmove.S
index eb3b6e0..043db18 100644
--- a/arch/alpha/lib/memmove.S
+++ b/arch/alpha/lib/memmove.S
@@ -6,7 +6,7 @@
  * This is hand-massaged output from the original memcpy.c.  We defer to
  * memcpy whenever possible; the backwards copy loops are not unrolled.
  */
-        
+
 	.set noat
 	.set noreorder
 	.text
-- 
1.7.1.251.gf80a2

