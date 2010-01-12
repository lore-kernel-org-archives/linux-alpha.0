From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: add myself to maintainer's list
Date: Tue, 12 Jan 2010 16:50:20 -0500
Message-ID: <1263333020-9050-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:from:to:cc:subject
         :date:message-id:x-mailer;
        bh=QlxyBUKmsHoMnYNfx2wwtQkVZJ4bVLtY1BgaXHsZOQ4=;
        b=jRc2olo1PIOGS9UTJJ+fZFBd00i24uYkuxUB2EMj8ZlhxLEGGHc/oxoEBCltBdbIJ+
         pvfLg8G+5h92+7ZKa6mQb8XPkDi1Nx/C7QVR4lPMdkhsoaZN/S5j2SODiQUNA2g/vvNb
         +V+EH3PKu/b5kS9dfR6dqoDHQ569RKVjImLJ0=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

CC: Richard Henderson <rth@twiddle.net>
CC: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
CC: linux-alpha@vger.kernel.org
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 MAINTAINERS |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c824b4d..69dc9fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -406,6 +406,8 @@ M:	Richard Henderson <rth@twiddle.net>
 S:	Odd Fixes for 2.4; Maintained for 2.6.
 M:	Ivan Kokshaysky <ink@jurassic.park.msu.ru>
 S:	Maintained for 2.4; PCI support for 2.6.
+M:	Matt Turner <mattst88@gmail.com>
+S:	Patch collector for 2.6.3x+.
 L:	linux-alpha@vger.kernel.org
 F:	arch/alpha/
 
-- 
1.6.4.4

